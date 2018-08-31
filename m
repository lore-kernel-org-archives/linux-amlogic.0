From: jasperkcoding@gmail.com (Jasper kcoding)
Date: Fri, 31 Aug 2018 15:53:17 +0200
Subject: Amlogic MMC controller: max-frequency: performance and stability
Message-ID: <CADGf2odEvoGN-Bjqkfi5uOkJmxNQaKfsQ9tO-8fzuavTW2POGA@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi,

There are some questions I have that hopefully someone can answer.
I am wondering why the max-frequency for the eMMC is set to 200000000
in meson-gxl-s905x-p212.dtsi of mainline kernel?
source: https://github.com/torvalds/linux/blob/4658aff6eeaaf0b049ce787513abfc985c452e3a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtsi#L156

This max-frequency is not stable for my p212 based board. Amlogic
kernel set the max-frequency for the p212 board to 100000000.
source: https://github.com/LibreELEC/linux-amlogic/blob/29941550f05282411c00c437b4c18bb5c6319d63/arch/arm64/boot/dts/amlogic/gxl_p212_2g.dts#L467

Setting the max-frequency for the eMMC of my p212 based board to
100000000 is stable for me. The libretech-cc dts sets max-frequency to
5000000, which is half of what amlogic sets in their kernel.
source: https://github.com/torvalds/linux/blob/4658aff6eeaaf0b049ce787513abfc985c452e3a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts#L257

Is the 200000000 max-frequency even stable for other boards?
Besides stability does frequency also affect performance?

thanks,
Jasper
