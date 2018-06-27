From: khilman@baylibre.com (Kevin Hilman)
Date: Wed, 27 Jun 2018 16:42:26 -0700
Subject: [PATCH] ARM64: dts: meson-gxl: fix Mali GPU compatible string
In-Reply-To: <ea6f70c0-d4f0-f89d-9fc6-e71869488a5f@baylibre.com> (Neil
 Armstrong's message of "Tue, 26 Jun 2018 10:06:50 +0200")
References: <20180623150056.1442-1-martin.blumenstingl@googlemail.com>
 <ea6f70c0-d4f0-f89d-9fc6-e71869488a5f@baylibre.com>
Message-ID: <7hpo0bhk4d.fsf@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> On 23/06/2018 17:00, Martin Blumenstingl wrote:
>> meson-gxl-mali.dtsi is only used on GXL SoCs. Thus it should use the GXL
>> specific compatible string instead of the GXBB one.
>> For now this is purely cosmetic since the (out-of-tree) lima driver for
>> this GPU currently uses the "arm,mali-450" match instead of the SoC
>> specific one. However, update the .dts to match the documentation since
>> this driver behavior might change in the future.
>> 
>> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>> ---
>>  arch/arm64/boot/dts/amlogic/meson-gxl-mali.dtsi | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-mali.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl-mali.dtsi
>> index eb327664a4d8..6aaafff674f9 100644
>> --- a/arch/arm64/boot/dts/amlogic/meson-gxl-mali.dtsi
>> +++ b/arch/arm64/boot/dts/amlogic/meson-gxl-mali.dtsi
>> @@ -6,7 +6,7 @@
>>  
>>  &apb {
>>  	mali: gpu at c0000 {
>> -		compatible = "amlogic,meson-gxbb-mali", "arm,mali-450";
>> +		compatible = "amlogic,meson-gxl-mali", "arm,mali-450";
>>  		reg = <0x0 0xc0000 0x0 0x40000>;
>>  		interrupts = <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>,
>>  			     <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>,
>> 
> [...]
> Acked-by: Neil Armstrong <narmstrong@baylibre.com>

Applied to v4.18/fixes (which I'll be submitting today.)

Kevin
