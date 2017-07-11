From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Wed, 12 Jul 2017 00:20:13 +0200
Subject: [PATCH 0/2] Add PWM support for Meson8
Message-ID: <20170711222015.10401-1-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

This series moves the pwm_ab and pwm_cd nodes to the common meson.dtsi.
According to Amlogic's GPL kernel sources Meson6 contains the same PWM
IP blocks for pwm_ab and pwm_cd (at the same register offsets) as Meson8
and Meson8b.

pwm_ef on the other hand does not exist on Meson6, so it stays in
meson8b.dtsi (and is added to meson8b.dtsi).

Known usages of the PWM controllers:
- controlling the brightness of the system LED
- generating the 32.768kHz wifi LPO clock
- controlling the VDDEE (CPU) voltage


Martin Blumenstingl (2):
  ARM: dts: move the pwm_ab and pwm_cd nodes to meson.dtsi
  ARM: dts: meson8: add the PWM controller nodes

 arch/arm/boot/dts/meson.dtsi   | 14 ++++++++++++++
 arch/arm/boot/dts/meson8.dtsi  | 15 +++++++++++++++
 arch/arm/boot/dts/meson8b.dtsi | 22 ++++++++--------------
 3 files changed, 37 insertions(+), 14 deletions(-)

-- 
2.13.2
