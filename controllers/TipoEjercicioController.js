const TipoEjercicio = require("../models/TipoEjercicio");

exports.GetAllTipoEjercicio = (req, res, next) => {
  TipoEjercicio.GetAllTipoEjercicio()
    .then((posts) => {
      if (!posts) {
        const error = new Error("Could not find the type");
        error.statusCode = 404;
        throw error;
      }
      res.status(200).json({ message: "fetch posts ok", posts: posts[0][0] });
    })
    .catch((err) => {
      if (!err.statusCode) {
        err.statusCode = 500;
      }
      next(err);
    });
};

exports.GetObjectByIdTipoEjercicio = (req, res, next) => {
  const IdTipoEjercicio = req.params.IdTipoEjercicio;
  TipoEjercicio.GetTipoEjercicioById(IdTipoEjercicio)
    .then((result) => {
      if (!result) {
        const error = new Error("Could not find the type");
        error.statusCode = 404;
        throw error;
      }
      res.status(200).json({ message: "Type Fetched", post: result[0][0][0] });
    })
    .catch((err) => {
      if (!err.statusCode) {
        err.statusCode = 500;
      }
      next(err);
    });
};

exports.InsertTipoEjercicio = (req, res, next) => {
  const Codigo = req.body.Codigo;
  const Nombre = req.body.Nombre;
  TipoEjercicio.InsertTipoEjercicio(Codigo, Nombre)
    .then((result) => {
      res.status(201).json({
        message: "Insert Type Correct",
        posts: result,
      });
    })
    .catch((err) => {
      console.log(err);
    });
};

exports.UpdateTipoEjercicio = (req, res, next) => {
  const Codigo = req.body.Codigo;
  const Nombre = req.body.Nombre;
  const IdTipoEjercicio = req.body.IdTipoEjercicio;
  TipoEjercicio.UpdateTipoEjercicio(Codigo, Nombre, IdTipoEjercicio)
    .then((result) => {
      res.status(201).json({
        message: "Update type correct",
        post: result,
      });
    })
    .catch((err) => {
      if (!err.statusCode) {
        err.statusCode = 500;
      }
      next(err);
    });
};

exports.DeleteTipoEjercicio = (req, res, next) => {
  const IdTipoEjercicio = req.params.IdTipoEjercicio;
  TipoEjercicio.DeleteTipoEjercicio(IdTipoEjercicio)
    .then((result) => {
      res.status(200).json({ message: "Deleted type" });
    })
    .catch((err) => {
      if (!err.statusCode) {
        err.statusCode = 500;
      }
      next(err);
    });
};
