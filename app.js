const path = require("path");
const fs = require("fs");
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
const TrainnerRouter = require("./routes/TrainnerRoute");
const dotenv = require("dotenv");
const helmet = require("helmet");
const morgan = require("morgan");

const app = express();

const fileStorage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, "images");
  },
  filename: (req, file, cb) => {
    cb(null, "GYM" + "-" + file.originalname);
  },
});

const fileFilter = (req, file, cb) => {
  if (
    file.mimetype === "image/png" ||
    file.mimetype === "image/jpg" ||
    file.mimetype === "image/jpeg"
  ) {
    cb(null, true);
  } else {
    cb(null, false);
  }
};

const accessLogStream = fs.createWriteStream(
  path.join(__dirname, "acces.log"),
  { flags: "a" }
);

app.use(bodyParser.json());
app.use(helmet());
app.use(morgan("combined", { stream: accessLogStream }));
dotenv.config();

const port = process.env.PORT || 3000;

app.use(
  multer({ storage: fileStorage, fileFilter: fileFilter }).single("image")
);
app.use("/images", express.static(path.join(__dirname, "images")));

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
app.use("/api", TrainnerRouter);

app.use((error, req, res, next) => {
  console.log(error);
  const status = error.statusCode || 500;
  const message = error.message;
  res.status(status).json({ message: message });
});

app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`);
});
