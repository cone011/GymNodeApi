const Trainner = require("../models/Trainner");
const { validationResult } = require("express-validator");
const { Validate } = require("../util/ValidationValue");
const { ErrorHandler } = require("../util/ErrorHandler");
const { ResultNoFound } = require("../util/ResultNotFound");

exports.GetAllTrainner = (req, res, next) => {
  Trainner.GetAllTrainners()
    .then((result) => {
      ResultNoFound(result);
      res.status(200).json({ mensaje: "OK", result: result[0][0] });
    })
    .catch((err) => {
      ErrorHandler(err, next);
    });
};

exports.GetObjectByIdTrainner = (req, res, next) => {
  const errors = validationResult(req);
  Validate(errors);
  const IdTrainner = req.params.IdTrainner;
  Trainner.GetObjectByIdTrainner(IdTrainner)
    .then((result) => {
      ResultNoFound(result);
      res.status(200).json({ mensaje: "OK", result: result[0][0] });
    })
    .catch((err) => {
      ErrorHandler(err, next);
    });
};

exports.GetSearchTrainner = async function (req, res, next) {
  try {
    const SQLSearch = req.params.SQLSearch;
    res.json(await Trainner.GetSearchTrainner(SQLSearch));
  } catch (err) {
    console.log(`Error to search the trainner`, err.message);
    next(err);
  }
};

exports.InsertTrainner = async function (req, res, next) {
  try {
    const IdUsuario = req.body.IdUsuario;
    const Cedula = req.body.Cedula;
    const Nombre = req.body.Nombre;
    const FechaNacimiento = req.body.FechaNacimiento;
    const Edad = req.body.Edad;
    const Telefono = req.body.Telefono;
    const Email = req.body.Email;
    res.json(
      await Trainner.InsertTrainner(
        IdUsuario,
        Cedula,
        Nombre,
        FechaNacimiento,
        Edad,
        Telefono,
        Email
      )
    );
  } catch (err) {
    console.log(`Error to insert the trainner`, err.message);
    next(err);
  }
};

exports.UpdateTrainner = async function (req, res, next) {
  try {
    const IdUsuario = req.body.IdUsuario;
    const Cedula = req.body.Cedula;
    const Nombre = req.body.Nombre;
    const FechaNacimiento = req.body.FechaNacimiento;
    const Edad = req.body.Edad;
    const Telefono = req.body.Telefono;
    const Email = req.body.Email;
    const EstaEliminado = req.body.EstaEliminado;
    const IdTrainner = req.body.IdTrainner;
    res.json(
      await Trainner.UpdateTrainner(
        IdUsuario,
        Cedula,
        Nombre,
        FechaNacimiento,
        Edad,
        Telefono,
        Email,
        EstaEliminado,
        IdTrainner
      )
    );
  } catch (err) {
    console.log(`Error to update the trainner`, err.message);
    next(err);
  }
};

exports.DeleteTrainner = (req, res, next) => {
  const errors = validationResult(req);
  Validate(errors);
  const IdTrainner = req.params.IdTrainner;
  Trainner.DeleteTrainner(IdTrainner)
    .then((result) => {
      ResultNoFound(result);
      res.status(201).json({ mensaje: "OK", result: result });
    })
    .catch((err) => {
      ErrorHandler(err, next);
    });
};
