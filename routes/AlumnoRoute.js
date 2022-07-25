const express = require("express");

const router = express.Router();

const AlumnoController = require("../controllers/AlumnoController");

router.get("/Alumno", AlumnoController.GetAllAlumno);

router.get("/Alumno/:IdAlumno", AlumnoController.GetObjectByIdAlumno);

router.get("/Alumno/GetSearch/:SQLSearch", AlumnoController.GetSearchAlumno);

router.post("/Alumno", AlumnoController.InsertAlumno);

router.post("/Alumno/Update", AlumnoController.UpdateAlumno);

router.delete("/Alumno", AlumnoController.DeleteAlumno);

module.exports = router;
