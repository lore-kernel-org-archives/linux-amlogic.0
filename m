Return-Path: <SRS0=ipOD=OT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60F58C04EB8
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Dec 2018 21:17:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E10120672
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Dec 2018 21:17:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Y9hNf1Yf";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="q2NWIpH5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E10120672
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gNzga0ONHVn+kstxZm/tdawUCnW5+oi4/Nu+3JfhJOU=; b=Y9hNf1Yf/2ZDMN
	gLcPsozq+9SZH9yBaNBoB8NnNdPZSHMsMFen9cCKzLM2L4VVvHQKNw+mCW/SofT8/mYIthTQAcbMW
	Ff6MTCiokWzWSDQWHo1Zi/sGTFnloZQax+x9dRs8KmxaeycR/qycg45iP1UXrNOHSOtg29/fco65C
	kNWX1j2IdYeVZDXGu5V9pprsbbMpp5ib5LYfDgUtB7/OI+hfbza4SL/Z2RvGD0t07LwbOSqoiG+cZ
	iCFE11ISBmzxKJT+A11otx51y9RZ7jUkoAEIjj6N47cOvfqVrUql8ZFaot2Hhpt4ZFZ5inXonknSQ
	984iuQhVJcLZPHulo6iQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gWSw6-0007QK-Fx; Mon, 10 Dec 2018 21:17:54 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gWSw2-0007Nu-Fp
 for linux-amlogic@lists.infradead.org; Mon, 10 Dec 2018 21:17:53 +0000
Received: by mail-pg1-x544.google.com with SMTP id w6so5550656pgl.6
 for <linux-amlogic@lists.infradead.org>; Mon, 10 Dec 2018 13:17:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=C94QuNa+7VK3Rf2ToYyYT9nrOJ5ofXPZR4RoJw4IVnk=;
 b=q2NWIpH5UM7rq5CcdQ+mPXlrvpsOD20YoycBO2qjFVy2HmACw02Yy3HwIo461Ls9Tl
 n59zFfYtZkX0SHAiHEe2vocOsR3GQfZjgAL25lqEkbH0/W3MXymlsMo9PRD079F5z5Y+
 2MWUIXa528ti6U4oH9MPXjdZFfu5YQITl2jy296nM11FIxYeIfEt+tL18OxWlnTXKYos
 QRYdXMHpAIln1MuUT5bB3ngCanFjTJ1sdDOSli2+YcxQP9tnLu2U75yo4Jlygci9in7a
 Y4NK5ptBS8kd2JnR2+WPn5knS1BnHGptOlJWvAQqLStHgwt9Jdi+4KkiFOnwPn49cllt
 GwlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=C94QuNa+7VK3Rf2ToYyYT9nrOJ5ofXPZR4RoJw4IVnk=;
 b=rC4SHJ2oTo75CFD94l/BA1gg0wANVNU9Wis0C5BLbM6dc45v6GZzN5vMaFxNHGVJ9c
 NORo31f0a+hUah9Uwe/qAf01SSF6chOHUxKlH8FL3OjrasBf9sjcsuXJ7AsA+JmxJRVS
 J99jfO+tv/pqPIEeD6+1TCGp7YY0BbHXYTQEOBZHLsW5xMeMor6IL3FZrLpJzlRE8/fd
 k8McsnSXLKR+EOPcFCi8O/a8g1a4pvgUYeJPAT/7H1H5RMVKATQLTGxVOu8JTTGg2abN
 NQcHZOj/0vioS+8OqfJTzb102tCuwnId+ggA1w4ra0aUVUYN7qOA+l7Ju7pWzuTQ3Xpc
 grNA==
X-Gm-Message-State: AA+aEWbHkpt1rh/BLJjHSxWlxKesvy2bh99c4HkgzomGTXyGlQXQj/fh
 Sifsr0pDgvSo7/0aL/aPegv1XA6ueeE=
X-Google-Smtp-Source: AFSGD/VnBAoBo97r9FRQJg3EcpzMiSTg/VC/2UkFQ+BeeoDoH8wctLqdqrauv95QEjAvRU2P8abXhg==
X-Received: by 2002:a63:3d03:: with SMTP id k3mr12254348pga.191.1544476659770; 
 Mon, 10 Dec 2018 13:17:39 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152]) by smtp.googlemail.com with ESMTPSA id
 h128sm14691064pgc.15.2018.12.10.13.17.39
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 10 Dec 2018 13:17:39 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Corentin Labbe <clabbe@baylibre.com>
Subject: Re: [PATCH 2/2] soc: amlogic: meson-clk-measure: Add missing
 REGMAP_MMIO dependency
In-Reply-To: <1544471155-26661-2-git-send-email-clabbe@baylibre.com>
References: <1544471155-26661-1-git-send-email-clabbe@baylibre.com>
 <1544471155-26661-2-git-send-email-clabbe@baylibre.com>
Date: Mon, 10 Dec 2018 13:17:38 -0800
Message-ID: <7hr2epuln1.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181210_131750_526381_074743B2 
X-CRM114-Status: UNSURE (   6.62  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Corentin Labbe <clabbe@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Corentin Labbe <clabbe@baylibre.com> writes:

> This patchs adds a missing dependency on REGMAP_MMIO.
> This cause the following build failure on SPARC:
> drivers/soc/amlogic/meson-clk-measure.o: In function `meson_msr_probe':
> meson-clk-measure.c:(.text+0xc4): undefined reference to `__devm_regmap_init_mmio_clk'
>
> Signed-off-by: Corentin Labbe <clabbe@baylibre.com>

now queued for v4.21 (branch drivers)

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
