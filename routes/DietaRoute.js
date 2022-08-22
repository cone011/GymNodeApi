const dietaController = require("../controllers/DietaController");
const { body, param } = require("express-validator");
const express = require("express");
const router = express.Router();

router.get("/Dieta", dietaController.GetAllDieta);

router.get(
  "/Dieta/:IdDieta",
  [param("IdDieta").isNumeric().isLength({ min: 1 })],
  dietaController.GetAllDieta
);

router.post(
  "/Dieta",
  [
    body("IdAlumno").isNumeric().isLength({ min: 1 }),
    body("Alumno").trim().isLength({ min: 5 }),
    body("IdTrainner").isNumeric().isLength({ min: 1 }),
    body("Trainner").trim().isLength({ min: 5 }),
    body("FechaCarga").isISO8601().toDate(),
  ],
  dietaController.InsertDieta
);

router.put(
  "/Dieta/:IdDieta",
  [
    body("IdAlumno").isNumeric().isLength({ min: 1 }),
    body("Alumno").trim().isLength({ min: 5 }),
    body("IdTrainner").isNumeric().isLength({ min: 1 }),
    body("Trainner").trim().isLength({ min: 5 }),
    body("FechaCarga").isISO8601().toDate(),
    param("IdDieta").isNumeric().isLength({ min: 1 }),
  ],
  dietaController.UpdateDieta
);

router.delete(
  "/Dieta/:IdDieta",
  [param("IdDieta").isNumeric().isLength({ min: 1 })],
  dietaController.DeleteDieta
);

module.exports = router;
