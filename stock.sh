echo "All ready"
wget http://bigota.d.miui.com/7.1.5/miui_HM3SGlobal_7.1.5_e696a743c5_6.0.zip
unzip miui_HM3S*.zip -d letv
cd letv 
curl https://raw.githubusercontent.com/xpirt/sdat2img/master/sdat2img.py > sdat2img.py
chmod a+x sdat2img.py
./sdat2img.py system.transfer.list system.new.dat system.img
echo "generated system.img"
mkdir system-letv
sudo mount -t ext4 -o loop system.img system-letv/
mkdir -p output/boot
cp -r system-letv/* output/
cp -r boot.img output/boot/
tar -czvf output.tar.gz output
curl --ftp-pasv -T output.tar.gz ftp://Infinity:ThugLife@uploads.androidfilehost.com
echo "thanks :)"
