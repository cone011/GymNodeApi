const dietaDetalleController = require("../controllers/DietaDetalleController");
const { body, param } = require("express-validator");
const express = require("express");
const router = express.Router();

router.get("/DietaDetalle", dietaDetalleController.GetAllDietaDetalle);

router.get(
  "/DietaDetalle/:IdDietaDetalle",
  [param("IdDietaDetalle").isNumeric().isLength({ min: 1 })],
  dietaDetalleController.GetObjectByIdDietaDetalle
);

router.get(
  "/DietaDetalle/:IdDieta",
  [param("IdDieta").isNumeric().isLength({ min: 1 })],
  dietaDetalleController.GetObjectByBaseDieta
);

router.post(
  "/DietaDetalle",
  [
    body("IdDieta").isNumeric().isLength({ min: 1 }),
    body("Dia").trim().isLength({ min: 5 }),
    body("Concepto").trim().isLength({ min: 5 }),
  ],
  dietaDetalleController.InsertDietaDetalle
);

router.put(
  "/DietaDetalle/:IdDietaDetalle",
  [
    param("IdDietaDetalle").isNumeric().isLength({ min: 1 }),
    body("IdDieta").isNumeric().isLength({ min: 5 }),
    body("Dia").trim().isLength({ min: 5 }),
    body("Concepto").trim().isLength({ min: 5 }),
  ],
  dietaDetalleController.UpdateDietaDetalle
);

router.delete(
  "/DietaDetalle/:IdDietaDetalle",
  [param("IdDietaDetalle").isNumeric().isLength({ min: 1 })],
  dietaDetalleController.DeleteDietaDetalle
);

module.exports = router;
