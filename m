Return-Path: <SRS0=mi7Q=HF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDD35C433DB
	for <linux-amlogic@archiver.kernel.org>; Wed,  3 Feb 2021 19:20:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98E8364F58
	for <linux-amlogic@archiver.kernel.org>; Wed,  3 Feb 2021 19:20:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 98E8364F58
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ie7oFfKTIHSgPvTp7UvfpddYAMLCdu7og20O0HuldJU=; b=1EVs02M2Kf1MVxBvdtATRiLDA
	s7os4/cYWVmfsQl6FuwN57abcN/Tr3EOdRIgz2Ywu9TnUReLIE4z71hzrnyafIwAv4ZWAOFfNDHbj
	E0Aqxa4xAX3l/WuY0SJHg1dTdz0GJMr/uXmI1fh9XXvW9+ScJmw9ow3i2mINJcoFI/CUdY7zTfh+9
	kNk6X9vZbD27kT+NwmAcqgi7KT7+3SkjmtFlX3G1gQeZuDkhs3Qga8vpdn6J6TGSI63dFpNMK48d1
	x+gNRwyDGYbPFMGvJyet9GhB3vw4Kz+5yLSEzAQqSYutL21iibsoYBVNQAUvlA64x955TLRUUvEBR
	LBdA1JXKA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7Nhe-0000BP-Og; Wed, 03 Feb 2021 19:20:38 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7Nha-0000AG-Q4
 for linux-amlogic@lists.infradead.org; Wed, 03 Feb 2021 19:20:37 +0000
Received: by mail-wr1-x434.google.com with SMTP id v15so558963wrx.4
 for <linux-amlogic@lists.infradead.org>; Wed, 03 Feb 2021 11:20:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=tt99hPLhk3KaB2PWzbIx3e0caoHHzjfbHL4MeGUbUaA=;
 b=vvurCJa+zL6OxkKbyDFd91HDwpgH5Exn+ACKhgh6lzDDzBZzqB67sEj67RW3kmaXBy
 8ovZ12/qyWX+x9Ju6g6gG8l970n77+oxMHWFfLq6xJREUv3S6FTizerERJQxj1VW00kb
 kz/5uuT7hLNt6ellVYzPo9pmdhz/VD3qqK8UZIDnCQH5fDpcnt0anzrdxaDPHsSfsLyk
 Ze88s1rs6vq9tt0dIZULmRiR6WuOFm2uywGlU1EQA4khInjZxVIxZfLCIv04wUefVY1f
 7b2wUq6Qb/W5zssFSbJ328EAmkXxZRH1XPn7BLafKshHz/Ir1ehXRa9ff1YqaZrCTyIE
 PU5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=tt99hPLhk3KaB2PWzbIx3e0caoHHzjfbHL4MeGUbUaA=;
 b=clipQtS5fsTlqV5+JV5DiouyhXLP9URRrrv0ZZzAP0kgzHwOxhjxAJ4m1PoK6OWcCk
 28DLsJ90wjEk/DpTtn4Jhf7eORSLlDFGmJpmiMhh8sSwKVOr4UyhqCbafSnBM04sUjKN
 1RVM9VcWxJ+Tagi40PKBK/Q5+JfJH/gQHQLpm/41xxs/6Sjpya4g9YQoeF8I4vOYctkE
 y2zwhF5WP8GVk6uaq0Bd4um32iWVnOC1JD0GZqMljkrTIFSKyYeKB+9EekuC+ZUi19Rl
 WZI40xiBQwLu/w0dRwL5EEe3+aB6majjCLEEZi9jDgZCz9rE1Ntpj8c5D2eJfELsJO/M
 LXuQ==
X-Gm-Message-State: AOAM533vl2ZQvmxTWYlY0e+HOpmPaCmmtGs3iqvlbPnx2xLq9rbuZCb3
 GcPMnoaYB/2m+G2Q6ISG+G6NRg==
X-Google-Smtp-Source: ABdhPJx7Ma+smAB3z6XyTHRbpL8aFLX1XsmI+JVbGuB7Mh+y1U9TrAecPs1aJwuPWW0GKwsvK8Q7Ng==
X-Received: by 2002:adf:fe04:: with SMTP id n4mr5432984wrr.115.1612380027641; 
 Wed, 03 Feb 2021 11:20:27 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id e10sm4692036wro.65.2021.02.03.11.20.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 11:20:26 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Alexander Stein <alexander.stein@mailbox.org>, Rob Herring
 <robh+dt@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v2 1/1] arm64: dts: amlogic: Assign a fixed index to mmc
 devices
In-Reply-To: <20210202170328.79929-1-alexander.stein@mailbox.org>
References: <20210127230852.66686-1-alexander.stein@mailbox.org>
 <20210202170328.79929-1-alexander.stein@mailbox.org>
Date: Wed, 03 Feb 2021 11:20:24 -0800
Message-ID: <7hwnvp2c1z.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210203_142036_167932_64132710 
X-CRM114-Status: GOOD (  18.00  )
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
Cc: Alexander Stein <alexander.stein@mailbox.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Alexander Stein <alexander.stein@mailbox.org> writes:

> Recently introduced async probe on mmc devices can shuffle block IDs.
> Pin them to fixed values to ease booting in environments where UUIDs
> are not practical. Use newly introduced aliases for mmcblk devices from [1].
> [1]
> https://patchwork.kernel.org/patch/11747669/
>
> Commit message taken from commit 0011c6d18277 ("arm64: dts: rockchip: Assign a fixed index to mmc devices on rk3399 boards.")
>
> The unconventional order (B, C, A) is due to the fact that sd_emmc_a is
> (according to the comments) only used for SDIO.
>
> AFAICS all boards either have both sd_emmc_b and sd_emmc_c or only one of
> them enabled. So the alias order should match the previous non-async order
> for all of them.
>
> Signed-off-by: Alexander Stein <alexander.stein@mailbox.org>
> ---
> Just for the records, I only tested this on my ODROID-N2 (G12 based) board.
>
>  arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 6 ++++++
>  arch/arm64/boot/dts/amlogic/meson-gx.dtsi         | 6 ++++++
>  2 files changed, 12 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> index 9c90d562ada1..15525f3aa4a6 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> @@ -17,6 +17,12 @@ / {
>  	#address-cells = <2>;
>  	#size-cells = <2>;
>  
> +	aliases {
> +		mmc0 = &sd_emmc_b;
> +		mmc1 = &sd_emmc_c;
> +		mmc2 = &sd_emmc_a;
> +	};
> +

Thanks for updating this.

minor nit: as I suggested earlier, could you add comments here showing the
intention that mmc0 -> SD, mmc1 -> eMMC, mmc2 -> SDIO

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
