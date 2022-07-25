const db = require("../config/database");
const DiaScript = require("../scripts/DiaScript");

module.exports = class Dia {
  constructor(IdDia, Dias) {
    this.IdDia = IdDia;
    this.Dias = Dias;
  }

  static getAllDays() {
    return db.execute(DiaScript.GetAllDia);
  }
};
