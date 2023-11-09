// window.addEventListener('turbo:load', () => {
//    console.log("OK");
// });

// 金額を入力した数値をpriceInputという変数に格納する
// const priceInput = document.getElementById("item_price");
// console.log(priceInput);

function item_price (){
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
     const inputValue = priceInput.value;
     console.log(inputValue);

  const addTaxDom = document.getElementById("add-tax-price");
  addTaxDom.innerHTML = Math.floor(inputValue/10)
  const profit = document.getElementById("profit");
  profit.innerHTML = Math.floor(inputValue/10*9)
  });
  
};

window.addEventListener('turbo:load', item_price);
