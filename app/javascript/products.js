$(function(){
  // 画像用のinputを生成する関数
  const buildFileField = (index)=> {
    const html = `<div data-index="${index}" class="js-file_group">
                    <input data-index="${index}" class="js-file" type="file"
                    name="item[item_images_attributes][${index}][image]"
                    id="item_item_images_attributes_${index}_image"
                    ><br>
                  </div>`;
    return html;
  }
  // プレビュー用のimgタグを生成する関数
  const buildImg = (index, url)=> {
    const html = `<div data-index="${index}" class="js-img">
                    <img src="${url}" width="100px" height="100px">
                    <div class="js-control">
                      <div class="js-edit">編集</div>
                      <div class="js-remove">削除</div>
                    </div
                  </div>`;
    return html;
  }

  // file_fieldのnameに動的なindexをつける為の配列
  let fileIndex = [1,2,3,4,5,6,7,8,9,10];
  // 既に使われているindexを除外
  lastIndex = $('.js-file_group:last').data('index');
  fileIndex.splice(0, lastIndex);

  $('.hidden-destroy').hide();

  $(document).on('change', ".js-file",function(e) {
    const targetIndex = $(this).parent().data('index');
    console.log(targetIndex)
    // ファイルのブラウザ上でのURLを取得する
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);

    // 該当indexを持つimgがあれば取得して変数imgに入れる(画像変更の処理)
    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      img.setAttribute('src', blobUrl);
      console.log("チェンジ")
    } else {  // 新規画像追加の処理
      $('.listing-image').append(buildImg(targetIndex, blobUrl));
      // fileIndexの先頭の数字を使ってinputを作る
      $('.listing-image').append(buildFileField(fileIndex[0]))
      fileIndex.shift();
      // 末尾の数に1足した数を追加する
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
    }
    });


  $(document).on('click', '.input-area', function() {
    file_length = $('.js-file').length-1
    if (file_length == 2){
      alert("2枚登録しましたので、これ以上登録できないです。");
    } else{
      $('.js-file:last').trigger('click')
    }
  })

  $('.listing-image').on('click', '.js-edit', function() {
    ed_id = $(this).parent().parent().data("index")
    $('.js-img[data-index='+ed_id+']').remove()
    $('.js-file[data-index='+ed_id+']').trigger('click')
  });

  $('.listing-image').on('click', '.js-remove', function() {
    rm_id = $(this).parent().parent().data("index")
    $('.js-file_group[data-index='+rm_id+']').remove()
    $(this).parent().parent().remove();
    // 画像入力欄が0個にならないようにしておく
    if ($('.js-file').length == 0) $('#item_item_images_attributes_0_image').append(buildFileField(fileIndex[0]));
  });
});