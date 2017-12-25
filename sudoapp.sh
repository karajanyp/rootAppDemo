project=$(grep APPLICATION_NAME Makefile | awk '{print $3}')
echo "creating root-permission script for: $project"
mkdir layout && cd layout
mkdir DEBIAN && cd DEBIAN && touch postinst && cd .. && cd .. && cd ..
target=layout/DEBIAN/postinst
sudo cp sudoapp.template $target
perl -p -i -e "s,<ProjectName>,$project,g" $target
chmod 0555 $target
