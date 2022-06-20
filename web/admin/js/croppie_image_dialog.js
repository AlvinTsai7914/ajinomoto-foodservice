var croppie_width = 0;
var croppie_height = 0;
var croppie_viewport_width = 0;
var croppie_viewport_height = 0;
var croppie_source = "";
var croppie_result = "";
var croppie_preview = "";

//顯示對話框
$('#croppie_modal').on('shown.bs.modal', function (e) {
    $(this).find('.modal-content, .modal-body').css({
        width: 'auto',
        height: 'auto',
        'max-height': '100%'
    });

    ClearImageModelField();
    //取得顯示對話框的button
    var button = $(e.relatedTarget);
    croppie_width = (button.data('width') !== null) ? button.data('width') : 300;
    croppie_height = (button.data('height') !== null) ? button.data('height') : 300;
    croppie_source = (button.data('source') !== null) ? button.data('source') : "";
    croppie_result = (button.data('result') !== null) ? button.data('result') : "";
    croppie_preview = (button.data('preview') !== null) ? button.data('preview') : "";

    if (croppie_result === "")
        $('#croppie_modal').hide();

    var title = "圖片編輯：" + croppie_width + "×" + croppie_height;
    $("#croppie_modal .modal-title").text(title);

    if (croppie_source !== "")
    {
        $("#croppie_file_input").val($(croppie_source).val());
        InitCroppie($(croppie_source).val());
    }
});

//確定-關閉對話框
$("#croppie_confirm_btn").click(function () {
    $("#croppie_modal_img").croppie('result', {
        type: 'canvas',
        //size: 'viewport'
        size: {width: croppie_width, height: croppie_height}
    }).then(function (resp) {
        $(croppie_source).val($("#croppie_file_input").val()).trigger('change');
        $(croppie_result).val(resp).trigger('change');
        $(croppie_preview).attr("src", resp).trigger('change');
        $('#croppie_modal').modal('hide');
        ClearImageModelField();
    });
});

$("#croppie_file_btn").click(function () {
    $("#croppie_hidden_file_input").click();
});

$("#croppie_hidden_file_input").change(function () {
    $("#croppie_modal_img").croppie('destroy');
    var fileobj = $("#croppie_hidden_file_input")[0].files[0];
    if (fileobj) {
        var reader = new FileReader();
        reader.onload = function (e) {
            InitCroppie(e.target.result);
            $("#croppie_file_input").val(fileobj.name);
            $("#croppie_hidden_file_input").val("");
        };
        reader.readAsDataURL(fileobj);
    } else {
        ClearImageModelField();
    }
});

function ClearImageModelField() {
    $("#croppie_hidden_file_input").val("");
    $("#croppie_hidden_file_input").hide();
    $("#croppie_modal_img").croppie('destroy');
    croppie_width = 0;
    croppie_height = 0;
    croppie_viewport_width = 0;
    croppie_viewport_height = 0;
    croppie_source = "";
    croppie_source_src = "";
}

function InitCroppie(src)
{
    $("#croppie_modal_img").croppie('destroy');
    var tmpImg = new Image();
    tmpImg.src = src;
    tmpImg.onload = function () {
        croppie_viewport_width = croppie_width;
        croppie_viewport_height = croppie_height;
        var minWidth = croppie_width;
        if (minWidth > $("#croppie_modal .modal-dialog").width())
            minWidth = $("#croppie_modal .modal-dialog").width() - 32;

        if (croppie_viewport_width >= minWidth)
        {
            croppie_viewport_height = croppie_viewport_height * (minWidth / croppie_viewport_width);
            croppie_viewport_width = minWidth;
        }
        $("#croppie_modal_img").croppie({
            url: src,
            viewport: {width: croppie_viewport_width, height: croppie_viewport_height, type: 'square'},
            boundary: {width: croppie_viewport_width, height: croppie_viewport_height},
            showZoomer: true,
            enableResize: false,
            enableOrientation: true,
            maxZoomedCropWidth: 100,
            enforceBoundary: true
        });
        $("#croppie_modal_img").croppie('bind', {url: src});
    };
}
