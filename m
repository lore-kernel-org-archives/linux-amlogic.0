Return-Path: <SRS0=O93K=C3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ECC1C43463
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Sep 2020 20:28:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 886C3208C3
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Sep 2020 20:28:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uMtkE6Xu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="wxLFywGK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 886C3208C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=N1pU0ONKvJml2Vx55e3DnRXSqYslXpC/wGHkrDdgU9I=; b=uMtkE6XuAd21SV7160VBz5eYk
	uV/SXNP3AzB4ZOAr+pHYVh3Tc17WHim0QTAlkMXR4PPdUTMZahi4vreqhHV19QZS3W3uxN6LsmE0d
	wk6/LFzdggFohDgep7Klxi+ko0KZwWsJ3ROHy2iUv8RBxAqhIka3oi11kc2/MUk8myLvi4kxff/K7
	IE72m3VWUd5a0xgVtaNK9V0pgmjArGyslClvCFC5/nseH8lmzbSjyFiC2+E1NNb0v55NjAVlHr6pF
	reLtwIJtZXEgT+6IwZYNlarCxhA6h9BHGJ3YAx2iLKjuQEXtJABIKN8ugafyaekD6FoW4w0nl0Xe7
	dvJAR+4uw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJMz6-0005PW-Jy; Fri, 18 Sep 2020 20:27:56 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJMvF-0003X4-Is
 for linux-amlogic@lists.infradead.org; Fri, 18 Sep 2020 20:24:17 +0000
Received: by mail-pg1-x530.google.com with SMTP id f2so4137172pgd.3
 for <linux-amlogic@lists.infradead.org>; Fri, 18 Sep 2020 13:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=a0WzdzmvXqBL6C78B+KfrEF7AYTF4BXuovwhhy80AIc=;
 b=wxLFywGKKhY1DXT0vLBHQ5770kVzTJAE75BSj5s7gyB1wAHZ3AA6RSEUiVYOmkyKU8
 oDUoMr41cxzYTeg7tArApWIRPcyV0N4mElb0vGGIEwESdhS0v220oFmi57Pq0L8nONPE
 JOf3sRO/CDsbTWAGFPrDtza9Evghcgt9bl0oD9jNqk1ZKgvzqXdm+LiBe1di/2XsnDUp
 7D7gKoaamFTDeGDtrQYtn+K3m6zAfPziUfY3UApw1m3SNLLuM76Fh8iojfevryo86k2D
 zrFwgmNAJrvElTOtUgHgIZCV8HipXdqRLmVL3WixFifYNE9AzQwYOYAxPeNU9k3ydpQf
 OtxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=a0WzdzmvXqBL6C78B+KfrEF7AYTF4BXuovwhhy80AIc=;
 b=WkKNols3N3VftEn7QT2HrUZ+uTUEaqAazVYI6hrpOuKLQJbzJkgb6M8CvNzzp5RNZS
 RXeJu77y55REKM/cmCji4kLZctyKaXytq0GJFwQKCC4Na6cJLFD3ARjWp5NXwzEKzH4H
 eBSyPeN5iwg+Vaw4sInFcrMafVzT/Ko/6B6HI/aBDv5yUMCBCweolnYu/kQWZugVN69U
 Po/EIU8i9/tE44QQQvcpGQGfrJ2IqNYBMoS8Jc5jxf3MIv2tlvi8OJ+bPHpCOHr5EwOK
 U8fQi+g3WSkbGUgcbnlxhWR2aKwUvgfFoJJHszM3rEBPr82X96juH6RwnV9/EGWBOj0F
 /6tw==
X-Gm-Message-State: AOAM532qi+MwMmFazkRrDHL2ZFCPIKb6HDnP+ifrVQ5rU6PBiS6Ijl/v
 IlyaX3it73Oy1JiatJLCzfcZiDko63i2jQ==
X-Google-Smtp-Source: ABdhPJzF4bHwe4qeJ4MffdzGNuPNPMggDeTVQlEXQR1Xvp4iBoIFzuNV1j2NbGmzZ/0cvzqzflbEUw==
X-Received: by 2002:a63:4656:: with SMTP id v22mr11946668pgk.116.1600460634155; 
 Fri, 18 Sep 2020 13:23:54 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id i1sm4208050pfk.21.2020.09.18.13.23.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2020 13:23:53 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH] arm64: dts: meson: vim3l: remove sound card definition
Date: Fri, 18 Sep 2020 13:23:52 -0700
Message-Id: <160046062721.27609.4386781014145624881.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200828154435.419561-1-jbrunet@baylibre.com>
References: <20200828154435.419561-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200918_162357_889681_C59470C1 
X-CRM114-Status: UNSURE (   8.83  )
X-CRM114-Notice: Please train this message.
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
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, 28 Aug 2020 17:44:35 +0200, Jerome Brunet wrote:
> The sound card definition should have been removed when the common
> definition was added to the vim3 dtsi but this slips through.
> Remove it now.

Applied, thanks!

[1/1] arm64: dts: meson: vim3l: remove sound card definition
      (no commit info)

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
