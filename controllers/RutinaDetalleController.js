const { validationResult } = require("express-validator");
const { Validate } = require("../util/ValidationValue");
const { ResultNoFound } = require("../util/ResultNotFound");
const { ErrorHandler } = require("../util/ErrorHandler");
const RutinaDetalle = require("../models/RutinaDetalle");

exports.GetAllRutinaDetalle = (req, res, next) => {
  RutinaDetalle.GetAllRutinaDetalle()
    .then((result) => {
      ResultNoFound(result);
      res.status(200).json({ message: "OK", result: result[0][0] });
    })
    .catch((err) => {
      ErrorHandler(err, next);
    });
};

exports.GetRutinaDetalleByBase = (req, res, next) => {
  const errors = validationResult(req);
  Validate(errors);
  const IdRutina = req.params.IdRutina;
  RutinaDetalle.GetRutinaDetalleByBase(IdRutina)
    .then((result) => {
      ResultNoFound(result);
      res.status(200).json({ message: "OK", result: result[0][0] });
    })
    .catch((err) => {
      ErrorHandler(err, next);
    });
};

exports.GetObjectByIdRutinaDetalle = (req, res, next) => {
  const errors = validationResult(req);
  Validate(errors);
  const IdRutinaDetalle = req.params.IdRutinaDetalle;
  RutinaDetalle.GetObjectByIdRutinaDetalle(IdRutinaDetalle)
    .then((result) => {
      ResultNoFound(result);
      res.status(200).json({ message: "OK", result: result[0][0] });
    })
    .catch((err) => {
      ErrorHandler(err, next);
    });
};

exports.DeleteRutinaDetalle = (req, res, next) => {
  const errors = validationResult(req);
  Validate(errors);
  const IdRutinaDetalle = req.params.IdRutinaDetalle;
  RutinaDetalle.DeleteRutinaDetalle(IdRutinaDetalle)
    .then((result) => {
      ResultNoFound(result);
      res.status(2001).json({ message: "OK", ...result });
    })
    .catch((err) => {
      ErrorHandler(err, next);
    });
};
