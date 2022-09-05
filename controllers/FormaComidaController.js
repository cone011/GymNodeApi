const FormaComida = require("../models/FormaComida");
const { ErrorHandler } = require("../util/ErrorHandler");
const { ResultNoFound } = require("../util/ResultNotFound");

exports.GetAllFormaComida = (req, res, next) => {
  FormaComida.GetAllFormaComida()
    .then((result) => {
      ResultNoFound(result);
      res.status(200).json({ mensaje: "OK", result: result[0][0] });
    })
    .catch((err) => {
      ErrorHandler(err, next);
    });
};
