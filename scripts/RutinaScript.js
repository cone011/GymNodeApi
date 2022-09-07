module.exports = class RutinaScript {
  static GetAllRutina = "CALL pa_GetAllRutina();";

  static GetObjectByIdRutina = "CALL pa_GetObjectByIdRutina";

  static GetRutinaByToday = "CALL pa_GetRutinaHoyByData();";

  static GetRutinaBySemanaActual = "CALL pa_GetRutinaSemanaAcutal();";

  static GetRutinaByDate = "CALL pa_GetRutinaByDate";

  static InsertRutina = "CALL pa_InsertRutina";

  static UpdateRutina = "CALL pa_UpdateRutina";

  static DeleteRutina = "CALL pa_DeleteRutina";
};
