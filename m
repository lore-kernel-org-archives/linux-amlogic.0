Return-Path: <SRS0=vLcw=YJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 934E2ECE588
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Oct 2019 09:08:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6537921835
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Oct 2019 09:08:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pki1kXgb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zYuc2eZ9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6537921835
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nN/u/2WdhBKsuavwRezHKMJP59kM0bqIBwekpVacUDs=; b=pki1kXgbPI/Ifs
	j4XE65CycCsuWRhUIxLFgY+WKUWw5u+hU99mQBecDEeIE3qxR6lCFaZMEV0OMUATpNyHxE9j+pQ6C
	yU/8fYk8N2ChYzFTJ0Y//LPmpd97eq4nX28R1m1eSvUdVKYYlsxAH9kBcv65x5rrTBvvGzaJEfh39
	WG/ioTasQY4rZ58tsSIrrvBOmhhfRpwgxUAfWGm18jNGDvQmBVedfLtu79ntE6nmZWqKpAKyMPzOq
	hb+2bdIoRQqMllAFpLruf1eQq9z9j5Dm011eL5HACnCLR2Zzj0YQDLHIYYMBlRpdB9FBj3NZthaOH
	4fE6a+KTPr6hyUcccJDg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iKfIT-0003P7-J3; Wed, 16 Oct 2019 09:08:45 +0000
Received: from mail-vs1-xe44.google.com ([2607:f8b0:4864:20::e44])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iKfIF-0003Ef-UI
 for linux-amlogic@lists.infradead.org; Wed, 16 Oct 2019 09:08:33 +0000
Received: by mail-vs1-xe44.google.com with SMTP id d3so15131591vsr.1
 for <linux-amlogic@lists.infradead.org>; Wed, 16 Oct 2019 02:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NdVzA6qPVlAmhSw+AF0RzsUEa7rtQhimXzVFQeLQmeY=;
 b=zYuc2eZ9oGLA1uBehnPVw3qQghPYysUXj+5+wQkhQ8Q0vhUZYyls8WZWwVTpZaz/f0
 xx8XuURCVETsEjW7RrxU1lVytuaF9SDoyRLW/7wZZGtdLI8npkck9Gwy33hWjJsm9t8V
 HNuJYmlMK0sCHnbt1jceoZARW15VMQkafTKURVi4D+6C9YBX2PowbgGNj8IZdSgFQXQy
 /kELXCPaXG+99tz2Wh2H+ep7a8hf4uHc7CHJoWN2CoezsBwtXMFbvWs0xSs7WBraLDdG
 sXnrjlzPIDxhfFwhCBi1hoys4BDH/gpaAv4sVVTUG00b5u/K0RO0PDYFLJ6I94sGrokH
 L3pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NdVzA6qPVlAmhSw+AF0RzsUEa7rtQhimXzVFQeLQmeY=;
 b=C4MkE/s8A8Wf85Zr7OKrdioimOreKy9lYUET5KdsoIWHFx/byxNiQQVt9eybI2iqFR
 YwmbASDTqRSC464KRmp+lR4PqpwezksMANwlkB2OteusmFEnxHFxmtvazzfhCu7R9lSa
 5UJE60ZzxKlgy+CLo/2a4PPmJJyCaaGRHjiY9EvcGXISsYwiPMMWFpTZViyUsZ2LSn9p
 2J+CCSOkv9keyE1JbWlLIKn2S4njpZOtiFr/uP5AwKJIhukfVJkJnYmAzpGJuqEXWyJ7
 79LLRDK4c5h/xOHsMpgLy8bXmHzKl/VU1c8y0MkqUWr81pu6Von2Cwr96l4o9POM86pV
 cwQw==
X-Gm-Message-State: APjAAAWcCKQcJRGGOwvRIt5cq837tF1801F5MDMIGdyeB/Wj9FyBYzIG
 wU3B0izO5SDQD/XeLyV6M97SVENHelnrGdOd8NGLpQ==
X-Google-Smtp-Source: APXvYqzUUdjO1L90uCeShcgC6GevLXtyLsvHvDJTSP9JdgM4/IYVfwW7FFgabsmOFF/VTLlGKr6pTf/ZFohS3hAj90I=
X-Received: by 2002:a67:edce:: with SMTP id e14mr16990631vsp.182.1571216909051; 
 Wed, 16 Oct 2019 02:08:29 -0700 (PDT)
