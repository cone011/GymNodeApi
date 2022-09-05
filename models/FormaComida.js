const db = require("../config/database");
const FormaComidaScript = require("../scripts/FormaComidaScript");

module.exports = class FormaComida {
  constructor(IdFormaComida, Nombre) {
    this.IdFormaComida = IdFormaComida;
    this.Nombre = Nombre;
  }

  static GetAllFormaComida() {
    return db.query(`${FormaComidaScript.GetAllFormaComida}`);
  }
};
