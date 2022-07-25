const express = require("express");

const router = express.Router();

const EjercicioController = require("../controllers/EjercicioController");

router.get("/Ejercicio", EjercicioController.GetAllEjercicio);

router.get(
  "/EjercicioByTipo/:IdTipoEjercicio",
  EjercicioController.GetObjectByBaseEjercicio
);

router.get(
  "/Ejercicio/:IdEjercicio",
  EjercicioController.GetObjectByIdEjercicio
);

router.post("/Ejercicio", EjercicioController.InsertarEjercicio);

router.post("/UpdateEjercicio", EjercicioController.UpdateEjercicio);

router.delete("/Ejercicio", EjercicioController.DeleteEjercicio);

module.exports = router;
