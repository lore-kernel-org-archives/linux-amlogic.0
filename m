From: narmstrong@baylibre.com (Neil Armstrong)
Date: Wed, 21 Nov 2018 10:34:34 +0100
Subject: [PATCH u-boot 10/19] pinctrl: meson: add axg support
In-Reply-To: <788453170c72385ccdbe2240a335561d237506cc.camel@baylibre.com>
References: <1541777218-472-1-git-send-email-narmstrong@baylibre.com>
 <1541777218-472-11-git-send-email-narmstrong@baylibre.com>
 <788453170c72385ccdbe2240a335561d237506cc.camel@baylibre.com>
Message-ID: <26df8723-32e0-23ed-4ec6-04e306b97e0f@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Carlo,

On 20/11/2018 15:47, Carlo Caione wrote:
> On Fri, 2018-11-09 at 16:26 +0100, Neil Armstrong wrote:
>> From: Jerome Brunet <jbrunet@baylibre.com>
>>
>> This adds support for the Amlogic AXG SoC pinctrl and GPIO controller
>> using a specific set of pinctrl functions which differs from the GX
>> SoCs.
>>
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> 
> /cut
>> +struct meson_pinctrl_data meson_axg_aobus_pinctrl_data = {
>> +	.name		= "aobus-banks",
>> +	.pin_base	= 0,
>> +	.groups		= meson_axg_aobus_groups,
>> +	.funcs		= meson_axg_aobus_functions,
>> +	.banks		= meson_axg_aobus_banks,
>> +	.num_pins	= 11,
> 
> Should this be 14?
> 
> --
> Carlo Caione
> 

Will fix both errors,

Thanks,
Neil
