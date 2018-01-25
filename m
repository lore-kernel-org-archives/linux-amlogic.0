From: linus.luessing@c0d3.blue (Linus =?utf-8?Q?L=C3=BCssing?=)
Date: Thu, 25 Jan 2018 03:18:12 +0100
Subject: [PATCH v2 2/2] ARM: dts: meson8b-odroidc1: ethernet support
In-Reply-To: <e0edec83100c6f76136721dd05ffe4fab8653ca4.1516326105.git.ingrassia@epigenesys.com>
References: <cover.1516326105.git.ingrassia@epigenesys.com>
 <e0edec83100c6f76136721dd05ffe4fab8653ca4.1516326105.git.ingrassia@epigenesys.com>
Message-ID: <20180125021812.GC1756@otheros>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Emiliano,

On Fri, Jan 19, 2018 at 02:49:17AM +0100, Emiliano Ingrassia wrote:
> The Odroid-C1+ board is equipped with an RTL8211F ethernet PHY
> which supports 10/100/1000 Mbps ethernet.
> The PHY reset and interrupt lines are controlled by the SoC via
> two GPIO lines (GPIOH_4 and GPIOH_3 respectively).
> The PHY energy efficient ethernet (eee) mode is marked as broken
> using "eee-broken-1000t" because, during tests, high packet losses
> were experienced without it.
> 
> Signed-off-by: Emiliano Ingrassia <ingrassia@epigenesys.com>

I tested your patches on a 4.15-rc8 kernel with the following
patches on top:

f120580deba4 ARM: dts: meson8b-odroidc1: ethernet support
22a6d87b9ee2 ARM: dts: meson8b: extend ethernet controller description
6d053e5f1f3b net: stmmac: dwmac-meson8b: propagate rate changes to the parent clock
8a5f3df5bcfa net: stmmac: dwmac-meson8b: fix setting the RGMII TX clock on Meson8b
c045d6785ec7 net: stmmac: dwmac-meson8b: fix internal RGMII clock configuration
6b63adce0b60 net: stmmac: dwmac-meson8b: only configure the clocks in RGMII mode
9e8946eda815 clk: meson: mpll: use 64-bit maths in params_from_rate

And config file created via multiv7_defconfig.

I tested against a laptop with an Intel Core2Duo and an Intel
82567LM Gigabit network card.

These are the results I get with iperf3, running for 120s for each
test:

# Direct Gigabit connection between Odroid C1+ and the laptop:

Odroid C1+ -> Laptop: 646MBit/s
Laptop -> Odroid C1+: 239MBit/s

# 100Mbit forced via 'ethtool advertise 0x008' on laptop:

Odroid C1+ -> Laptop: 84.6MBit/s
Laptop -> Odroid C1+: 52.7MBit/s

# Connection with a Gigabit switch in between:

Odroid C1+ -> GBit-SW -> Laptop: 626MBit/s
Laptop -> GBit-SW -> Odroid C1+: 248MBit/s

# Connection with a 100MBit switch in between:

Odroid C1+ -> 100MBit-SW -> Laptop: 91.7MBit/s
Laptop -> 100MBit-SW -> Odroid C1+: 43.7MBit/s


Not quite sure why RX is somehow slower than TX on the C1+.
But other than that looks great :-). Many thanks to
everyone who had contributed!

Tested-by: Linus L?ssing <linus.luessing@c0d3.blue>
