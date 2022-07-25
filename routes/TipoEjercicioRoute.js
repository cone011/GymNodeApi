const path = require("path");

const express = require("express");

const router = express.Router();

const tipoEjercicioController = require("../controllers/TipoEjercicioController");

router.get("/TipoEjercicio", tipoEjercicioController.GetAllTipoEjercicio);

router.get(
  "/TipoEjercicio/:IdTipoEjercicio",
  tipoEjercicioController.GetObjectByIdTipoEjercicio
);

router.post("/TipoEjercicio", tipoEjercicioController.InsertTipoEjercicio);

router.post(
  "/TipoEjercicio/Update",
  tipoEjercicioController.UpdateTipoEjercicio
);

router.delete(
  "/TipoEjercicio/:IdTipoEjercicio",
  tipoEjercicioController.DeleteTipoEjercicio
);

module.exports = router;
