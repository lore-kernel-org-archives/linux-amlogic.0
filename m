From: narmstrong@baylibre.com (Neil Armstrong)
Date: Thu, 29 Mar 2018 16:27:14 +0200
Subject: [PATCH u-boot 1/3] usb: host: Add simple of glue driver for DWC3
 USB Controllers integration
In-Reply-To: <3b74b97c-a6db-80ca-b172-c4f20fe67c69@denx.de>
References: <1522330940-25062-1-git-send-email-narmstrong@baylibre.com>
 <1522330940-25062-2-git-send-email-narmstrong@baylibre.com>
 <fb62880a-1a3e-c95b-647e-7f80d1319fe1@denx.de>
 <549799c4-8e69-6c47-bad9-49d6c07c8caf@baylibre.com>
 <3b74b97c-a6db-80ca-b172-c4f20fe67c69@denx.de>
Message-ID: <477fd0fe-099b-1bbc-3cc8-2e75e32cf7b0@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 29/03/2018 16:24, Marek Vasut wrote:
> On 03/29/2018 04:23 PM, Neil Armstrong wrote:
>> On 29/03/2018 15:52, Marek Vasut wrote:
>>> On 03/29/2018 03:42 PM, Neil Armstrong wrote:
>>>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>>>> ---
>>>>  drivers/usb/host/Kconfig          |   7 ++
>>>>  drivers/usb/host/Makefile         |   1 +
>>>>  drivers/usb/host/dwc3-of-simple.c | 187 ++++++++++++++++++++++++++++++++++++++
>>>>  3 files changed, 195 insertions(+)
>>>>  create mode 100644 drivers/usb/host/dwc3-of-simple.c
>>>>
>>>> diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
>>>> index a7249b7..6caa615 100644
>>>> --- a/drivers/usb/host/Kconfig
>>>> +++ b/drivers/usb/host/Kconfig
>>>> @@ -21,6 +21,13 @@ config USB_XHCI_DWC3
>>>>  	  Say Y or if your system has a Dual Role SuperSpeed
>>>>  	  USB controller based on the DesignWare USB3 IP Core.
>>>>  
>>>> +config USB_XHCI_DWC3_OF_SIMPLE
>>>> +	bool "DesignWare USB3 DRD Generic OF Simple Glue Layer"
>>>> +	select MISC
>>>> +	help
>>>> +	  Support USB2/3 functionality in simple SoC integrations with
>>>> +	  USB controller based on the DesignWare USB3 IP Core.
>>>> +
>>>>  config USB_XHCI_MVEBU
>>>>  	bool "MVEBU USB 3.0 support"
>>>>  	default y
>>>> diff --git a/drivers/usb/host/Makefile b/drivers/usb/host/Makefile
>>>> index 9819489..abe4f90 100644
>>>> --- a/drivers/usb/host/Makefile
>>>> +++ b/drivers/usb/host/Makefile
>>>> @@ -49,6 +49,7 @@ obj-$(CONFIG_USB_EHCI_ZYNQ) += ehci-zynq.o
>>>>  # xhci
>>>>  obj-$(CONFIG_USB_XHCI_HCD) += xhci.o xhci-mem.o xhci-ring.o
>>>>  obj-$(CONFIG_USB_XHCI_DWC3) += xhci-dwc3.o
>>>> +obj-$(CONFIG_USB_XHCI_DWC3_OF_SIMPLE) += dwc3-of-simple.o
>>>>  obj-$(CONFIG_USB_XHCI_ROCKCHIP) += xhci-rockchip.o
>>>>  obj-$(CONFIG_USB_XHCI_ZYNQMP) += xhci-zynqmp.o
>>>>  obj-$(CONFIG_USB_XHCI_KEYSTONE) += xhci-keystone.o
>>>> diff --git a/drivers/usb/host/dwc3-of-simple.c b/drivers/usb/host/dwc3-of-simple.c
>>>> new file mode 100644
>>>> index 0000000..826a996
>>>> --- /dev/null
>>>> +++ b/drivers/usb/host/dwc3-of-simple.c
>>>> @@ -0,0 +1,187 @@
>>>> +/*
>>>> + * dwc3-of-simple.c - OF glue layer for simple integrations
>>>> + *
>>>> + * Copyright (c) 2015 Texas Instruments Incorporated - http://www.ti.com
>>>> + *
>>>> + * Author: Felipe Balbi <balbi@ti.com>
>>>> + *
>>>> + * Copyright (C) 2018 BayLibre, SAS
>>>> + * Author: Neil Armstrong <narmstron@baylibre.com>
>>>> + *
>>>> + * SPDX-License-Identifier:     GPL-2.0+
>>>> + */
>>>> +
>>>> +#include <common.h>
>>>> +#include <dm.h>
>>>> +#include <fdtdec.h>
>>>> +#include <reset.h>
>>>> +#include <clk.h>
>>>> +
>>>> +DECLARE_GLOBAL_DATA_PTR;
>>>> +
>>>> +struct dwc3_of_simple {
>>>> +#if CONFIG_IS_ENABLED(CLK)
>>>> +	struct clk		*clks;
>>>> +	int			num_clocks;
>>>> +#endif
>>>> +#if CONFIG_IS_ENABLED(DM_RESET)
>>>> +	struct reset_ctl	*resets;
>>>> +	int			num_resets;
>>>> +#endif
>>>> +};
>>>> +
>>>> +#if CONFIG_IS_ENABLED(DM_RESET)
>>>> +static int dwc3_of_simple_reset_init(struct udevice *dev,
>>>> +				     struct dwc3_of_simple *simple,
>>>> +				     int count)
>>>> +{
>>>> +	int i, ret, err;
>>>> +
>>>> +	if (!count)
>>>> +		return 0;
>>>> +
>>>> +	simple->resets = devm_kcalloc(dev, count, sizeof(struct reset_ctl),
>>>> +				      GFP_KERNEL);
>>>> +	if (!simple->resets)
>>>> +		return -ENOMEM;
>>>> +
>>>> +	for (i = 0; i < count; i++) {
>>>> +		ret = reset_get_by_index(dev, i, &simple->resets[i]);
>>>> +		if (ret < 0)
>>>> +			break;
>>>> +
>>>> +		ret = reset_request(&simple->resets[i]);
>>>> +		if (ret) {
>>>> +			pr_err("failed to request reset line %d\n", i);
>>>> +			reset_free(&simple->resets[i]);
>>>> +			goto reset_err;
>>>> +		}
>>>> +
>>>> +		
>>>> +		++simple->num_resets;
>>>> +	}
>>>> +
>>>> +	for (i = 0; i < simple->num_resets; i++) {
>>>> +		ret = reset_deassert(&simple->resets[i]);
>>>> +		if (ret && ret != -ENOSYS && ret != -ENOTSUPP) {
>>>> +			pr_err("failed to deassert reset line %d\n", i);
>>>> +			goto reset_err;
>>>> +		}
>>>> +	}
>>>> +
>>>> +	return 0;
>>>
>>> This looks like some driver I've seen before. Isn't there similar code
>>> for simple EHCI or OHCI driver already ?
>>>
>>
>> Hi,
>>
>> This is not an EHCI/OHCI driver, only the glue to init the clocks and reset,
>> it's the exact same as the drivers/usb/dwc3/dwc3-of-simple.c adapted to U-Boot.
>>
>> yes, similar code exists in drivers/usb/host/ehci-generic.c and
>> drivers/usb/host/ohci-generic.c but the goal here is not to initialize the controller
>> but only the glue.
> 
> Can't we recycle that code instead of having three copies of similar stuff ?
> 

Sure, where should I put this code ? the clock and resets are stored in the driver's platdata.

Neil
