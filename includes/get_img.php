<?php
$img_dir = 'tbi/';
$images = scandir($img_dir);
$html = '';
$html .= '<script src="https://cdn.tms-dist.lan:433/styles/js/photos.js"></script>
                <div class="slideshow-container">';
$tot = count($images) - 2;
$count = 1;
if ($tot == 0) {
    echo '<script>
        $(".slideshow-container").addClass("no-slides");
    </script>';
    $html .= 'There happens to be no slides to show.';
} else {
    foreach ($images as $img) {
        if ($img === '.' || $img === '..') {
            continue;
        }
        if ((preg_match('/.JPG/', $img)) || (preg_match('/.gif/', $img)) || (preg_match('/.tiff/', $img)) || (preg_match('/.png/', $img))
        ) {
            $i = '/includes/' . $img_dir . $img;
            list($w, $h) = getimagesize($i);
            if ($h > $w) {
                $sC = imagecreatefromjpeg($i);
                $rI = imagerotate($sC, 90, 0);
                imagejpeg($rI, $i);
                $html .= '<div class="mySlides fade">
                <div class="numbertext">' . $count . '/' . $tot . '</div>
                <img src="' . $i . '" style="width:80px" alt="' . file_ext($img) . '"></img>
                <div class="text">' . file_ext($img) . '</div>
                </div>';
            } else {
                $html .= '<div class="mySlides fade">
                <div class="numbertext">' . $count . '/' . $tot . '</div>
                <img src="' . $i . '" style="width:100%" alt="' . file_ext($img) . '"></img>
                <div class="text">' . file_ext($img) . '</div>
                </div>';
            }
            $count += 1;
        } else {
            continue;
        }
    }
    $html .= '</div><p>';
    $count = 1;
    $html .= '<div class="navigation tms-center">';
    for (; $count <= $tot; $count++) {
        $html .= '<span class="dot" onclick="currentSlide(' . $count . ')"></span>';
    }
}

$html .= '</div>';
echo $html;

function file_ext($strName)
{
    $ext = strrchr($strName, '.');
    if ($ext !== false) {
        $strName = substr($strName, 0, -strlen($ext));
    }
    return $strName;
}
