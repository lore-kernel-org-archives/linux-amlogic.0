From: ingrassia@epigenesys.com (Emiliano Ingrassia)
Date: Sun, 28 Jan 2018 17:28:40 +0100
Subject: [PATCH v2 2/2] ARM: dts: meson8b-odroidc1: ethernet support
In-Reply-To: <20180125021812.GC1756@otheros>
References: <cover.1516326105.git.ingrassia@epigenesys.com>
 <e0edec83100c6f76136721dd05ffe4fab8653ca4.1516326105.git.ingrassia@epigenesys.com>
 <20180125021812.GC1756@otheros>
Message-ID: <20180128162840.GA15681@ingrassia.epigenesys.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Linus,

thanks for testing!

On Thu, Jan 25, 2018 at 03:18:12AM +0100, Linus L?ssing wrote:
> Hi Emiliano,
> 
> On Fri, Jan 19, 2018 at 02:49:17AM +0100, Emiliano Ingrassia wrote:
> > The Odroid-C1+ board is equipped with an RTL8211F ethernet PHY
> > which supports 10/100/1000 Mbps ethernet.
> > The PHY reset and interrupt lines are controlled by the SoC via
> > two GPIO lines (GPIOH_4 and GPIOH_3 respectively).
> > The PHY energy efficient ethernet (eee) mode is marked as broken
> > using "eee-broken-1000t" because, during tests, high packet losses
> > were experienced without it.
> > 
> > Signed-off-by: Emiliano Ingrassia <ingrassia@epigenesys.com>
> 
> I tested your patches on a 4.15-rc8 kernel with the following
> patches on top:
> 
> f120580deba4 ARM: dts: meson8b-odroidc1: ethernet support
> 22a6d87b9ee2 ARM: dts: meson8b: extend ethernet controller description
> 6d053e5f1f3b net: stmmac: dwmac-meson8b: propagate rate changes to the parent clock
> 8a5f3df5bcfa net: stmmac: dwmac-meson8b: fix setting the RGMII TX clock on Meson8b
> c045d6785ec7 net: stmmac: dwmac-meson8b: fix internal RGMII clock configuration
> 6b63adce0b60 net: stmmac: dwmac-meson8b: only configure the clocks in RGMII mode
> 9e8946eda815 clk: meson: mpll: use 64-bit maths in params_from_rate
> 
> And config file created via multiv7_defconfig.
> 
> I tested against a laptop with an Intel Core2Duo and an Intel
> 82567LM Gigabit network card.
> 
> These are the results I get with iperf3, running for 120s for each
> test:
> 
> # Direct Gigabit connection between Odroid C1+ and the laptop:
> 
> Odroid C1+ -> Laptop: 646MBit/s
> Laptop -> Odroid C1+: 239MBit/s
> 
> # 100Mbit forced via 'ethtool advertise 0x008' on laptop:
> 
> Odroid C1+ -> Laptop: 84.6MBit/s
> Laptop -> Odroid C1+: 52.7MBit/s
> 
> # Connection with a Gigabit switch in between:
> 
> Odroid C1+ -> GBit-SW -> Laptop: 626MBit/s
> Laptop -> GBit-SW -> Odroid C1+: 248MBit/s
> 
> # Connection with a 100MBit switch in between:
> 
> Odroid C1+ -> 100MBit-SW -> Laptop: 91.7MBit/s
> Laptop -> 100MBit-SW -> Odroid C1+: 43.7MBit/s
> 
> 
> Not quite sure why RX is somehow slower than TX on the C1+.
> But other than that looks great :-). Many thanks to
> everyone who had contributed!
>
> Tested-by: Linus L?ssing <linus.luessing@c0d3.blue>

I tested ethernet performance, with the same patches applied
on top of 4.15-rc8 kernel, using the kernel packet generator
configured as follow:

# echo "add_device eth0" > /proc/net/pktgen/kpktgend_0
# echo "dst_min 1.0.0.1" > /proc/net/pktgen/eth0
# echo "dst_max 254.255.255.254" > /proc/net/pktgen/eth0
# echo "src_max 254.255.255.254" > /proc/net/pktgen/eth0
# echo "src_min 1.0.0.1" > /proc/net/pktgen/eth0
# echo "count 1000000000"  > /proc/net/pktgen/eth0
# echo "min_pkt_size 1500"  > /proc/net/pktgen/eth0
# echo "max_pkt_size 1500"  > /proc/net/pktgen/eth0
# echo "udp_src_min 1"  > /proc/net/pktgen/eth0
# echo "udp_src_max 65534"  > /proc/net/pktgen/eth0
# echo "src_mac <mac_src>"  > /proc/net/pktgen/eth0
# echo "dst_mac <mac_dst>"  > /proc/net/pktgen/eth0
# echo "flag TXSIZE_RND"  > /proc/net/pktgen/eth0
# echo "flag IPSRC_RND"  > /proc/net/pktgen/eth0
# echo "flag IPDST_RND"  > /proc/net/pktgen/eth0
# echo "flag UDPDST_RND"  > /proc/net/pktgen/eth0
# echo "flag UDPSRC_RND"  > /proc/net/pktgen/eth0
# echo start > /proc/net/pktgen/pgctrl

on a direct Gigabit connection between the board and a laptop
with gigabit ethernet interface.
The results were measured with the tool "nload".

Running the rx/tx tests separately I got:

Odroid C1+ -> Laptop: 941MBit/s
Laptop -> Odroid C1+: 934MBit/s

Testing in parallel (generator used on both sides):

Odroid C1+ -> Laptop: 245MBit/s (outgoing)
Laptop -> Odroid C1+: 455MBit/s (incoming)

with just one CPU fully loaded (for the packet generator) and about
67 MB of RAM in use (on the C1+).

On my board "ethtool eth0" reports:

Settings for eth0:
        Supported ports: [ TP MII ]
        Supported link modes:   10baseT/Half 10baseT/Full
                                100baseT/Half 100baseT/Full
                                1000baseT/Full
        Supported pause frame use: Symmetric Receive-only
        Supports auto-negotiation: Yes
        Advertised link modes:  10baseT/Half 10baseT/Full
                                100baseT/Half 100baseT/Full
                                1000baseT/Full
        Advertised pause frame use: No
        Advertised auto-negotiation: Yes
        Link partner advertised link modes:  10baseT/Half 10baseT/Full
                                             100baseT/Half 100baseT/Full
                                             1000baseT/Full
        Link partner advertised pause frame use: Symmetric
        Link partner advertised auto-negotiation: Yes
        Speed: 1000Mb/s
        Duplex: Full
        Port: MII
        PHYAD: 0
        Transceiver: internal
        Auto-negotiation: on
        Supports Wake-on: ug
        Wake-on: d
        Current message level: 0x0000003f (63)
                               drv probe link timer ifdown ifup
        Link detected: yes

Also, "mii-tool eth0" reports:

eth0: negotiated 1000baseT-FD flow-control, link ok

So, apparently, we have a 1Gbit full-duplex connection while, from
the tests, it seems we have less than a half-duplex connection.
I can't explain why.

About the fact that Rx speed is about half the Tx speed, 
I think this is due to the different length of the FIFO queue inside
the MAC. The SoC S805 manual reports an Rx FIFO of 4KB and a Tx FIFO
of 2KB, with the latter half the former.

Regards,

Emiliano
