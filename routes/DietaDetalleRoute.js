const dietaDetalleController = require("../controllers/DietaDetalleController");
const { param } = require("express-validator");
const express = require("express");
const router = express.Router();

router.get("/DietaDetalle", dietaDetalleController.GetAllDietaDetalle);

router.get(
  "/DietaDetalle/:IdDietaDetalle",
  [param("IdDietaDetalle").isNumeric().isLength({ min: 1 })],
  dietaDetalleController.GetObjectByIdDietaDetalle
);

router.get(
  "/Dieta-Detalle/:IdDieta",
  [param("IdDieta").isNumeric().isLength({ min: 1 })],
  dietaDetalleController.GetObjectByBaseDieta
);

router.delete(
  "/DietaDetalle/:IdDietaDetalle",
  [param("IdDietaDetalle").isNumeric().isLength({ min: 1 })],
  dietaDetalleController.DeleteDietaDetalle
);

module.exports = router;
