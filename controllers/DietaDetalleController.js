const DietaDetalle = require("../models/DietaDetalle");
const { validationResult } = require("express-validator/check");
const { Validate } = require("../util/ValidationValue");
const { ErrorHandler } = require("../util/ErrorHandler");
const { ResultNoFound } = require("../util/ResultNotFound");

exports.GetAllDietaDetalle = (req, res, next) => {
  DietaDetalle.GetAllDietaDetalle()
    .then((result) => {
      ResultNoFound(result);
      res
        .status(200)
        .json({ message: "Data was found it", result: result[0][0] });
    })
    .catch((err) => {
      ErrorHandler(err, next);
    });
};

exports.GetObjectByIdDietaDetalle = (req, res, next) => {
  const errors = validationResult(req);
  Validate(errors);
  const IdDietaDetalle = req.params.IdDietaDetalle;
  DietaDetalle.GetObjectByIdDietaDetalle(IdDietaDetalle)
    .then((result) => {
      ResultNoFound(result);
      res
        .status(200)
        .json({ message: "The data was able to get", result: result[0][0] });
    })
    .catch((err) => {
      ErrorHandler(err, next);
    });
};

exports.GetObjectByBaseDieta = (req, res, next) => {
  const errors = validationResult(req);
  Validate(errors);
  const IdDieta = req.params.IdDieta;
  DietaDetalle.GetObjectByBaseDieta(IdDieta)
    .then((result) => {
      ResultNoFound(result);
      res
        .status(200)
        .json({ message: "The data was fetched", result: result[0][0] });
    })
    .catch((err) => {
      ErrorHandler(err, next);
    });
};

exports.DeleteDietaDetalle = (req, res, next) => {
  const errors = validationResult(req);
  Validate(errors);
  const IdDietaDetalle = req.params.IdDietaDetalle;
  DietaDetalle.DeleteDietaDetalle(IdDietaDetalle)
    .then((result) => {
      ResultNoFound(result);
      res
        .status(200)
        .json({ message: "the register was deleted", result: result });
    })
    .catch((err) => {
      ErrorHandler(err, next);
    });
};
