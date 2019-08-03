Return-Path: <SRS0=lQ9R=V7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED153C433FF
	for <linux-amlogic@archiver.kernel.org>; Sat,  3 Aug 2019 18:29:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B8A78214AE
	for <linux-amlogic@archiver.kernel.org>; Sat,  3 Aug 2019 18:29:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lRX14szi";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="PvBvg4hu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B8A78214AE
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jo9RYXi9Jcy7akseKtoVdrzPu2NRGVwLbLtNkvEYFWk=; b=lRX14szinl9nfE
	W3QibQcAEHe0WbYm7T01dCmnjncMIGEdW80vSortKVF6pmosAYVBCD7rkuMvmdzs461e6oh1ob0QI
	ILRsAJUzKv1if/HIqRfXK4m5XLK9xNXiDJdRUDnUFRadPo/fmkTbAY3Von1o07X9Qa5CszCATQKLW
	7aeZr3Nyx9lFAQ0uxW0yNUjvNwMgTMzu94/MPNub1eW08irmyTxEj72TUOKk9beoLop0Smo/5kM7N
	nNc53hOMFPV37F81O4Ic5lMoFxUsbyuXzMvhZqKo5/XGwLRqH1kWoMc7f5lBSyWyyRv5RiLr8hHM1
	kriPTs9TwSdHwRDloCXg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1htymS-0004Hr-Sk; Sat, 03 Aug 2019 18:29:24 +0000
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1htymQ-0004HV-PP; Sat, 03 Aug 2019 18:29:24 +0000
Received: by mail-oi1-x243.google.com with SMTP id c15so3874038oic.3;
 Sat, 03 Aug 2019 11:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZmwQzZFWN1VH43yyrewfQCrNQzkLp/L4+LR2NbHJc20=;
 b=PvBvg4hunsTs0giKyiL15cDxqpUWZJJxBgAjtmY8q1EH6FPxs1nx8kirnGu9sEPZUN
 75hgG7VfyjDLpXEvGHkxVqQs9zoZRNlMRUykM50jFIEucPSSSZ4q3V0USvdDbIwc3LWc
 HLSRMU/zaU4p8RdS39kddAqUBXtmsqp3r+XHRijt2RiABnuM3hcZF85C//2UY9Xv6swM
 Ga2ItWR4PddVdwlcCACr358tayUXsZDUT/Z07QWU2Uk3McQt8TcDYBUy627Wm9Rhj/+6
 zd5pPteLyTRm8jvU0qHe4W5qPUsOht+JJQtwKBLq5F0PTSSGYbl/hX1cNsTWMPfZKsWF
 rNFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZmwQzZFWN1VH43yyrewfQCrNQzkLp/L4+LR2NbHJc20=;
 b=VvP2cCyDizoSupA150Fpl9B/4uFlUmyNjTIw2NOMXxsAn5kX1rytB6oGkA71kKkCTP
 wviuJW6nNf8i79drzsBCEiVcc6AiDBTKhlcoCBluTTr3YqeovA3nEjVugdXoXCi2nz1P
 nRKcUqNQvCCZ9fLDl9gWV5EfZ6sLoQJ/PwFdPZqEkH+4UnYWYzy8tDJdeRD7EgdQi61T
 vJT9WU7cATRQRTIPwdTLq0Cv4fgjqBhQHrO7lr5NZldy2ALhIsbpUnIT4iwwA9EsOA4K
 XziM9XJOjf6tEgghhooGho20aLDCb6OLJgKnTk8B3k+dNNv7INmDveQcQGPk+XtL/09R
 EkqQ==
X-Gm-Message-State: APjAAAVNugfRJR6x6oB2Nx2LfI8ntn59y2dvLLKMFvk/BP6i+1tmel07
 JIbCxnynqNPbwWJAb4sx8oAPddMVA6wPHX8pWYo=
X-Google-Smtp-Source: APXvYqwJbx+70CCBTietpO39u7K1TgLKPTpN4Bi1Ow630XW6U1gtXiCVC87cK74QbovUvi45FqC4+cT21hLCfvd82L4=
X-Received: by 2002:a05:6808:3d6:: with SMTP id
 o22mr6459987oie.140.1564856961731; 
 Sat, 03 Aug 2019 11:29:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190731153529.30159-1-glaroque@baylibre.com>
 <20190731153529.30159-5-glaroque@baylibre.com>
