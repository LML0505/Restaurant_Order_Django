import qrcode 
url="http://192.168.31.178:8080/mobile/table"

qr = qrcode.QRCode(
    version=1,
    box_size=10,
    border=4
)
qr.add_data(url)
qr.make(fit=True)
img=qr.make_image()
img.show()
img.save("/Users/lml/Desktop/Orderweb/qrcode.png")
