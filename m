Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA260C36014
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Apr 2025 14:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U3XWOtp9suoCoi0Qq0CE6kfiyyBgHxBPxZ2QV/hgIPs=; b=4etxxTOTouqqj/
	AH0tXs4MsRjQI43KEHM4oDfn9VH836uPg48HlzRTeXO31aqOFwFLbKc1Sd9+zuMuWY2GUALwtgAV9
	g6zpOIS/ANP46F1Q+20pLbITkEib3vVHXHNbKCqhhqL0lhmU6JSbbq6ofcCOSrwlJq/+HlwFZWdES
	Ay0PT+cgCr6LTO2kaJ4CxMSXpLe/qWJZwU+Pb9u3CUG9/ZJKGIwog0baBWeDVA5U7qpQXc66g3Kp9
	CR0EX0O6EvHCjMlGqeKW7Tax4vPfTWSMGU+0Ne1rb4N84FnQBTz4Fbc9zxB94myvr29eTYGzeiIQ3
	RO0nH8vx+Pa/poI/jIew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0hnX-0000000BxEE-3EuT;
	Fri, 04 Apr 2025 14:13:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0hnV-0000000BxDp-0Xpn;
	Fri, 04 Apr 2025 14:13:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BAE311515;
	Fri,  4 Apr 2025 07:13:27 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 909073F63F;
	Fri,  4 Apr 2025 07:13:22 -0700 (PDT)
Date: Fri, 4 Apr 2025 15:13:20 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet
 <jbrunet@baylibre.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Emilio =?UTF-8?B?TMOzcGV6?= <emilio@elopez.com.ar>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 4/5] clk: sunxi-ng: Do not enable by default during
 compile testing
Message-ID: <20250404151320.53c4698b@donnerap.manchester.arm.com>
In-Reply-To: <20250404-kconfig-defaults-clk-v1-4-4d2df5603332@linaro.org>
References: <20250404-kconfig-defaults-clk-v1-0-4d2df5603332@linaro.org>
	<20250404-kconfig-defaults-clk-v1-4-4d2df5603332@linaro.org>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_071329_307061_9FB75E0E 
