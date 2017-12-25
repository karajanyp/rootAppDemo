project=$(grep APPLICATION_NAME Makefile | awk '{print $3}')
echo "creating root-permission script for: $project"
if [ ! -d "layout" ]; then
    mkdir layout
    cd layout
 else
 	cd layout
fi

if [ ! -d "DEBIAN" ]; then
    mkdir DEBIAN
    cd DEBIAN
 else
 	cd DEBIAN
fi

if [ -f "layout/DEBIAN/postinst" ]; then
	echo "start copy postinst file to layout/DEBIAN/postinst , and please do code 'make do' again !"
  	touch postinst && cd .. && cd ..
	target=./layout/DEBIAN/postinst
	sudo cp ./sudoapp.template $target
	perl -p -i -e "s,<ProjectName>,$project,g" $target
	chmod 0555 $target
else
	echo "layout/DEBIAN/postinst file exists and do nothing"
fi

