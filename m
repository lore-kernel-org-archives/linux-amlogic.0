From: ingrassia@epigenesys.com (Emiliano Ingrassia)
Date: Sun, 6 May 2018 23:53:05 +0200
Subject: [PATCH 0/1] Meson8b RGMII Ethernet pin cleanup
In-Reply-To: <CAFBinCAvkOzQOqFLqpdumx2hbQiq9H6MQpJV6DiemEDwwk_GSg@mail.gmail.com>
References: <20180501220045.2004-1-martin.blumenstingl@googlemail.com>
 <20180503170635.GA1925@ingrassia.epigenesys.com>
 <CAFBinCAvkOzQOqFLqpdumx2hbQiq9H6MQpJV6DiemEDwwk_GSg@mail.gmail.com>
Message-ID: <20180506215305.GA9963@ingrassia.epigenesys.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Martin,

On Fri, May 04, 2018 at 10:09:37PM +0200, Martin Blumenstingl wrote:
> Hi Emiliano,
> 
> On Thu, May 3, 2018 at 7:06 PM, Emiliano Ingrassia
> <ingrassia@epigenesys.com> wrote:
> > Hi Martin,
> >
> > the patch seems to work fine but I have two questions.
> thank you for testing this! :)
>

Thanks for your patch! :)

> > First, should we remove those pins from "ethernet_groups" structure
> > in "drivers/pinctrl/meson/pinctrl-meson8b.c" ?
> I believe that some boards with RMII (100Mbit/s) PHY use TXD0/TXD1 on
> DIF_2_P and DIF_2_N
> so we should keep support for these in the driver
> 
> > Second, following the Odroid-C1+ schematics there are two pins,
> > "eth_rxd2" and "eth_rxd3" which are not configured by the pin controller
> > driver, nor included in the pins group in the relative device tree.
> > Should we configure and include them ?
> interesting - good catch. I think we should include them in both, the
> pinctrl driver and meson8b.dtsi
> do you know which pads are used for "eth_rxd2" and "eth_rxd3"?
>

Following the Odroid-C1+ schematics it seems to me that the differential
pads used for "eth_rxd2" and "eth_rxd3" are exactly DIF_2_P and DIF_2_N.
Infact, comparing the ethernet pads on the schematics and the
"GPIO bank DIF" section on S805 SoC manual, there seems to be
a strict correspondence in the order of the two list of pins.

What do you think ?

> 
> Regards
> Martin

Regards,

Emiliano
