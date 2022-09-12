const express = require("express");

const router = express.Router();

const AlumnoController = require("../controllers/AlumnoController");

const { body, param } = require("express-validator");

router.get("/Alumno", AlumnoController.GetAllAlumno);

router.get(
  "/Alumno/:IdAlumno",
  [param("IdAlumno").isNumeric().isLength({ min: 1 })],
  AlumnoController.GetObjectByIdAlumno
);

router.get(
  "/Alumno-search/:SQLSearch",
  [param("SQLSearch").trim().isLength({ min: 4 })],
  AlumnoController.GetSearchAlumno
);

router.post(
  "/Alumno",
  [
    body("IdUsuario").isNumeric().isLength({ min: 1 }),
    body("Cedula").trim().isLength({ min: 6 }),
    body("Nombre").trim().isLength({ min: 3 }),
    body("FechaNacimiento").isDate(),
    body("Edad").isNumeric().isLength({ min: 1 }),
    body("Direccion").trim().isLength({ min: 10 }),
    body("Telefono").trim().isLength({ min: 7 }),
    body("Email").isEmail().isLength({ min: 10 }),
  ],
  AlumnoController.InsertAlumno
);

router.put(
  "/Alumno/:IdAlumno",
  [
    param("IdAlumno").isNumeric().isLength({ min: 1 }),
    body("IdUsuario").isNumeric().isLength({ min: 1 }),
    body("Cedula").trim().isLength({ min: 6 }),
    body("Nombre").trim().isLength({ min: 3 }),
    body("FechaNacimiento").isDate(),
    body("Edad").isNumeric().isLength({ min: 1 }),
    body("Direccion").trim().isLength({ min: 10 }),
    body("Telefono").trim().isLength({ min: 7 }),
    body("Email").isEmail().isLength({ min: 10 }),
  ],
  AlumnoController.UpdateAlumno
);

router.delete(
  "/Alumno/:IdAlumno",
  [param("IdAlumno").isNumeric().isLength({ min: 1 })],
  AlumnoController.DeleteAlumno
);

module.exports = router;
