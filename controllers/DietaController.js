const Dieta = require("../models/Dieta");
const { validationResult } = require("express-validator/check");
const { Validate } = require("../util/ValidationValue");
const { ResultNoFound } = require("../util/ResultNotFound");
const { ErrorHandler } = require("../util/ErrorHandler");
exports.GetAllDieta = (req, res, next) => {
  Dieta.GetAllDietas()
    .then((result) => {
      ResultNoFound(result);
      res.status(200).json({
        message: "Could fetch data from dietas",
        result: result[0][0],
      });
    })
    .catch((err) => {
      ErrorHandler(err, next);
    });
};

exports.GetObjectByIdDieta = (req, res, next) => {
  const errors = validationResult(req);
  Validate(errors);
  const IdDieta = req.params.IdDieta;
  Dieta.GetObjectByIdDieta(IdDieta)
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

exports.GetHistorialDieta = (req, res, next) => {
  const errors = validationResult(req);
  Validate(errors);
  const FechaInicio = req.body.FechaInicio;
  const FechaFin = req.body.FechaFin;
  const IdAlumno = req.body.IdAlumno;
  const IdTrainner = req.body.IdTrainner;
  Dieta.GetHistorialDieta(FechaInicio, FechaFin, IdAlumno, IdTrainner)
    .then((result) => {
      ResultNoFound(result);
      res
        .status(200)
        .json({ message: "Data was able to collect", result: result[0][0] });
    })
    .catch((err) => {
      ErrorHandler(err, next);
    });
};

exports.InsertDieta = (req, res, next) => {
  const errors = validationResult(req);
  Validate(errors);
  const IdAlumno = req.body.IdAlumno;
  const Alumno = req.body.Alumno;
  const IdTrainner = req.body.IdTrainner;
  const Trainner = req.body.Trainner;
  const FechaCarga = req.body.FechaCarga;
  const Observacion = req.body.Observacion;
  Dieta.InsertDieta(
    IdAlumno,
    Alumno,
    IdTrainner,
    Trainner,
    FechaCarga,
    Observacion
  )
    .then((result) => {
      ResultNoFound(result);
      res
        .status(201)
        .json({ message: "The dieta was inseted correctly", result: result });
    })
    .catch((err) => {
      ErrorHandler(err, next);
    });
};

exports.UpdateDieta = (req, res, next) => {
  const errors = validationResult(req);
  Validate(errors);
  const IdAlumno = req.body.IdAlumno;
  const Alumno = req.body.Alumno;
  const IdTrainner = req.body.IdTrainner;
  const Trainner = req.body.Trainner;
  const FechaCarga = req.body.FechaCarga;
  const Observacion = req.body.Observacion;
  const IdDieta = req.params.IdDieta;
  Dieta.UpdateDieta(
    IdAlumno,
    Alumno,
    IdTrainner,
    Trainner,
    FechaCarga,
    Observacion,
    IdDieta
  )
    .then((result) => {
      ResultNoFound(result);
      res
        .status(201)
        .json({ message: "The update was correct", result: result });
    })
    .catch((err) => {
      ErrorHandler(err, next);
    });
};

exports.DeleteDieta = (req, res, next) => {
  const errors = validationResult(req);
  Validate(errors);
  const IdDieta = req.params.IdDieta;
  Dieta.DeleteDieta(IdDieta)
    .then((result) => {
      ResultNoFound(result);
      res.status(201).json({ message: "The diet was deleted", result: result });
    })
    .catch((err) => {
      ErrorHandler(err, next);
    });
};