In-Reply-To: <20190731153529.30159-5-glaroque@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 3 Aug 2019 20:29:10 +0200
Message-ID: <CAFBinCD-DUEjPgfUEJmHpPjw1ShZy7nemaFBKANmM5M42XBG4Q@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] arm64: dts: meson: sei510: Add minimal thermal zone
To: Guillaume La Roque <glaroque@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190803_112922_830138_0324B644 
X-CRM114-Status: GOOD (  12.45  )
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
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org, khilman@baylibre.com,
 daniel.lezcano@linaro.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Guillaume,

On Wed, Jul 31, 2019 at 5:36 PM Guillaume La Roque
<glaroque@baylibre.com> wrote:
>
> Add minimal thermal zone for DDR and CPU sensor
so high DDR (controller?) temperatures will throttle Mali and high PLL
temperatures will throttle the CPU?
to get things started I'm fine with this, but I think it should be
mentioned here

> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
> ---
>  .../boot/dts/amlogic/meson-g12a-sei510.dts    | 56 +++++++++++++++++++
>  1 file changed, 56 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
> index 979449968a5f..2c16a2cba0a3 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
> @@ -10,6 +10,7 @@
>  #include <dt-bindings/input/input.h>
>  #include <dt-bindings/gpio/meson-g12a-gpio.h>
>  #include <dt-bindings/sound/meson-g12a-tohdmitx.h>
> +#include <dt-bindings/thermal/thermal.h>
>
>  / {
>         compatible = "seirobotics,sei510", "amlogic,g12a";
> @@ -33,6 +34,53 @@
>                 ethernet0 = &ethmac;
>         };
>
> +       thermal-zones {
> +               cpu-thermal {
> +                       polling-delay = <1000>;
> +                       polling-delay-passive = <100>;
> +                       thermal-sensors = <&cpu_temp>;
> +
> +                       trips {
> +                               cpu_critical: cpu-critical {
> +                                       temperature = <110000>; /* millicelsius */
> +                                       hysteresis = <2000>; /* millicelsius */
> +                                       type = "critical";
> +                               };
> +                       };
> +
> +                       cooling-maps {
> +                               map {
> +                                       trip = <&cpu_critical>;
> +                                       cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +                                                        <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +                                                        <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +                                                        <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +                               };
> +                       };
> +               };
> +
> +               ddr-thermal {
> +                       polling-delay = <1000>;
> +                       polling-delay-passive = <100>;
> +                       thermal-sensors = <&ddr_temp>;
> +
> +                       trips {
> +                               ddr_critical: ddr-critical {
> +                                       temperature = <110000>; /* millicelsius */
> +                                       hysteresis = <2000>; /* millicelsius */
> +                                       type = "critical";
> +                               };
> +                       };
> +
> +                       cooling-maps {
> +                               map {
> +                                       trip = <&ddr_critical>;
> +                                       cooling-device = <&mali THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +                               };
> +                       };
> +               };
> +       };
> +
>         mono_dac: audio-codec-0 {
>                 compatible = "maxim,max98357a";
>                 #sound-dai-cells = <0>;
> @@ -321,6 +369,7 @@
>         operating-points-v2 = <&cpu_opp_table>;
>         clocks = <&clkc CLKID_CPU_CLK>;
>         clock-latency = <50000>;
> +       #cooling-cells = <2>;
>  };
>
>  &cpu1 {
> @@ -328,6 +377,7 @@
>         operating-points-v2 = <&cpu_opp_table>;
>         clocks = <&clkc CLKID_CPU_CLK>;
>         clock-latency = <50000>;
> +       #cooling-cells = <2>;
>  };
>
>  &cpu2 {
> @@ -335,6 +385,7 @@
>         operating-points-v2 = <&cpu_opp_table>;
>         clocks = <&clkc CLKID_CPU_CLK>;
>         clock-latency = <50000>;
> +       #cooling-cells = <2>;
>  };
>
>  &cpu3 {
> @@ -342,6 +393,7 @@
>         operating-points-v2 = <&cpu_opp_table>;
>         clocks = <&clkc CLKID_CPU_CLK>;
>         clock-latency = <50000>;
> +       #cooling-cells = <2>;
>  };
>
>  &cvbs_vdac_port {
> @@ -368,6 +420,10 @@
>         status = "okay";
>  };
>
> +&mali {
> +       #cooling-cells = <2>;
> +};
is there something device-specific in this patch? I'm wondering
whether we can move all of this go g12a.dtsi to simplify maintenance
in the future


Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
