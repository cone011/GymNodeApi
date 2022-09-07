const db = require("../config/database");

const RutinaScript = require("../scripts/RutinaScript");

module.exports = class Rutina {
  constructor(IdRutina, IdAlumno, Alumno, IdTrainner, Trainner, FechaCarga) {
    this.IdRutina = IdRutina;
    this.IdAlumno = IdAlumno;
    this.Alumno = Alumno;
    this.IdTrainner = IdTrainner;
    this.Trainner = Trainner;
    this.FechaCarga = FechaCarga;
  }

  static GetAllRutinas() {
    return db.query(`${RutinaScript.GetAllRutina}`);
  }

  static GetRutinaById(IdRutina) {
    return db.query(`${RutinaScript.GetObjectByIdRutina}(${IdRutina})`);
  }

  static GetRutinaByToday(IdAlumno) {
    return db.query(`${RutinaScript.GetRutinaBySemanaActual}(${IdAlumno})`);
  }

  static GetRutinaBySemanaActual(IdAlumno) {
    return db.query(`${RutinaScript.GetRutinaBySemanaActual}(${IdAlumno})`);
  }

  static GetRutinaByDate(FechaInicio, FechaFin, IdAlumno, IdTrainner) {
    return db.query(
      `${RutinaScript.GetRutinaByDate}('${FechaInicio}', '${FechaFin}', ${IdAlumno}, ${IdTrainner})`
    );
  }

  static InsertRutina(
    IdAlumno,
    Alumno,
    IdTrainner,
    Trainner,
    Fecha,
    Observacion
  ) {
    return db.query(
      `${RutinaScript.InsertRutina}(${IdAlumno},'${Alumno}', ${IdTrainner}, '${Trainner}', '${Fecha}', '${Observacion}')`
    );
  }

  static UpdateRutina(
    IdAlumno,
    Alumno,
    IdTrainner,
    Trainner,
    Fecha,
    Observacion,
    IdRutina
  ) {
    return db.query(
      `${RutinaScript.UpdateRutina}(${IdAlumno},'${Alumno}', ${IdTrainner}, '${Trainner}', '${Fecha}', '${Observacion}', ${IdRutina})`
    );
  }

  static DeleteRutina(IdRutina) {
    return db.query(`${RutinaScript.DeleteRutina}(${IdRutina})`);
  }
};
