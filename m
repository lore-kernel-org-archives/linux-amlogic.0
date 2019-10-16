Return-Path: <SRS0=vLcw=YJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7FE7C4360C
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Oct 2019 09:08:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB1702168B
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Oct 2019 09:08:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OAW+8UkK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WkQCEGe/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AB1702168B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gv6XMl+BBHalfqvss0AEXYiAWXtFm/BbP5AzBVDEDm8=; b=OAW+8UkK5wZ2Mh
	K8ODgBhmshV0hG0ajhxmuv9O8ezgG0PmLAlt4FrmyeVfDyiOjJkHuIfhanIxJNBQ4rz+M/DsB7ZS0
	sPhdTjKhZLO7IXFqLWhwLPmJYa03HGLUgjqE/F82DcU4ZOGA4D0wijk23Q1xyO4K4dLiVJ9Hx3x89
	VGo+6q7tnqZhs2lJPBnjNfXtZNnwukVfoPYB/PqLXKNyH4xdvdbkKXszxLnuW8wbfPVBGuSnnGSfH
	VKVmfvGhnSp22VlOtqjG2PH8DnBBY4jA7/3DaOMW1ZL4ut5t8rvRXUHIrc4Go+Ms6KfcOnDFk8UcG
	XFhC7PgTQJLP0vk99dwA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iKfIc-0003Wb-Ty; Wed, 16 Oct 2019 09:08:54 +0000
Received: from mail-vs1-xe43.google.com ([2607:f8b0:4864:20::e43])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iKfIa-0003Ul-8z
 for linux-amlogic@lists.infradead.org; Wed, 16 Oct 2019 09:08:53 +0000
Received: by mail-vs1-xe43.google.com with SMTP id b123so15111685vsb.5
 for <linux-amlogic@lists.infradead.org>; Wed, 16 Oct 2019 02:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=f+cbAAT/Sf2rErLhd62NV0+wHrRpwzDTpuV1QL+WgT0=;
 b=WkQCEGe/JAlMlgRGB7nm+sPGEBKCVm2NHJCVmMGXfIYgzeKUN3my5cJrAPT2mNJVkb
 fpEN30qA5FLHU5uCRa0DaQr2t6p3BpsDX7lgLuldrPYzWo7TX7WyhiEemNZWiMpWAl6D
 S3LkJwnFcv+UrH/tOvfu2o4TPqWrUh9Zbv0hZrp8uL4K1mIKneqUwLhV+Jslu423nKSH
 TMsl0r4WiGv/koqvQRiM49mFdqg31ufBtMedL4v9eLtp2a1WkTf5UaX8UXKbLsdJhbOg
 AvpE37hKsWvyZpkCGedlDeYcXFROMfTaGrUX2fgkhK4Bgn0019hnDfwJZ8k2UA25ivTK
 SlGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=f+cbAAT/Sf2rErLhd62NV0+wHrRpwzDTpuV1QL+WgT0=;
 b=ANvA9jupIeEAn8+YjUp3WcZdWHeusWZfZFaVagb+sJG+jNWVyEvW6VArKUhBKyV39v
 wN0u0jE6FoTK15R8XgqGBgHRdwGEcya9N1Wpr9MuhKrGqGcazLpjpeBNR2iU4vtGR5nS
 PNqd/I/tG4snKHK9oi4jClVDW7NH0WQji6KGVg40Tjp0CgChNUF+u2u/i0YNkagU98ZD
 N7otd1xEbFeMgv4WSTQ34HlRc+8znM+rpimelSrUO7KBxhi2QaG83pK2lZt87ZLrYZVI
 EU38K3GsIvR2NpcYBpFeFBIEQ5V1X8UGogJR4BFkcAsYhtQjpOeFsvwvSDy93jkROKON
 6EmQ==
X-Gm-Message-State: APjAAAVmCV01hTpeUQUegQBdDvmjjq5BLRvWGDGMiBiG2pWvsZGq9n7B
 /pJOT08q99/u8vLBnx0SCgM6fcWzBlCMXJyI8Sjwsg==
