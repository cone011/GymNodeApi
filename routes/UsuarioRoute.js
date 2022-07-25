const express = require("express");

const router = express.Router();

const usuarioController = require("../controllers/UsuarioController");

router.get("/Usuario", usuarioController.GetAllUsuarios);

router.post("/Usuario/GetValid", usuarioController.GetValidUsuario);

router.get("/Usuario/:IdUsuario", usuarioController.GetObjectByIdUsuario);

router.post("/Usuario", usuarioController.InsertUsuario);

router.post("/Usuario/Update", usuarioController.UpdateUsuario);

router.delete("/Usuario", usuarioController.DeleteUsuario);

module.exports = router;
