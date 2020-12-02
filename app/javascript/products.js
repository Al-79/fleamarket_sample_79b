$(function(){
  // 画像用のinputを生成する関数
  const buildFileField = (index)=> {
    const html = `<input data-index="${index}" class="js-file" type="file"
                  name="item[item_images_attributes][${index}][image]"
                  id="item_item_images_attributes_${index}_image"
                  style="display:none"
                  ><br>`;
    return html;
  }
  // プレビュー用のimgタグを生成する関数
  const buildImg = (index, url)=> {
    const html = `<div data-index="${index}" class="js-img" id="js_img">
                    <img src="${url}" width="100px" height="100px">
                    <div class="js-control">
                      <div class="js-edit">編集</div>
                      <div class="js-remove">削除</div>
                    </div>
                  </div>`;
    return html;
  }

  // file_fieldのnameに動的なindexをつける為の配列
  let fileIndex = [1,2,3,4,5,6,7,8,9,10];
  // 既に使われているindexを除外
  lastIndex = $('.js-file:last').data('index');
  fileIndex.splice(0, lastIndex);

  $('.hidden-destroy').hide();

  $(document).on('change', ".js-file",function(e) {
    const targetIndex = $(this).data('index');
    console.log(targetIndex)
    // ファイルのブラウザ上でのURLを取得する
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);

    // 該当indexを持つimgがあれば取得して変数imgに入れる(画像変更の処理)
    edit_img = $(`#js_img[data-index="${targetIndex}"]`)[0]
    console.log(edit_img)
    if (edit_img == null){ // 新規画像追加の処理
      $('.listing-image').append(buildImg(targetIndex, blobUrl));
      // fileIndexの先頭の数字を使ってinputを作る
      $('.listing-image').append(buildFileField(fileIndex[0]))
      fileIndex.shift();
      // 末尾の数に1足した数を追加する
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
    }else{ // 画像編集
      edit_img.children[0].setAttribute('src', blobUrl);
    }
    });


  $(document).on('click', '.input-area', function() {
    file_length = $('.js-file').length-1
    if (file_length == 4){
      alert("4枚登録しましたので、これ以上登録できないです。");
    } else{
      $('.js-file:last').trigger('click')
    }
  })

  $('.listing-image').on('click', '.js-edit', function() {
    ed_id = $(this).parent().parent().data("index")
    // $('.js-img[data-index='+ed_id+']').remove()
    // $('.js-file[data-index='+ed_id+']').remove()
    console.log(ed_id);
    $(`.js-file[data-index="${ed_id}"]`).trigger('click')
  });
  
  $('.listing-image').on('click', '.js-remove', function() {
    rm_id = $(this).parent().parent().data("index")
    $('.js-file[data-index='+rm_id+']').remove()
    $(this).parent().parent().remove();
    // 画像入力欄が0個にならないようにしておく
    if ($('.js-file').length == 0) $('#item_item_images_attributes_0_image').append(buildFileField(fileIndex[0]));
  });
});