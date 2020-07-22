Return-Path: <SRS0=3iUY=BB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CF91C433E3
	for <linux-amlogic@archiver.kernel.org>; Wed, 22 Jul 2020 23:03:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB70D22B3F
	for <linux-amlogic@archiver.kernel.org>; Wed, 22 Jul 2020 23:03:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ukljtHx3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=agner.ch header.i=@agner.ch header.b="cKt3xtSu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB70D22B3F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=agner.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nu67Sw3BR6Qxpi5WlnzrH2bFZPuqKbg+z8l0IsVwe5E=; b=ukljtHx32bXvkZ6KGFZxje3MI
	iIVHOLfhyrnEEm1eZHGTaRnCtVcb4t6/mw8cZG/QTyHrs1Duyq6168cBKiQrRHGKWwJqIc6ONbfOv
	bm8kijyePCJZFTX2nGwTdWHMDCzITqinzcEoiZElk1mQODhCebos9QQmFJPNL8zQy2hQcaSzQphzX
	6kWmJBjSAU1Piy0hGb83tlRfkob9V24BguJjzVx0+oHSEixXGeZneihkz8UlxT485xVOp7TJrI9ex
	I62sBJ3QkesOoPyqye2oHQJNyRLD30V1vg7jd0mGkHP+HYc2FNus0+BR8AUNEKBqPcbAXofO2udly
	TFEgxvFDg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyNlk-0001hf-Sq; Wed, 22 Jul 2020 23:03:24 +0000
Received: from mail.kmu-office.ch ([2a02:418:6a02::a2])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyNli-0001gd-G4; Wed, 22 Jul 2020 23:03:23 +0000
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id D28885C3C5A;
 Thu, 23 Jul 2020 01:03:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
 t=1595458998;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bdMZJqRkVGvuWEDFrcGlBP7yBOdaxQVCDcUt6SHzHQg=;
 b=cKt3xtSu46nk8Lwaf8+GZ04qFypC6ZpJQSjGkh8auUvRnBlnXOgNRKPBh5ewMryAh+/0qy
 +6BxM/HIGRpokoTk/d0r4vUcn09Aw/h/YydoIkfL7XTX6k0KJDuKZ9ynSWyE1hIcBuXlzN
 Q/2hK0IdSNKG/WqSSB7KyHTgvS6dcUI=
MIME-Version: 1.0
Date: Thu, 23 Jul 2020 01:03:18 +0200
From: Stefan Agner <stefan@agner.ch>
To: Christian Hewitt <christianshewitt@gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: meson: add support for the ODROID-N2+
In-Reply-To: <20200719141034.8403-4-christianshewitt@gmail.com>
References: <20200719141034.8403-1-christianshewitt@gmail.com>
 <20200719141034.8403-4-christianshewitt@gmail.com>
User-Agent: Roundcube Webmail/1.4.1
Message-ID: <9e2894b3ad0311dcd8179237305d1cd5@agner.ch>
X-Sender: stefan@agner.ch
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200722_190322_808708_4D90A7B4 
X-CRM114-Status: GOOD (  20.95  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Dongjin Kim <tobetter@hardkernel.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Christian,

On 2020-07-19 16:10, Christian Hewitt wrote:
> HardKernel ODROID-N2+ uses an Amlogic S922X rev. C chip capable of higher
> clock speeds than the original ODROID-N2. Hardkernel supports the big cpu
> cluster at 2.4GHz and the little cpu cluster at 2.0GHz. Opp points and
> regulator changess are from the HardKernel Linux kernel sources.

According to the ODROID wiki those values are already in the
overclocking range:
https://wiki.odroid.com/odroid-n2/hardware/overclocking

From what I can tell, for ODROID-N2 upstream Linux so far used defaults
from meson-g12b-s922x.dtsi, which were 1896MHz for the A53 and 1704MHz
for the A73 (so it seems currently the A73 running even 100MHz below
"Stock").

I guess we should pick either Stock or Overclock for the two models.
Unless there is another good reason not to?

--
Stefan

> 
> Suggested-by: Dongjin Kim <tobetter@hardkernel.com>
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>  arch/arm64/boot/dts/amlogic/Makefile          |  1 +
>  .../dts/amlogic/meson-g12b-odroid-n2-plus.dts | 53 +++++++++++++++++++
>  2 files changed, 54 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2-plus.dts
> 
> diff --git a/arch/arm64/boot/dts/amlogic/Makefile
> b/arch/arm64/boot/dts/amlogic/Makefile
> index 5cac4d1d487d..6dc508b80133 100644
> --- a/arch/arm64/boot/dts/amlogic/Makefile
> +++ b/arch/arm64/boot/dts/amlogic/Makefile
> @@ -8,6 +8,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-g12b-gtking-pro.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-g12b-a311d-khadas-vim3.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-g12b-s922x-khadas-vim3.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-g12b-odroid-n2.dtb
> +dtb-$(CONFIG_ARCH_MESON) += meson-g12b-odroid-n2-plus.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-g12b-ugoos-am6.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-kii-pro.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-nanopi-k2.dtb
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2-plus.dts
> b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2-plus.dts
> new file mode 100644
> index 000000000000..99e96be509f8
> --- /dev/null
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2-plus.dts
> @@ -0,0 +1,53 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2019 BayLibre, SAS
> + * Author: Neil Armstrong <narmstrong@baylibre.com>
> + */
> +
> +/dts-v1/;
> +
> +#include "meson-g12b-odroid-n2.dtsi"
> +
> +/ {
> +	compatible = "hardkernel,odroid-n2-plus", "amlogic,s922x", "amlogic,g12b";
> +	model = "Hardkernel ODROID-N2+";
> +
> +	vddcpu_a: regulator-vddcpu-a {
> +		regulator-min-microvolt = <680000>;
> +		regulator-max-microvolt = <1040000>;
> +
> +		pwms = <&pwm_ab 0 1500 0>;
> +	};
> +
> +	vddcpu_b: regulator-vddcpu-b {
> +		regulator-min-microvolt = <680000>;
> +		regulator-max-microvolt = <1040000>;
> +
> +		pwms = <&pwm_AO_cd 1 1500 0>;
> +	};
> +
> +	cpu_opp_table_0: opp-table-0 {
> +		opp-1908000000 {
> +			opp-hz = /bits/ 64 <1908000000>;
> +			opp-microvolt = <1030000>;
> +		};
> +
> +		opp-2016000000 {
> +			opp-hz = /bits/ 64 <2016000000>;
> +			opp-microvolt = <1040000>;
> +		};
> +	};
> +
> +	cpub_opp_table_1: opp-table-1 {
> +		opp-2304000000 {
> +			opp-hz = /bits/ 64 <2304000000>;
> +			opp-microvolt = <1030000>;
> +		};
> +
> +		opp-2400000000 {
> +			opp-hz = /bits/ 64 <2400000000>;
> +			opp-microvolt = <1040000>;
> +		};
> +	};
> +};
> +

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
