describe('Add to Cart', () => {
  it('should increase cart count when adding a product to cart', () => {
    // homepage
    cy.visit('/');

    // check if cart is empty
    cy.contains('.nav-link', 'My Cart (0)').should('exist');
    
    // find first products add to cart button and click it
    cy.get('.products article')
      .first()
      .contains('Add')
      .click({force: true}); // covered by another element

    // wait for cart to update
    cy.contains('.nav-link', 'My Cart (1)').should('exist');
  });

  it('should navigate to cart page when clicking on cart', () => {
    // homepage
    cy.visit('/');

    // add item to cart
    cy.get('.products article')
      .first()
      .contains('Add')
      .click({force: true});

    // click on cart link
    cy.contains('.nav-link', 'My Cart').click();

    // verify cart page
    cy.url().should('include', '/cart');

    // verify item in cart
    cy.get('.cart-show').should('have.length', 1);
  });
});