const price_calc = () => {
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener("input", () => {
    const inputPrice = itemPrice.value;
    const addTaxPrice = document.getElementById("add-tax-price");
    const taxPrice = Math.floor(inputPrice * 0.1);
    const profit = document.getElementById("profit");
    addTaxPrice.innerHTML = taxPrice;
    profit.innerHTML = Math.floor(inputPrice - taxPrice);
  });
};

window.addEventListener( 'turbo:load', price_calc);
window.addEventListener( 'turbo:render', price_calc);