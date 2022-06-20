/**
 * @license Copyright (c) 2003-2018, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see https://ckeditor.com/legal/ckeditor-oss-license
 */

CKEDITOR.editorConfig=function(config){
    config.toolbarGroups=[
        {name:'clipboard',groups:['clipboard','undo']},
        {name:'editing',groups:['find','selection','spellchecker','editing']},
        {name:'links',groups:['links']},
        {name:'insert',groups:['insert']},
        {name:'forms',groups:['forms']},
        {name:'tools',groups:['tools']},
        {name:'document',groups:['mode','document','doctools','Templates']},
        {name:'others',groups:['others']},
        '/',
        {name:'basicstyles',groups:['basicstyles','cleanup']},
        {name:'paragraph',groups:['list','indent','blocks','align','bidi','paragraph']},
        {name:'styles',groups:['styles']},
        {name:'colors',groups:['colors']}
    ];

    config.removeButtons='Flash,PageBreak,Radio,Form,Checkbox,Save,NewPage,Preview,Print,BidiLtr,BidiRtl,Language,Replace,Find,SelectAll,Scayt,Blockquote,CreateDiv';
    config.removePlugins='cloudservices';
    config.removePlugins='easyimage';
    config.extraPlugins='youtube';
    config.skin='moonocolor';

    config.templates_files=['../plugins/ckeditor/templates/templates.js'];
    config.templates_replaceContent=true;
    config.filebrowserImageUploadUrl='_upload_image_ckeditor_ajax.php?type=Images';
    config.enterMode=CKEDITOR.ENTER_BR;
    config.allowedContent=true;
    config.extraAllowedContent='span(*)';
    config.contentsCss=['../css/style.css','../css/all.css','../admin/css/ckeditor.css'];
    config.bodyClass='main-content';
};

CKEDITOR.dtd.$removeEmpty.span=0;

