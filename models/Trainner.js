const db = require("../config/database");

const TrainnerScript = require("../scripts/TrainnerScript");

module.exports = class Trainner {
  constructor(
    IdTrainner,
    IdUsuario,
    Cedula,
    Nombre,
    FechaNacimiento,
    Edad,
    Telefono,
    Email,
    EstaEliminado
  ) {
    this.IdTrainner = IdTrainner;
    this.IdUsuario = IdUsuario;
    this.Cedula = Cedula;
    this.Nombre = Nombre;
    this.FechaNacimiento = FechaNacimiento;
    this.Edad = Edad;
    this.Telefono = Telefono;
    this.Email = Email;
    this.EstaEliminado = EstaEliminado;
  }

  static GetAllTrainners() {
    return db.execute(`${TrainnerScript.GetAllTrainner}`);
  }

  static GetAllTrainnersDisponibles() {
    return db.execute(`${TrainnerScript.GetAllTrainnersDisponibles}`);
  }

  static GetSearchTrainner(SQLSearch) {
    return db.execute(`${TrainnerScript.GetSearchTrainner}(${SQLSearch});`);
  }

  static GetObjectByIdTrainner(IdTrainner) {
    return db.execute(
      `${TrainnerScript.GetObjectByIdTrainner}(${IdTrainner});`
    );
  }

  static InsertTrainner(
    IdUsuario,
    Cedula,
    Nombre,
    FechaNacimiento,
    Edad,
    Telefono,
    Email
  ) {
    return db.execute(
      `${TrainnerScript.InsertTrainner}(${IdUsuario},${Cedula},${Nombre},${FechaNacimiento},${Edad},${Telefono},${Email});`
    );
  }

  static UpdateTrainner(
    IdUsuario,
    Cedula,
    Nombre,
    FechaNacimiento,
    Edad,
    Telefono,
    Email,
    EstaEliminado,
    IdTrainner
  ) {
    return db.execute(
      `${Trainner.UpdateTrainner}(${IdUsuario},${Cedula},${Nombre},${FechaNacimiento},${Edad},${Telefono},${Email}, ${EstaEliminado}, ${IdTrainner});`
    );
  }

  static DeleteTrainner(IdTrainner) {
    return db.execute(`${TrainnerScript.DeleteTrainner}(${IdTrainner});`);
  }
};
