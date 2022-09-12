module.exports = class UsuariosScript {
  static GetAllUsers = "CALL pa_GetAllUsuarios();";

  static GetObjectByIdUsuario = "CALL pa_GetObjectByIdUsuario";

  static GetValidUsuario = "CALL pa_GetValidLoginUsuario";

  static InsertUsuario = "CALL pa_InsertUsuario";

  static UpdateUsuario = "CALL pa_UpdateUsuario";

  static DeleteUsuario = "CALL pa_DeleteUsuario";

  static ValidUsuario = "CALL pa_GetValidUser";
};
