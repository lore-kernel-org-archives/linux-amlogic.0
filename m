Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07874C7EE29
	for <linux-amlogic@archiver.kernel.org>; Fri,  9 Jun 2023 12:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=79hJrdVMsZMmH/A/z8a3z8RH9WLd11iGCkRHrvNQHTg=; b=mnYlHHcodmU0v1
	e2qU+niK+SsjefhtAu2s2z1b2OulsH6hSgDutWFx3Dz5DAY2MnT9BD5GXOTO7XH3CSUwj8KmldqfY
	PwgBy21rRfY99mj6z1v17exC5ZGueT8XrDkM3jYWoEbINw+KhVCF6eY0SdR3GsfP9Fig5TFFTVVR2
	ZZcsq2eqedM/7qFngI9/kDyQjk/uqifRFmXa0VvPX9ChUD36TAwW3NRumAyCg5QjbVKyZVQas6WgP
	7UzAJMj6Tc0X8U9eU8bsyoHoF8yJ5Gcd3iQkvWnCxqo8i7/tmVU15VoFi07cLlNZsAt0cQh6D0vIU
	/uY18C7ArTuffss+xCVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7b0c-00CxAc-2z;
	Fri, 09 Jun 2023 12:14:26 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7awd-00CuSm-1D;
	Fri, 09 Jun 2023 12:10:21 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 0A17E5FD8E;
	Fri,  9 Jun 2023 15:10:17 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1686312617;
	bh=ub+fulo7iW/neBWoaW5ppJg+bJ5K5cJ0kpCRCQIV+58=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	b=bGf8obVJxAgMRZCiOz2F+Ze/a7xIAQF3UFRnjwDDzkegdLuRmDj9i7BPiStEukv9v
	 EjmT3/dbeB7NT5Mnic80UM7CzAm//xD8CYGAnkiEgM4KY6knJGytArllmZWuK0Vudt
	 EhMXXd2gV9w+nrKxV9eHQIXHlOmUt4hvlRtHSRvhgDT1dXVRGgxsV0bMgyQDYFzLbZ
	 8f2onmR9vhHxoy1s7K5x2ftHf9UgoaTb97NbhlEDsbQu/WXRBkLl2VmmAe/7xbd5MJ
	 gIfhd9KD7bsWOUklzGCKwnN9t9d0Kiud1J+aqtqJB6h3Frtg66GE+ef3RqiJvoTXYs
	 UYwZPrH4VgJwA==
Received: from S-MS-EXCH02.sberdevices.ru (S-MS-EXCH02.sberdevices.ru [172.16.1.5])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Fri,  9 Jun 2023 15:10:16 +0300 (MSK)
Date: Fri, 9 Jun 2023 15:10:16 +0300
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
Subject: Re: [PATCH 12/18] dt-bindings: clk: amlogic,a1-pll-clkc: expose all
 clock ids
Message-ID: <20230609121016.4njwpst3mu57fehv@CAB-WSD-L081021>
References: <20230607-topic-amlogic-upstream-clkid-public-migration-v1-0-9676afa6b22c@linaro.org>
 <20230607-topic-amlogic-upstream-clkid-public-migration-v1-12-9676afa6b22c@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230607-topic-amlogic-upstream-clkid-public-migration-v1-12-9676afa6b22c@linaro.org>
User-Agent: NeoMutt/20220415
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH02.sberdevices.ru (172.16.1.5) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/06/09 07:08:00 #21465535
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230609_051019_764223_7B1224A2 
X-CRM114-Status: GOOD (  21.45  )
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

On Wed, Jun 07, 2023 at 12:56:23PM +0200, Neil Armstrong wrote:
> Due to a policy change in clock ID bindings handling, expose
> all the "private" clock IDs to the public clock dt-bindings
> to move out of the previous maintenance scheme.
> 
> This refers to a discussion at [1] & [2] with Krzysztof about
> the issue with the current maintenance.
> 
> It was decided to move every A1 pll ID to the public clock
> dt-bindings headers to be merged in a single tree so we
> can safely add new clocks without having merge issues.
> 
> [1] https://lore.kernel.org/all/c088e01c-0714-82be-8347-6140daf56640@linaro.org/
> [2] https://lore.kernel.org/all/2fabe721-7434-43e7-bae5-088a42ba128d@app.fastmail.com/
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/clk/meson/a1-pll.h                      | 15 ---------------
>  include/dt-bindings/clock/amlogic,a1-pll-clkc.h |  5 +++++
>  2 files changed, 5 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/clk/meson/a1-pll.h b/drivers/clk/meson/a1-pll.h
> index 82570759e6a2..0add1c7ea9f5 100644
> --- a/drivers/clk/meson/a1-pll.h
> +++ b/drivers/clk/meson/a1-pll.h
> @@ -28,19 +28,4 @@
>  /* include the CLKIDs that have been made part of the DT binding */
>  #include <dt-bindings/clock/amlogic,a1-pll-clkc.h>
>  
> -/*
> - * CLKID index values for internal clocks
> - *
> - * These indices are entirely contrived and do not map onto the hardware.
> - * It has now been decided to expose everything by default in the DT header:
> - * include/dt-bindings/clock/a1-pll-clkc.h. Only the clocks ids we don't want
> - * to expose, such as the internal muxes and dividers of composite clocks,
> - * will remain defined here.
> - */
> -#define CLKID_FIXED_PLL_DCO	0
> -#define CLKID_FCLK_DIV2_DIV	2
> -#define CLKID_FCLK_DIV3_DIV	3
> -#define CLKID_FCLK_DIV5_DIV	4
> -#define CLKID_FCLK_DIV7_DIV	5
> -
>  #endif /* __A1_PLL_H */
> diff --git a/include/dt-bindings/clock/amlogic,a1-pll-clkc.h b/include/dt-bindings/clock/amlogic,a1-pll-clkc.h
> index 01fb8164ac29..2b660c0f2c9f 100644
> --- a/include/dt-bindings/clock/amlogic,a1-pll-clkc.h
> +++ b/include/dt-bindings/clock/amlogic,a1-pll-clkc.h
> @@ -10,7 +10,12 @@
>  #ifndef __A1_PLL_CLKC_H
>  #define __A1_PLL_CLKC_H
>  
> +#define CLKID_FIXED_PLL_DCO	0
>  #define CLKID_FIXED_PLL		1
> +#define CLKID_FCLK_DIV2_DIV	2
> +#define CLKID_FCLK_DIV3_DIV	3
> +#define CLKID_FCLK_DIV5_DIV	4
> +#define CLKID_FCLK_DIV7_DIV	5
>  #define CLKID_FCLK_DIV2		6
>  #define CLKID_FCLK_DIV3		7
>  #define CLKID_FCLK_DIV5		8
> 
> -- 
> 2.34.1
> 

Reviewed-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>

-- 
Thank you,
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
