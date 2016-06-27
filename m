From: carlo@caione.org (Carlo Caione)
Date: Mon, 27 Jun 2016 11:24:48 +0200
Subject: [PATCH RFC 3/3] ARM64: dts: meson-gxbb: use the new meson8b
 DWMAC glue
In-Reply-To: <20160625165013.15917-4-martin.blumenstingl@googlemail.com>
References: <20160625165013.15917-1-martin.blumenstingl@googlemail.com>
 <20160625165013.15917-4-martin.blumenstingl@googlemail.com>
Message-ID: <20160627092448.GA3275@localhost>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 25/06/16 18:50, Martin Blumenstingl wrote:
> The Amlogic reference driver uses the "mc_val" devicetree property to
> configure the PRG_ETHERNET_ADDR0 register. Unfortunately it uses magic
> values for this configuration.
> 
> According to the datasheet the PRG_ETHERNET_ADDR0 register is at address
> 0xc8834108. However, the reference driver uses 0xc8834540 instead.
> According to my tests, the value from the reference driver is correct.
> 
> The updated examples are representing 0x1621 from the reference driver's
> mc_val property, which is used when there is an external gbit PHY
> connected.
> For RMII mode PHYs mc_val 0x1800 is used in the reference driver, which
> translates  would translate to "do not set any of the following
> properties" (as the two bits are configured automatically):
> - amlogic,enable-25mhz-phy-clk
> - amlogic,mp2-clock
> - amlogic,tx-delay

[...]

>  			};
> +
> +			prg_ethernet: prg_ethernet at 540 {
> +				compatible = "syscon";
> +				reg = <0x0 0x00540 0x0 0x8>;
> +			};
>  		};


A syscon is a region containing a set of miscellaneous registers used
for several reasons by several devices [1]. It this case there is really
no need to define a new syscon node since those two registers are only
used by your driver.

[1] http://lxr.free-electrons.com/source/Documentation/devicetree/bindings/mfd/syscon.txt

>  		hiubus: hiubus at c883c000 {
> @@ -354,14 +360,14 @@
>  		};
>  
>  		ethmac: ethernet at c9410000 {
> -			compatible = "amlogic,meson6-dwmac", "snps,dwmac";
> -			reg = <0x0 0xc9410000 0x0 0x10000
> -			       0x0 0xc8834540 0x0 0x4>;
> +			compatible = "amlogic,meson8b-dwmac", "snps,dwmac";
> +			reg = <0x0 0xc9410000 0x0 0x10000>;
>  			interrupts = <0 8 1>;
>  			interrupt-names = "macirq";
>  			clocks = <&clkc CLKID_ETH>;
>  			clock-names = "stmmaceth";
>  			phy-mode = "rgmii";
> +			amlogic,prg-ethernet = <&prg_ethernet>;
>  			status = "disabled";
>  		};
>  	};
> -- 
> 2.9.0
> 
> 
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic

-- 
Carlo Caione
