describe("Homepage Tests", () => {
  it("should display the welcome message", () => {
    cy.visit("https://eirik-app.azurewebsites.net"); 
    cy.contains("Welcome to Azure");
  });
});
