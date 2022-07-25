const db = require("../config/database");

const AlumnoScript = require("../scripts/AlumnoScript");

module.exports = class Alumno {
  constructor(
    IdAlumno,
    IdUsuario,
    Cedula,
    Nombre,
    FechaNacimiento,
    Edad,
    Direccion,
    Telefono,
    Email,
    EstaEliminado
  ) {
    this.IdAlumno = IdAlumno;
    this.IdUsuario = IdUsuario;
    this.Cedula = Cedula;
    this.Nombre = Nombre;
    this.FechaNacimiento = FechaNacimiento;
    this.Edad = Edad;
    this.Direccion = Direccion;
    this.Telefono = Telefono;
    this.Email = Email;
    this.EstaEliminado = EstaEliminado;
  }

  static GetAllAlumno() {
    return db.execute(`${AlumnoScript.GetAllAlumnos}`);
  }

  static GetObjectByIdAlumno(IdAlumno) {
    return db.execute(`${AlumnoScript.GetObjectByIdAlumnos}(${IdAlumno});`);
  }

  static GetSearchAlumno(SQLSearch) {
    return db.execute(`${AlumnoScript.GetSearchAlumno}('${SQLSearch}');`);
  }

  static InsertAlumno(
    IdUsuario,
    Cedula,
    Nombre,
    FechaNacimiento,
    Edad,
    Direccion,
    Telefono,
    Email
  ) {
    return db.execute(
      `${AlumnoScript.InsertAlumno}(${IdUsuario},'${Cedula}','${Nombre}','${FechaNacimiento}',${Edad},'${Direccion}','${Telefono}','${Email}');`
    );
  }

  static UpdateAlumno(
    IdUsuario,
    Cedula,
    Nombre,
    FechaNacimiento,
    Edad,
    Direccion,
    Telefono,
    Email,
    IdAlumno
  ) {
    return db.execute(
      `${AlumnoScript.UpdateAlumno}(${IdUsuario},'${Cedula}','${Nombre}','${FechaNacimiento}',${Edad},'${Direccion}','${Telefono}','${Email}',${IdAlumno});`
    );
  }

  static DeleteAlumno(IdAlumno) {
    return db.execute(`${AlumnoScript.DeleteAlumno}(${IdAlumno});`);
  }
};
