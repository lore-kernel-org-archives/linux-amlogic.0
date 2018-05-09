From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Thu, 10 May 2018 01:01:03 +0200
Subject: [PATCH 0/1] Meson8b RGMII Ethernet pin cleanup
In-Reply-To: <20180506215305.GA9963@ingrassia.epigenesys.com>
References: <20180501220045.2004-1-martin.blumenstingl@googlemail.com>
 <20180503170635.GA1925@ingrassia.epigenesys.com>
 <CAFBinCAvkOzQOqFLqpdumx2hbQiq9H6MQpJV6DiemEDwwk_GSg@mail.gmail.com>
 <20180506215305.GA9963@ingrassia.epigenesys.com>
Message-ID: <CAFBinCAq1YSzX9dZHt=LouXeRPezVW8KnSZWCKGbMq64ZVekLw@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Emiliano,

On Sun, May 6, 2018 at 11:53 PM, Emiliano Ingrassia
<ingrassia@epigenesys.com> wrote:
> Hi Martin,
>
> On Fri, May 04, 2018 at 10:09:37PM +0200, Martin Blumenstingl wrote:
>> Hi Emiliano,
>>
>> On Thu, May 3, 2018 at 7:06 PM, Emiliano Ingrassia
>> <ingrassia@epigenesys.com> wrote:
>> > Hi Martin,
>> >
>> > the patch seems to work fine but I have two questions.
>> thank you for testing this! :)
>>
>
> Thanks for your patch! :)
>
>> > First, should we remove those pins from "ethernet_groups" structure
>> > in "drivers/pinctrl/meson/pinctrl-meson8b.c" ?
>> I believe that some boards with RMII (100Mbit/s) PHY use TXD0/TXD1 on
>> DIF_2_P and DIF_2_N
>> so we should keep support for these in the driver
>>
>> > Second, following the Odroid-C1+ schematics there are two pins,
>> > "eth_rxd2" and "eth_rxd3" which are not configured by the pin controller
>> > driver, nor included in the pins group in the relative device tree.
>> > Should we configure and include them ?
>> interesting - good catch. I think we should include them in both, the
>> pinctrl driver and meson8b.dtsi
>> do you know which pads are used for "eth_rxd2" and "eth_rxd3"?
>>
>
> Following the Odroid-C1+ schematics it seems to me that the differential
> pads used for "eth_rxd2" and "eth_rxd3" are exactly DIF_2_P and DIF_2_N.
> Infact, comparing the ethernet pads on the schematics and the
> "GPIO bank DIF" section on S805 SoC manual, there seems to be
> a strict correspondence in the order of the two list of pins.
odroid-c1+_rev0.4_20150615.pdf - page 23 almost matches the S805 datasheet:
(left value: Odroid-C1 schematics, right value: S805 datasheet):
- ETH_RXD1 vs ETH_RXD1
- ETH_RXD0 vs ETH_RXD0
- RGMII_RX_CLK vs ETH_RX_DV
- ETH_RX_DV vs ETH_RX_CLK
- ETH_RXD2 vs ETH_TXD0 (questionable in the S805 datasheet?)
- ETH_RXD3 vs ETH_TXD1 (questionable in the S805 datasheet?)
- ETH_PHY_REF_CLK_25MOUT vs ETH_TX_EN
- ETH_TX_EN vs ETH_PHY_REF_CLK
- ETH_MDIO vs ETH_MDC
- ETH_MDC vs ETH_MDIO

> What do you think ?
I think that you made a point here - good catch :)
maybe DIF_2_P and DIF_2_N have different functionality in RMII mode
(TXD0 and TXD1) and RGMII mode (RXD2 and RXD3)?

@Kevin: please ignore this series until we have further clarification
from Amlogic about the function of DIF_2_P and DIF_2_N in RMII/RGMII
mode


Regards
Martin
