From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Fri, 4 May 2018 22:09:37 +0200
Subject: [PATCH 0/1] Meson8b RGMII Ethernet pin cleanup
In-Reply-To: <20180503170635.GA1925@ingrassia.epigenesys.com>
References: <20180501220045.2004-1-martin.blumenstingl@googlemail.com>
 <20180503170635.GA1925@ingrassia.epigenesys.com>
Message-ID: <CAFBinCAvkOzQOqFLqpdumx2hbQiq9H6MQpJV6DiemEDwwk_GSg@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Emiliano,

On Thu, May 3, 2018 at 7:06 PM, Emiliano Ingrassia
<ingrassia@epigenesys.com> wrote:
> Hi Martin,
>
> the patch seems to work fine but I have two questions.
thank you for testing this! :)

> First, should we remove those pins from "ethernet_groups" structure
> in "drivers/pinctrl/meson/pinctrl-meson8b.c" ?
I believe that some boards with RMII (100Mbit/s) PHY use TXD0/TXD1 on
DIF_2_P and DIF_2_N
so we should keep support for these in the driver

> Second, following the Odroid-C1+ schematics there are two pins,
> "eth_rxd2" and "eth_rxd3" which are not configured by the pin controller
> driver, nor included in the pins group in the relative device tree.
> Should we configure and include them ?
interesting - good catch. I think we should include them in both, the
pinctrl driver and meson8b.dtsi
do you know which pads are used for "eth_rxd2" and "eth_rxd3"?


Regards
Martin
