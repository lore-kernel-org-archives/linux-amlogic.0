Return-Path: <SRS0=MCOz=W4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EED5C3A5A4
	for <linux-amlogic@archiver.kernel.org>; Sun,  1 Sep 2019 11:37:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3BBD2077B
	for <linux-amlogic@archiver.kernel.org>; Sun,  1 Sep 2019 11:37:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TeExecc9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="S/f4+9NJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E3BBD2077B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eX9QU7q88rDVI7gPFsaEsXJaCLHOHnSKW7rB978EsAg=; b=TeExecc9ELRxd9
	jCXa88YMZ0L/YLExky8JrfYUnYxoheJen4KjcNhcXEmZc2TnrVKLbdqmwSArsuMk6zPAmQEwtfQ38
	7FUEEknqodnAu+XavKSEoroUk9KdA27zPzzazn5cxC031gyXp5TzcqD4+a++BiNXAQtkHc4KkQpv/
	Fpx3yTNDcxgTnn8iisk7hUVVZAQzrs7WS/jgXKgciW+KpHa+1SfSZzTOSMUMicyTWiDCrmi67c4qy
	UohH8sl9wlLZKdw9g8qIkYy1aWzF453Blk2BYXQ8wpj/D2mv4hY83na+wSMC6dnf7QpAuEsKO0HQH
	upLzKFGeBcN3v31CMVuw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i4OB6-00047K-Hi; Sun, 01 Sep 2019 11:37:52 +0000
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i4OAs-0003vD-4s; Sun, 01 Sep 2019 11:37:39 +0000
Received: by mail-oi1-x241.google.com with SMTP id k20so2141461oih.3;
 Sun, 01 Sep 2019 04:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=F4ea0X195pjBksmLH4Jb5O+7IQFkWIEKe4KvUWbpWKw=;
 b=S/f4+9NJpYgjaAYohWElo6Lxu8W10QGg8WQpz2TSmYq6WVpnoMZ5X5mD4FD2Qm/+aT
 h6k30488weYD+GtpbU1X+etsHEo3iek41SBijV4qSTEHt2Tws6OHYsjtY9WjaLh6/EBR
 M9ZFYDsoqasPfy8ltkslhDV8TDNXC6OIyo+EZhDrhfodnlAT9tliaU/i0AVE3Gwmyc+L
 /kCNZ6SkV3A+pJFHBwpu1qX64zPcMUpLXLQhy4iazKhKc2cZnOtA7c56aIjbtj7ENxOa
 UKFmfudh4s6GVBAfHoUYAvgaNq3HNxbUXWrKBdndKCtzq5JrHaRjUC1l5hN+fAkjg1V6
 ZYGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=F4ea0X195pjBksmLH4Jb5O+7IQFkWIEKe4KvUWbpWKw=;
 b=qqqoRilBo8qLkYvqFPNxx16UiuDmcZZVV3aeW3y9LPr1ORXrcDEqEt6DHpNqR3rc9I
 +pckkaENmShSAe1hV9Q4k3LhKzRwElv5NFkcYdS+WDlBS9TkXwdNAHDnb7uc7Y9eqT6f
 aVHfvW+yQHzaoa+pW/R8FNEU2G6vY29MnUMFNmhuydUeu5IVHEWSgkUjGCylJD2xIIVW
 i2SD84LFeRSbRUgje+YPHC1zucGm3oh16dsHOlB0Pz1ogJHNec4jDN8JwwmVAUOeVZAp
 crJSaKWvIZNJmy1aHZOlEUWdfmMRbvU1mTIDkwl1JcpsQTEh94boGpSLfLWk6GcKh2z/
 Rzew==
X-Gm-Message-State: APjAAAWdBu6JOYPNLY+dW8aeTy82Tqcw2Q73OjAn014tFZ0zf+ljzJ44
 nTzBxNifppa6giZ4CWUjAsNycsbcZ3EshEyJZDE=
