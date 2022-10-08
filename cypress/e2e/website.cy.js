describe("Testing API Endpoints Using Cypress", () => {
  it("Test GET Request", () => {
    cy.request(
      "https://liz7p9d3mf.execute-api.us-east-1.amazonaws.com/example/MyDemoResource"
    ).then((response) => {
      expect(response.body).to.have.property("visitor");
    });
  });
});
