const db = require("../config/database");
const EjercicioScript = require("../scripts/EjercicioScript");

module.exports = class Ejercicio {
  constructor(
    IdEjercicio,
    IdTipoEjercicio,
    TipoEjercicio,
    Codigo,
    Nombre,
    ImagenUrl,
    VideoUrl
  ) {
    this.IdEjercicio = IdEjercicio;
    this.IdTipoEjercicio = IdTipoEjercicio;
    this.TipoEjercicio = TipoEjercicio;
    this.Codigo = Codigo;
    this.Nombre = Nombre;
    this.ImagenUrl = ImagenUrl;
    this.VideoUrl = VideoUrl;
  }

  static GetAllEjercicio() {
    return db.execute(`${EjercicioScript.GetAllEjercicio}`);
  }

  static GetEjercicioByIdEjercicio(IdEjercicio) {
    return db.execute(
      `${EjercicioScript.GetEjercicioByIdEjercicio}(${IdEjercicio});`
    );
  }

  static GetEjercicioByBase(IdTipoEjercicio) {
    return db.execute(
      `${EjercicioScript.GetEjercicioByBase}(${IdTipoEjercicio});`
    );
  }

  static InsertEjercicio(
    IdTipoEjercicio,
    TipoEjercicio,
    Codigo,
    Nombre,
    ImagenUrl,
    VideoUrl
  ) {
    return db.execute(
      `${EjercicioScript.InsertTipoEjercico}('${Codigo}','${Nombre}',${IdTipoEjercicio},'${TipoEjercicio}','${ImagenUrl}','${VideoUrl}');`
    );
  }

  static UpdateEjercicio(
    IdTipoEjercicio,
    TipoEjercicio,
    Codigo,
    Nombre,
    ImagenUrl,
    VideoUrl,
    IdEjercicio
  ) {
    return db.execute(
      `${EjercicioScript.UpdateEjercicio}(${IdTipoEjercicio}, '${TipoEjercicio}','${Codigo}', '${Nombre}', '${ImagenUrl}', '${VideoUrl}', ${IdEjercicio});`
    );
  }

  static DeleteEjercicio(IdEjercicio) {
    return db.execute(`${EjercicioScript.DeleteEjercicio}(${IdEjercicio});`);
  }
};
