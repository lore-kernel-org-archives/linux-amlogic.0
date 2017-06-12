From: narmstrong@baylibre.com (Neil Armstrong)
Date: Mon, 12 Jun 2017 09:32:01 +0200
Subject: [PATCH 09/13] ARM: dts: meson8: add reserved memory zones
In-Reply-To: <20170611101644.28581-10-martin.blumenstingl@googlemail.com>
References: <20170611101644.28581-1-martin.blumenstingl@googlemail.com>
 <20170611101644.28581-10-martin.blumenstingl@googlemail.com>
Message-ID: <2f93816d-4276-2ccb-fd3e-e6ec8a6c9f70@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 06/11/2017 12:16 PM, Martin Blumenstingl wrote:
> There seem to be two memory regions that need to be reserved, otherwise
> the system just hangs when running:
> $ stress --vm-bytes $(awk '/MemFree/{printf "%d\n", $2 * 0.9;}' < /proc/meminfo)k \
>   --vm-keep -m 1
> 
> The first memory region is really crucial and without it the system
> hangs. I could not find any references to this in Amlogic's GPL kernel
> sources.
> The second region is used by the "suspend firmware". The u-boot sources
> (/arch/arm/cpu/aml_meson/m8/firmwareld.c) state that the suspend
> firmware is located at "64M + 15M" which matches CONFIG_MESON_SUSPEND in
> the Amlogic GPL kernel sources. The "suspend firmware" is responsible
> for waking up the system from suspend state.
> 
> This also fixes reading the full SD card as without this the system
> would simply hang (probably related to the first memory region, if some
> buffer is allocated there).
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  arch/arm/boot/dts/meson8.dtsi | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/meson8.dtsi b/arch/arm/boot/dts/meson8.dtsi
> index 8582490fcb52..cf011dfe050e 100644
> --- a/arch/arm/boot/dts/meson8.dtsi
> +++ b/arch/arm/boot/dts/meson8.dtsi
> @@ -83,6 +83,33 @@
>  			reg = <0x203>;
>  		};
>  	};
> +
> +	reserved-memory {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		/* 2 MiB reserved for Hardware ROM Firmware? */
> +		hwrom_reserved: hwrom at 0 {
> +			reg = <0x0 0x200000>;
> +			no-map;
> +		};
> +
> +		/*
> +		 * 1 MiB reserved for the "ARM Power Firmware": this is ARM
> +		 * code which is responsible for system suspend. It loads a
> +		 * piece of ARC code ("arc_power" in the vendor u-boot tree)
> +		 * into SRAM, executes that and shuts down the (last) ARM core.
> +		 * The arc_power firmware then checks various wakeup sources
> +		 * (IR remote receiver, HDMI CEC, WIFI and Bluetooth wakeup or
> +		 * simply the power key) and re-starts the ARM core once it
> +		 * detects a wakeup request.
> +		 */
> +		suspend_firmware: secmon at 4f00000 {
> +			reg = <0x4f00000 0x100000>;
> +			no-map;
> +		};
> +	};
>  }; /* end of / */
>  
>  &aobus {
> 

Good, but maybe you could add _reserved to the secmon alias.

Apart of that :
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
