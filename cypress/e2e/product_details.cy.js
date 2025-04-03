describe('Product Details', () => {
  it('can navigate to product detail page by clicking on a product', () => {
    // homepage
    cy.visit('/');
    
    // Find any link inside a product article and click it
    cy.get('.products article a').first().click();
    
    // Verify product detail page
    cy.url().should('include', '/products/');
  });
});