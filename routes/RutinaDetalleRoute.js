const express = require("express");
const { param } = require("express-validator");
const rutinaDetalleController = require("../controllers/RutinaDetalleController");
const router = express.Router();

router.get("/RutinaDetalle", rutinaDetalleController.GetAllRutinaDetalle);

router.get(
  "/RutinaDetalle/:IdRutinaDetalle",
  [param("IdRutinaDetalle").isNumeric().isLength({ min: 1 })],
  rutinaDetalleController.GetObjectByIdRutinaDetalle
);

router.get(
  "/RutinaBase/:IdRutina",
  [param("IdRutina").isNumeric().isLength({ min: 1 })],
  rutinaDetalleController.GetRutinaDetalleByBase
);

router.delete(
  "/RutinaDetalle/:IdRutinaDetalle",
  [param("IdRutinaDetalle").isNumeric().isLength({ min: 1 })],
  rutinaDetalleController.DeleteRutinaDetalle
);

module.exports = router;
