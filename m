Return-Path: <SRS0=Ixac=WW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4EA1C3A59F
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Aug 2019 10:39:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BAE6420828
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Aug 2019 10:39:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SGxpARvO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="zQ8qmx05"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BAE6420828
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+m9YYo4W4e5uI1YLuSinLRsNFcj0KjqLLYgTtahs+FQ=; b=SGxpARvOIYU/mM
	e79smcBfg/h4/AQQkYp6wLZvrk2Up/IBAkc2rtBFlnVZVEzS9zPzBA9iYIUSMPjpo74Aa0HPJF8XB
	FvY728GjwXwvteM83bgRWAX/fcNuAuF4XlN1Mj6OVz9Gml+HXJdto7+JHvfUXca2kP/GXn5mEJFef
	goBBBIHPMXdrzrf9Uc/aTeI+BBvKqzI2MceN7Ugl+cjxXr0FKsHlHlstdsGsDMc3hE3On4OxTIvT/
	s24qjlKO0vTrODivZsyOm2E/+u/NVEVWz8J7y6uyddrwLAXx4HOQeh6zYHgPZE84yN1zxRP/myEx/
	fX6WDAEVg4w7Gap6lJqA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i2COs-0007mp-KZ; Mon, 26 Aug 2019 10:39:02 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i2COk-0007fz-Jb
 for linux-amlogic@lists.infradead.org; Mon, 26 Aug 2019 10:38:56 +0000
Received: by mail-wm1-x344.google.com with SMTP id v15so14963614wml.0
 for <linux-amlogic@lists.infradead.org>; Mon, 26 Aug 2019 03:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=Kf8u4CCd/0S9O2So6myGgJK9LXtHBggKOGNILgyNsuQ=;
 b=zQ8qmx05qaOIOKB3nVfxXqNCv+sn45uHFoupchU/B5zmHCN7P03HHPRLrUjbmJmnhx
 IpyiotKwMSMCJbdLA9LfMV32TI6cVrpw+aoiguzXU9TCxD84ovcOUzc/yHq2RzLjkOwh
 V6qOJdCIhgChbe7pPv77ONsJFBRDFa3bl91/LcGbmlZBM/ki7UAsHZzDqDR5Z7AkAkIQ
 e55qpjmV2NWd/xbpvPP3DnV0donLR7jFVICnLZkeFV19/9R2kmIW99MIPIwW8mmLs50T
 /tCRnjIzaS3Ez4vOpUw1ZnZZUCN9Z8QTxRF95FpldE71mQQRFb6fqa51UjkMk84x3r8C
 qxJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=Kf8u4CCd/0S9O2So6myGgJK9LXtHBggKOGNILgyNsuQ=;
 b=ZXn1hHzGKYkMETj236uqFfbdKggMZfw36jMr4eyUX+Yd5PCsoa6Mfx/JvkM3Uw7jOW
 tbVz/b71/OtDMYp7+HzMvGmU/tIxWQ9/vm+ilZj0c1BEUid7F6eEIpsZcXjKyptHDWLO
 0Kyrh9nlWwnLYIsdvDkRAJSEMH2I2brUhrITIib6ig+7MYfG29+4Y4RvW1/3QfeQ38ZU
 i92FRpt4fWr1QCUnhrScW1EzXmhjMWqEbhV/D4Hhseg0sQoN3rMpfJKDpVRgx2mSTYIo
 tIDE5YgJeU7HPhmFNyAiQFQF5/J7QZyewLTclSAtmFa1/1ELEGs9T5orSq77QYwsaW9/
 UR5w==
X-Gm-Message-State: APjAAAWOEol54BS7Tw6HVhR36FqRWFrQkkjwlceGhGj76xVKCdGUXDrN
 Ou58oP4J36l95Gy6j7S2ZNCXclTlkO0=
X-Google-Smtp-Source: APXvYqx71Hht1gZQHsv1/FmSYQIlLLq0ghiFPtdJ3K9r2UYbesJhnRhD20ID9r47y8tLV2cTZB7m2w==
X-Received: by 2002:a7b:c198:: with SMTP id y24mr20738869wmi.131.1566815931702; 
 Mon, 26 Aug 2019 03:38:51 -0700 (PDT)
Received: from localhost (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id e11sm32044884wrc.4.2019.08.26.03.38.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Aug 2019 03:38:50 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, khilman@baylibre.com
Subject: Re: [PATCH v2 0/5] 0/6] arm64: meson-sm1: add support for DVFS
In-Reply-To: <20190826072539.27725-1-narmstrong@baylibre.com>
References: <20190826072539.27725-1-narmstrong@baylibre.com>
Date: Mon, 26 Aug 2019 12:38:49 +0200
Message-ID: <1jblwc6wjq.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190826_033854_708694_DEBC4887 
X-CRM114-Status: GOOD (  13.72  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon 26 Aug 2019 at 09:25, Neil Armstrong <narmstrong@baylibre.com> wrote:

> Following DVFS support for the Amlogic G12A and G12B SoCs, this serie
> enables DVFS on the SM1 SoC for the SEI610 board.
>
> The SM1 Clock structure is slightly different because of the Cortex-A55
> core used, having the capability for each core of a same cluster to run
> at a different frequency thanks to the newly used DynamIQ Shared Unit.
>
> This is why SM1 has a CPU clock tree for each core and for DynamIQ Shared Unit,
> with a bypass mux to use the CPU0 instead of the dedicated trees.
>
> The DSU uses a new GP1 PLL as default clock, thus GP1 is added as read-only.
>
> The SM1 OPPs has been taken from the Amlogic Vendor tree, and unlike
> G12A only a single version of the SoC is available.
>
> Dependencies:
> - patch 6 is based on the "arm64: meson: add support for SM1 Power Domains" serie,
> 	but is not a strong dependency, it will work without
>
> Changes since v1:
> - exposed GP1, DSU and CPU 1,2,3 clock in patch 1
>
> Neil Armstrong (5):
>   dt-bindings: clk: meson: add sm1 periph clock controller bindings
>   clk: meson: g12a: add support for SM1 GP1 PLL
>   clk: meson: g12a: add support for SM1 DynamIQ Shared Unit clock
>   clk: meson: g12a: add support for SM1 CPU 1, 2 & 3 clocks
>   arm64: dts: meson-sm1-sei610: enable DVFS
>
>  .../bindings/clock/amlogic,gxbb-clkc.txt      |   1 +
>  .../boot/dts/amlogic/meson-sm1-sei610.dts     |  59 +-
>  arch/arm64/boot/dts/amlogic/meson-sm1.dtsi    |  69 +++
>  drivers/clk/meson/g12a.c                      | 544 ++++++++++++++++++
>  drivers/clk/meson/g12a.h                      |  24 +-
>  include/dt-bindings/clock/g12a-clkc.h         |   5 +
>  6 files changed, 697 insertions(+), 5 deletions(-)

Applied 1 to 4

Nitpick: two checkpatch warnings regarding 75 char line wrap fixed in place.

>
> -- 
> 2.22.0

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
