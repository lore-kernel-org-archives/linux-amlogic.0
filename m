From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Wed, 29 Aug 2018 20:05:50 +0200
Subject: [PATCH] Revert "net: stmmac: Do not keep rearming the coalesce
 timer in stmmac_xmit"
References: <20180824090440.13411-1-jbrunet@baylibre.com>
 <d3858ef0-97c7-28b5-db4a-4ac71af52ba5@synopsys.com>
 <CAFBinCA+Q6vLzutdMLOgeTDg5GBkqvp3YzBQiUd_y-qyiz=dsQ@mail.gmail.com>
Message-ID: <CAFBinCDZ3t-_-+Erfm_ubTjKkHpfQ1zWsLg=Ad7rwBHuiGm_xg@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Wed, Aug 29, 2018 at 8:03 PM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
[snip]
> from that point on:
> # dmesg | tail -n 4
> [   47.782778] RTL8211F Gigabit Ethernet 0.2009087f:00: attached PHY driver [RTL8211F Gigabit Ethernet] (mii_bus:phy_addr=0.2009087f:00, irq=30)
> [   47.803540] meson8b-dwmac c9410000.ethernet eth0: No Safety Features support found
> [   47.805505] meson8b-dwmac c9410000.ethernet eth0: PTP not supported by HW
> [   50.311975] meson8b-dwmac c9410000.ethernet eth0: Link is Up - 1Gbps/Full - flow control rx/tx
I forgot to mention: after traffic doesn't flow anymore there are no
additional messages in the kernel log
thus the output of "dmesg | tail -n 4" is identical before and after
the test run


Regards
Martin
