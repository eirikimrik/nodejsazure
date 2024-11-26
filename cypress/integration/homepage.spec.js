describe('Homepage', () => {
    it('should load the homepage and display the title', () => {
      cy.visit('https://eirik-app.azurewebsites.net'); 
      cy.contains('Express');
    });
  });
  
  describe('Users Page', () => {
    it('should load the users page and display users', () => {
      cy.visit('https://eirik-app.azurewebsites.net/users'); 
      cy.contains('John Doe'); 
      cy.contains('Jane Doe');
    });
  });
  