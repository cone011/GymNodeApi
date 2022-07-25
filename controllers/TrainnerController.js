const Trainner = require("../models/Trainner");

exports.GetAllTrainner = async function (req, res, next) {
  try {
    res.json(await Trainner.GetAllTrainners());
  } catch (err) {
    console.log(`Error to fetch the trainners`, err.message);
    next(err);
  }
};

exports.GetObjectByIdTrainner = async function (req, res, next) {
  try {
    const IdTrainner = req.params.IdTrainners;
    res.json(await Trainner.GetObjectByIdTrainner(IdTrainner));
  } catch (err) {
    console.log(`Error to fetch the Id Trainner`, err.message);
    next(err);
  }
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

exports.DeleteTrainner = async function (req, res, next) {
  try {
    const IdTrainner = req.params.IdTrainner;
    res.json(await Trainner.DeleteTrainner(IdTrainner));
  } catch (err) {
    console.log(`Error to delete the trainner`, err.message);
    next(err);
  }
};
