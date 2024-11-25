describe("Homepage Tests", () => {
  it("should display the welcome message", () => {
    cy.visit("https://eirik-app.azurewebsites.net"); // Replace with your app URL
    cy.contains("Welcome to Azure");
  });
});
