var testFunc = require("./index");

describe("Opens jasmine", function () {
  it("and runs some tests", function () {
    expect(testFunc(1)).toBe(2);
  });
});