X-CRM114-Status: GOOD (  15.81  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, 04 Apr 2025 13:57:00 +0200
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

Hi 
> Enabling the compile test should not cause automatic enabling of all
> drivers.  Restrict the default to ARCH also for individual drivers, even
> though their choice is not visible without selecting parent Kconfig
> symbol, because otherwise selecting parent would select the child during
> compile testing.

so I remember we changed this to "default y", because there were some
tricky problems with regards to RISC-V and ARM. See commits:

commit 0ff347db4c97cc16b4e428dc1db550ba3628f1e2
Author: Samuel Holland <samuel@sholland.org>
Date:   Sat Dec 31 17:14:25 2022 -0600
    clk: sunxi-ng: Move SoC driver conditions to dependencies

and 

commit a26dc096f683ca27ac5e68703bfd3098b4212abd
Author: Samuel Holland <samuel@sholland.org>
Date:   Sat Dec 31 17:14:24 2022 -0600
    clk: sunxi-ng: Remove duplicate ARCH_SUNXI dependencies

Don't remember what broke, exactly, but just wanted to give a heads up.

Cheers,
Andre

> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/clk/sunxi-ng/Kconfig | 48 ++++++++++++++++++++++----------------------
>  1 file changed, 24 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/clk/sunxi-ng/Kconfig b/drivers/clk/sunxi-ng/Kconfig
> index 5830a9d87bf25d536ac787fe83669c64c8214952..8896fd052ef1784d60d488ab1498737c1405deb2 100644
> --- a/drivers/clk/sunxi-ng/Kconfig
> +++ b/drivers/clk/sunxi-ng/Kconfig
> @@ -9,123 +9,123 @@ if SUNXI_CCU
>  
>  config SUNIV_F1C100S_CCU
>  	tristate "Support for the Allwinner newer F1C100s CCU"
> -	default y
> +	default ARCH_SUNXI
>  	depends on MACH_SUNIV || COMPILE_TEST
>  
>  config SUN20I_D1_CCU
>  	tristate "Support for the Allwinner D1/R528/T113 CCU"
> -	default y
> +	default ARCH_SUNXI
>  	depends on MACH_SUN8I || RISCV || COMPILE_TEST
>  
>  config SUN20I_D1_R_CCU
>  	tristate "Support for the Allwinner D1/R528/T113 PRCM CCU"
> -	default y
> +	default ARCH_SUNXI
>  	depends on MACH_SUN8I || RISCV || COMPILE_TEST
>  
>  config SUN50I_A64_CCU
>  	tristate "Support for the Allwinner A64 CCU"
> -	default y
> +	default ARCH_SUNXI
>  	depends on ARM64 || COMPILE_TEST
>  
>  config SUN50I_A100_CCU
>  	tristate "Support for the Allwinner A100 CCU"
> -	default y
> +	default ARCH_SUNXI
>  	depends on ARM64 || COMPILE_TEST
>  
>  config SUN50I_A100_R_CCU
>  	tristate "Support for the Allwinner A100 PRCM CCU"
> -	default y
> +	default ARCH_SUNXI
>  	depends on ARM64 || COMPILE_TEST
>  
>  config SUN50I_H6_CCU
>  	tristate "Support for the Allwinner H6 CCU"
> -	default y
> +	default ARCH_SUNXI
>  	depends on ARM64 || COMPILE_TEST
>  
>  config SUN50I_H616_CCU
>  	tristate "Support for the Allwinner H616 CCU"
> -	default y
> +	default ARCH_SUNXI
>  	depends on ARM64 || COMPILE_TEST
>  
>  config SUN50I_H6_R_CCU
>  	tristate "Support for the Allwinner H6 and H616 PRCM CCU"
> -	default y
> +	default ARCH_SUNXI
>  	depends on ARM64 || COMPILE_TEST
>  
>  config SUN55I_A523_CCU
>  	tristate "Support for the Allwinner A523/T527 CCU"
> -	default y
> +	default ARCH_SUNXI
>  	depends on ARM64 || COMPILE_TEST
>  
>  config SUN55I_A523_R_CCU
>  	tristate "Support for the Allwinner A523/T527 PRCM CCU"
> -	default y
> +	default ARCH_SUNXI
>  	depends on ARM64 || COMPILE_TEST
>  
>  config SUN4I_A10_CCU
>  	tristate "Support for the Allwinner A10/A20 CCU"
> -	default y
> +	default ARCH_SUNXI
>  	depends on MACH_SUN4I || MACH_SUN7I || COMPILE_TEST
>  
>  config SUN5I_CCU
>  	bool "Support for the Allwinner sun5i family CCM"
> -	default y
> +	default ARCH_SUNXI
>  	depends on MACH_SUN5I || COMPILE_TEST
>  	depends on SUNXI_CCU=y
>  
>  config SUN6I_A31_CCU
>  	tristate "Support for the Allwinner A31/A31s CCU"
> -	default y
> +	default ARCH_SUNXI
>  	depends on MACH_SUN6I || COMPILE_TEST
>  
>  config SUN6I_RTC_CCU
>  	tristate "Support for the Allwinner H616/R329 RTC CCU"
> -	default y
> +	default ARCH_SUNXI
>  	depends on MACH_SUN8I || ARM64 || RISCV || COMPILE_TEST
>  
>  config SUN8I_A23_CCU
>  	tristate "Support for the Allwinner A23 CCU"
> -	default y
> +	default ARCH_SUNXI
>  	depends on MACH_SUN8I || COMPILE_TEST
>  
>  config SUN8I_A33_CCU
>  	tristate "Support for the Allwinner A33 CCU"
> -	default y
> +	default ARCH_SUNXI
>  	depends on MACH_SUN8I || COMPILE_TEST
>  
>  config SUN8I_A83T_CCU
>  	tristate "Support for the Allwinner A83T CCU"
> -	default y
> +	default ARCH_SUNXI
>  	depends on MACH_SUN8I || COMPILE_TEST
>  
>  config SUN8I_H3_CCU
>  	tristate "Support for the Allwinner H3 CCU"
> -	default y
> +	default ARCH_SUNXI
>  	depends on MACH_SUN8I || ARM64 || COMPILE_TEST
>  
>  config SUN8I_V3S_CCU
>  	tristate "Support for the Allwinner V3s CCU"
> -	default y
> +	default ARCH_SUNXI
>  	depends on MACH_SUN8I || COMPILE_TEST
>  
>  config SUN8I_DE2_CCU
>  	tristate "Support for the Allwinner SoCs DE2 CCU"
> -	default y
> +	default ARCH_SUNXI
>  	depends on MACH_SUN8I || ARM64 || RISCV || COMPILE_TEST
>  
>  config SUN8I_R40_CCU
>  	tristate "Support for the Allwinner R40 CCU"
> -	default y
> +	default ARCH_SUNXI
>  	depends on MACH_SUN8I || COMPILE_TEST
>  
>  config SUN9I_A80_CCU
>  	tristate "Support for the Allwinner A80 CCU"
> -	default y
> +	default ARCH_SUNXI
>  	depends on MACH_SUN9I || COMPILE_TEST
>  
>  config SUN8I_R_CCU
>  	tristate "Support for Allwinner SoCs' PRCM CCUs"
> -	default y
> +	default ARCH_SUNXI
>  	depends on MACH_SUN8I || ARM64 || COMPILE_TEST
>  
>  endif
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
