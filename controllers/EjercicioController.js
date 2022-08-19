const { validationResult } = require("express-validator");
const { Validate } = require("../util/ValidationValue");
const Ejercicio = require("../models/Ejercicio");
const { ErrorHandler } = require("../util/ErrorHandler");
const { ResultNoFound } = require("../util/ResultNotFound");

exports.GetAllEjercicio = (req, res, next) => {
  Ejercicio.GetAllEjercicio()
    .then((result) => {
      ResultNoFound(result, "Could not find any data");
      res
        .status(200)
        .json({ message: "All fetch ejercicio", result: result[0][0] });
    })
    .catch((err) => {
      ErrorHandler(err, next);
    });
};

exports.GetObjectByIdEjercicio = (req, res, next) => {
  const errors = validationResult(req);
  Validate(errors);
  const IdEjercicio = req.params.IdEjercicio;
  Usuarios.GetObjectByIdUsuario(IdEjercicio)
    .then((result) => {
      ResultNoFound(result, "Could not find the data with this value");
      res.status(200).json({ message: "Ejercicio found it", result: result });
    })
    .catch((err) => {
      ErrorHandler(err, next);
    });
};

exports.GetObjectByBaseEjercicio = (req, res, next) => {
  const errors = validationResult(req);
  Validate(errors);
  const IdTipoEjercicio = req.params.IdTipoEjercicio;
  Ejercicio.GetEjercicioByBase(IdTipoEjercicio)
    .then((result) => {
      ResultNoFound(result, "Could not find the ejercicios");
      res.status(200).json({ message: "Find the ejercicios", result: result });
    })
    .catch((err) => {
      ErrorHandler(err, next);
    });
};

exports.InsertarEjercicio = (req, res, next) => {
  const errors = validationResult(req);
  Validate(errors);

  /*if (!req.file) {
    const error = new Error("No image provided");
    error.statusCode = 422;
    throw error;
  }*/

  const Codigo = req.body.Codigo;
  const Nombre = req.body.Nombre;
  const IdTipoEjercicio = req.body.IdTipoEjercicio;
  const TipoEjercicio = req.body.TipoEjercicio;
  const ImageUrl = "test"; //req.file.path;
  const VideoUrl = "test"; //req.body.VideoUrl;

  Ejercicio.InsertEjercicio(
    IdTipoEjercicio,
    TipoEjercicio,
    Codigo,
    Nombre,
    ImageUrl,
    VideoUrl
  )
    .then((result) => {
      res.status(201).json({ message: "Insert ejercicio", result: result });
    })
    .catch((err) => {
      ErrorHandler(err, next);
    });
};

exports.UpdateEjercicio = (req, res, next) => {
  const errors = validationResult(req);
  Validate(errors);

  const IdEjercicio = req.params.IdEjercicio;
  const Codigo = req.body.Codigo;
  const Nombre = req.body.Nombre;
  const IdTipoEjercicio = req.body.IdTipoEjercicio;
  const TipoEjercicio = req.body.TipoEjercicio;
  const ImageUrl = "test"; //req.file.path;
  const VideoUrl = "test"; //req.body.VideoUrl;

  Ejercicio.UpdateEjercicio(
    IdTipoEjercicio,
    TipoEjercicio,
    Codigo,
    Nombre,
    ImageUrl,
    VideoUrl,
    IdEjercicio
  )
    .then((result) => {
      res.status(201).json({ message: "Update ejercicio", result: result });
    })
    .catch((err) => {
      ErrorHandler(err, next);
    });
};

exports.DeleteEjercicio = (req, res, next) => {
  const errors = validationResult(req);
  Validate(errors);

  const IdEjercicio = req.params.IdEjercicio;
  Ejercicio.DeleteEjercicio(IdEjercicio)
    .then((result) => {
      ResultNoFound(result, "Cant delete ejercicio");
      res.status(200).json({ message: "Delete is ok" });
    })
    .catch((err) => {
      ErrorHandler(err, next);
    });
};
