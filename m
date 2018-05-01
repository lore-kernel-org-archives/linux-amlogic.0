From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Wed,  2 May 2018 00:00:44 +0200
Subject: [PATCH 0/1] Meson8b RGMII Ethernet pin cleanup
Message-ID: <20180501220045.2004-1-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Emiliano, Hi Linus,

could you please test the patch from this series on your Odroid-C1?
I tested it on mine and Ethernet seems to be working fine with it.

There should be no functional changes with this patch as it just
removes an incorrect pad configuration for DIF_2_P and DIF_2_N for
the TXD0 and TXD1 signal (as these are routed to GPIOH_5 and GPIOH_6
on Odroid-C1).


Martin Blumenstingl (1):
  ARM: dts: meson8b: RGMII doesn't use the eth_txd1_1 and eth_txd0_1
    pins

 arch/arm/boot/dts/meson8b.dtsi | 2 --
 1 file changed, 2 deletions(-)

-- 
2.17.0
