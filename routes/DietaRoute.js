const Dieta = require("../models/Dieta");
const { body, param } = require("express-validator/check");
const express = require("express");
const router = express.Router();

router.get("/Dieta", Dieta.GetAllDietas);

router.get(
  "/Dieta/:IdDieta",
  [param("IdDieta").isNumeric().isLength({ min: 1 })],
  Dieta.GetObjectByIdDieta
);

router.delete(
  "/Dieta/:IdDieta",
  [param("IdDieta").isNumeric().isLength({ min: 1 })],
  Dieta.DeleteDieta
);
