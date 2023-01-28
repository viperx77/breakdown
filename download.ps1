#!/bin/pwsh
param($url, $title, $stems="5")
$tmp = [System.IO.Path]::GetTempPath()
& "docker" "run" "-it" "-v" "$($tmp):/tmp/output" "-v" "$($tmp):/models" "breakdown" $url "$($stems)stems" 

Copy-Item -Path "$($tmp)/audio.mp3" -Destination ./$title.mp3
Copy-Item -Path "$($tmp)/audio.info.json" -Destination ./"$($title).json"

$file = "$($tmp)/bass.mp3"
If (Test-Path -Path $file -PathType Leaf) {
    Copy-Item -Path $file -Destination ./"$($title)-bass.mp3"
}
$file = "$($tmp)/drums.mp3"
If (Test-Path -Path $file -PathType Leaf) {
    Copy-Item -Path $file -Destination ./"$($title)-drums.mp3"
}
$file = "$($tmp)/other.mp3"
If (Test-Path -Path $file -PathType Leaf) {
    Copy-Item -Path $file -Destination ./"$($title)-other.mp3"
}
$file = "$($tmp)/piano.mp3"
If (Test-Path -Path $file -PathType Leaf) {
    Copy-Item -Path $file -Destination ./"$($title)-piano.mp3"
}
$file = "$($tmp)/vocals.mp3"
If (Test-Path -Path $file -PathType Leaf) {
    Copy-Item -Path $file -Destination ./"$($title)-vocals.mp3"
}
$file = "$($tmp)/accompaniment.mp3"
If (Test-Path -Path $file -PathType Leaf) {
    Copy-Item -Path $file -Destination ./"$($title)-accompaniment.mp3"
}
