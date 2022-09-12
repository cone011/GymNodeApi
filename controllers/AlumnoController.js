const Alumno = require("../models/Alumno");
const { validationResult } = require("express-validator");
const { Validate } = require("../util/ValidationValue");
const { ResultNoFound } = require("../util/ResultNotFound");
const { ErrorHandler } = require("../util/ErrorHandler");

exports.GetAllAlumno = (req, res, next) => {
  Alumno.GetAllAlumno()
    .then((result) => {
      ResultNoFound(result);
      res
        .status(200)
        .json({ message: "Fetch all alumnos", result: result[0][0] });
    })
    .catch((err) => {
      ErrorHandler(err, next);
    });
};

exports.GetObjectByIdAlumno = (req, res, next) => {
  const errors = validationResult(req);
  Validate(errors);
  const IdAlumno = req.params.IdAlumno;
  Alumno.GetObjectByIdAlumno(IdAlumno)
    .then((result) => {
      ResultNoFound(result);
      res.status(200).json({ message: "Alumno Fetched", result: result[0][0] });
    })
    .catch((err) => {
      ErrorHandler(err, next);
    });
};

exports.GetSearchAlumno = (req, res, next) => {
  const errors = validationResult(req);
  Validate(errors);
  const SQLSearch = req.params.SQLSearch;
  Alumno.GetSearchAlumno(SQLSearch)
    .then((result) => {
      ResultNoFound(result);
      res
        .status(200)
        .json({ message: "Alumnos search complete", result: result[0][0] });
    })
    .catch((err) => {
      ErrorHandler(err, next);
    });
};

exports.InsertAlumno = (req, res, next) => {
  const errors = validationResult(req);
  Validate(errors);
  const IdUsuario = req.body.IdUsuario;
  const Cedula = req.body.Cedula;
  const Nombre = req.body.Nombre;
  const FechaNacimiento = req.body.FechaNacimiento;
  const Edad = req.body.Edad;
  const Direccion = req.body.Direccion;
  const Telefono = req.body.Telefono;
  const Email = req.body.Email;
  Alumno.InsertAlumno(
    IdUsuario,
    Cedula,
    Nombre,
    FechaNacimiento,
    Edad,
    Direccion,
    Telefono,
    Email
  )
    .then((result) => {
      ResultNoFound(result);
      res
        .status(201)
        .json({ message: "Insert Alumno Correct", result: result });
    })
    .catch((err) => {
      if (!err.statusCode) {
        err.statusCode = 500;
      }
      next(err);
    });
};

exports.UpdateAlumno = (req, res, next) => {
  const errors = validationResult(req);
  Validate(errors);
  const IdAlumno = req.params.IdAlumno;
  const IdUsuario = req.body.IdUsuario;
  const Cedula = req.body.Cedula;
  const Nombre = req.body.Nombre;
  const FechaNacimiento = req.body.FechaNacimiento;
  const Edad = req.body.Edad;
  const Direccion = req.body.Direccion;
  const Telefono = req.body.Telefono;
  const Email = req.body.Email;

  Alumno.UpdateAlumno(
    IdUsuario,
    Cedula,
    Nombre,
    FechaNacimiento,
    Edad,
    Direccion,
    Telefono,
    Email,
    IdAlumno
  )
    .then((result) => {
      ResultNoFound(result);
      res.status(200).json({ message: "Update Alumno", result: result });
    })
    .catch((err) => {
      ErrorHandler(err, next);
    });
};

exports.DeleteAlumno = (req, res, next) => {
  const errors = validationResult(req);
  Validate(errors);
  const IdAlumno = req.params.IdAlumno;
  Alumno.DeleteAlumno(IdAlumno)
    .then((result) => {
      ResultNoFound(result);
      res.status(200).json({ message: "Delete Alumno" });
    })
    .catch((err) => {
      ErrorHandler(err, next);
    });
};
