Return-Path: <SRS0=ej2R=UC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,T_DKIMWL_WL_HIGH autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CD25C04AB5
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Jun 2019 22:11:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F9DA26799
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Jun 2019 22:11:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AWLPwd1l";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="LOMmLUn3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F9DA26799
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9YweP8XVUIuivZ/QifZh/KUdK6ITo1laC04DlzSHeNQ=; b=AWLPwd1lU/afsv
	IPUtJV53q/ZYar00UTfF3mV+5kpDFkWdkbo8NdCf2vWzGcXuZImSwAdbp8Z5BWRrd0KCy0h5Yi8Zp
	GPOoMgGvBp+HZv4boHDRRXvWtl+Rx+ubXn3+BvhiG3njHbd3RA+KbWCIpWE+mXcfphaXnawWAfCFg
	StV6HP/HEinXZjco9DtxulwJfUHYVVqBsy8kmIXvxKc3gRJX6iOw0vD5/OGtRiH1NZeZo7GN+jfO/
	PFViJGmDTK5Art8MSziyVMsg0r5xJ+FYmR+fo4Zkht3uy210JlAvVE3/agBplD1ypMxl6kxMC8ezx
	ySka5Ii5M5xqOJeiT9pQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hXvAO-00053U-QF; Mon, 03 Jun 2019 22:10:56 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hXvAL-00052W-JB
 for linux-amlogic@lists.infradead.org; Mon, 03 Jun 2019 22:10:55 +0000
Received: by mail-pf1-x444.google.com with SMTP id y11so11364304pfm.13
 for <linux-amlogic@lists.infradead.org>; Mon, 03 Jun 2019 15:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=Lqtk1JLPJRbV/Uor8A27eWDozVcUr19IPuyQSb2ZXss=;
 b=LOMmLUn3OWji8hcp69Cer8ETlOICLjhPAltnN4rp4K5f25q0RlT24pWNBHwJHhZbmV
 2AOmASgj1C5kiQPqxC5BPsx0ELPuyx2MPcfB89pVUNo90bBPw2TRyhbzh5SH2Scu6/j8
 m64nBG/w+Yhv5R/ZfbzdPZw0gQ0oUVHxnJXordTCw9ZhsQak0YrH89m5teRm4Ut/zuvh
 GgbweAG/DCgafajg9GpEaZgoG0ZouFPc22PwC77s1UnfGj1yN3pzGXJgXrWenNphhHR9
 KJ1JQnfDizgW24Rp47icxjhjBl6WVLrhUsPnikns/XcaLkcA7vJy2Q2/jZAQk1GQB/eo
 bz1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=Lqtk1JLPJRbV/Uor8A27eWDozVcUr19IPuyQSb2ZXss=;
 b=nfz/HxeXHIDoHyJWsQThKV5FZ+uiOAzzNLYCw+7l/51vyqcPG7vDAddfWKl/SBHyLS
 0knjWjjPhAClcaD2ls1uuQ/41ggByU7OTvhTTMXBQuAI+UBDN6UEQGBxk+Nqq5vMdlfT
 77omnr5PPWbm3knAUhGO1d3WAVvacOtYbg1ax/MrsP68bugziqYR1abf3Hf4wZd8NdYe
 1xzz+PJH3KJSrvYOdcyoysaRErRb1lkULa+FyaTObcEndnEH3lCvdnw+iSxUb5vt4/DE
 pjz1rqO9E1XjBTwKqIiMtTdN5sjkmBGMZst2+GxTpDRBjxtbLWQaw5AywXlfwEtcukm5
 ntYw==
X-Gm-Message-State: APjAAAX5x3jkoRtklPCsWs91fAXeufsdLKr2naoV9+L82GHwbNiY8ave
 q70eA03UhsOBbzGBklDEbzsX9w==
X-Google-Smtp-Source: APXvYqxTWg1pff0VpEjIEtZaLRKwlbARqN5oAhRdttUjDIsDawnE2zYntfrph7HTS32iO+Wx978D4A==
X-Received: by 2002:a17:90a:29a4:: with SMTP id
 h33mr27038831pjd.105.1559599852823; 
 Mon, 03 Jun 2019 15:10:52 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.googlemail.com with ESMTPSA id p20sm27244237pgk.7.2019.06.03.15.10.52
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 03 Jun 2019 15:10:52 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, ulf.hansson@linaro.org
Subject: Re: [PATCH v2 3/3] arm64: dts: meson: g12a: add SDIO controller
In-Reply-To: <20190527124307.32075-4-narmstrong@baylibre.com>
References: <20190527124307.32075-1-narmstrong@baylibre.com>
 <20190527124307.32075-4-narmstrong@baylibre.com>
Date: Mon, 03 Jun 2019 15:10:51 -0700
Message-ID: <7hwoi2ial0.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190603_151054_432573_7CD11885 
X-CRM114-Status: UNSURE (   6.41  )
X-CRM114-Notice: Please train this message.
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> From: Jerome Brunet <jbrunet@baylibre.com>
>
> The Amlogic G12A SDIO Controller has a bug preventing direct DDR access,
> add the port A (SDIO) pinctrl and controller nodes and mark this specific
> controller with the amlogic,dram-access-quirk property.
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

Queued for v5.3,

Thanks,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
