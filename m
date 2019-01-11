Return-Path: <SRS0=DVbv=PT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03264C43387
	for <linux-amlogic@archiver.kernel.org>; Fri, 11 Jan 2019 00:44:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C63F820879
	for <linux-amlogic@archiver.kernel.org>; Fri, 11 Jan 2019 00:44:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CuFN/Hos";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="LCPJKAOv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C63F820879
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aHhem90j7nsgzJy9V67Hr2GONQrnuFPx7nxoHNwtMRo=; b=CuFN/HosNpiXi9
	x/B1swEYICc9gnFi+Rb3QoPHUYIgdlUZGnA+qL5mxhFAvUNw6riEsiqfI2SvSPWQJ6n1rRo/cuRr3
	GfOtw8QYscdIUS7ExOcUiNw03e4R5c3dWtfgUADdxvfjNcon3YEPU+kHSzbYQbbIgEM8pm5kl1J68
	8qatlzW5fLg45QdiF++6QBJqRFwTfDoI3jVi0X7hk3xGbVwdoVtXaf4miDSeUZypsccx0AqAbXsTv
	3Ys8xasO0POiHdgjqTMonYidBobZDnG/Nr/lU5B18OEoHckjXKUJq+9mNTuDWG+fHYVngpnqt3Ysn
	R5CA2RR9o7iECil5z9KQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ghkvV-00017d-28; Fri, 11 Jan 2019 00:43:57 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ghkvS-00017H-FJ
 for linux-amlogic@lists.infradead.org; Fri, 11 Jan 2019 00:43:56 +0000
Received: by mail-wm1-x342.google.com with SMTP id n190so778557wmd.0
 for <linux-amlogic@lists.infradead.org>; Thu, 10 Jan 2019 16:43:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=aQN/RKFxQTK/6lxV5iF1HFo39ISp9QJU8sb5g5HF8vg=;
 b=LCPJKAOvwoI+S+agdYxjgFAtpm1xuHy3kc+U6NmfMgtvfHZiwvR5fEY9eLDwmRVaMB
 Sz5NMCrh6EoEXqO18GJJx94bbFRmThtFtfAGsQ2lCEV+GedGiDJdzWOr71l/AC0jp0/l
 4EosGY0UhAaRDp1XhtlEAQJpy7gPs3uCr+iK3hr7QPFJhPb5xPrGrmIBaOnyKMkGkP39
 1tzeeif8DDCn3Xgl2O4WHezwM1iY1uE06ayXMVh9uKvWBxqnwaESD588GZFyXagM31JB
 OU+l+e/D3GyyFys4ICOuYNaZvHZ67NCWeZTT8LSLjVNFFG2zRQ7Ur0Xfj8av2dMXg0nS
 xfLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=aQN/RKFxQTK/6lxV5iF1HFo39ISp9QJU8sb5g5HF8vg=;
 b=LEoIIvIRBnN57I0XNh1L2PXM7F2mKewqDemPFD00NlPqZGZd8NhiwdompAc2s/FgRO
 qIi8p6UadIR/CaafnBLkKWgl1SXKacKnMhsoXaKLSjlzsnHrCybDJBpzcP1qJm7gW3iR
 BUIv8Fi4rNqKxl4mPAV/cyRzlTrRLcIREXQ/sh4oSWYM7bIZnivsEvXEBBSXdI6jGWDo
 W05ipibUnlpclvr6NxTRcSCGvHaSlbWPR7UOd8tqTrH4iuXXu3tS5/mzRgHa93H+E2ji
 fDX18mKXyzprfGSbwTPUYdybUd/PsEK9S9PxEvpu+wPg6sa+3Q/5rqpUq2IF+iYEWBdM
 /mAQ==
X-Gm-Message-State: AJcUukdlL6tbpbJ7mC5GBXchIH49xxlfvDd6ZHLt9OjowrDmKYw/2Mxm
 MevSX7sNuQOx1nvFmOLaJO9K8J/gb0Y=
X-Google-Smtp-Source: ALg8bN4u/C9wSavU9Y9vcfPA3BXo90JXTvWet/dPUU008sAfcbcxocOBvGowfbtkfRgWZLSc4+D+ow==
X-Received: by 2002:a1c:b687:: with SMTP id g129mr222451wmf.59.1547167432454; 
 Thu, 10 Jan 2019 16:43:52 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152]) by smtp.googlemail.com with ESMTPSA id
 k128sm22476100wmd.37.2019.01.10.16.43.51
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 10 Jan 2019 16:43:51 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>, Carlo Caione <carlo@caione.org>
Subject: Re: [PATCH 0/3] arm64: dts: meson-axg: add spdif input
In-Reply-To: <20181213143631.19218-1-jbrunet@baylibre.com>
References: <20181213143631.19218-1-jbrunet@baylibre.com>
Date: Thu, 10 Jan 2019 16:43:49 -0800
Message-ID: <7ha7k8qb0a.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190110_164354_514937_795B1D25 
X-CRM114-Status: UNSURE (   6.81  )
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
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> This patchset adds spdif input support to the axg SoC family and the
> s400 reference design.
>
> Kevin, ASoC support for this spdif input (including the binding doc) just
> got merged in the ASoC tree [0]. Until the related patches hit mainline,
> you may get a warning about using undocumented bindings.
>
> [0]: https://lkml.kernel.org/r/20181213120843.876CB11254D1@debutante.sirena.org.uk

Queued for v5.1 (branch: v5.1/dt64)

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
