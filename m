Return-Path: <SRS0=EyFj=YI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C0E3ECE59D
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Oct 2019 23:21:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DFE7C2084B
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Oct 2019 23:21:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="S1Lmm3X1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eDOzDhVM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DFE7C2084B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TDrnIaqXugA9xxFo07weG3USDYo0a8l5IIEpTjcG1cE=; b=S1Lmm3X1a7x0mb
	p0ofox8wsuOSDE9MGFS1LTiLbudgD1pcuQEGmgOHEsytUOvrklqolE22coBrK6TjBPxNaEDyfPqsc
	vM1apNgXyoOS/HDESiplRrLEFP1b6KKIgtOFpZ8XEyg1rWfhmiySQJ7uFZ8MSG22v+6//qzrj4uOy
	vOYgSJpbqD8ZQg6kGr/LKl2uGOBr1xatLyc7KzqgvK2eLxdImxx6C+OQvIKh2CGRgMkl7m6Z9TitL
	hlIYaZMPZBjsgZoe+iJoW42TvLUFCEOB34MI0zDELBQzFBKXQ96MVETI0PyoYD2JBgXlsA7+GdX6B
	gI09YEaOH/KcWQdeFjXg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iKW7f-0002wj-6c; Tue, 15 Oct 2019 23:20:59 +0000
Received: from mail-vs1-xe41.google.com ([2607:f8b0:4864:20::e41])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iKW7Q-0002gQ-Bf
 for linux-amlogic@lists.infradead.org; Tue, 15 Oct 2019 23:20:45 +0000
Received: by mail-vs1-xe41.google.com with SMTP id v10so14353433vsc.7
 for <linux-amlogic@lists.infradead.org>; Tue, 15 Oct 2019 16:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7Luzeu61JUpCQk5lttonbL70KSFby5OvdNNxzg/MFQ8=;
 b=eDOzDhVMybk0i/+feqo0X+49gsS5JqJW8Ry8hE/JpXVc3WdVLD8WqJn9dDxRuwCehy
 QvBk66yW4mH2kDlYuzMBwPUkP7IEFj9ZOCyD/4jTGGzyqm14Z6beV+SiRvogqh3bul4S
 iB5C2XFuK7HRXnTP1fLCtCvORAdxwIVNNPgEfK7/yPQBrFJLj5U8IlVLAnGbma2My+bA
 WBSOGcGHMJNm8DROoKh3HDAVOdcniv422vxJwA1eHO+j7o/CCl3KJUcbsWYelqWlID+T
 ADHbasV+eQpUbByIGOW8dLaZ/+35eAnKAiGRw80ERMmbEtCmUY0OfB7tcC1PPQ9bI1JZ
 KYPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7Luzeu61JUpCQk5lttonbL70KSFby5OvdNNxzg/MFQ8=;
 b=K9FoNkamy6sLoHxjt1Tl2cobTZ1aTkG7lfB0JzW1vGNM1NPJ6QxDwee+7jP3+vJM9i
 PtrEf0A9plbf4V1YiXJlGRUHutdklK7cE19549vVJK9FCgboAvrQ5vqoy4Lmqf5y+5VY
 nZ4OPWz4PSaS0rSnh1Nvgkotm5Z19bG5qSebsQ6C5SUF3HB/QbBnbmE/tezOi6fT/axf
 XVF/yqv1lc1SgcBjIhrXwDkTooI9E37i3np/54WOriH75fhDkZVrr2CWtKKCdC28h5FP
 adkozdXwakC8tKz6HS6dOKJEAHYzPDLBd90naGvVt0fYR5XXA49CeuuFCoWhySrShPZP
 /0hA==
X-Gm-Message-State: APjAAAV7LdG4/+2VzHk899Rg56I6hOejiGqeqg6aNu86UpdKB0x7N4VY
 IEBiX9OsRt5epwRwJAazkxw124x4nm9cJBG8KaIzzA==
X-Google-Smtp-Source: APXvYqygrun7u9zevVDKfu0sa7amxsriNbVYF4wbVRpuSP6Re4yc+jB0Mmyyr6iQQ2WpPrkisEClAIRglX6AbvGsZDk=
X-Received: by 2002:a67:dc16:: with SMTP id x22mr1767729vsj.159.1571181642542; 
 Tue, 15 Oct 2019 16:20:42 -0700 (PDT)
MIME-Version: 1.0
References: <20191004090114.30694-1-glaroque@baylibre.com>
 <20191004090114.30694-5-glaroque@baylibre.com>
In-Reply-To: <20191004090114.30694-5-glaroque@baylibre.com>
From: Amit Kucheria <amit.kucheria@linaro.org>
Date: Wed, 16 Oct 2019 04:50:31 +0530
Message-ID: <CAHLCerOzZ6kc0nrGL+XMi37WuBKUv6E0yzE26wUZ5XoRMS8q6w@mail.gmail.com>
Subject: Re: [PATCH v7 4/7] arm64: dts: meson: g12: Add minimal thermal zone
To: Guillaume La Roque <glaroque@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191015_162044_410628_0357E6C1 
X-CRM114-Status: GOOD (  15.07  )
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

Ordinarily, you would need to set these delays to 0 in interrupt mode
to prevent polling overhead. I've just submitted a patch to of-thermal
that should fix this requirement. Could you check if it works for you?

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