X-Google-Smtp-Source: APXvYqwvsFh4/YUE47XtDvJtwbjcL/6stJq0LFpkSlQboo8+bTGRT0ChsLaFBnwCmNrxYIhmz28KlbhlSVsH+kzP2pA=
X-Received: by 2002:a05:6808:b14:: with SMTP id
 s20mr15797899oij.15.1567337856627; 
 Sun, 01 Sep 2019 04:37:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190828202723.1145-1-linux.amoon@gmail.com>
 <20190828202723.1145-2-linux.amoon@gmail.com>
In-Reply-To: <20190828202723.1145-2-linux.amoon@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 1 Sep 2019 13:37:25 +0200
Message-ID: <CAFBinCBWq0LcdA1-a5W06zKp0RzGs5_=Mph6StGKXJ7npCgbfg@mail.gmail.com>
Subject: Re: [PATCHv1 1/3] arm64: dts: meson: odroid-c2: Add missing regulator
 linked to P5V0 regulator
To: Anand Moon <linux.amoon@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190901_043738_215732_F54176F2 
X-CRM114-Status: GOOD (  14.32  )
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, Aug 28, 2019 at 10:27 PM Anand Moon <linux.amoon@gmail.com> wrote:
>
> As per shematics VDDIO_AO18, VDDIO_AO3V3/VDD3V3 DDR3_1V5/DDR_VDDC:
typo: "schematics"

> fixed regulator output which is supplied by P5V0.
>
> Rename vcc3v3 regulator node to vddio_ao3v3 as per shematics.
typo: "schematics"

according to the schematics there's both:
- VDDIO_AO3V3
- VCC3V3 (which is turned on by VDDIO_AO3V3, see [0])

> Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Cc: Jerome Brunet <jbrunet@baylibre.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
>  .../boot/dts/amlogic/meson-gxbb-odroidc2.dts  | 29 +++++++++++++++++--
>  1 file changed, 26 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
> index 792698a60a12..98e742bf44c1 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
> @@ -104,11 +104,34 @@
>                 regulator-max-microvolt = <1800000>;
>         };
>
> -       vcc3v3: regulator-vcc3v3 {
> +       vddio_ao1v8: regulator-vddio-ao1v8 {
>                 compatible = "regulator-fixed";
> -               regulator-name = "VCC3V3";
> +               regulator-name = "VDDIO_AO1V8";
> +               regulator-min-microvolt = <1800000>;
> +               regulator-max-microvolt = <1800000>;
> +               regulator-always-on;
> +               /* U17 RT9179GB */
> +               vin-supply = <&p5v0>;
> +       };
> +
> +       vddio_ao3v3: regulator-vddio-ao3v3 {
> +               compatible = "regulator-fixed";
> +               regulator-name = "VDDIO_AO3V3";
>                 regulator-min-microvolt = <3300000>;
>                 regulator-max-microvolt = <3300000>;
> +               regulator-always-on;
> +               /* U11 MP2161GJ-C499 */
> +               vin-supply = <&p5v0>;
> +       };
> +
> +       vddc_ddr: regulator-vddc-ddr {
> +               compatible = "regulator-fixed";
> +               regulator-name = "DDR_VDDC";
personally I would call this (along with the node name and alias) DDR3_1V5
odroid-c2_rev0.1_20150930.pdf shows that DDR3_1V5 and DDR_VDDC are
both the same. however, the DDR_VDDC signal name is not used by any
component in the datasheet

> +               regulator-min-microvolt = <1500000>;
> +               regulator-max-microvolt = <1500000>;
> +               regulator-always-on;
> +               /* U15 MP2161GJ-C499 */
> +               vin-supply = <&p5v0>;
>         };
>
>         emmc_pwrseq: emmc-pwrseq {
> @@ -301,7 +324,7 @@
>         mmc-hs200-1_8v;
>
>         mmc-pwrseq = <&emmc_pwrseq>;
> -       vmmc-supply = <&vcc3v3>;
> +       vmmc-supply = <&vddio_ao3v3>;
odroid-c2_rev0.1_20150930.pdf uses VCC3V3 as supply


Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
