From: narmstrong@baylibre.com (Neil Armstrong)
Date: Thu, 12 Apr 2018 10:05:50 +0200
Subject: [U-Boot] [PATCH v3 u-boot 1/3] usb: host: Add simple of glue
 driver for DWC3 USB Controllers integration
In-Reply-To: <75bafa27-9f08-7d3d-91a2-6b2878df16ae@ti.com>
References: <1523459282-12235-1-git-send-email-narmstrong@baylibre.com>
 <1523459282-12235-2-git-send-email-narmstrong@baylibre.com>
 <75bafa27-9f08-7d3d-91a2-6b2878df16ae@ti.com>
Message-ID: <873d3df8-787e-27ec-3d66-73d723ee7ddb@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Jean-Jacques,

On 11/04/2018 18:17, Jean-Jacques Hiblot wrote:
> 
> 
> On 11/04/2018 17:08, Neil Armstrong wrote:
>> This is a port of the dwc3-of-simple driver from Linux to enable/deassert
>> clock and resets of a simple DWC3 Controller HW glue.
>>
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>> ---
>> ? drivers/usb/host/Kconfig????????? |?? 7 +++
>> ? drivers/usb/host/Makefile???????? |?? 1 +
>> ? drivers/usb/host/dwc3-of-simple.c | 109 ++++++++++++++++++++++++++++++++++++++
>> ? 3 files changed, 117 insertions(+)
>> ? create mode 100644 drivers/usb/host/dwc3-of-simple.c
>>
>> diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
>> index a7249b7..6caa615 100644
>> --- a/drivers/usb/host/Kconfig
>> +++ b/drivers/usb/host/Kconfig
>> @@ -21,6 +21,13 @@ config USB_XHCI_DWC3
[...]

>> +
>> +static int dwc3_of_simple_clk_init(struct udevice *dev,
>> +?????????????????? struct dwc3_of_simple *simple)
>> +{
>> +??? int ret;
>> +
>> +??? ret = clk_get_bulk(dev, &simple->clks);
>> +??? if (ret == -ENOTSUPP)
> 
> Must be ENOSYS instead of ENOTSUPP, otherwise probe fails on platform not using the clk framework

You are right, I naively used the same between reset and clock...

> 
> tested-by: Jean-Jacques hiblot <jjhiblot@ti.com>
> 
>> +??????? return 0;
>> +??? if (ret)
>> +??????? return ret;
>> +
>> +#if CONFIG_IS_ENABLED(CLK)
>> +??? ret = clk_enable_bulk(&simple->clks);
>> +??? if (ret) {
>> +??????? clk_release_bulk(&simple->clks);
>> +??????? return ret;
>> +??? }
>> +#endif
>> +
>> +??? return 0;
>> +}

[...]
Thanks,
Neil
