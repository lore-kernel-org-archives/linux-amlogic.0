From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sun, 11 Feb 2018 22:18:09 +0100
Subject: [PATCH 0/5] improvements and fixes for the phy-meson-gxl-usb2
 driver
In-Reply-To: <9b5295ea-74a2-7bb1-744e-6e8eb76f2673@amlogic.com>
References: <20180128202245.25021-1-martin.blumenstingl@googlemail.com>
 <9b5295ea-74a2-7bb1-744e-6e8eb76f2673@amlogic.com>
Message-ID: <CAFBinCCZ+eYp0Y7qdvxiHtCxF+AAdxubpUATbzMptFsvRiRvmA@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Yixun,

On Fri, Feb 9, 2018 at 9:27 AM, Yixun Lan <yixun.lan@amlogic.com> wrote:
>
>
> On 01/29/18 04:22, Martin Blumenstingl wrote:
>> This contains two fixes and two (minor) fixes for the phy-meson-gxl-usb2
>> driver:
>> - a clock and reset line is used for the PHYs. this was not clear from
>>   the Amlogic GPL kernel sources since the clock is enabled very early
>>   in the boot process (either because the hardware defaults to "on",
>>   the bootrom enables it or a bootloader before BL3-3/u-boot enables it)
>> - we don't read the controller's dr_mode anymore because the USB2 PHY
>>   can only be switched into host mode if the USB3 PHY knows about it.
>>   Thus auto-detecting the mode doesn't work for this PHY so it's removed
>>   in patch #3
>> - do not log an error message when the phy-supply is not ready yet and
>>   we have to return -EPROBE_DEFER
>> - improve the naming of some U2P_R2 test mode registers
>>
>>
>> Martin Blumenstingl (5):
>>   dt-bindings: phy: meson-gxl-usb2-phy: add the reset line and clock
>>   phy: amlogic: phy-meson-gxl-usb2: support the clock and reset line
>>   phy: amlogic: phy-meson-gxl-usb2: default to host mode
>>   phy: amlogic: phy-meson-gxl-usb2: don't log an error on -EPROBE_DEFER
>>   phy: amlogic: phy-meson-gxl-usb2: rename some of the U2P_R2 registers
>>
>>  .../devicetree/bindings/phy/meson-gxl-usb2-phy.txt |  4 ++
>>  drivers/phy/amlogic/Kconfig                        |  1 -
>>  drivers/phy/amlogic/phy-meson-gxl-usb2.c           | 78 ++++++++++++++++------
>>  3 files changed, 61 insertions(+), 22 deletions(-)
>>
>
> Hi Martin
>
>   thanks for your great work for pushing the USB driver upstream.
you're welcome - I hope that most problems are sorted out in the latest version

>   I've test your whole series[1] on AXG S400 board and it works fine here.
many thanks!
I just re-sent v9 of "initialize (multiple) PHYs for a HCD" and v2
"DWC3 support for Amlogic Meson AXG and GXL SoCs" which both include
fixes based on the feedback I got. I added your "Tested-by" to all
applicable patches, which I hope is fine for you!

I will re-send the USB2 and USB3 PHY patches once -rc1 is out if
Kishon wants me to re-send those with all Reviewed-by/Tested-by's
collected.

> Yixun
>
>
> [1] the whole patch series include
>
> [RFC usb-next v8 0/3] initialize (multiple) PHYs for a HCD
> https://lkml.kernel.org/r/20180125000053.9387-1-martin.blumenstingl at googlemail.com
>
> [PATCH 0/3] DWC3 support for Amlogic Meson AXG and GXL SoCs
> https://lkml.kernel.org/r/20180128200333.20093-1-martin.blumenstingl at googlemail.com
>
> [PATCH v2 0/2] Meson GXL USB3 PHY driver
> https://lkml.kernel.org/r/20180128201554.23889-1-martin.blumenstingl at googlemail.com
>
> [PATCH 1/5] dt-bindings: phy: meson-gxl-usb2-phy: add the reset line and
> clock
> https://lkml.kernel.org/r/20180128202245.25021-1-martin.blumenstingl at googlemail.com


Regards
Martin
