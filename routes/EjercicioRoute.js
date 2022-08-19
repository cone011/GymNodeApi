const express = require("express");

const router = express.Router();

const { body, param } = require("express-validator");

const EjercicioController = require("../controllers/EjercicioController");

router.get("/Ejercicio", EjercicioController.GetAllEjercicio);

router.get(
  "/EjercicioByTipo/:IdTipoEjercicio",
  [param("IdTipoEjercicio").isNumeric().isLength({ min: 1 })],
  EjercicioController.GetObjectByBaseEjercicio
);

router.get(
  "/Ejercicio/:IdEjercicio",
  [param("IdEjercicio").isNumeric().isLength({ min: 1 })],
  EjercicioController.GetObjectByIdEjercicio
);

router.post(
  "/Ejercicio",
  [
    body("IdTipoEjercicio").isNumeric().isLength({ min: 1 }),
    body("TipoEjercicio").trim().isLength({ min: 3 }),
    body("Codigo").trim().isLength({ min: 3 }),
    body("Nombre").trim().isLength({ min: 5 }),
  ],
  EjercicioController.InsertarEjercicio
);

router.put(
  "/Ejercicio/:IdEjercicio",
  [
    param("IdEjercicio").isNumeric().isLength({ min: 1 }),
    body("IdTipoEjercicio").isNumeric().isLength({ min: 1 }),
    body("TipoEjercicio").trim().isLength({ min: 3 }),
    body("Codigo").trim().isLength({ min: 3 }),
    body("Nombre").trim().isLength({ min: 5 }),
  ],
  EjercicioController.UpdateEjercicio
);

router.delete(
  "/Ejercicio/:IdEjercicio",
  [param("IdEjercicio").isNumeric().isLength({ min: 1 })],
  EjercicioController.DeleteEjercicio
);

module.exports = router;
