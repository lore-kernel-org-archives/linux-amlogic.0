From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sun, 28 Oct 2018 15:03:40 +0100
Subject: [PATCH 0/3] 32-bit Meson: add missing /chosen/stdout-path
Message-ID: <20181028140343.1071-1-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Some boards don't have the /chosen/stdout-path property yet. Support
for these boards is far from being complete and I don't have any of
those for testing. Whenever someone reports an issue with one of these
boards I would like an output with the "earlycon" kernel argument.
However, this only works when the board sets the /chosen/stdout-path
property.

None of these were tested manually, but since it's the same for all
existing (32-bit and 64-bit) boards it's safe to assume that this will
work.


Martin Blumenstingl (3):
  ARM: dts: meson6: atv1200: add the /chosen/stdout-path property
  ARM: dts: meson8: minix-neo-x8: add the /chosen/stdout-path property
  ARM: dts: meson8b: mxq: add the /chosen/stdout-path property

 arch/arm/boot/dts/meson6-atv1200.dts      | 4 ++++
 arch/arm/boot/dts/meson8-minix-neo-x8.dts | 4 ++++
 arch/arm/boot/dts/meson8b-mxq.dts         | 4 ++++
 3 files changed, 12 insertions(+)

-- 
2.19.1
