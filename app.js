const path = require("path");
const express = require("express");
const bodyParser = require("body-parser");

const DiaRoute = require("./routes/DiaRoute");
const TipoEjercicioRoute = require("./routes/TipoEjercicioRoute");
const AlumnoRouter = require("./routes/AlumnoRoute");
const EjercicioRouter = require("./routes/EjercicioRoute");
const UsuarioRouter = require("./routes/UsuarioRoute");

const app = express();

const port = 9091;

app.use(bodyParser.json());

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

app.use((error, req, res, next) => {
  console.log(error);
  const status = error.statusCode || 500;
  const message = error.message;
  res.status(status).json({ message: message });
});

app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`);
});
