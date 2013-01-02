all: mysql.nsi 
	mkdir -p build
	makensis mysql.nsi
clean:
	rm -rf build
