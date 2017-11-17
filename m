From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Fri, 17 Nov 2017 23:58:55 +0100
Subject: [PATCH v2 0/2] add Meson8/Meson8b serial core clock handling
Message-ID: <20171117225857.9571-1-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

This patchset adds the tty/serial core clock handling to the UARTs
on Meson8 and Meson8b.

Basically this is the Meson8 and Meson8b version of a patchset from
Helmut Klein and Neil Armstrong, who implemented this for Meson GX
(see [0]). Back then I asked Neil to drop Meson8b from his patchset
because I was working on the Meson8 clock controller at that time.

This also removes the last users that rely on the "amlogic,meson-uart"
binding. Removing that binding from the meson_uart driver is not part
of this series though.

changes since v1 at [1]:
- moved the "baud" clock to the first position because the meson_uart
  driver currently chooses the first clock as baud clock (this is until
  the legacy clock handling is removed from the driver). in v1 the xtal
  clock was the first clock, which means that (other than before) the
  xtal clock was used to generate the baudrate.
- added Jerome's Acked-by (thank you!)


[0] http://lists.infradead.org/pipermail/linux-amlogic/2017-June/004173.html
[1] http://lists.infradead.org/pipermail/linux-amlogic/2017-October/005144.html

Martin Blumenstingl (2):
  ARM: dts: meson8: use stable UART bindings with correct gate clock
  ARM: dts: meson8b: use stable UART bindings with correct gate clock

 arch/arm/boot/dts/meson8.dtsi  | 16 ++++++++++++----
 arch/arm/boot/dts/meson8b.dtsi | 16 ++++++++++++----
 2 files changed, 24 insertions(+), 8 deletions(-)

-- 
2.15.0
