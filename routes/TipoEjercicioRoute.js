const path = require("path");

const express = require("express");

const router = express.Router();

const { body, param } = require("express-validator");

const tipoEjercicioController = require("../controllers/TipoEjercicioController");

router.get("/TipoEjercicio", tipoEjercicioController.GetAllTipoEjercicio);

router.get(
  "/TipoEjercicio/:IdTipoEjercicio",
  [param("IdTipoEjercicio").isNumeric().isLength({ min: 1 })],
  tipoEjercicioController.GetObjectByIdTipoEjercicio
);

router.post(
  "/TipoEjercicio",
  [
    body("Codigo").trim().isLength({ min: 3 }),
    body("Nombre").trim().isLength({ min: 5 }),
  ],
  tipoEjercicioController.InsertTipoEjercicio
);

router.put(
  "/TipoEjercicio/:IdTipoEjercicio",
  [
    param("IdTipoEjercicio").isNumeric().isLength({ min: 1 }),
    body("Codigo").trim().isLength({ min: 2 }),
    body("Nombre").trim().isLength({ min: 3 }),
  ],
  tipoEjercicioController.UpdateTipoEjercicio
);

router.delete(
  "/TipoEjercicio/:IdTipoEjercicio",
  [param("IdTipoEjercicio").isNumeric().isLength({ min: 1 })],
  tipoEjercicioController.DeleteTipoEjercicio
);

module.exports = router;
