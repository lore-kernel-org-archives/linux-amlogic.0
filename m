From: hkallweit1@gmail.com (Heiner Kallweit)
Date: Thu, 2 Mar 2017 20:37:29 +0100
Subject: [PATCH] ARM64: dts: meson-gxbb-odroidc2: switch ethernet phy mode
 to rgmii-txid
In-Reply-To: <1488450147.2420.2.camel@baylibre.com>
References: <5baa94a2-f45c-2ab3-0085-422436e12a84@gmail.com>
 <1488450147.2420.2.camel@baylibre.com>
Message-ID: <e3e2ff90-e4cb-b209-3824-fb45e595397d@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Am 02.03.2017 um 11:22 schrieb Jerome Brunet:
> On Fri, 2017-02-10 at 00:09 +0100, Heiner Kallweit wrote:
>> Documentation/networking/phy.txt states:
>> Whenever possible,use the PHY side RGMII delay.
>>
>> The board uses a RTl8211F phy which supports creating the needed
>> tx delay internally. Therefore switch to rgmii-txid mode.
>>
>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>> ---
>>  arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
>> b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
>> index 3877dda6..94896139 100644
>> --- a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
>> +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
>> @@ -152,6 +152,7 @@
>>  	pinctrl-0 = <&eth_rgmii_pins>;
>>  	pinctrl-names = "default";
>>  	phy-handle = <&eth_phy0>;
>> +	phy-mode = "rgmii-txid";
>>  
>>  	mdio {
>>  		compatible = "snps,dwmac-mdio";
> 
> Heiner,
> 
> In principle, I agree with this patch but:
> 
> * We need the patches [0] [1] from net-next to merged first (or pulled
> in kevin's tree). Without this, the proposed change would result in a
> 4ns Tx delay instead of 2ns. If Martin send another version of patch
> [2], then "amlogic,tx-delay-ns = <2>;" should be removed for the
> odroidc2 as the delay would be introduced by the PHY (the value would
> ignored anyway, but it would be misleading)
> 
Right ..

> * We would be changing a configuration tested by many people for a
> barely tested one, without any benefits expected. These 2
> configurations are supposed to be equivalent, and I'm willing to test
> it again once the prerequisites are merged but I'd prefer if more
> people could test this and confirm there is no regression before
> merging it.
> 
Also right. There is no urgent need for this patch and I'm totally
fine with waiting for more feedback.
It's just a minor improvement to make the configuration more
in line with the documented best practices.

Heiner

> Cheers
> 
> Jerome
> 
> [0]: commit b765234e72fc ("net: stmmac: dwmac-meson8b: make the RGMII
> TX delay configurable")
> [1]: commit d6db61a40ee0 ("net: stmmac: don't set tx delay in RGMII_ID
> and RGMII_TXID mode")
> [2]: https://marc.info/?l=linux-arm-kernel&m=148754182813497&w=2
> 
> 
> 
