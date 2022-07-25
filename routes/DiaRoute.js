const path = require("path");

const express = require("express");

const router = express.Router();

const diaController = require("../controllers/DiaController");

router.get("/Dia", diaController.GetAllDays);

module.exports = router;
