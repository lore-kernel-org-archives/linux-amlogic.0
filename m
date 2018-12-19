Return-Path: <SRS0=yw6d=O4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 995B2C43387
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Dec 2018 14:45:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 669C021841
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Dec 2018 14:45:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pKuy7Y8m";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="hUWRqlbb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 669C021841
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jvLFMSZKXyIX2a18xB8/UV8gooFRjhqj9ANycdObH9g=; b=pKuy7Y8mUUOllJ
	gbNHsADFztriw6PDDn6M32rr8L3nfHMtnPZd9aedgPRjavBEGYn243zLASJrJ2h0KOfw9fodr372X
	wiQhmc5ipuedsa7D8dJN8O3ljGBPzWOwp7Fv++hTf7TE1jUOVeLlLEBVMsty/OS/ezL94KVLCexQU
	OpjR/A/M6x86LalzhtQO+k5PWCp4Myd/EtJnclB0bGWtI29CWaY9GRPbABYIq3XxO3UBxZ/tknk0e
	2BEEJA+ohdthzd5P5bzWnG+qCPBGWX3O4fGhmKs+Gr4hCePaAuXGuEta40pIPwOsyUHzHp6bbNPKm
	R6SBkdGA5A6YEfS0RwXw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gZd5v-00070A-81; Wed, 19 Dec 2018 14:45:07 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gZd5r-0006IW-Ky
 for linux-amlogic@lists.infradead.org; Wed, 19 Dec 2018 14:45:06 +0000
Received: by mail-wm1-x344.google.com with SMTP id p6so6438067wmc.1
 for <linux-amlogic@lists.infradead.org>; Wed, 19 Dec 2018 06:44:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=sab6zG16J4LQDU3B8SJF0jzz8G7TdQt5SdX+9frJtok=;
 b=hUWRqlbbrCn+7QOM7kZ37Z26656Zqx1S0orgGqt2o2HFLrvkrh7juRv/EBp24aMKXf
 Er4x3MKgJ4sLYNdi0kHZ8KeIwqVv/83dPqpV7nDv4h7GCUwtdg24sQrAzmQl/s/OcLJd
 Z00L7IWWGLiJ07r7sprnOAjosSYEb2nHcI/K7NajK2YbwAGD6pWl/suuXG6brLrT1uj6
 I5xCalR9wVuORBYX6LqxG28VSY99I6utqhTOnzbKTNkUGn7kQOLJBMvHMzimj4V7ouSy
 /ye5ycpX7UbH0Ikw6blXDNHuSi402PGiOpd0fBgv3bbv5ZqGyksgT1SO3RdVvSUfr074
 rgIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=sab6zG16J4LQDU3B8SJF0jzz8G7TdQt5SdX+9frJtok=;
 b=XpYtz7gbGTYJUob0gRoOEwigyAch6h6bc1aYa2hMJXYAsrIXDZf9XdlXTO56WcYflj
 CSnrWAqRR26Wy8Ss0Lvcxy1whl0NA3aPnVl52xvBmxVLIUkuF/iHGamhrRIHlbDkE7f0
 DV4rf/o9avs4gDlt3T+hfciSIEzyEdZRQODkHikfxASHVaNWOsjpXSkSi+2zS4j0G5gR
 xgrBjCBdTXOeaTr13XA3W7aT6L22LCk15aVpTwdvUh12KXSUl0XNafGF1wER2stbMFa0
 7bpa0IpV4UNgcOwZdsYVAUPWjuIej04bsGZLykDFoRwawvtyfhz1H9esBuN86+2E6GRL
 fkZg==
X-Gm-Message-State: AA+aEWaKT0YhNW7urwQLfsm04TwKDH1FiAcno3a4i/N4cJKowHINtCsX
 cXJAkVxsfbSVQ6aOmPkOUEYp9Q==
X-Google-Smtp-Source: AFSGD/VHBZSurs2jem629eslZpDzfnygX5HewFT5bWT2T4drPuWUUIYXpAhfHMYzGo73oZF1aUC1MA==
X-Received: by 2002:a1c:af89:: with SMTP id y131mr7295925wme.105.1545230690937; 
 Wed, 19 Dec 2018 06:44:50 -0800 (PST)
Received: from boomer.baylibre.com ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.gmail.com with ESMTPSA id
 i192sm5172026wmg.7.2018.12.19.06.44.49
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 19 Dec 2018 06:44:50 -0800 (PST)
Message-ID: <cd3818ab3d8edc0a4f55a375204204297131f96a.camel@baylibre.com>
Subject: Re: [U-Boot] [PATCH u-boot] arm: dts: s400: Fix status for eMMC and
 SDIO ports
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, u-boot@lists.denx.de, 
 trini@konsulko.com
Date: Wed, 19 Dec 2018 15:44:47 +0100
In-Reply-To: <20181217092616.31001-1-narmstrong@baylibre.com>
References: <20181217092616.31001-1-narmstrong@baylibre.com>
User-Agent: Evolution 3.30.3 (3.30.3-1.fc29) 
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181219_064503_757586_E00D801E 
X-CRM114-Status: GOOD (  15.80  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, 2018-12-17 at 10:26 +0100, Neil Armstrong wrote:
> Under U-boot, the WiFi SDIO Module should be disabled and the
> eMMC modules should be enabled, so this patch adds an s400-u-boot.dtsi
> include file specific for U-Boot that will be included by the build system.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

Tested-by: Jerome Brunet <jbrunet@baylibre.com>

> ---
>  arch/arm/dts/meson-axg-s400-u-boot.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>  create mode 100644 arch/arm/dts/meson-axg-s400-u-boot.dtsi
> 
> diff --git a/arch/arm/dts/meson-axg-s400-u-boot.dtsi b/arch/arm/dts/meson-
> axg-s400-u-boot.dtsi
> new file mode 100644
> index 0000000000..c46eb3f38d
> --- /dev/null
> +++ b/arch/arm/dts/meson-axg-s400-u-boot.dtsi
> @@ -0,0 +1,14 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2017 Amlogic, Inc. All rights reserved.
> + */
> +
> +/* wifi module */
> +&sd_emmc_b {
> +	status = "disabled";
> +};
> +
> +/* emmc storage */
> +&sd_emmc_c {
> +	status = "okay";
> +};



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
