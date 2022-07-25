const Ejercicio = require("../models/Ejercicio");

exports.GetAllEjercicio = (req, res, next) => {
  Ejercicio.GetAllEjercicio()
    .then((result) => {
      res
        .status(200)
        .json({ message: "All fetch ejercicio", result: result[0][0] });
    })
    .catch((err) => {
      if (!err.statusCode) {
        err.statusCode = 500;
      }
      next(err);
    });
};

exports.GetObjectByIdEjercicio = (req, res, next) => {
  const IdEjercicio = req.params.IdEjercicio;
  Usuarios.GetObjectByIdUsuario(IdEjercicio)
    .then((result) => {
      if (!result) {
        const error = new Error("Could not get the ejercicio");
        error.statusCode = 404;
        throw error;
      }
      res.status(200).json({ message: "Ejercicio found it", result: result });
    })
    .catch((err) => {
      if (!err.statusCode) {
        err.statusCode = 500;
      }
      next(err);
    });
};

exports.GetObjectByBaseEjercicio = (req, res, next) => {
  const IdTipoEjercicio = req.params.IdTipoEjercicio;
  Ejercicio.GetEjercicioByBase(IdTipoEjercicio)
    .then((result) => {
      if (!result) {
        const error = new Error("Could not find the ejercicios");
        error.statusCode = 404;
        throw error;
      }
      res.status(200).json({ message: "Find the ejercicios", result: result });
    })
    .catch((err) => {
      if (!err.statusCode) {
        err.statusCode = 500;
      }
      next(err);
    });
};

exports.InsertarEjercicio = (req, res, next) => {
  const Codigo = req.body.Codigo;
  const Nombre = req.body.Nombre;
  const IdTipoEjercicio = req.body.IdTipoEjercicio;
  const TipoEjercicio = req.body.TipoEjercicio;
  const ImageUrl = req.body.ImageUrl;
  const VideoUrl = req.body.VideoUrl;

  Ejercicio.InsertEjercicio(
    IdTipoEjercicio,
    TipoEjercicio,
    Codigo,
    Nombre,
    ImageUrl,
    VideoUrl
  )
    .then((result) => {
      res.status(201).json({ message: "Insert ejercicio", result: result });
    })
    .catch((err) => {
      if (!err.statusCode) {
        err.statusCode = 500;
      }
      next(err);
    });
};

exports.UpdateEjercicio = (req, res, next) => {
  const Codigo = req.body.Codigo;
  const Nombre = req.body.Nombre;
  const IdTipoEjercicio = req.body.IdTipoEjercicio;
  const TipoEjercicio = req.body.TipoEjercicio;
  const ImageUrl = req.body.ImageUrl;
  const VideoUrl = req.body.VideoUrl;
  const IdEjercicio = req.body.IdEjercicio;

  Ejercicio.UpdateEjercicio(
    IdTipoEjercicio,
    TipoEjercicio,
    Codigo,
    Nombre,
    IdEjercicio,
    ImageUrl,
    VideoUrl
  )
    .then((result) => {
      res.status(201).json({ message: "Update ejercicio", result: result });
    })
    .catch((err) => {
      if (!err.statusCode) {
        err.statusCode = 500;
      }
      next(err);
    });
};

exports.DeleteEjercicio = (req, res, next) => {
  const IdEjercicio = req.params.IdEjercicio;
  Ejercicio.DeleteEjercicio(IdEjercicio)
    .then((result) => {
      if (!result) {
        const error = new Error("Cant delete ejercicio");
        error.statusCode = 404;
        throw error;
      }
      res.status(200).json({ message: "Delete is ok" });
    })
    .catch((err) => {
      if (!err.statusCode) {
        err.statusCode = 500;
      }
      next(err);
    });
};
