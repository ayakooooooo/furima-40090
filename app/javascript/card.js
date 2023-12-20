const pay = () => {
  const publicKey = gon.public_key
  const payjp = Payjp(publicKey) // PAY.JPテスト公開鍵
  const elements = payjp.elements();
  //  elementsインスタンスは、フォームを生成するためのcreate()メソッドを使える
  const numberElement = elements.create('cardNumber');
  //  カード番号入力欄の入力フォームを作成
  const expiryElement = elements.create('cardExpiry');
  //  有効期限入力欄の入力フォームを作成
  const cvcElement = elements.create('cardCvc');
  //  CVC入力欄の入力フォームを作成


  numberElement.mount('#number-form');
  // 'number-form'というid属性の要素とフォームを置き換える
  expiryElement.mount('#expiry-form');
  // 'expiry-form'というid属性の要素とフォームを置き換える
  cvcElement.mount('#cvc-form');
  // 'cvc-form'というid属性の要素とフォームを置き換える


  const form = document.getElementById('charge-form')
  //フォームに設定している”charge-form”というidを指定して要素を取得し、変数formに代入
  form.addEventListener("submit", (e) => {
    payjp.createToken(numberElement).then(function (response) {
      //createTokenメソッドの第一引数には、カード番号入力フォームとなっているelementインスタンスであるnumberElementが入る
      if (response.error) {
        //response.errorの値がnilとなることを利用して条件分岐.処理が完了時にトークンの値を取得し送信アクションが行われる
      } else {
        const token = response.id;
        //response.idとすることでトークンの値を取得
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden">`;
        //トークンの値はユーザーに見せる必要のない情報,非表示
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }
      numberElement.clear();
      expiryElement.clear();
      cvcElement.clear();
      //フォームに存在するクレジットカードの各情報を削除
      document.getElementById("charge-form").submit();
      //フォームの情報をサーバーサイドに送信
    });
    e.preventDefault();
    //通常のRuby on Railsにおけるフォーム送信処理はキャンセル.「購入」ボタンをクリックしても、サーバーサイドへリクエストは送られ
  });
};

window.addEventListener("turbo:load", pay);
//	ページが完全に読み込まれたときに発火する
window.addEventListener("turbo:render", pay);