const express = require("express");
const router = express.Router();
const formaComidaController = require("../controllers/FormaComidaController");

router.get("/FormaComida", formaComidaController.GetAllFormaComida);

module.exports = router;
