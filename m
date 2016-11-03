From: jbrunet@baylibre.com (Jerome Brunet)
Date: Thu, 03 Nov 2016 17:36:20 +0100
Subject: stmmac/RTL8211F/Meson GXBB: TX throughput problems
In-Reply-To: <CAFBinCD_-KjVa70iOhBSGaXZc9uKy2m4d2yVr-AfLiV7F=3EqQ@mail.gmail.com>
References: <CAFBinCALSL_-izJ2tEsAjevAw90kGNTrQ3na3D1YV8f1dS1=Xg@mail.gmail.com>
 <ff6f3501-fbd5-3e79-dcc1-549406a5144b@st.com>
 <CAFBinCD42A_SqQz8GM-H+A32dMELknAytHuJ5T2YgZ3BrMKA3A@mail.gmail.com>
 <20160917232312.1e30d425@gmail.com>
 <d59f6e2c-15ff-779d-da2f-8eb5f5a535a6@st.com>
 <CAFBinCD_-KjVa70iOhBSGaXZc9uKy2m4d2yVr-AfLiV7F=3EqQ@mail.gmail.com>
Message-ID: <1478190980.6632.26.camel@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Sat, 2016-10-01 at 17:58 +0200, Martin Blumenstingl wrote:
> Hello Peppe,
> 
> On Mon, Sep 26, 2016 at 8:17 AM, Giuseppe CAVALLARO
> <peppe.cavallaro@st.com> wrote:
> > 
> > Hello Andr?
> > 
> > On 9/17/2016 11:23 PM, Andr? Roth wrote:
> > > 
> > > 
> > > 
> > > Hi all,
> > > 
> > > I have an odroid c2 board which shows this issue. No data is
> > > transmitted or received after a moment of intense tx traffic.
> > > Copying a
> > > 1GB file per scp from the board triggers it repeatedly.
> > > 
> > > The board has a stmmac - user ID: 0x11, Synopsys ID: 0x37.
> > > 
> > > When switching the network to 100Mb/s the copying does
> > > not seam to trigger the issue.
> > > 
> > > I've attached the ethtool statistics before and after the
> > > problem.
> > 
> > 
> > at first glance, it enters in EEE mode often in the ethtool.after.
> > On some platforms we met problems and it was necessary to disable
> > the
> > feature. Maybe, you can start looking at if this is true on yours.
> > We will see to provide a clean subset of patches to switch-on/off
> > it.
> I did some hacking in the stmmac driver to disable the LPI stuff (see
> the attachment)
> 
> Unfortunately this did not fix the problem.
> 
> I did not issue any ethtool commands not shown in the logs.
> Also I did not have time to change the AXI tuning / PBL value yet -
> so
> those are also untouched.
> 
> I will keep testing, but unfortunately my device is starting to fall
> apart (I sometimes have DDR initialization issues and u-boot fails to
> come up, oh dear...).

Hi all,

I did several tests on this issue with amlogic's S905 SoC (Synopsys MAC
- user ID: 0x11, Synopsys ID: 0x37.)?

With the OdroidC2 (PHY Realtek RTL8211F), EEE is on by default.
Just before launching iperf3, here are the ethtool stats regarding LPI:
? ? ?irq_tx_path_in_lpi_mode_n: 6
?????irq_tx_path_exit_lpi_mode_n: 5
?????irq_rx_path_in_lpi_mode_n: 76
?????irq_rx_path_exit_lpi_mode_n: 75
?????phy_eee_wakeup_error_n: 0

Sending data with iperf usually works for little while (between 0 and
10s)

# iperf3 -c 192.168.1.170 -p12345
Connecting to host 192.168.1.170, port 12345
local 192.168.1.30 port 54450 connected to 192.168.1.170 port 12345
Interval???????????Transfer?????Bandwidth???????Retr??Cwnd
0.00-1.00???sec???112 MBytes???938 Mbits/sec????0????409 KBytes???????
1.00-2.00???sec???112 MBytes???940 Mbits/sec????0????426 KBytes ? ? ??
2.00-3.00???sec???112 MBytes???939 Mbits/sec????0????426 KBytes???????
3.00-4.00???sec???112 MBytes???940 Mbits/sec????0????426 KBytes???????
4.00-5.00???sec???112 MBytes???940 Mbits/sec????0????426 KBytes???????
5.00-6.00???sec???112 MBytes???939 Mbits/sec????0????426 KBytes???????
6.00-7.00???sec??9.26 MBytes??77.6 Mbits/sec????2???1.41 KBytes???????
7.00-8.00???sec??0.00 Bytes??0.00 bits/sec????1???1.41 KBytes???????
8.00-9.00???sec??0.00 Bytes??0.00 bits/sec????0???1.41 KBytes???????
^C10.00-13.58??sec??0.00 Bytes??0.00 bits/sec????1???1.41 KBytes???????
- - - - - - - - - - - - - - - - - - - - - - - - -
Interval???????????Transfer?????Bandwidth???????Retr
0.00-13.58??sec???681 MBytes???421 Mbits/sec????4?????????????sender
0.00-13.58??sec??0.00 Bytes??0.00 bits/sec??????????????????receiver
iperf3: interrupt - the client has terminated

iperf3 does not exit ant the link seems completely broken. We cannot
send or receive until the interface is brought down then up again.

Here are the LPI related stats after the test:
? ? ?irq_tx_path_in_lpi_mode_n: 48
?????irq_tx_path_exit_lpi_mode_n: 48
?????irq_rx_path_in_lpi_mode_n: 325
?????irq_rx_path_exit_lpi_mode_n: 325
?????phy_eee_wakeup_error_n: 0

Like Martin, I tried playing around with eee in stmmac, but I could not
improve the situation. Then I tried disabling EEE advertisement on the
PHY (patch attached). With this patch, iperf3 runs nicely for me.

This is what the folks of FreeBSD have done for the Same MAC/PHY
combination [0]

On the P200 Board (PHY Micrel KSZ9031), EEE is off by default. There is
no problem on this board right now. I tried to force the activation of
EEE on this board and ended up in the same situation as the OdroidC2
(link broken). The stats were a bit different though:
? ? ?irq_tx_path_in_lpi_mode_n: 28
?????irq_tx_path_exit_lpi_mode_n: 28
?????irq_rx_path_in_lpi_mode_n: 408
?????irq_rx_path_exit_lpi_mode_n: 408
?????phy_eee_wakeup_error_n: 5440

To everybody having similar issue with their OdroidC2, could you try
the attached patch and let us know if it changes anything for you ?

Peppe, Alexandre,
What is your view on this ? I'm not sure that removing EEE
advertisement is the right way to address the problem ?
Could it be an issue stmmac ?
If there is any other information / test which would help understand
the issue, please let me know.

Cheers

Jerome


[0] :?https://github.com/freebsd/freebsd-base-graphics/commit/1f49e276c
3801545dc0a337792a5f07e6ad39c84
?

> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic
-------------- next part --------------
A non-text attachment was scrubbed...
Name: realtek8211f-disable-eee-1000.patch
Type: text/x-patch
Size: 2912 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-amlogic/attachments/20161103/27c2f20a/attachment.bin>
