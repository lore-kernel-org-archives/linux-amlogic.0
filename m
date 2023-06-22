Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57C6CEB64D8
	for <linux-amlogic@archiver.kernel.org>; Thu, 22 Jun 2023 13:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0UP4uSdn9l7K0CGWyTkHlVoBt58W8Fc4v62gGww7Iig=; b=FrURfyiRwzSuDF
	5MP6RZ78TisJ9OLU5wRYQenisiONyrprEQEtyOJpnnyolXQ+sdX6ZirC662ZKJ4flILpiIHpEkA5e
	Ufd5ayValT9b1zAY4fYxPSliwuNfZTwbwUUfWFGIW6ZXMhav8Q/AyW7iM1h1sP4HZLZpvx/8GiMCR
	F+PaVeDhN9rurIdX+4517b+akTgfknige3Q49ExVeuk/m9UulxgpVxFAsNg3ws2KI6iasBxKioQDL
	zHMYXgdr7IkvCciMMveE0034lcr92qryPMtAM57gwGSQr+9DJZGBUGg/J1Ibz03eFx5sNsZHjYtR3
	9xXEecvkA/vaghhRZyyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCJxH-000gw1-35;
	Thu, 22 Jun 2023 13:02:31 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCJxB-000gte-2C;
	Thu, 22 Jun 2023 13:02:29 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id D60DE5FDAD;
	Thu, 22 Jun 2023 16:02:19 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1687438939;
	bh=w4D8j20IdblRYzBMBoVQwAQ0UD3FpLpcfi4gJumrTeQ=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	b=lv8HX8NapO5+UDMYVLqguE7sxm2Tq1ry6+DzAv7NHpkG1lbdpUGx3FRZt8AvWIVyU
	 bXlhMfSnZ1z6Vyz95+3AY7nWP3NqAs4swTi7ktrVNHFFVFj0dWUS4X9fvH+sWGJ6bs
	 naEnAWTJj9TJq+p9N0JDEyX50wlx+kxiQ1n3aEtVsSV/blwOVEq2sdRjhPxSH5ZwkZ
	 smy0ZCTZ4psYPdyENpZ7PGdO/PUOClbRKxCL5iW2jbuUBwiaSMxOap1I+tL81DSB1x
	 0yMn4XFxjCv2DQ6Hf0546pe/5qm+6/H1swrBWgA34TrFCjx6c9pB0RCUJUqjddG9+5
	 ikfD5iWHAxmVA==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Thu, 22 Jun 2023 16:02:16 +0300 (MSK)
Date: Thu, 22 Jun 2023 16:02:16 +0300
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: Neil Armstrong <neil.armstrong@linaro.org>
CC: Jerome Brunet <jbrunet@baylibre.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Kevin Hilman
	<khilman@baylibre.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, <linux-amlogic@lists.infradead.org>,
	<linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH v2 17/19] clk: meson: a1: move bindings include to main
 driver
Message-ID: <20230622130216.ocfvwfnad7amex65@CAB-WSD-L081021>
References: <20230607-topic-amlogic-upstream-clkid-public-migration-v2-0-38172d17c27a@linaro.org>
 <20230607-topic-amlogic-upstream-clkid-public-migration-v2-17-38172d17c27a@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230607-topic-amlogic-upstream-clkid-public-migration-v2-17-38172d17c27a@linaro.org>
User-Agent: NeoMutt/20220415
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/06/22 09:26:00 #21554371
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230622_060226_437412_20719643 
X-CRM114-Status: GOOD (  16.71  )
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

On Mon, Jun 12, 2023 at 11:57:34AM +0200, Neil Armstrong wrote:
> Now the clock ids are no more defined in private headers,
> cleanup and include the dt-bindings headers from the main
> driver file.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/clk/meson/a1-peripherals.c | 2 ++
>  drivers/clk/meson/a1-peripherals.h | 3 ---
>  drivers/clk/meson/a1-pll.c         | 2 ++
>  drivers/clk/meson/a1-pll.h         | 3 ---
>  4 files changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/clk/meson/a1-peripherals.c b/drivers/clk/meson/a1-peripherals.c
> index a5cab418736a..070ea1427d73 100644
> --- a/drivers/clk/meson/a1-peripherals.c
> +++ b/drivers/clk/meson/a1-peripherals.c
> @@ -15,6 +15,8 @@
>  #include "clk-regmap.h"
>  #include "meson-clkc-utils.h"
>  
> +#include <dt-bindings/clock/amlogic,a1-peripherals-clkc.h>
> +
>  static struct clk_regmap xtal_in = {
>  	.data = &(struct clk_regmap_gate_data){
>  		.offset = SYS_OSCIN_CTRL,
> diff --git a/drivers/clk/meson/a1-peripherals.h b/drivers/clk/meson/a1-peripherals.h
> index 842b52634ed0..26de8530184a 100644
> --- a/drivers/clk/meson/a1-peripherals.h
> +++ b/drivers/clk/meson/a1-peripherals.h
> @@ -43,7 +43,4 @@
>  #define PSRAM_CLK_CTRL		0xf4
>  #define DMC_CLK_CTRL		0xf8
>  
> -/* include the CLKIDs that have been made part of the DT binding */
> -#include <dt-bindings/clock/amlogic,a1-peripherals-clkc.h>
> -
>  #endif /* __A1_PERIPHERALS_H */
> diff --git a/drivers/clk/meson/a1-pll.c b/drivers/clk/meson/a1-pll.c
> index 25e6b567afd5..7de7d78c3813 100644
> --- a/drivers/clk/meson/a1-pll.c
> +++ b/drivers/clk/meson/a1-pll.c
> @@ -14,6 +14,8 @@
>  #include "clk-regmap.h"
>  #include "meson-clkc-utils.h"
>  
> +#include <dt-bindings/clock/amlogic,a1-pll-clkc.h>
> +
>  static struct clk_regmap fixed_pll_dco = {
>  	.data = &(struct meson_clk_pll_data){
>  		.en = {
> diff --git a/drivers/clk/meson/a1-pll.h b/drivers/clk/meson/a1-pll.h
> index 0add1c7ea9f5..4be17b2bf383 100644
> --- a/drivers/clk/meson/a1-pll.h
> +++ b/drivers/clk/meson/a1-pll.h
> @@ -25,7 +25,4 @@
>  #define ANACTRL_HIFIPLL_CTRL4	0xd0
>  #define ANACTRL_HIFIPLL_STS	0xd4
>  
> -/* include the CLKIDs that have been made part of the DT binding */
> -#include <dt-bindings/clock/amlogic,a1-pll-clkc.h>
> -
>  #endif /* __A1_PLL_H */

Reviewed-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>

-- 
Thank you,
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
