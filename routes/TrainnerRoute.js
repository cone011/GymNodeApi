const express = require("express");

const router = express.Router();

const { body, param } = require("express-validator");

const trainnerController = require("../controllers/TrainnerController");

router.get("/trainner", trainnerController.GetAllTrainner);

router.get(
  "/trainner/:IdTrainner",
  [param("IdTrainner").isNumeric().isLength({ min: 1 })],
  trainnerController.GetObjectByIdTrainner
);

router.post(
  "/trainner",
  [
    body("IdUsuario").isNumeric().isLength({ min: 1 }),
    body("Cedula").trim().isLength({ min: 6 }),
    body("Nombre").trim().isLength({ min: 15 }),
    body("FechaNacimiento").isDate(),
    body("Edad").isNumeric().isLength({ min: 10 }),
    body("Telefono").trim().isLength({ min: 7 }),
    body("Email").isEmail().isLength({ min: 10 }),
  ],
  trainnerController.InsertTrainner
);

router.put(
  "/trainner",
  [
    param("IdTrainner").isNumeric().isLength({ min: 1 }),
    body("IdUsuario").isNumeric().isLength({ min: 1 }),
    body("Cedula").trim().isLength({ min: 6 }),
    body("Nombre").trim().isLength({ min: 15 }),
    body("FechaNacimiento").isDate(),
    body("Edad").isNumeric().isLength({ min: 10 }),
    body("Telefono").trim().isLength({ min: 7 }),
    body("Email").isEmail().isLength({ min: 10 }),
  ],
  trainnerController.UpdateTrainner
);

router.delete(
  "/trainner",
  [param("IdTrainner").isNumeric().isLength({ min: 1 })],
  trainnerController.DeleteTrainner
);

module.exports = router;
