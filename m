From: linus.luessing@c0d3.blue (=?UTF-8?q?Linus=20L=C3=BCssing?=)
Date: Tue, 26 Sep 2017 03:08:46 +0200
Subject: [RFC PATCH 0/1] ARM: meson: Add Ethernet for Odroid C1/C1+
Message-ID: <20170926010847.30219-1-linus.luessing@c0d3.blue>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi,

I'm currently trying to get the ethernet device of the Odroid C1+
up and running. Especially thanks to Martin's help I was able to
get the meson8b-dwmac driver to recognize the RTL8211F Gigabit
Ethernet chip.

Unfortunately, trying to set the eth0 device up with ip link
fails so far:

~~~
$ ip link set up dev eth0
RTNETLINK answers: Device or resource busy
~~~

And the kernel complains with this then:

~~~
[  105.123705] meson8b-dwmac c9410000.ethernet eth0: device MAC address da:0e:a8:ec:a8:a7
[  105.322726] RTL8211F Gigabit Ethernet stmmac-0:00: attached PHY driver [RTL8211F Gigabit Ethernet] (mii_bus:phy_addr=stmmac-0:00, irq=POLL)
[  105.362725] meson8b-dwmac c9410000.ethernet: Failed to reset the dma
[  105.363466] meson8b-dwmac c9410000.ethernet eth0: stmmac_hw_setup: DMA engine initialization failed
[  105.372493] meson8b-dwmac c9410000.ethernet eth0: stmmac_open: Hw setup failed
~~~

I'm sorry, I'm rather new to this. What could be a common mistake
to cause such an error?

Regard, Linus

PS: A full serial console output will follow in a separate mail.
