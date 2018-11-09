From: narmstrong@baylibre.com (Neil Armstrong)
Date: Fri, 9 Nov 2018 11:08:14 +0100
Subject: [PATCH v3 1/3] arm64: dts: meson-gxl: add support for phicomm n1
In-Reply-To: <20181109100701.62vxl4wdgm5lwn36@raspberrypi>
References: <20181105172904.omks6taxjzcwroky@raspberrypi>
 <bfe5d8b7-fabc-dec1-2798-8922f3a69350@baylibre.com>
 <20181109100701.62vxl4wdgm5lwn36@raspberrypi>
Message-ID: <957d2b9a-ddf0-e254-4c1e-242bdab71456@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 09/11/2018 11:07, He Yangxuan wrote:
> On Fri, Nov 09, 2018 at 10:47:37AM +0100, Neil Armstrong wrote:
>> Hi,
>>
>> On 05/11/2018 18:29, He Yangxuan wrote:
>>> This patch adds support for the Phicomm N1. This device based on P230 reference design.
>>> The phy is RTL8211F, need to disable Energy Efficient Ethernet (EEE) to make it stable.
>>> And this box doesn't have cvbs, so disable related section in device tree.
>>>
>>> Signed-off-by: He Yangxuan <yangxuan8282@gmail.com>
>>> ---
>>>  arch/arm64/boot/dts/amlogic/Makefile               |  1 +
>>>  .../dts/amlogic/meson-gxl-s905d-phicomm-n1.dts     | 26 ++++++++++++++++++++++
>>>  2 files changed, 27 insertions(+)
>>>  create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxl-s905d-phicomm-n1.dts
>>>
>>> diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
>>> index c31f29d66..49f3ac5d8 100644
>>> --- a/arch/arm64/boot/dts/amlogic/Makefile
>>> +++ b/arch/arm64/boot/dts/amlogic/Makefile
>>> @@ -18,6 +18,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-nexbox-a95x.dtb
>>>  dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-p212.dtb
>>>  dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905d-p230.dtb
>>>  dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905d-p231.dtb
>>> +dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905d-phicomm-n1.dtb
>>>  dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s805x-p241.dtb
>>>  dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905w-p281.dtb
>>>  dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905w-tx3-mini.dtb
>>> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-phicomm-n1.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-phicomm-n1.dts
>>> new file mode 100644
>>> index 000000000..1096509b2
>>> --- /dev/null
>>> +++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-phicomm-n1.dts
>>> @@ -0,0 +1,26 @@
>>
>> [...]
>>
>>> +&external_phy {
>>> +	/* Realtek RTL8211F (0x001cc916) */
>>> +	eee-broken-1000t;
>>> +};
>>>
>>
>> I was thinking about this, and the `eee-broken-1000t;` should go into meson-gxl-s905d-p230.dts
>> instead since the P230 should also have a broken EEE on the Realtek RTL8211F PHY.
>>
>> Thanks,
>> Neil
>>
>> _______________________________________________
>> linux-amlogic mailing list
>> linux-amlogic at lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-amlogic
> 
> Neil, thanks for review. If add `eee-broken-1000t;` into meson-gxl-s905d-p230.dts, then this device 
> tree only include disable cvbs section, should I submit a separate patch for meson-gxl-s905d-p230.dts?

Yes please

> 
> Yangxuan
> 
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic
> 
