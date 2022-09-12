const express = require("express");
const { param, body } = require("express-validator");
const rutinaController = require("../controllers/RutinaController");
const router = express.Router();

router.get("/Rutina", rutinaController.GetAllRutina);

router.get(
  "/Rutina/:IdRutina",
  [param("IdRutina").isNumeric().isLength({ min: 1 })],
  rutinaController.GetRutinaById
);

router.get(
  "/Rutina-Semana/:IdAlumno",
  [param("IdAlumno").isNumeric().isLength({ min: 1 })],
  rutinaController.GetRutinaBySemanaActual
);

router.get(
  "/Rutina-Diaria/:IdAlumno",
  [param("IdAlumno").isNumeric().isLength({ min: 1 })],
  rutinaController.GetRutinaByToday
);

router.get(
  "/search-rutina/:FechaInicio/:FechaFin/:IdAlumno/:IdTrainner",
  [param("FechaInicio").isDate(), param("FechaFin").isDate()],
  rutinaController.GetRutinaByDate
);

router.post(
  "/Rutina",
  [
    body("IdAlumno").isNumeric().isLength({ min: 1 }),
    body("Alumno").trim().isLength({ min: 5 }),
    body("IdTrainner").isNumeric().isLength({ min: 1 }),
    body("Trainner").trim().isLength({ min: 3 }),
  ],
  rutinaController.InsertRutina
);

router.put(
  "/Rutina/:IdRutina",
  [
    body("IdAlumno").isNumeric().isLength({ min: 1 }),
    body("Alumno").trim().isLength({ min: 5 }),
    body("IdTrainner").isNumeric().isLength({ min: 1 }),
    body("Trainner").trim().isLength({ min: 3 }),
    param("IdRutina").isNumeric().isLength({ min: 1 }),
  ],
  rutinaController.UpdateRutina
);

router.delete(
  "/Rutina/:IdRutina",
  [param("IdRutina").isNumeric().isLength({ min: 1 })],
  rutinaController.DeleteRutina
);

module.exports = router;
