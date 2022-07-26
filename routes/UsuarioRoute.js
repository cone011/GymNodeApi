const express = require("express");

const router = express.Router();

const { body, param } = require("express-validator");

const usuarioController = require("../controllers/UsuarioController");

router.get("/Usuario", usuarioController.GetAllUsuarios);

router.post(
  "/valid-usuario",
  [
    body("Usuario").trim().isLength({ min: 5 }),
    body("Contraseña").trim().isLength({ min: 5 }),
  ],
  usuarioController.GetValidUsuario
);

router.get(
  "/Usuario/:IdUsuario",
  [param("IdUsuario").isNumeric().isLength({ min: 1 })],
  usuarioController.GetObjectByIdUsuario
);

router.post(
  "/Usuario",
  [
    body("Usuario").trim().isLength({ min: 5 }),
    body("Password").trim().isLength({ min: 5 }),
  ],
  usuarioController.InsertUsuario
);

router.put(
  "/Usuario/:IdUsuario",
  [
    param("IdUsuario").isNumeric().isLength({ min: 1 }),
    body("Usuario").trim().isLength({ min: 5 }),
    body("Password").trim().isLength({ min: 5 }),
  ],
  usuarioController.UpdateUsuario
);

router.delete(
  "/Usuario/:IdUsuario",
  [param("IdUsuario").isNumeric().isLength({ min: 1 })],
  usuarioController.DeleteUsuario
);

module.exports = router;