X-Google-Smtp-Source: APXvYqys96QtP/a589oj4qhDSHoh3ceKxXMx8205sD/iOsFacZUanmKIFgQRgZbT9Fci7ihZ25YAPhZkM6grwM2/Kv8=
X-Received: by 2002:a67:df0d:: with SMTP id s13mr4375026vsk.95.1571216930772; 
 Wed, 16 Oct 2019 02:08:50 -0700 (PDT)
MIME-Version: 1.0
References: <20191004090114.30694-1-glaroque@baylibre.com>
 <20191004090114.30694-7-glaroque@baylibre.com>
In-Reply-To: <20191004090114.30694-7-glaroque@baylibre.com>
From: Amit Kucheria <amit.kucheria@linaro.org>
Date: Wed, 16 Oct 2019 14:38:39 +0530
Message-ID: <CAHLCerOcHoMLc8kjBvG3ssiro31sr2Fsv5dGscqCTD72xdaLMQ@mail.gmail.com>
Subject: Re: [PATCH v7 6/7] arm64: dts: amlogic: g12b: add cooling properties
To: Guillaume La Roque <glaroque@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191016_020852_321975_679B77A3 
X-CRM114-Status: GOOD (  12.19  )
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
> Add missing #colling-cells field for G12B SoC
> Add cooling-map for passive and hot trip point
>
> Tested-by: Christian Hewitt <christianshewitt@gmail.com>
> Tested-by: Kevin Hilman <khilman@baylibre.com>
> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>

Reviewed-by: Amit Kucheria <amit.kucheria@linaro.org>

> ---
>  arch/arm64/boot/dts/amlogic/meson-g12b.dtsi | 29 +++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi
> index 98ae8a7c8b41..4bb89bce758f 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi
> @@ -49,6 +49,7 @@
>                         reg = <0x0 0x0>;
>                         enable-method = "psci";
>                         next-level-cache = <&l2>;
> +                       #cooling-cells = <2>;
>                 };
>
>                 cpu1: cpu@1 {
> @@ -57,6 +58,7 @@
>                         reg = <0x0 0x1>;
>                         enable-method = "psci";
>                         next-level-cache = <&l2>;
> +                       #cooling-cells = <2>;
>                 };
>
>                 cpu100: cpu@100 {
> @@ -65,6 +67,7 @@
>                         reg = <0x0 0x100>;
>                         enable-method = "psci";
>                         next-level-cache = <&l2>;
> +                       #cooling-cells = <2>;
>                 };
>
>                 cpu101: cpu@101 {
> @@ -73,6 +76,7 @@
>                         reg = <0x0 0x101>;
>                         enable-method = "psci";
>                         next-level-cache = <&l2>;
> +                       #cooling-cells = <2>;
>                 };
>
>                 cpu102: cpu@102 {
> @@ -81,6 +85,7 @@
>                         reg = <0x0 0x102>;
>                         enable-method = "psci";
>                         next-level-cache = <&l2>;
> +                       #cooling-cells = <2>;
>                 };
>
>                 cpu103: cpu@103 {
> @@ -89,6 +94,7 @@
>                         reg = <0x0 0x103>;
>                         enable-method = "psci";
>                         next-level-cache = <&l2>;
> +                       #cooling-cells = <2>;
>                 };
>
>                 l2: l2-cache0 {
> @@ -219,3 +225,26 @@
>  &sd_emmc_a {
>         amlogic,dram-access-quirk;
>  };
> +
> +&cpu_thermal {
> +       cooling-maps {
> +               map0 {
> +                       trip = <&cpu_passive>;
> +                       cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +                                        <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +                                        <&cpu100 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +                                        <&cpu101 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +                                        <&cpu102 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +                                        <&cpu103 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +               };
> +               map1 {
> +                       trip = <&cpu_hot>;
> +                       cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +                                        <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +                                        <&cpu100 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +                                        <&cpu101 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +                                        <&cpu102 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +                                        <&cpu103 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +               };
> +       };
> +};
> --
> 2.17.1
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
