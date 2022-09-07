const db = require("../config/database");

const DietaDetalleScript = require("../scripts/DietaDetalleScript");

module.exports = class DietaDetalle {
  constructor(IdDietaDetalle, IdDieta, Dia, Concepto) {
    this.IdDietaDetalle = IdDietaDetalle;
    this.IdDieta = IdDieta;
    this.Dia = Dia;
    this.Concepto = Concepto;
  }

  static GetAllDietaDetalle() {
    return db.execute(`${DietaDetalleScript.GetAllDietaDetalle}`);
  }

  static GetObjectByIdDietaDetalle(IdDietaDetalle) {
    return db.execute(
      `${DietaDetalleScript.GetObjectByIdDietaDetalle}(${IdDietaDetalle});`
    );
  }

  static GetObjectByBaseDieta(IdDieta) {
    return db.execute(
      `${DietaDetalleScript.GetObjectByBaseDieta}(${IdDieta});`
    );
  }

  static InsertDietaDetalle(IdDieta, IdFormaComida, IdDia, Concepto) {
    return db.execute(
      `${DietaDetalleScript.InsertDietaDetalle}(${IdDieta}, ${IdFormaComida}, ${IdDia}, '${Concepto}');`
    );
  }

  static UpdateDietaDetalle(
    IdDieta,
    IdDia,
    IdFormaComida,
    Concepto,
    IdDietaDetalle
  ) {
    return db.execute(
      `${DietaDetalleScript.UpdateDietaDetalle}(${IdDieta}, ${IdFormaComida}, ${IdDia}, '${Concepto}',${IdDietaDetalle});`
    );
  }

  static DeleteDietaDetalle(IdDietaDetalle) {
    return db.execute(
      `${DietaDetalleScript.DeleteDietaDetalle}(${IdDietaDetalle});`
    );
  }
};
