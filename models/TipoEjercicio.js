const db = require("../config/database");

const TipoEjercicioScript = require("../scripts/TipoEjercicioScript");

module.exports = class TipoEjercicio {
  constructor(IdTipoEjercicio, Codigo, Nombre) {
    this.IdTipoEjercicio = IdTipoEjercicio;
    this.Codigo = Codigo;
    this.Nombre = Nombre;
  }

  static GetAllTipoEjercicio() {
    return db.execute(TipoEjercicioScript.GetAllTipoEjercicio);
  }

  static GetTipoEjercicioById(IdTipoEjercicio) {
    return db.execute(
      `${TipoEjercicioScript.GetTipoEjercicioById}(${IdTipoEjercicio});`
    );
  }

  static InsertTipoEjercicio(Codigo, Nombre) {
    return db.execute(
      `${TipoEjercicioScript.InsertTipoEjercicio}('${Codigo}','${Nombre}');`
    );
  }

  static UpdateTipoEjercicio(Codigo, Nombre, IdTipoEjercicio) {
    return db.execute(
      `${TipoEjercicioScript.UpdateTipoEjercicio}('${Codigo}','${Nombre}',${IdTipoEjercicio});`
    );
  }

  static DeleteTipoEjercicio(IdTipoEjercicio) {
    return db.execute(
      `${TipoEjercicioScript.DeleteTipoEjercicio}(${IdTipoEjercicio});`
    );
  }
};
