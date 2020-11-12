$(window).on("load",function(){
  $('#charge-form').on('submit', function(e) {
    console.log("aaa")
    e.preventDefault()
    Payjp.setPublicKey("pk_test_d5c95d5cbf1ea89733c9d85a");
    var card = {
      number: document.getElementById("card-number").value,
      exp_month: document.getElementById("exp_month").value,
      exp_year: document.getElementById("exp_year").value,
      cvc: document.getElementById("cvc").value
    };
    console.log(card)
    if (card.number == "" || card.cvc == "") {
      alert("入力漏れがあります");
    } else {
      Payjp.createToken(card, function(status, response) {
        console.log(status)
        console.log(response)
        if (status === 200 ) {
          $("#card-number").removeAttr("name");
          $("#cvc").removeAttr("name");
          $("#exp_month").removeAttr("name");
          $("#exp_year").removeAttr("name");
          $("#card_token").append(
            $('<input type="hidden" name="payjp-token">').val(response.id)
          );
          $('#charge-form').get(0).submit();
          alert("登録に成功しました");
        } else {
          alert("カード情報が正しくありません");
        }
      });
    }
  });
});