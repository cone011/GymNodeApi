const bcrypt = require("bcryptjs");
const Usuario = require("../models/Usuarios");

exports.GetAllUsuarios = (req, res, next) => {
  Usuario.GetAllUsuarios()
    .then((result) => {
      res.status(200).json({ message: "Fetched all Usuarios", result: result });
    })
    .catch((err) => {
      if (!err.statusCode) {
        err.statusCode = 500;
      }
      next(err);
    });
};

exports.GetObjectByIdUsuario = (req, res, next) => {
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
  const User = req.body.User;
  const Password = req.body.Password;
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
  const User = req.body.User;
  const Password = req.body.Password;
  const EsTrainner = req.body.EsTrainner;
  bcrypt
    .hash(Password, 12)
    .then((hashedPassword) => {
      return Usuario.InsertUsuario(User, hashedPassword, EsTrainner);
    })
    .then((result) => {
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
  const IdUsuario = req.params.IdUsuario;

  Usuario.DeleteUser(IdUsuario)
    .then((result) => {
      res.status(200).json({ message: "Usuario deleted", result: result });
    })
    .catch((err) => {
      if (!err.statusCode) {
        err.statusCode = 500;
      }
      next(err);
    });
};
