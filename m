From: sjg@chromium.org (Simon Glass)
Date: Mon, 27 Nov 2017 10:12:43 -0700
Subject: [PATCH v2 1/5] ARM: arch-meson: add ethernet common init function
In-Reply-To: <f80b7d1c-9f6f-4208-b0d6-e6af72d8fd65@baylibre.com>
References: <1511357151-3771-1-git-send-email-narmstrong@baylibre.com>
 <1511357151-3771-2-git-send-email-narmstrong@baylibre.com>
 <CAPnjgZ1FaU5JBAuNv5nZGa0PjRyk-jYNeeoGTGN0Y_4q3_po8A@mail.gmail.com>
 <5A193BBA.2080102@baylibre.com>
 <CAPnjgZ2V=heb6Et=V_xBiahMDoszz8pmoeQ=ZC4KSh++55MTpA@mail.gmail.com>
 <f80b7d1c-9f6f-4208-b0d6-e6af72d8fd65@baylibre.com>
Message-ID: <CAPnjgZ2txXYS+aJTAr_GmugtDbj4hwxHCNHpAwtOG82GPgLxTQ@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Neil,

On 27 November 2017 at 01:48, Neil Armstrong <narmstrong@baylibre.com> wrote:
> On 26/11/2017 12:39, Simon Glass wrote:
>> Hi Neil,
>>
>> On 25 November 2017 at 02:45, Neil Armstrong <narmstrong@baylibre.com> wrote:
>>> Hi Simon,
>>>
>>> Le 24/11/2017 23:35, Simon Glass a ?crit :
>>>> Hi Neil,
>>>>
>>>> On 22 November 2017 at 06:25, Neil Armstrong <narmstrong@baylibre.com> wrote:
>>>>> Introduce a generic common Ethernet Hardware init function
>>>>> common to all Amlogic GX SoCs with support for the
>>>>> Internal PHY enable for GXL SoCs.
>>>>>
>>>>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>>>>> ---
>>>>>  arch/arm/include/asm/arch-meson/eth.h | 15 ++++++++++
>>>>>  arch/arm/mach-meson/Makefile          |  2 +-
>>>>>  arch/arm/mach-meson/eth.c             | 53 +++++++++++++++++++++++++++++++++++
>>>>>  3 files changed, 69 insertions(+), 1 deletion(-)
>>>>>  create mode 100644 arch/arm/include/asm/arch-meson/eth.h
>>>>>  create mode 100644 arch/arm/mach-meson/eth.c
>>>>>
>>>>> diff --git a/arch/arm/include/asm/arch-meson/eth.h b/arch/arm/include/asm/arch-meson/eth.h
>>>>> new file mode 100644
>>>>> index 0000000..8ea8e10
>>>>> --- /dev/null
>>>>> +++ b/arch/arm/include/asm/arch-meson/eth.h
>>>>> @@ -0,0 +1,15 @@
>>>>> +/*
>>>>> + * Copyright (C) 2016 BayLibre, SAS
>>>>> + * Author: Neil Armstrong <narmstrong@baylibre.com>
>>>>> + *
>>>>> + * SPDX-License-Identifier:    GPL-2.0+
>>>>> + */
>>>>> +
>>>>> +#ifndef __MESON_ETH_H__
>>>>> +#define __MESON_ETH_H__
>>>>> +
>>>>> +#include <phy.h>
>>>>> +
>>>>> +void meson_gx_eth_init(phy_interface_t mode, bool use_internal_phy);
>>>>> +
>>>>> +#endif /* __MESON_ETH_H__ */
>>>>> diff --git a/arch/arm/mach-meson/Makefile b/arch/arm/mach-meson/Makefile
>>>>> index bf49b8b..b4e8dde 100644
>>>>> --- a/arch/arm/mach-meson/Makefile
>>>>> +++ b/arch/arm/mach-meson/Makefile
>>>>> @@ -4,4 +4,4 @@
>>>>>  # SPDX-License-Identifier:     GPL-2.0+
>>>>>  #
>>>>>
>>>>> -obj-y += board.o sm.o
>>>>> +obj-y += board.o sm.o eth.o
>>>>> diff --git a/arch/arm/mach-meson/eth.c b/arch/arm/mach-meson/eth.c
>>>>> new file mode 100644
>>>>> index 0000000..46ecb5e
>>>>> --- /dev/null
>>>>> +++ b/arch/arm/mach-meson/eth.c
>>>>> @@ -0,0 +1,53 @@
>>>>> +/*
>>>>> + * Copyright (C) 2016 BayLibre, SAS
>>>>> + * Author: Neil Armstrong <narmstrong@baylibre.com>
>>>>> + *
>>>>> + * SPDX-License-Identifier:    GPL-2.0+
>>>>> + */
>>>>> +
>>>>> +#include <common.h>
>>>>> +#include <dm.h>
>>>>> +#include <asm/io.h>
>>>>> +#include <asm/arch/gxbb.h>
>>>>> +#include <asm/arch/eth.h>
>>>>> +#include <phy.h>
>>>>> +
>>>>> +void meson_gx_eth_init(phy_interface_t mode, bool use_internal_phy)
>>>>
>>>> Can you add a header file addition for this somewhere, with comments?
>>>
>>> Do you mean comments in the added arch/arm/include/asm/arch-meson/eth.h in this
>>> same patchset ?
>>
>> Yes that's what I meant.
>>
>>>
>>>>
>>>>> +{
>>>>> +       switch (mode) {
>>>>> +       case PHY_INTERFACE_MODE_RGMII:
>>>>> +       case PHY_INTERFACE_MODE_RGMII_ID:
>>>>> +       case PHY_INTERFACE_MODE_RGMII_RXID:
>>>>> +       case PHY_INTERFACE_MODE_RGMII_TXID:
>>>>> +               /* Set RGMII mode */
>>>>> +               setbits_le32(GXBB_ETH_REG_0, GXBB_ETH_REG_0_PHY_INTF |
>>>>> +                            GXBB_ETH_REG_0_TX_PHASE(1) |
>>>>> +                            GXBB_ETH_REG_0_TX_RATIO(4) |
>>>>> +                            GXBB_ETH_REG_0_PHY_CLK_EN |
>>>>> +                            GXBB_ETH_REG_0_CLK_EN);
>>>>> +               break;
>>>>> +
>>>>> +       case PHY_INTERFACE_MODE_RMII:
>>>>> +               /* Set RMII mode */
>>>>> +               out_le32(GXBB_ETH_REG_0, GXBB_ETH_REG_0_INVERT_RMII_CLK |
>>>>> +                                        GXBB_ETH_REG_0_CLK_EN);
>>>>
>>>> How come this is using out_le32() instead of (for example) writel()?
>>>
>>> It should be writel(), but since the register size is 32bit, it can be out_le32
>>
>> So why do we have out_le32()? What is the difference?

Still unsure about this one.

>>
>>>
>>>>
>>>>> +
>>>>> +#ifdef CONFIG_MESON_GXL
>>>>
>>>> This doesn't seem fully generic if it has this #ifdef in it. Can this
>>>> be a parameter? At worst can we use if() instead of #ifdef ?
>>>
>>> Yeah, I didn't really figured out how to specify the internal PHY.
>>>
>>> GXL and GXM SoCs have an internal PHY, but yeah GXBB does't.
>>> I hesitated to add a different meson_gx_eth_init() signature
>>> for these different SoCs, what do you think about that ?
>>>
>>> The new AXG SoC does not have internal PHY, so it will use the same
>>> code as GXBB.
>>
>> I think this function needs to be told which SoC type it is dealing
>> with, as a separate enum parameters.
>
> It's more complex since the S905D from the same GXL family can also use an
> external RGMII interface *and* the internal PHY depending on the board.
>
> Could a generic flags parameter be better, and add a GXL specific
> MESON_GXL_USE_INTERNAL_RMII_PHY to be passed only on GXL platforms ?

Yes that sounds good and will get rid of the CONFIG check.

Regards,
Simon
