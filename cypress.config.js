const { defineConfig } = require("cypress");

module.exports = defineConfig({
  e2e: {
    baseUrl: "https://eirik-app.azurewebsites.net",
    setupNodeEvents(on, config) {
      // Implement node event listeners here if needed
    },
  },
});
