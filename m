Return-Path: <SRS0=LN9z=TN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 717A0C04AA7
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 May 2019 17:47:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 455D320879
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 May 2019 17:47:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ge81/9a9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="aG5v8TAA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 455D320879
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NOsbmI+mycd6ZY9+z4TzdYNyGQikn+0LiVFGbR66ILQ=; b=Ge81/9a9ikqL3m
	atKoUq8IpW1R8BJAYp6L6kFPt+s3gJfjZou0Mzm40nSQOqToA8qZBOx6XRfcqldp5gDjfywpIFK07
	qk00Fm6o5SiFhrmxxOwF+IDenIG5v79/dKqVz5HnAgc1J6fkJwiY4KM9N6Fg1s7V4gwYsyvQW/OmS
	WbEIPJ/nl7DTeE57Fe/k4EGsqtYBlp3/WgcVC9TZwLK/uQK3+SPE08yDI1vaujRElGRc8F+Gbt8fm
	PB32//EF4M1YYqAo8i2zfPUaY1cJ0kdp1NrwzHXlwn7JBlWTHWQJlyahhXYK1PCYtLI4PutXBfTHi
	y8+gYdfKV9mk6foIYZRg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hQF3H-000696-SI; Mon, 13 May 2019 17:47:51 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQF3E-00067a-Po
 for linux-amlogic@lists.infradead.org; Mon, 13 May 2019 17:47:50 +0000
Received: by mail-pl1-x643.google.com with SMTP id d3so6824210plj.11
 for <linux-amlogic@lists.infradead.org>; Mon, 13 May 2019 10:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=7ftcbU8JnQmvm8sGh32+gWVqyGisGkp05zvI/Os1BUA=;
 b=aG5v8TAA+1qIp67dGGOJ7ud6fKmC9NYGNER2ymFATsKxSw7VEJIAcZr2RhZ15fOE+B
 xM9aXfO+Ft7I1MfUm4KhUZu+IaQTsAEf0ZUgfzyXoJqmDOKfJe66+f8zw4AuubJ+or27
 ufNo6pYKwNT8Q2CQZo2VhJrv8HJ0BChKp1IwSD51GT5N3nyfqhziSRmyrdLi7fiCHqsO
 j3XOAMVG4Yp4wboAfnQSKvQq9UFhKNB3o2DaThW4zr3zp8xLy/YYiycKAQjGpm/IhWaZ
 ofn9Dn3m2QyeTutPItizv/1Me+LzhsVv7veUC9Qx4hrZZ1nCfKt/wt9RPLbvy6vlzNwK
 N55Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=7ftcbU8JnQmvm8sGh32+gWVqyGisGkp05zvI/Os1BUA=;
 b=Un5oqLnTED/bB/N5Tx/+n2iYAcXgkd9JeyjBi9CDUiQvbpPmjWzS3ETxb5YekbjjK/
 DTMM0jPcSa5rFACCuKw9a/bPr3xovSGLT1IzUJVyMTB6yQXcO1nqMvcZ/zC/hz3aXmYf
 asRTDqzMZxhxRuV6Q0XpGUxh59KksPcYXxRtnWgrQH4wW7012GgWpxSJGAdYqVLtON9H
 qsp1WF/iNICabrZklm0ZSezqhW41gHfpSvin5BsqORvqJEeW2OlzwwTwwtKExzeOBPIv
 /wSZhMR7yiYZbQHW+nLwGJ+rxnbrEcA6en2t0ie6w/mV+Pfpz564pdlg4wnjEeBcWj+R
 X96Q==
X-Gm-Message-State: APjAAAVHPw5gwITWytKG4tZ3GR/9dHmeAGR/pmZNEXDedmdDAjIvjkDT
 fZ1/mpRhxWidQU1bUqmJcKJZcw==
X-Google-Smtp-Source: APXvYqykzOc6H2gQfaH2tmKL5VMylfiYXvxqcBKK0+ieVzRpKiH1CsSkvAVqvM2zkJDtRZ1QN5T4tw==
X-Received: by 2002:a17:902:e708:: with SMTP id
 co8mr32206427plb.141.1557769667349; 
 Mon, 13 May 2019 10:47:47 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:fd66:a9bc:7c2c:636a])
 by smtp.googlemail.com with ESMTPSA id w12sm14856903pgp.51.2019.05.13.10.47.46
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 13 May 2019 10:47:46 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, ulf.hansson@linaro.org
Subject: Re: [PATCH 2/3] mmc: meson-gx: add ddr-access-quirk
In-Reply-To: <20190513091548.16674-3-narmstrong@baylibre.com>
References: <20190513091548.16674-1-narmstrong@baylibre.com>
 <20190513091548.16674-3-narmstrong@baylibre.com>
Date: Mon, 13 May 2019 10:47:45 -0700
Message-ID: <7hd0kmckla.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190513_104748_834613_3A314D79 
X-CRM114-Status: GOOD (  11.40  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, baylibre-upstreaming@groups.io,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> On the Amlogic G12A SoC family, (only) the SDIO controller fails to access
> the data from DDR, leading to a broken controller.
>
> But each MMC controller has 1,5KiB of SRAM after the registers, that can
> be used as bounce buffer to avoid direct DDR access from the integrated
> DMAs (this SRAM may be used by the boot ROM when DDR is not yet initialized).
>
> The quirk is to disable the chained descriptor for this controller, and
> use this SRAM memory zone as buffer for the bounce buffer fallback mode.
>
> The performance hit hasn't been evaluated, but the fix has been tested
> using a WiFi AP6398S SDIO module, and the iperf3 Bandwidth measurement gave
> 55.2 Mbits/sec over a 63 Hours long test, with the SDIO ios set as High-Speed
> at 50MHz clock. It gave 170 Mbits/sec as SDR104 and 200MHz clock.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

Reviewed-by: Kevin Hilman <khilman@baylibre.com>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
