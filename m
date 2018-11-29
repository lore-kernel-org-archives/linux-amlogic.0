From: jian.hu@amlogic.com (Jian Hu)
Date: Thu, 29 Nov 2018 19:55:43 +0800
Subject: [PATCH 0/2] i2c: meson: add support for Meson G12A SoC i2c
 controller
In-Reply-To: <8a6a204b28523e5a181f9e85dda18fade76a26a3.camel@baylibre.com>
References: <1543489197-183181-1-git-send-email-jian.hu@amlogic.com>
 <8a6a204b28523e5a181f9e85dda18fade76a26a3.camel@baylibre.com>
Message-ID: <b2bceaf4-92ce-92a4-c382-713d29ae3b70@amlogic.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org



On 2018/11/29 19:02, Jerome Brunet wrote:
> On Thu, 2018-11-29 at 18:59 +0800, Jian Hu wrote:
>> 1)Add G12A SoC i2c compatible string in dt-bindings.
>> 2)Add compatible and data for G12A I2C controller driver.
>>
>> Jian Hu (2):
>>    dt-bindings: i2c: meson: add Meson G12A SoC i2c compatible string
>>    i2c: meson: add support for Meson G12A SoC I2C controller
> 
> Looks to me that the g12a is compatible with the axg. What is the point of
> adding this new compatible string ?
> 

I am okay if it is reasonable below in file 
arch/arm64/boot/dts/amlogic/meson-g12a.dtsi. I2c controller node just 
uses axg's compatible.

			i2c0: i2c at 1f000 {
				compatible = "amlogic,meson-axg-i2c";
				reg = <0x0 0x1f000 0x0 0x20>;
				interrupts = <GIC_SPI 21 		   IRQ_TYPE_EDGE_RISING>;
				clocks = <&clkc CLKID_I2C>;
				#address-cells = <1>;
				#size-cells = <0>;
				status = "disabled";
			};

If it is, I just submit the i2c controller node in meson-g12a.dtsi.

>>
>>   Documentation/devicetree/bindings/i2c/i2c-meson.txt | 1 +
>>   drivers/i2c/busses/i2c-meson.c                      | 5 +++++
>>   2 files changed, 6 insertions(+)
>>
> 
> 
> .
> 
