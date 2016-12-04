echo "All ready"
wget https://qc3.androidfilehost.com/dl/zSA_KImRDiQhd2_oNfkcQg/1480923835/385035244224402797/FULL_X500_X500-OS-OP-DHXOSOP5801911241S-5.8.019S.zip
unzip FULL_X500*.zip -d letv
cd letv 
curl https://raw.githubusercontent.com/xpirt/sdat2img/master/sdat2img.py > sdat2img.py
chmod a+x sdat2img.py
./sdat2img.py system.transfer.list system.new.dat system.img
echo "generated system.img"
mkdir system-letv
sudo mount -t ext4 -o loop system.img system-letv/
mkdir output
cp -r system-letv/* output/
tar -czvf output.tar.gz output
curl --ftp-pasv -T output.tar.gz ftp://Infinity:ThugLife@uploads.androidfilehost.com
figlet DONE
echo "thanks :)"
