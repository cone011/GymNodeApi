const { validationResult } = require("express-validator");
const { Validate } = require("../util/ValidationValue");
const { ErrorHandler } = require("../util/ErrorHandler");
const { ResultNoFound } = require("../util/ResultNotFound");
const Rutina = require("../models/Rutina");
const RutinaDetalle = require("../models/RutinaDetalle");

exports.GetAllRutina = (req, res, next) => {
  Rutina.GetAllRutinas()
    .then((result) => {
      ResultNoFound(result);
      res.status(200).json({ message: "OK", result: result[0][0] });
    })
    .catch((err) => {
      ErrorHandler(err, next);
    });
};

exports.GetRutinaById = (req, res, next) => {
  const erros = validationResult(req);
  Validate(erros);
  const IdRutina = req.params.IdRutina;
  Rutina.GetRutinaById(IdRutina)
    .then((result) => {
      ResultNoFound(result);
      res.status(200).json({ message: "OK", result: result[0][0] });
    })
    .catch((err) => {
      ErrorHandler(err, next);
    });
};

exports.GetRutinaByToday = (req, res, next) => {
  const errors = validationResult(req);
  Validate(errors);
  const IdAlumno = req.params.IdAlumno;
  Rutina.GetRutinaByToday(IdAlumno)
    .then((result) => {
      ResultNoFound(result);
      res.status(200).json({ message: "OK", result: result[0][0] });
    })
    .catch((err) => {
      ErrorHandler(err, next);
    });
};

exports.GetRutinaBySemanaActual = (req, res, next) => {
  const errors = validationResult(req);
  Validate(errors);
  const IdAlumno = req.params.IdAlumno;
  Rutina.GetRutinaBySemanaActual(IdAlumno)
    .then((result) => {
      ResultNoFound(result);
      res.status(200).json({ message: "OK", result: result[0][0] });
    })
    .catch((err) => {
      ErrorHandler(err, next);
    });
};

exports.GetRutinaByDate = (req, res, next) => {
  const errors = validationResult(req);
  Validate(errors);
  const FechaInicio = req.params.FechaInicio;
  const FechaFin = req.params.FechaFin;
  const IdAlumno = req.params.IdAlumno;
  const IdTrainner = req.params.IdTrainner;
  Rutina.GetRutinaByDate(FechaInicio, FechaFin, IdAlumno, IdTrainner)
    .then((result) => {
      ResultNoFound(result);
      res.status(200).json({ message: "OK", result: result[0][0] });
    })
    .catch((err) => {
      ErrorHandler(err, next);
    });
};

exports.InsertRutina = async (req, res, next) => {
  try {
    const errors = validationResult(req);
    Validate(errors);
    const IdAlumno = req.body.IdAlumno;
    const Alumno = req.body.Alumno;
    const IdTrainner = req.body.IdTrainner;
    const Trainner = req.body.Trainner;
    const Fecha = req.body.Fecha;
    const Observacion = req.body.Observacion;
    const RutinaDetalleList = req.body.RutinaDetalle;
    const result = await Rutina.InsertRutina(
      IdAlumno,
      Alumno,
      IdTrainner,
      Trainner,
      Fecha,
      Observacion
    );
    const Id = { ...result[0][0][0] };
    for (const key in RutinaDetalleList) {
      const resultDetal = await RutinaDetalle.InsertRutinaDetalle(
        Id.Id,
        RutinaDetalleList[key].IdDia,
        RutinaDetalleList[key].IdEjercicio,
        RutinaDetalleList[key].Observacion
      );
    }
    res.status(201).json({ message: "OK", result: Id });
  } catch (err) {
    ErrorHandler(err, next);
  }
};

exports.UpdateRutina = async (req, res, next) => {
  try {
    const errors = validationResult(req);
    Validate(errors);
    const IdAlumno = req.body.IdAlumno;
    const Alumno = req.body.Alumno;
    const IdTrainner = req.body.IdTrainner;
    const Trainner = req.body.Trainner;
    const Fecha = req.body.Fecha;
    const Observacion = req.body.Observacion;
    const RutinaDetalleList = req.body.RutinaDetalle;
    const IdRutina = req.params.IdRutina;
    const result = await Rutina.UpdateRutina(
      IdAlumno,
      Alumno,
      IdTrainner,
      Trainner,
      Fecha,
      Observacion,
      IdRutina
    );
    const Id = { ...result[0][0][0] };
    for (const key in RutinaDetalleList) {
      if (RutinaDetalleList[key].esNuevo) {
        const resultDetal = await RutinaDetalle.InsertRutinaDetalle(
          Id.Id,
          RutinaDetalleList[key].IdDia,
          RutinaDetalleList[key].IdEjercicio,
          RutinaDetalleList[key].Observacion
        );
      } else {
        const resultDetal = await RutinaDetalle.UpdateRutinaDetalle(
          Id.Id,
          RutinaDetalleList[key].IdDia,
          RutinaDetalleList[key].IdEjercicio,
          RutinaDetalleList[key].Observacion,
          RutinaDetalleList[key].IdRutinaDetalle
        );
      }
    }
    res.status(201).json({ message: "OK", result: Id });
  } catch (err) {
    ErrorHandler(err, next);
  }
};

exports.DeleteRutina = (req, res, next) => {
  const errors = validationResult(req);
  Validate(errors);
  const IdRutina = req.params.IdRutina;
  Rutina.DeleteRutina(IdRutina)
    .then((result) => {
      ResultNoFound(result);
      res.status(201).json({ message: "OK", result: result[0] });
    })
    .catch((err) => {
      ErrorHandler(err, next);
    });
};
