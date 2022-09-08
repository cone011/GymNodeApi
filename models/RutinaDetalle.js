const db = require("../config/database");
const RutinaDetalleScript = require("../scripts/RutinaDetalleScript");

module.exports = class RutinaDetalle {
  constructor(IdRutina, IdDia, IdEjercicio, Observacion, IdRutinaDetalle) {
    this.IdRutina = IdRutina;
    this.IdDia = IdDia;
    this.IdEjercicio = IdEjercicio;
    this.Observacion = Observacion;
    this.IdRutinaDetalle = IdRutinaDetalle;
  }

  static GetAllRutinaDetalle() {
    return db.query(`${RutinaDetalleScript.GetAllRutinaDetalle}`);
  }

  static GetRutinaDetalleByBase(IdRutina) {
    return db.query(
      `${RutinaDetalleScript.GetRutinaDetalleByBase}(${IdRutina})`
    );
  }

  static GetObjectByIdRutinaDetalle(IdRutinaDetalle) {
    return db.query(
      `${RutinaDetalleScript.GetObjectByIdRutinaDetalle}(${IdRutinaDetalle})`
    );
  }

  static InsertRutinaDetalle(IdRutina, IdDia, IdEjercicio, Observacion) {
    return db.query(
      `${RutinaDetalleScript.InsertRutinaDetalle}(${IdRutina}, ${IdDia}, ${IdEjercicio}, '${Observacion}')`
    );
  }

  static UpdateRutinaDetalle(
    IdRutina,
    IdDia,
    IdEjercicio,
    Observacion,
    IdRutinaDetalle
  ) {
    return db.query(
      `${RutinaDetalleScript.UpdateRutinaDetalle}(${IdRutina}, ${IdDia}, ${IdEjercicio}, '${Observacion}', ${IdRutinaDetalle})`
    );
  }

  static DeleteRutinaDetalle(IdRutinaDetalle) {
    return db.query(
      `${RutinaDetalleScript.DeleteRutinaDetalle}(${IdRutinaDetalle})`
    );
  }
};
