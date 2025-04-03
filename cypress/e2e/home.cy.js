describe('Home Page', () => {
  beforeEach(() => {
    cy.visit("/");
    // Log the HTML to debug
    cy.log('Checking page structure');
    cy.document().then(doc => {
      console.log(doc.body.innerHTML);
    });
  });

  it("There is products on the page", () => {
    cy.visit("/");
    cy.get(".products article").should("be.visible");
  });

  it("There is at least one product on the page", () => {
    cy.visit("/");
    cy.get(".products article").should("have.length.at.least", 2);
  });
});