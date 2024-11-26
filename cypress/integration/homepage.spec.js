describe("Homepage", () => {
  it("should load the homepage and display the title", () => {
    cy.visit("http://localhost:3000");
    cy.contains("Express");
  });
});

describe("Users Page", () => {
  it("should load the users page and display users", () => {
    cy.visit("http://localhost:3000/users");
    cy.contains("John Doe");
    cy.contains("Jane Doe");
  });
});
