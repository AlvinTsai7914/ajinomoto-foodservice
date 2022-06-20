<?php

require_once $_SERVER["DOCUMENT_ROOT"] . "/libs/PHPExcel.php";
$objPHPExcel = new PHPExcel();
//保存excel—2007格式
$objWriter = new PHPExcel_Writer_Excel2007($objPHPExcel);


$styleArray = array(
    'font' => array(
        'size' => 11,
        //'bold'  => true,
        //'color' => array('rgb' => $c2),
        'name' => '微軟正黑體'
    )
);
$objPHPExcel->getActiveSheet()->getDefaultStyle()->applyFromArray($styleArray);

//直接輸出到瀏覽器
ob_end_clean();
header("Pragma: public");
header("Expires: 0");
header("Cache-Control:must-revalidate, post-check=0, pre-check=0");
header("Content-Type:application/force-download");
header("Content-Type:application/vnd.ms-execl");
header("Content-Type:application/octet-stream");
header("Content-Type:application/download");
header("Content-Transfer-Encoding:binary");
header('Cache-Control: max-age=0');

//PHPExcel Function=============================================================
//轉換
function cell($x, $y) {
    return PHPExcel_Cell::stringFromColumnIndex($x) . $y;
}

function coordinate($cell1, $cell2) {
    return $cell1 . ":" . $cell2;
}

function mergeCells($cell1, $cell2) {
    global $objPHPExcel;
    $objPHPExcel->getActiveSheet()->mergeCells(coordinate($cell1, $cell2));
}

function set_cell_string($cell, $val, $bold = false) {
    global $objPHPExcel;
    $objPHPExcel->getActiveSheet()->getCell($cell)->setValueExplicit($val, PHPExcel_Cell_DataType::TYPE_STRING2);
    $objPHPExcel->getActiveSheet()->getStyle($cell)->getFont()->setBold($bold);
}

function set_cell_number($cell, $val, $bold = false) {
    global $objPHPExcel;
    $objPHPExcel->getActiveSheet()->getCell($cell)->setValueExplicit($val, PHPExcel_Cell_DataType::TYPE_NUMERIC);
    $objPHPExcel->getActiveSheet()->getStyle($cell)->getNumberFormat()->setFormatCode('#,##0');
    $objPHPExcel->getActiveSheet()->getStyle($cell)->getFont()->setBold($bold);
}

function set_cell_number_formula($cell, $val, $bold = false) {
    global $objPHPExcel;
    $objPHPExcel->getActiveSheet()->setCellValue($cell, $val);
    $objPHPExcel->getActiveSheet()->getStyle($cell)->getNumberFormat()->setFormatCode('#,##0');
    $objPHPExcel->getActiveSheet()->getStyle($cell)->getFont()->setBold($bold);
}

function set_cell_percentage($cell, $val, $bold = false) {
    global $objPHPExcel;
    $objPHPExcel->getActiveSheet()->getCell($cell)->setValueExplicit($val, PHPExcel_Cell_DataType::TYPE_NUMERIC);
    $objPHPExcel->getActiveSheet()->getStyle($cell)->getNumberFormat()->setFormatCode('0.0%');
    $objPHPExcel->getActiveSheet()->getStyle($cell)->getFont()->setBold($bold);
}

function set_cell_percentage_formula($cell, $val, $bold = false) {
    global $objPHPExcel;
    $objPHPExcel->getActiveSheet()->setCellValue($cell, $val);
    $objPHPExcel->getActiveSheet()->getStyle($cell)->getNumberFormat()->setFormatCode('0.0%');
    $objPHPExcel->getActiveSheet()->getStyle($cell)->getFont()->setBold($bold);
}

// cell 顏色
function cell_color_ds($x, $y, $color, $c2 = '') {
    cell_color(cell($x, $y), $color, $c2);
}

function cell_color($cells, $color, $c2 = '') {
    global $objPHPExcel;

    $styleArray = array(
        'type' => PHPExcel_Style_Fill::FILL_SOLID,
        'startcolor' => array(
            'rgb' => $color
        )
    );
    $objPHPExcel->getActiveSheet()->getStyle($cells)->getFill()->applyFromArray($styleArray);

    if ($c2 != '') {
        text_color($cells, $c2);
    }
}

// text 顏色
function text_color_ds($x, $y, $color) {
    text_color(cell($x, $y), $color);
}

function text_color($cells, $color) {
    global $objPHPExcel;
    $styleArray = array(
        'font' => array(
            //'bold'  => true,
            'color' => array('rgb' => $color),
        //'size'  => 15,
        //'name'  => 'Verdana'
        )
    );
    $objPHPExcel->getActiveSheet()->getStyle($cells)->applyFromArray($styleArray);
}

// border
function cell_border_ds($x, $y, $x2 = '', $y2 = '') {
    if ($x2 != '' && $y2 != '') {
        cell_border(cell($x, $y) . ':' . cell($x2, $y2));
    } else {
        cell_border(cell($x, $y));
    }
}

function cell_border($cells) {
    global $objPHPExcel;
    $style = array(
        'borders' => array(
            'allborders' => array(
                'style' => PHPExcel_Style_Border::BORDER_THIN
            )
        )
    );
    $objPHPExcel->getActiveSheet()->getStyle($cells)->applyFromArray($style);
}

//置中
function cell_center($cells) {
    global $objPHPExcel;
    $style = array(
        'alignment' => array(
            'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER,
        )
    );
    $objPHPExcel->getActiveSheet()->getStyle($cells)->applyFromArray($style);
}

//靠左
function cell_left($cells) {
    global $objPHPExcel;
    $style = array(
        'alignment' => array(
            'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_LEFT,
        )
    );
    $objPHPExcel->getActiveSheet()->getStyle($cells)->applyFromArray($style);
}

//靠右
function cell_right($cells) {
    global $objPHPExcel;
    $style = array(
        'alignment' => array(
            'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_RIGHT,
        )
    );
    $objPHPExcel->getActiveSheet()->getStyle($cells)->applyFromArray($style);
}
