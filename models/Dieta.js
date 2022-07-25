const db = require("../config/database");

const DietaScript = require("../scripts/DietaScript");

module.exports = class Dieta {
  constructor(IdDieta, IdAlumno, Alumno, IdTrainner, Trainner, Fecha) {
    this.IdDieta = IdDieta;
    this.IdAlumno = IdAlumno;
    this.Alumno = Alumno;
    this.IdTrainner = IdTrainner;
    this.Trainner = Trainner;
    this.Fecha = Fecha;
  }

  static GetAllDietas() {
    return db.query(`${DietaScript.GetAllDieta}`);
  }

  static GetObjectByIdDieta(IdDieta) {
    return db.query(`${DietaScript.GetObjectByIdDieta}(${IdDieta});`);
  }

  static GetHistorialDieta(FechaInicio, FechaFin, IdAlumno, IdTrainner) {
    return db.query(
      `${DietaScript.GetHistorialDieta}('${FechaInicio}','${FechaFin}',${IdAlumno},${IdTrainner});`
    );
  }

  static InsertDieta(IdAlumno, Alumno, IdTrainner, Trainner, Fecha) {
    return db.query(
      `${DietaScript.InsertDieta}(${IdAlumno}, ${Alumno}, ${IdTrainner}, ${Trainner}, ${Fecha});`
    );
  }

  static UpdateDieta(IdAlumno, Alumno, IdTrainner, Trainner, Fecha, IdDieta) {
    return db.query(
      `${DietaScript.UpdateDieta}(${IdAlumno}, ${Alumno}, ${IdTrainner}, ${Trainner}, ${Fecha}, ${IdDieta});`
    );
  }

  static DeleteDieta(IdDieta) {
    return db.query(`${DietaScript.DeleteDieta}(${IdDieta});`);
  }
};
