const Dia = require("../models/Dia");

exports.GetAllDays = (req, res, next) => {
  Dia.getAllDays()
    .then((result) => {
      res
        .status(200)
        .json({ message: "Fetched all days", result: result[0][0] });
    })
    .catch((err) => {
      if (!err.statusCode) {
        err.statusCode = 500;
      }
      next(err);
    });
};
