From: afaerber@suse.de (=?UTF-8?Q?Andreas_F=c3=a4rber?=)
Date: Sat, 9 Jul 2016 00:25:43 +0200
Subject: [PATCH 3/3] ARM64: dts: amlogic: enable sd_emmc_b on all
 Tronsmart Vega S95 devices
In-Reply-To: <577EF895.1000600@suse.de>
References: <20160625163446.7245-1-martin.blumenstingl@googlemail.com>
 <20160625163446.7245-4-martin.blumenstingl@googlemail.com>
 <577EF895.1000600@suse.de>
Message-ID: <57802867.8030905@suse.de>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Am 08.07.2016 um 02:49 schrieb Andreas F?rber:
> Am 25.06.2016 um 18:34 schrieb Martin Blumenstingl:
>> sd_emmc_b is routed to the SD-card. Unlike p20x there is no GPIO
>> regulator, meaning it only supports 3.3V (which seems to be hard-wired).
>>
>> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>> ---
>>  .../boot/dts/amlogic/meson-gxbb-vega-s95.dtsi      | 27 ++++++++++++++++++++++
>>  1 file changed, 27 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
>> index b003729..3a77829 100644
>> --- a/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
>> +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
>> @@ -53,6 +53,17 @@
>>  	chosen {
>>  		stdout-path = "serial0:115200n8";
>>  	};
>> +
>> +	mmc_iv: fixed-regulator {
>> +		compatible = "regulator-fixed";
>> +
>> +		regulator-name = "mmc-supply";
>> +		regulator-min-microvolt = <3300000>;
>> +		regulator-max-microvolt = <3300000>;
>> +
>> +		regulator-always-on;
>> +		regulator-boot-on;
>> +	};
>>  };
>>  
>>  &uart_A {
>> @@ -73,3 +84,19 @@
>>  	pinctrl-0 = <&eth_pins>;
>>  	pinctrl-names = "default";
>>  };
>> +
>> +&sd_emmc_b {
> [snip]
> 
> This does not build on next-20160707 - what branch is this based on?

Apparently linux-amlogic.git v4.7/integ.

Tested-by: Andreas F?rber <afaerber@suse.de>

Thanks again,
Andreas

-- 
SUSE Linux GmbH, Maxfeldstr. 5, 90409 N?rnberg, Germany
GF: Felix Imend?rffer, Jane Smithard, Graham Norton
HRB 21284 (AG N?rnberg)
