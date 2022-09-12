const bcrypt = require("bcryptjs");
const Usuario = require("../models/Usuarios");
const { validationResult } = require("express-validator");
const { Validate } = require("../util/ValidationValue");

exports.GetAllUsuarios = (req, res, next) => {
  Usuario.GetAllUsuarios()
    .then((result) => {
      if (!result) {
        const error = new Error("Couldn't get the data");
        error.statusCode = 404;
        throw error;
      }
      res
        .status(200)
        .json({ message: "Fetched all Usuarios", result: result[0][0] });
    })
    .catch((err) => {
      if (!err.statusCode) {
        err.statusCode = 500;
      }
      next(err);
    });
};

exports.GetObjectByIdUsuario = (req, res, next) => {
  const errors = validationResult(req);
  Validate(errors);
  const IdUsuario = req.params.IdUsuario;
  Usuario.GetObjectByIdUsuario(IdUsuario)
    .then((result) => {
      if (!result) {
        const error = new Error("Could not find the user");
        error.statusCode = 404;
        throw error;
      }
      res.status(200).json({ message: "User find it", result: result });
    })
    .catch((err) => {
      if (!err.statusCode) {
        err.statusCode = 500;
      }
      next(err);
    });
};

exports.GetValidUsuario = (req, res, next) => {
  const errors = validationResult(req);
  Validate(errors);
  const User = req.params.User;
  const Password = req.params.Password;
  bcrypt
    .compare(Password, 12)
    .then((hashedPassword) => {
      return Usuario.GetValidUser(User, hashedPassword);
    })
    .then((result) => {
      res.status(201).json({ message: "Get user correct", result: result });
    })
    .catch((err) => {
      if (!err.statusCode) {
        err.statusCode = 500;
      }
      next(err);
    });
};

/*exports.GetValidUsuario = async function (req, res, next) {
  try {
    const User = req.body.User;
    const Password = req.body.Password;
    res.json(await Usuario.GetValidUser(User, Password));
  } catch (err) {
    console.error(`Error while getting programming languages `, err.message);
    next(err);
  }
};*/

exports.InsertUsuario = (req, res, next) => {
  const errors = validationResult(req);
  Validate(errors);
  const User = req.body.User;
  const Password = req.body.Password;
  const EsTrainner = req.body.EsTrainner;
  bcrypt
    .hash(Password, 12)
    .then((hashedPassword) => {
      return Usuario.InsertUsuario(User, hashedPassword, EsTrainner);
    })
    .then((result) => {
      if (!result) {
        const error = new Error("Couldn't insert the user");
        error.statusCode = 404;
        throw error;
      }
      res.status(201).json({ message: "Insert user correct", result: result });
    })
    .catch((err) => {
      if (!err.statusCode) {
        err.statusCode = 500;
      }
      next(err);
    });
};

exports.UpdateUsuario = (req, res, next) => {
  const errors = validationResult(req);
  Validate(errors);
  const User = req.body.User;
  const Password = req.body.Password;
  const EsTrainner = req.body.EsTrainner;
  const IdUsuario = req.body.IdUsuario;

  bcrypt
    .hash(Password, 12)
    .then((hashedPassword) => {
      return Usuario.UpdateUsuario(User, hashedPassword, EsTrainner, IdUsuario);
    })
    .then((result) => {
      if (!result) {
        const error = new Error("Couldn't update the user");
        error.statusCode = 404;
        throw error;
      }
      res.status(201).json({ message: "Update user correct", result: result });
    })
    .catch((err) => {
      if (!err.statusCode) {
        err.statusCode = 500;
      }
      next(err);
    });
};

exports.DeleteUsuario = (req, res, next) => {
  const errors = validationResult(req);
  Validate(errors);
  const IdUsuario = req.params.IdUsuario;

  Usuario.DeleteUser(IdUsuario)
    .then((result) => {
      if (!result) {
        const error = new Error("Couldn't delete the user");
        error.statusCode = 404;
        throw error;
      }
      res.status(200).json({ message: "Usuario deleted", result: result });
    })
    .catch((err) => {
      if (!err.statusCode) {
        err.statusCode = 500;
      }
      next(err);
    });
};
