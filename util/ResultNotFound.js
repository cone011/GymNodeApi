exports.ResultNoFound = (result) => {
  if (!result) {
    const error = new Error("No data to fecht");
    error.statusCode = 422;
    throw error;
  }
};
