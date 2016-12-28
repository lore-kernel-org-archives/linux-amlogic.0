From: webczat_200@poczta.onet.pl (=?UTF-8?Q?Micha=c5=82_Zegan?=)
Date: Wed, 28 Dec 2016 04:06:14 +0100
Subject: problems with odroid c2 support with kernel 4.10 from master
Message-ID: <b31fdc89-2d36-d115-5f46-ca78bd49260a@poczta.onet.pl>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hello.

I have kernel 4.10 from master, with most thing compiled as modules
(personal preference), running on odroid c2.
I am now in a basic/test initramfs with a shell and modules at hand,
trying to load them.
There seem to be few problems there with usb.
Fixed regulator is now loaded. I load the phy-meson8b-usb2 first, then dwc2.
I get so: note the errors at the beginning. usb0 does not start, usb1
does start.
c9000000.usb supply vusb_d not found, using dummy regulator
c9000000.usb supply vusb_a not found, using dummy regulator
phy phy-c0000000.phy.0: USB ID detect failed!
phy phy-c0000000.phy.0: phy poweron failed --> -22
dwc2: probe of c9000000.usb failed with error -22
c9100000.usb supply vusb_d not found, using dummy regulator
c9100000.usb supply vusb_a not found, using dummy regulator
dwc2 c9100000.usb: DWC OTG Controller
dwc2 c9100000.usb: new USB bus registered, assigned bus number 1
dwc2 c9100000.usb: irq 20, io mem 0x00000000
usb usb1: New USB device found, idVendor=1d6b, idProduct=0002
usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
usb usb1: Product: DWC OTG Controller
usb usb1: Manufacturer: Linux 4.10.0-rc1 dwc2_hsotg
usb usb1: SerialNumber: c9100000.usb
hub 1-0:1.0: USB hub found
hub 1-0:1.0: 1 port detected

Also another thing: trying to load arm-scpi and things like cpufreq or
hwmon modules for scpi, it seems scpi is not detected, not sure what is
missing?

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 525 bytes
Desc: OpenPGP digital signature
URL: <http://lists.infradead.org/pipermail/linux-amlogic/attachments/20161228/3ac1cd45/attachment.sig>
