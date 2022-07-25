const Dieta = require("../models/Dieta");
const { validationResult } = require("express-validator/check");
const { Validate } = require("../util/ValidationValue");

exports.GetAllDieta = (req, res, next) => {
  Dieta.GetAllDietas()
    .then((result) => {
      if (!result) {
        const error = new Error("Could not find the data");
        error.statusCode = 404;
        throw error;
      }
      res.status(200).json({
        message: "Could fetch data from dietas",
        result: result[0][0],
      });
    })
    .catch((err) => {
      if (!err.statusCode) {
        err.statusCode = 500;
      }
      next(err);
    });
};

exports.GetObjectByIdDieta = (req, res, next) => {
  const errors = validationResult(req);
  Validate(errors);
  const IdDieta = req.params.IdDieta;
  Dieta.GetObjectByIdDieta(IdDieta)
    .then((result) => {
      if (!result) {
        const error = new Error("Could not find the data");
        error.statusCode = 404;
        throw error;
      }
    })
    .catch((err) => {
      if (!err.statusCode) {
        err.statusCode = 500;
      }
      next(err);
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
      if (!result) {
        const error = new Error("Could not get the data with the parameters");
        error.statusCode = 404;
        throw error;
      }
      res
        .status(200)
        .json({ message: "Data was able to collect", result: result[0][0] });
    })
    .catch((err) => {
      if (!err.statusCode) {
        err.statusCode = 500;
      }
      next(err);
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
      if (!result) {
        const error = new Error("Could not insert the data");
        error.statusCode = 404;
        throw error;
      }
      res
        .status(201)
        .json({ message: "The dieta was inseted correctly", result: result });
    })
    .catch((err) => {
      if (!err.statusCode) {
        err.statusCode = 500;
      }
      next(err);
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
  const IdDieta = req.body.IdDieta;
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
      if (!result) {
        const error = new Error("Could not update the dieta");
        error.statusCode = 404;
        throw error;
      }
      res
        .status(201)
        .json({ message: "The update was correct", result: result });
    })
    .catch((err) => {
      if (!err.statusCode) {
        err.statusCode = 500;
      }
      next(err);
    });
};

exports.DeleteDieta = (req, res, next) => {
  const errors = validationResult(req);
  Validate(errors);
  const IdDieta = req.params.IdDieta;
  Dieta.DeleteDieta(IdDieta)
    .then((result) => {
      if (!result) {
        const error = new Error("Could not made the update");
        error.statusCode = 404;
        throw error;
      }
      res.status(201).json({ message: "The diet was deleted", result: result });
    })
    .catch((err) => {
      if (!err.statusCode) {
        err.statusCode = 404;
      }
      next(err);
    });
};
