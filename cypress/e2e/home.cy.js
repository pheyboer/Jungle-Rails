describe('Home Page', () => {

  it("There is products on the page", () => {
    cy.visit("/");
    cy.get(".products article").should("be.visible");
  });

  it("There is at least one product on the page", () => {
    cy.visit("/");
    cy.get(".products article").should("have.length.at.least", 2);
  });
});