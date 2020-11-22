$(function(){
  
  // 画像用のinputを生成する関数
  const buildFileField = (index)=> {
    const html = `<div data-index="${index}" class="js-file_group">
                    <input class="js-file" type="file"
                    name="item[item_images_attributes][${index}][image]"
                    id="item_item_images_attributes_${index}_image"
                    style="display:none"
                    ><br>
                    <div class="js-remove", style="display:none">削除</div>
                  </div>`;
    return html;
  }

  // file_fieldのnameに動的なindexをつける為の配列
  let fileIndex = [1,2,3,4,5,6,7,8,9,10];
    console.log($('.input-area'))
    $(document).on('change', ".js-file",function(e) {
    // fileIndexの先頭の数字を使ってinputを作る
    console.log(fileIndex[0])
    // $(`#item_images_attributes_${fileIndex[0]}_image`[0]).trigger("click")
    $('.listing-image').append(buildFileField(fileIndex[0]))
    console.log(111)
    // $('.listing-camera').attr('for', `item_item_images_attributes_${fileIndex[0]}_image`)
    fileIndex.shift();
    // 末尾の数に1足した数を追加する
    fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
    console.log(fileIndex[0])
    console.log(fileIndex)
  });

  $(document).on('click', '.input-area', function() {
    $('.js-file:last').trigger('click')
  })


  $('.listing-image').on('click', '.js-remove', function() {
    $(this).parent().remove();
    // 画像入力欄が0個にならないようにしておく
    if ($('.js-file').length == 0) $('#item_item_images_attributes_0_image').append(buildFileField(fileIndex[0]));
  });
});