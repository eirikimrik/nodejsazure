var express = require("express");
var router = express.Router();

/* GET users listing. */
router.get("/", function (req, res, next) {
  res.json([
    { id: 1, name: "Hans Hansen" },
    { id: 2, name: "Jo Johansen" },
  ]);
});

module.exports = router;
