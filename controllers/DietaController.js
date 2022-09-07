const Dieta = require("../models/Dieta");
const DietaDetalle = require("../models/DietaDetalle");
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

exports.InsertDieta = async (req, res, next) => {
  try {
    const errors = validationResult(req);
    Validate(errors);
    const IdAlumno = req.body.IdAlumno;
    const Alumno = req.body.Alumno;
    const IdTrainner = req.body.IdTrainner;
    const Trainner = req.body.Trainner;
    const FechaCarga = req.body.FechaCarga;
    const Observacion = req.body.Observacion;
    const DietaDetalleList = req.body.DietaDetalleList;
    const result = await Dieta.InsertDieta(
      IdAlumno,
      Alumno,
      IdTrainner,
      Trainner,
      FechaCarga,
      Observacion
    );
    const Id = { ...result[0][0][0] };
    for (const key in DietaDetalleList) {
      const resultDetal = await DietaDetalle.InsertDietaDetalle(
        Id.Id,
        DietaDetalleList[key].IdFormaComida,
        DietaDetalleList[key].IdDia,
        DietaDetalleList[key].Concepto
      );
    }
    res.status(201).json({
      message: "The dieta was inseted correctly",
      Id: Id,
    });
  } catch (err) {
    ErrorHandler(err, next);
  }
};

exports.UpdateDieta = async (req, res, next) => {
  try {
    const errors = validationResult(req);
    Validate(errors);
    const IdAlumno = req.body.IdAlumno;
    const Alumno = req.body.Alumno;
    const IdTrainner = req.body.IdTrainner;
    const Trainner = req.body.Trainner;
    const FechaCarga = req.body.FechaCarga;
    const Observacion = req.body.Observacion;
    const DietaDetalleList = req.body.DietaDetalleList;
    const IdDieta = req.params.IdDieta;
    const result = await Dieta.UpdateDieta(
      IdAlumno,
      Alumno,
      IdTrainner,
      Trainner,
      FechaCarga,
      Observacion,
      IdDieta
    );
    const Id = { ...result[0][0][0] };
    for (const key in DietaDetalleList) {
      if (DietaDetalleList[key].esNuevo) {
        const resultDetal = await DietaDetalle.InsertDietaDetalle(
          Id.Id,
          DietaDetalleList[key].IdFormaComida,
          DietaDetalleList[key].IdDia,
          DietaDetalleList[key].Concepto
        );
      } else {
        const resultDetal = await DietaDetalle.UpdateDietaDetalle(
          Id.Id,
          DietaDetalleList[key].IdFormaComida,
          DietaDetalleList[key].IdDia,
          DietaDetalleList[key].Concepto,
          DietaDetalleList[key].IdDietaDetalle
        );
      }
    }
    res.status(201).json({
      message: "The dieta was updated correctly",
      Id: Id,
    });
  } catch (err) {
    ErrorHandler(err, next);
  }
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
