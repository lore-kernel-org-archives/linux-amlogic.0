Return-Path: <SRS0=1amn=EZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAB17C56201
	for <linux-amlogic@archiver.kernel.org>; Thu, 19 Nov 2020 16:56:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF04424199
	for <linux-amlogic@archiver.kernel.org>; Thu, 19 Nov 2020 16:56:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="3P7phavx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="teLgHfrA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF04424199
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:In-reply-to:Subject:To:
	From:References:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Z05zmZ/yohKEwL/TVv0IkdwCO27SeKRpTEtqD29FFBI=; b=3P7phavxreyVSrCfR3frLZ++0
	kb8aGrwVilJMyViUMlQV5aI2gd2d9qV/UXpkUKHKd9f12npTtDoFMuyPBCtTPS4+3g81jTspXgWc5
	FTHrY5cPDS/wn2lWcscC1wQvxFzgLmMRCIbgYqhMnWIZO592UknCGcQQHJhtIdwxVAgm4kvWnWUHa
	x0K/c91OZHLYOE9Z4oD99eIpntt8wPKffRu0MV22xdZWa5DaD5DU2BgZAJKpIZSBIu2X1b2CJhacT
	S7kEBoTmI5NNGQHVMz2/tM0O0DG/Nek+6fw6pLiiOKmYYG+QseQwrjMnyD/W3EbCNTSaFCg+n49Uj
	p9gaXKXDA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfnEN-0005Ga-Hk; Thu, 19 Nov 2020 16:56:23 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfn5b-0001R1-OB
 for linux-amlogic@lists.infradead.org; Thu, 19 Nov 2020 16:47:21 +0000
Received: by mail-wr1-x441.google.com with SMTP id m6so7124024wrg.7
 for <linux-amlogic@lists.infradead.org>; Thu, 19 Nov 2020 08:47:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:message-id
 :date:mime-version;
 bh=zchuhEm0vT5ynG8KlZ4xLj8iDkIzG/5Ra4QZPMTjKtM=;
 b=teLgHfrAXPCaab7EgYkxY8biXsFr1CQ7/yZVtDevYa8cOeUBQHaXUr2vue2nWiOsRa
 uHZ7wjs0UcKg18Azlna5IFlZHJZ1Z8h2TeCoeO/TDz7tTmtcrWbM8lQtqySLmnuvH0PY
 e9jnsKW/SPjebjuNAGaT2G6Q5QS+Nuza7TokLvF4S6s8fMmJxHOVGM7+dKBssc0c45QE
 mjk6wNn3wNEFgeWYr82WtB1nrMM2dHwYtSmnX4U6ZypKmCjCLD7Fq1nZqNRaVJ2r9Gfe
 ZB0tIqwF8WB5s/8sejLr0IeTMvv/RQ50NMo2BmC09AlUORtxtwpGWWq8tjZJv9OxmbFQ
 nruA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:message-id:date:mime-version;
 bh=zchuhEm0vT5ynG8KlZ4xLj8iDkIzG/5Ra4QZPMTjKtM=;
 b=rWhKHddRtaICtxiOddrECTf4JM1mPLp4Yj3K01JgTa3HEDhftfr7idq4F8GCFEMIom
 jUjnGxcSprAWgYmNMIuNUpBwlLRTcSvA1tGEYOocQEdxIktEKTi0K6DrqBCnUmyY+I0/
 k/XIGKwxuw+LQo646av39gi485M5qKkzGiGJvow1yF7HlnvGO4W6sZb2n2u+Qr6lwQMA
 8QHb3Y29r5mcuFH9ZoLn9kmNqO78RHq/yj61mFuEw9v8HvgNB0/QeEyk17FIrzJWI3PX
 imgoGkhtj6wlLwX1yD1tK9fXlUVhAzWa9HZH+aoUp4UpdDZRKnb+gOFP7Tes17C9to94
 ldSA==
X-Gm-Message-State: AOAM533rGsrz/AktYeo9Bg7G+ZNl72ctjekZJ5wYioOJ2w9Y5LUaiH/z
 S7BQ77s30Ms6HetGIjrmn/bCwQjoVYxg2D9z
X-Google-Smtp-Source: ABdhPJwuw665IRQWBR0WeOLYFbpO68TS81GPWNJy8/BMBgccH4mf6tkM0TDusJannl0uKrlaZRXEdQ==
X-Received: by 2002:a5d:62ca:: with SMTP id o10mr10878705wrv.422.1605804436202; 
 Thu, 19 Nov 2020 08:47:16 -0800 (PST)
Received: from localhost (253.35.17.109.rev.sfr.net. [109.17.35.253])
 by smtp.gmail.com with ESMTPSA id w17sm409626wru.82.2020.11.19.08.47.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2020 08:47:15 -0800 (PST)
References: <20201118190930.34352-1-khilman@baylibre.com>
User-agent: mu4e 1.4.10; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>, Neil Armstrong
 <narmstrong@baylibre.com>
Subject: Re: [PATCH] clk: meson: Kconfig: fix dependency for G12A
In-reply-to: <20201118190930.34352-1-khilman@baylibre.com>
Message-ID: <1jzh3d8fal.fsf@starbuckisacylon.baylibre.com>
Date: Thu, 19 Nov 2020 17:47:14 +0100
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201119_114720_270901_404E8724 
X-CRM114-Status: GOOD (  13.79  )
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
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Wed 18 Nov 2020 at 20:09, Kevin Hilman <khilman@baylibre.com> wrote:

> When building only G12A, ensure that VID_PLL_DIV clock driver is
> selected, otherwise results in this build error:
>
> ERROR: modpost: "meson_vid_pll_div_ro_ops" [drivers/clk/meson/g12a.ko] undefined!
>
> Signed-off-by: Kevin Hilman <khilman@baylibre.com>

Fixes: 085a4ea93d54 ("clk: meson: g12a: add peripheral clock controller")

> ---
>  drivers/clk/meson/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
> index 034da203e8e0..9a8a548d839d 100644
> --- a/drivers/clk/meson/Kconfig
> +++ b/drivers/clk/meson/Kconfig
> @@ -110,6 +110,7 @@ config COMMON_CLK_G12A
>  	select COMMON_CLK_MESON_AO_CLKC
>  	select COMMON_CLK_MESON_EE_CLKC
>  	select COMMON_CLK_MESON_CPU_DYNDIV
> +	select COMMON_CLK_MESON_VID_PLL_DIV
>  	select MFD_SYSCON
>  	help
>  	  Support for the clock controller on Amlogic S905D2, S905X2 and S905Y2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
