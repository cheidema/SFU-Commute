import mongoose, { Schema } from 'mongoose'
import bcrypt from 'bcrypt'

const UserSchema = new Schema({
  email: {
    type: String,
    lowercase: true,
    unique: true,
    index: true,
    match: [/.+@.+\..+/, 'Please fill a valid e-mail address'],
    required: 'Email is required',
  },
  firstname: {
    type: String,
    trim: true,
    required: 'First name is required',
    validate: [
      (firstname) => (/^[a-zA-Z]+$/.test(firstname)),
      'First name should contain only letters',
    ],
  },
  lastname: {
    type: String,
    trim: true,
    required: 'Last name is required',
    validate: [
      (lastname) => (/^[a-zA-Z]+$/.test(lastname)),
      'Last name should contain only letters',
    ],
  },
  password: {
    type: String,
    required: 'Password is required',
    validate: [
      (password) => (password.length >= 6),
      'Password should be longer',
    ],
  },
  phone: {
    number:{
      type: String,
      validate: [
        (number) => (number.length === 11),
        'Phone number should be 11-digit.',
      ],
    },
    verification:{
      verified:{
        type: Boolean,
        default: false,
      },
      code: String,
      expire: Date,
    }
  },
  created: {
    type: Date,
    default: Date.now,
  },
  resetPasswordToken: String,
  resetPasswordExpire: Date,
}, { collection: 'User' })


UserSchema.pre('save', function (next) {
  const user = this
  if (user.isModified('email') || user.isNew) {
    user.email = user.email.toLowerCase()
  }
  if (user.isModified('firstname') || user.isModified('lastname') || user.isNew) {
    user.firstname = user.firstname.toLowerCase()
    user.lastname = user.lastname.toLowerCase()
    
    user.firstname = user.firstname.charAt(0).toUpperCase() + user.firstname.slice(1)
    user.lastname = user.lastname.charAt(0).toUpperCase() + user.lastname.slice(1)
  }
  if (user.isModified('password') || user.isNew) {
    user.hashPassword(user.password, (err, hash) => {
      if (err) return next(err)
      user.password = hash
      return next()
    })
  } else {
    return next()
  }
})

UserSchema.methods.hashPassword = (password, cb) => {
  bcrypt.genSalt(10, (err, salt) => {
    if (err) return cb(err)
    return bcrypt.hash(password, salt, (hashErr, hash) => {
      if (hashErr) return cb(hashErr)
      return cb(null, hash)
    })
  })
}

// We cannot use ES6 arrow function here because scope problem
// Read more to search ES6 arrow function "this" scope
UserSchema.methods.authenticate = function (password, cb) {
  bcrypt.compare(password, this.password, (err, isMatch) => {
    if (err) return cb(err)
    return cb(null, isMatch)
  })
}

export default mongoose.model('User', UserSchema)
