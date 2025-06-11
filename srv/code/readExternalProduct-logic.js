/**
 * 
 * @On(event = { "READ" }, entity = "cap_simple_reqSrv.ExtProducts")
 * @param {cds.Request} request - User information, tenant-specific CDS model, headers and query parameters
 * @param {Function} next - Callback function to the next handler
 */
module.exports = async function(request, next) {
    // Connect to the external 'Northwind' service
    const northwindService = await cds.connect.to('Northwind');

    // Get the external entity identifier for 'Products'
    const { Products } = northwindService.entities;

    // Fetch data from the external 'Products' entity
    const externalProducts = await northwindService.run(SELECT.from(Products));

    // If external products are fetched, return them
    if (externalProducts) {
        return externalProducts;
    }

    // Proceed to the next handler if no external products are fetched
    return next();
}