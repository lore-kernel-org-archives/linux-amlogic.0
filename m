From: balbi@kernel.org (Felipe Balbi)
Date: Mon, 29 Jan 2018 10:18:28 +0200
Subject: [PATCH 2/3] usb: dwc3: of-simple: add support for shared and
 pulsed reset lines
In-Reply-To: <20180128200333.20093-3-martin.blumenstingl@googlemail.com>
References: <20180128200333.20093-1-martin.blumenstingl@googlemail.com>
 <20180128200333.20093-3-martin.blumenstingl@googlemail.com>
Message-ID: <87fu6pjcx7.fsf@linux.intel.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org


Hi,

Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:
> Some SoCs (such as Amlogic Meson GXL for example) share the reset line
> with other components (in case of the Meson GXL example there's a shared
> reset line between the USB2 PHYs, USB3 PHYs and the dwc3 controller).
> Additionally SoC implementations may prefer a reset pulse over level
> resets.
>
> Add an internal per-of_device_id struct which can be used to configure
> whether the reset lines are shared and whether they use level or pulse
> resets.
>
> For now this falls back to the old defaults, which are:
> - reset lines are exclusive
> - level resets are being used
>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  drivers/usb/dwc3/dwc3-of-simple.c | 65 ++++++++++++++++++++++++++++++++-------
>  1 file changed, 54 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/usb/dwc3/dwc3-of-simple.c b/drivers/usb/dwc3/dwc3-of-simple.c
> index 7ae0eefc7cc7..ceb9f0cd822a 100644
> --- a/drivers/usb/dwc3/dwc3-of-simple.c
> +++ b/drivers/usb/dwc3/dwc3-of-simple.c
> @@ -22,11 +22,22 @@
>  #include <linux/pm_runtime.h>
>  #include <linux/reset.h>
>  
> +/**
> + * struct dwc3_of_simple_params - hardware specific parameters
> + * @shared_resets: indicates that the resets are shared or exclusive
> + * @pulse_resets: use a reset pulse instead of level based resets
> + */
> +struct dwc3_of_simple_params {
> +	bool			shared_resets;
> +	bool			pulse_resets;
> +};
> +
>  struct dwc3_of_simple {
>  	struct device		*dev;
>  	struct clk		**clks;
>  	int			num_clocks;
>  	struct reset_control	*resets;
> +	const struct dwc3_of_simple_params	*params;

instead, you can add these two fields here:

	bool shared_resets;
        bool pulse_resets;

and ...

> @@ -90,17 +101,26 @@ static int dwc3_of_simple_probe(struct platform_device *pdev)
>  
>  	platform_set_drvdata(pdev, simple);
>  	simple->dev = dev;
> +	simple->params = of_device_get_match_data(dev);
>  
> -	simple->resets = of_reset_control_array_get_optional_exclusive(np);
> +	simple->resets = of_reset_control_array_get(np,
> +						simple->params->shared_resets,
> +						true);

wrap this with a of_device_is_compatible() check:

	if (of_device_is_compatible(dev->of_node, "foobar")) {
        	simple->shared_resets = true;
		simple->pulse_resets = true;
	}

or something like that. Then we don't need to add a new
dwc3_of_simple_params for everybody.

Also, the why isn't the reset type (pulse vs level) handled by reset
framework itself? Why does dwc3-of-simple need to know about it?

-- 
balbi
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 832 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-amlogic/attachments/20180129/dd2feb7d/attachment.sig>
