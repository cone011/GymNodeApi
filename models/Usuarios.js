const db = require("../config/database");

const UsuarioScript = require("../scripts/UsuariosScript");

module.exports = class Usuarios {
  constructor(
    IdUsuarios,
    Usuario,
    Password,
    ValidPassword,
    EsTrainner,
    EstaEliminado
  ) {
    this.IdUsuarios = IdUsuarios;
    this.Usuario = Usuario;
    this.Password = Password;
    this.ValidPassword = ValidPassword;
    this.EsTrainner = EsTrainner;
    this.EstaEliminado = EstaEliminado;
  }

  static GetAllUsuarios() {
    return db.execute(`${UsuarioScript.GetAllUsers}`);
  }

  static GetObjectByIdUsuario(IdUsuarios) {
    return db.execute(`${UsuarioScript.GetObjectByIdUsuario}(${IdUsuarios});`);
  }

  static GetValidUser(Usuario) {
    return db.execute(`${UsuarioScript.GetValidUsuario}('${Usuario}')`);
  }

  static ValidUserExist(Usuario) {
    return db.execute(`${UsuarioScript.ValidUsuario}('${Usuario}');`);
  }

  static InsertUsuario(Usuario, Password, EsTrainner) {
    return db.execute(
      `${UsuarioScript.InsertUsuario}('${Usuario}','${Password}',${EsTrainner});`
    );
  }

  static UpdateUsuario(
    Usuario,
    Password,
    EsTrainner,
    EstaEliminado,
    IdUsuarios
  ) {
    return db.execute(
      `${UsuarioScript.UpdateUsuario}('${Usuario}', '${Password}', ${EsTrainner}, ${IdUsuarios});`
    );
  }

  static DeleteUser(IdUsuarios) {
    return db.execute(`${UsuarioScript.DeleteUsuario}(${IdUsuarios});`);
  }
};
