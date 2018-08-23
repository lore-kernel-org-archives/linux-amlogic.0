From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Thu, 23 Aug 2018 20:42:12 +0200
Subject: [v3, net-next, 02/12] net: stmmac: Do not keep rearming the
 coalesce timer in stmmac_xmit
In-Reply-To: <7c15f9477adbf69c6eb57a2a89273f7afc51574e.camel@baylibre.com>
References: <9d0be5db11478d00a9194065abcf137b4d537c0a.1526651009.git.joabreu@synopsys.com>
 <7c15f9477adbf69c6eb57a2a89273f7afc51574e.camel@baylibre.com>
Message-ID: <CAFBinCDvcGCnKEzYP+X4Qjf9OfLUaha-TsVNPX3gVVaMOZ6n=w@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi,

On Fri, Aug 17, 2018 at 9:32 AM Jerome Brunet <jbrunet@baylibre.com> wrote:
>
> On Fri, 2018-05-18 at 14:55 +0100, Jose Abreu wrote:
> > This is cutting down performance. Once the timer is armed it should run
> > after the time expires for the first packet sent and not the last one.
> >
> > After this change, running iperf, the performance gain is +/- 24%.
>
> Hi Guys,
>
> Since v4.18, we are getting a serious regression on Amlogic based SoCs.
> I have tested this on amlogic's:
> * gxbb S905 p200 (Micrel KSZ9031 - 1GBps)
> * axg A113 s400 (Realtek RTL8211F - 1GBps)
>
> Both SoCs use the synopsys gmac with stmmac driver.
I can confirm this on Odroid-C1 (Meson8b SoC with RTL8211F RGMII PHY) as well

> I first noticed that running NFS root filesystem became unstable but I could not
> understand why. Then, running a download as simple test with iperf3 (from an
> initramfs) will break the 'network' in matter of seconds.
I didn't run iperf, simply downloading the latest rootfs package
updates (on Arch Linux ARM) caused the network to break

> I don't know exactly what breaks but bisect clearly assign the blame to this
> change. Reverting the change solve this problem.
>
> I'll be happy to make more tests to help understand what is happening here.
if some latency is fine then I can also help testing

here's a bootlog excerpt with the info from the dwmac-meson8b driver
(used on all platforms listed above):
meson8b-dwmac c9410000.ethernet: PTP uses main clock
meson8b-dwmac c9410000.ethernet: User ID: 0x10, Synopsys ID: 0x37
meson8b-dwmac c9410000.ethernet: DWMAC1000
meson8b-dwmac c9410000.ethernet: DMA HW capability register supported
meson8b-dwmac c9410000.ethernet: RX Checksum Offload Engine supported
meson8b-dwmac c9410000.ethernet: COE Type 2
meson8b-dwmac c9410000.ethernet: TX Checksum insertion supported
meson8b-dwmac c9410000.ethernet: Wake-Up On Lan supported
meson8b-dwmac c9410000.ethernet: Normal descriptors
meson8b-dwmac c9410000.ethernet: Ring mode enabled
meson8b-dwmac c9410000.ethernet: Enable RX Mitigation via HW Watchdog Timer
...
meson8b-dwmac c9410000.ethernet eth0: device MAC address [...random
mac address...]
RTL8211F Gigabit Ethernet stmmac-0:00: attached PHY driver [RTL8211F
Gigabit Ethernet] (mii_bus:phy_addr=stmmac-0:00, irq=27)
...
meson8b-dwmac c9410000.ethernet eth0: No Safety Features support found
meson8b-dwmac c9410000.ethernet eth0: PTP not supported by HW
IPv6: ADDRCONF(NETDEV_UP): eth0: link is not ready


Regards
Martin
