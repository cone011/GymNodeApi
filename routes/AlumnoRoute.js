const express = require("express");

const router = express.Router();

const AlumnoController = require("../controllers/AlumnoController");

const { body, param } = require("express-validator/check");

router.get("/Alumno", AlumnoController.GetAllAlumno);

router.get(
  "/Alumno/:IdAlumno",
  [param("IdAlumno").isNumeric().isLength({ min: 1 })],
  AlumnoController.GetObjectByIdAlumno
);

router.get(
  "/Alumno/GetSearch/:SQLSearch",
  [param("SQLSearch").trim().isLength({ min: 4 })],
  AlumnoController.GetSearchAlumno
);

router.post("/Alumno", AlumnoController.InsertAlumno);

router.post("/Alumno/Update", AlumnoController.UpdateAlumno);

router.delete("/Alumno", AlumnoController.DeleteAlumno);

module.exports = router;
