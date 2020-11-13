window.addEventListener('load', () => {
// 金額を入力した数値をpriceInputという変数に格納する
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;

    const addTaxDom = document.getElementById('add-tax-price');
    const Tax = inputValue* 0.1
    addTaxDom.innerHTML =  Math.floor(Tax)

    
  })
});


// const TAX = 1.08;

// export function addConsumptionTax(price) {
//     const floatTax = price * TAX; //消費税計算(消費税付き)
//     return Math.round(floatTax);  //四捨五入
// }

// addConsumptionTax(1000); //=> 1080


// Math.floor(数値)

// const Tax = 1.08;
// var priceBeforeTax = 999;
// var price = priceBeforeTax * Tax;
// // 四捨五入のコード追加
// var priceAfterTax = Math.round(price);

// console.log(price);
// console.log(priceAfterTax);
// // 結果
// 1078.92
// 1079
