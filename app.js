const path = require("path");
const express = require("express");
const bodyParser = require("body-parser");
const multer = require("multer");
const DiaRoute = require("./routes/DiaRoute");
const TipoEjercicioRoute = require("./routes/TipoEjercicioRoute");
const AlumnoRouter = require("./routes/AlumnoRoute");
const EjercicioRouter = require("./routes/EjercicioRoute");
const UsuarioRouter = require("./routes/UsuarioRoute");
const DietaRouter = require("./routes/DietaRoute");
const DietaDetalleRouter = require("./routes/DietaDetalleRoute");
const port = 9091;

const app = express();

const fileStore = multer.diskStorage({
  destination: (req, res, cb) => {
    cb(null, "images");
  },
  filename: (req, file, cb) => {
    cb(null, "GYM_" + file.originalname);
  },
});

const fileFilter = (req, file, cb) => {
  if (
    file.mimetype === "image/png" ||
    file.mimetype === "image/jpg" ||
    file.mimetype === "image/jpge"
  ) {
    cb(null, true);
  } else {
    cb(null, false);
  }
};

app.use(bodyParser.json());
app.use(multer({ storage: fileStore, fileFilter: fileFilter }).single("image"));
//app.use("/images", express.static(__dirname, "images"));
app.use((req, res, next) => {
  res.setHeader("Access-Control-Allow-Origin", "*");
  res.setHeader(
    "Access-Control-Allow-Methods",
    "OPTIONS, GET, POST, PUT, PATCH, DELETE"
  );
  res.setHeader("Access-Control-Allow-Headers", "Content-Type, Authorization");
  next();
});

app.use("/api", DiaRoute);
app.use("/api", TipoEjercicioRoute);
app.use("/api", AlumnoRouter);
app.use("/api", EjercicioRouter);
app.use("/api", UsuarioRouter);
app.use("/api", DietaDetalleRouter);
app.use("/api", DietaRouter);
app.use((error, req, res, next) => {
  console.log(error);
  const status = error.statusCode || 500;
  const message = error.message;
  res.status(status).json({ message: message });
});

app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`);
});
