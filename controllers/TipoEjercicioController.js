const { validationResult } = require("express-validator");
const TipoEjercicio = require("../models/TipoEjercicio");
const { Validate } = require("../util/ValidationValue");
const { ResultNoFound } = require("../util/ResultNotFound");
const { ErrorHandler } = require("../util/ErrorHandler");

exports.GetAllTipoEjercicio = (req, res, next) => {
  TipoEjercicio.GetAllTipoEjercicio()
    .then((result) => {
      if (!result) {
        ResultNoFound("Could not found results");
      }
      res.status(200).json({ message: "fetch posts ok", result: result[0][0] });
    })
    .catch((err) => {
      ErrorHandler(err, next);
    });
};

exports.GetObjectByIdTipoEjercicio = (req, res, next) => {
  const errors = validationResult(req);
  Validate(errors);
  const IdTipoEjercicio = req.params.IdTipoEjercicio;
  TipoEjercicio.GetTipoEjercicioById(IdTipoEjercicio)
    .then((result) => {
      ResultNoFound("Could not found a result with this value");
      res
        .status(200)
        .json({ message: "Type Fetched", result: result[0][0][0] });
    })
    .catch((err) => {
      ErrorHandler(err, next);
    });
};

exports.InsertTipoEjercicio = (req, res, next) => {
  const errors = validationResult(req);
  Validate(errors);
  const Codigo = req.body.Codigo;
  const Nombre = req.body.Nombre;
  TipoEjercicio.InsertTipoEjercicio(Codigo, Nombre)
    .then((result) => {
      res.status(201).json({
        message: "Insert Type Correct",
        result: result,
      });
    })
    .catch((err) => {
      ErrorHandler(err, next);
    });
};

exports.UpdateTipoEjercicio = (req, res, next) => {
  const error = validationResult(req);
  Validate(error);
  const IdTipoEjercicio = req.params.IdTipoEjercicio;
  const Codigo = req.body.Codigo;
  const Nombre = req.body.Nombre;
  TipoEjercicio.UpdateTipoEjercicio(Codigo, Nombre, IdTipoEjercicio)
    .then((result) => {
      res.status(201).json({
        message: "Update type correct",
        result: result,
      });
    })
    .catch((err) => {
      ErrorHandler(err, next);
    });
};

exports.DeleteTipoEjercicio = (req, res, next) => {
  const errors = validationResult(req);
  Validate(errors);
  const IdTipoEjercicio = req.params.IdTipoEjercicio;
  TipoEjercicio.DeleteTipoEjercicio(IdTipoEjercicio)
    .then((result) => {
      res.status(200).json({ message: "OK", result });
    })
    .catch((err) => {
      ErrorHandler(err, next);
    });
};
