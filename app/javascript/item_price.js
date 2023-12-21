window.addEventListener('load', () => {
const priceInput = document.getElementById("item-price");
  // 金額を入力した数値をpriceInputという変数に格納する
  //document.getElementById()は、指定されたid属性の値に一致する最初のHTML要素を取得するためのメソッド
priceInput.addEventListener("input", () => {
  //priceInput要素がテキスト入力フィールドであり、ユーザーがそのフィールドに入力をすると、指定された無名関数がイベントリスナーとして実行
  
  const inputValue = priceInput.value;
  //priceInput要素の現在の入力値がinputValueに代入

  const addTaxDom = document.getElementById("add-tax-price");
  //addTaxDomは、取得したHTML要素を指すための変数
  //id属性が"add-tax-price"という値に一致するHTML要素を取得する処理 販売手数料

  const ProfitDom = document.getElementById("profit");
  //id属性が"profit"という値に一致するHTML要素を取得する処理 販売利益

  addTaxDom.innerHTML = Math.floor(inputValue * 0.1);
  //addTaxDom.innerHTML = "入力した金額をもとに販売手数料を計算する処理"
  //入力された税抜き価格（priceInput.value）に0.1を掛けて、計算結果を四捨五入.そして、計算結果を税込み価格を表示するHTML要素（addTaxDom）の内部のテキストに代入
    
  ProfitDom.innerHTML = inputValue - addTaxDom.innerHTML;
  // 出品価格から販売手数料を引く処理 価格ー手数料
  //販売利益を表示するHTML要素（ProfitDom）の内部のテキストに代入

})
});