MIME-Version: 1.0
References: <20191004090114.30694-1-glaroque@baylibre.com>
 <20191004090114.30694-5-glaroque@baylibre.com>
In-Reply-To: <20191004090114.30694-5-glaroque@baylibre.com>
From: Amit Kucheria <amit.kucheria@linaro.org>
Date: Wed, 16 Oct 2019 14:38:18 +0530
Message-ID: <CAHLCerN+SCuWZJw4OgR7KuDWpkXf5xo-1q=pe0axH2W=DffUXw@mail.gmail.com>
Subject: Re: [PATCH v7 4/7] arm64: dts: meson: g12: Add minimal thermal zone
To: Guillaume La Roque <glaroque@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191016_020831_983982_123CC62D 
X-CRM114-Status: GOOD (  13.20  )
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Linux PM list <linux-pm@vger.kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 LKML <linux-kernel@vger.kernel.org>, Eduardo Valentin <edubezval@gmail.com>,
 linux-amlogic@lists.infradead.org, Zhang Rui <rui.zhang@intel.com>,
 lakml <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, Oct 4, 2019 at 2:31 PM Guillaume La Roque <glaroque@baylibre.com> wrote:
>
> Add minimal thermal zone for two temperature sensor
> One is located close to the DDR and the other one is
> located close to the PLLs (between the CPU and GPU)
>
> Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
> Tested-by: Christian Hewitt <christianshewitt@gmail.com>
> Tested-by: Kevin Hilman <khilman@baylibre.com>
> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>

Reviewed-by: Amit Kucheria <amit.kucheria@linaro.org>

> ---
>  .../boot/dts/amlogic/meson-g12-common.dtsi    | 57 +++++++++++++++++++
>  1 file changed, 57 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> index 0660d9ef6a86..a98c16e163c2 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> @@ -12,6 +12,7 @@
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/reset/amlogic,meson-axg-audio-arb.h>
>  #include <dt-bindings/reset/amlogic,meson-g12a-reset.h>
> +#include <dt-bindings/thermal/thermal.h>
>
>  / {
>         interrupt-parent = <&gic>;
> @@ -94,6 +95,61 @@
>                 #size-cells = <2>;
>                 ranges;
>
> +               thermal-zones {
> +                       cpu_thermal: cpu-thermal {
> +                               polling-delay = <1000>;
> +                               polling-delay-passive = <100>;
> +                               thermal-sensors = <&cpu_temp>;
> +
> +                               trips {
> +                                       cpu_passive: cpu-passive {
> +                                               temperature = <85000>; /* millicelsius */
> +                                               hysteresis = <2000>; /* millicelsius */
> +                                               type = "passive";
> +                                       };
> +
> +                                       cpu_hot: cpu-hot {
> +                                               temperature = <95000>; /* millicelsius */
> +                                               hysteresis = <2000>; /* millicelsius */
> +                                               type = "hot";
> +                                       };
> +
> +                                       cpu_critical: cpu-critical {
> +                                               temperature = <110000>; /* millicelsius */
> +                                               hysteresis = <2000>; /* millicelsius */
> +                                               type = "critical";
> +                                       };
> +                               };
> +                       };
> +
> +                       ddr_thermal: ddr-thermal {
> +                               polling-delay = <1000>;
> +                               polling-delay-passive = <100>;
> +                               thermal-sensors = <&ddr_temp>;
> +
> +                               trips {
> +                                       ddr_passive: ddr-passive {
> +                                               temperature = <85000>; /* millicelsius */
> +                                               hysteresis = <2000>; /* millicelsius */
> +                                               type = "passive";
> +                                       };
> +
> +                                       ddr_critical: ddr-critical {
> +                                               temperature = <110000>; /* millicelsius */
> +                                               hysteresis = <2000>; /* millicelsius */
> +                                               type = "critical";
> +                                       };
> +                               };
> +
> +                               cooling-maps {
> +                                       map {
> +                                               trip = <&ddr_passive>;
> +                                               cooling-device = <&mali THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +                                       };
> +                               };
> +                       };
> +               };
> +
>                 ethmac: ethernet@ff3f0000 {
>                         compatible = "amlogic,meson-axg-dwmac",
>                                      "snps,dwmac-3.70a",
> @@ -2412,6 +2468,7 @@
>                         assigned-clock-rates = <0>, /* Do Nothing */
>                                                <800000000>,
>                                                <0>; /* Do Nothing */
> +                       #cooling-cells = <2>;
>                 };
>         };
>
> --
> 2.17.1
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
