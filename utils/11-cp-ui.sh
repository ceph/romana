for unit in dashboard admin login manage
do
  rsync -av /romana.git/${unit}/dist/ /home/vagrant/calamari/webapp/content/${unit}
done
