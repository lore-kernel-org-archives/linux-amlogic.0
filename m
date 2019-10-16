Return-Path: <SRS0=vLcw=YJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C883ECE588
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Oct 2019 09:09:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D9F021835
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Oct 2019 09:09:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CNMZmBf2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TxAUvPHm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D9F021835
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GocQrQ5MzWcrV/BqKSEkChzRSxcmq97T2V7H4zYnRKs=; b=CNMZmBf281mLs+
	Qz8GkkDgMrJ5HxEU0E1USFrCZiYHQt78UT5Ogyw9O29z6eieT9MM7vYlTahlHk7hOOikdcEHze+zj
	ggtrHQ4CluuO/XTQByamQc596lgBqKugaCBy0lSMVjKNAE2QSUgwhCs41ySST9fAlfIHJiBooeLqI
	RMGlcc8iI0ESD4nqKsCpreEPNgVWR4rkgE5XA97SXHaCHMcoWaTHyCNEAkgG8LpTrR+L94MxZ0skf
	33im9/wPhNMpvfHM57oeeNR1NjY9KlvTiQje5uAKwwbgZKhRkRSq3A2BvA2MH73pHohfYgh8efTXp
	xO2U3tMdJXWPHjhdGsKA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iKfJV-00042m-9G; Wed, 16 Oct 2019 09:09:49 +0000
Received: from mail-vk1-xa44.google.com ([2607:f8b0:4864:20::a44])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iKfJE-0003qB-1A
 for linux-amlogic@lists.infradead.org; Wed, 16 Oct 2019 09:09:33 +0000
Received: by mail-vk1-xa44.google.com with SMTP id s72so5007538vkh.5
 for <linux-amlogic@lists.infradead.org>; Wed, 16 Oct 2019 02:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fLC2Bd8aTQlMgTV7BobgAGWFlGh3ztvsn8nW9/bKZV0=;
 b=TxAUvPHmWlpqZquEhMqD+x3551R1EZwVaKusNrROTNOeGYR0WQl7D+tujtdR8FSyyF
 2VeE5hAYMcMy3oMmSGWr1wAiipgs7pUOxgq6jJxs33Tx3MPjfT9ckCrvv/C+5gve3kV0
 tNEy86FFXR6/dHrqdTnSg3Gmnr5Asphn8ZSpJJnE+BsLyrAJscBCCdkt4XLiSb5oBFHQ
 RgPAmHOZgQ6FKVhO7pLWmEc3uBpSmSd5Gmud8YcSKygyyn3Y6Fsn7Mu8MGT93UWDJdwe
 QAE2jYUkX6PeuIbZoOt0oyrLbStPJgrPvJ5MOGHT4p02Lgzg6Pg9cqKTEpawJNUUsutW
 5q7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fLC2Bd8aTQlMgTV7BobgAGWFlGh3ztvsn8nW9/bKZV0=;
 b=AbupnPHqAP4kM50CMvRqsdXOiR2S9lUhAF0QBaQEh4HhO0Mzv0PoxIZFihwUGpdNTs
 6pVcR28awRpx373y1Qlj01669+ck/mmrhYONtXx8Ljm4pbcf49zYhZhjQUWCfPBTcL6G
 vAG6RoxTmKtSkedllmmHULYcLYg7AUzocY9ywlUXOQFnjUYrQBo26utI5RC/WQaeGBXF
 iFAlimyvJRWoGAMG/IJePaP1L7Vt+7eKOE2GNzL3oQEeGaVEnt5pvfVf14JmDrgymusn
 OwxtyRdSG7a0OzUtCnP6cVEIMvTchwozo3E49yGdJX3o8QmhXZu1CHUd7CYVkjbm9thY
 01XQ==
X-Gm-Message-State: APjAAAWG8yHZjhBP5EIaoFRag/fidsrql6nR6+AOGuNv9VW7AjAKxIAv
 GBmuMwkN2rwfpmdwsOUjsJ+F4FAiIa8WUsqTgEfZ6A==
X-Google-Smtp-Source: APXvYqww+h+Iq3oDN0oTKBVKfMcWMcfwYY7YU64RQBVmcDpEJ/mf+loxbnHvtZCcDTC1U4TMBxnPsF30uUlEr20CN5E=
X-Received: by 2002:a1f:f8cd:: with SMTP id w196mr21577811vkh.73.1571216970789; 
 Wed, 16 Oct 2019 02:09:30 -0700 (PDT)
MIME-Version: 1.0
References: <20191004090114.30694-1-glaroque@baylibre.com>
 <20191004090114.30694-6-glaroque@baylibre.com>
In-Reply-To: <20191004090114.30694-6-glaroque@baylibre.com>
From: Amit Kucheria <amit.kucheria@linaro.org>
Date: Wed, 16 Oct 2019 14:39:19 +0530
Message-ID: <CAHLCerMp8K7Gs6cAfDVPGa8zSNEOjyQghy-LoauGB15if0EjKg@mail.gmail.com>
Subject: Re: [PATCH v7 5/7] arm64: dts: amlogic: g12a: add cooling properties
To: Guillaume La Roque <glaroque@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191016_020932_086056_64768752 
X-CRM114-Status: GOOD (  11.98  )
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
> Add missing #colling-cells field for G12A SoC
> Add cooling-map for passive and hot trip point
>
> Tested-by: Christian Hewitt <christianshewitt@gmail.com>
> Tested-by: Kevin Hilman <khilman@baylibre.com>
> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>

Reviewed-by: Amit Kucheria <amit.kucheria@linaro.org>

> ---
>  arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 24 +++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
> index 733a9d46fc4b..3ab6497548ca 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
> @@ -18,6 +18,7 @@
>                         reg = <0x0 0x0>;
>                         enable-method = "psci";
>                         next-level-cache = <&l2>;
> +                       #cooling-cells = <2>;
>                 };
>
>                 cpu1: cpu@1 {
> @@ -26,6 +27,7 @@
>                         reg = <0x0 0x1>;
>                         enable-method = "psci";
>                         next-level-cache = <&l2>;
> +                       #cooling-cells = <2>;
>                 };
>
>                 cpu2: cpu@2 {
> @@ -34,6 +36,7 @@
>                         reg = <0x0 0x2>;
>                         enable-method = "psci";
>                         next-level-cache = <&l2>;
> +                       #cooling-cells = <2>;
>                 };
>
>                 cpu3: cpu@3 {
> @@ -42,6 +45,7 @@
>                         reg = <0x0 0x3>;
>                         enable-method = "psci";
>                         next-level-cache = <&l2>;
> +                       #cooling-cells = <2>;
>                 };
>
>                 l2: l2-cache0 {
> @@ -113,3 +117,23 @@
>  &sd_emmc_a {
>         amlogic,dram-access-quirk;
>  };
> +
> +&cpu_thermal {
> +       cooling-maps {
> +               map0 {
> +                       trip = <&cpu_passive>;
> +                       cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +                                       <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +                                       <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +                                       <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +               };
> +
> +               map1 {
> +                       trip = <&cpu_hot>;
> +                       cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +                                       <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +                                       <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +                                       <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
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
