Return-Path: <SRS0=5BKV=TY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F872C282E1
	for <linux-amlogic@archiver.kernel.org>; Fri, 24 May 2019 14:03:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C96E21850
	for <linux-amlogic@archiver.kernel.org>; Fri, 24 May 2019 14:03:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rvZVbMG/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="aDrFvuyR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C96E21850
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RfAumx1u/qzzlXcLxE+jFs2svG3pcbA8mgV1txYj0B4=; b=rvZVbMG/2Xcrwe
	cbgIj7MwgnZJ+nqbNsOIfltDlgTy+kyS77pszR3bWAhvkfQOBRAxP1PvP6FpiNrn43bJXOZmzavPy
	B7AvnZepkOMgkWyHM4p67/kwXs8d+D4P8/4XjVZO5tqy/TnpdnOLI+X9okR8hk5bERTzByR9FOui4
	TvL8R8Vt1UhrTrwu2s1QQDg0zCTULjU4Sn6EgZ3gKq+qTDpZAlAAl+bziOoLYFPscbhSuDpqC2rBB
	Flz+tdEKrQAESHaPsUUt4jb9+zGUHe0gC9z64XWZMWdE0wx3wgU5b4K6oWsVzeJLAyQwl+I6ecqUH
	m296umn65yuTBqZWWSaQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hUAnA-0006UY-Qr; Fri, 24 May 2019 14:03:28 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hUAn7-0006TC-3u
 for linux-amlogic@lists.infradead.org; Fri, 24 May 2019 14:03:26 +0000
Received: by mail-wr1-x444.google.com with SMTP id s17so10188106wru.3
 for <linux-amlogic@lists.infradead.org>; Fri, 24 May 2019 07:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qAiP1kaATrLVhsYQVSGC57biP0RGHD32g8QSytysdio=;
 b=aDrFvuyRej7ZnCiuZ8EMAXzGNtl2fX4SmiUratwoNSiduKV5rOtpWZJxwj4yn/Y5yo
 O62Q5PrqQYB+nD0GdJKHqX+dZIwoezbHMQeJTUgK1gEUAazt8uf48hUnjXEwuegoBJRe
 xWGXStyAO3z91VrLk0sMwzlXcaRgVrW07FRBPtK4KkE2iVWmKBEjcBNYr96v2aJcPKAE
 jNUGuZcvouYDc4QcDqFzZcbpjfxz1M19bK1LJNd+9FLrREWQh1JHTJaGxE3WIJIcsFxF
 WQ1bcNgkR2xpJlN/2pokPxqssd0oDICj2uMCERSYBj3nUfgwLzQQ3qArQJHYMIuFRRcR
 PFpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qAiP1kaATrLVhsYQVSGC57biP0RGHD32g8QSytysdio=;
 b=JDkbVP0zgptIolGutd5P0a6L6TOQ1ZCX21NPKMEDuCiAUnCy7EILlxV31asAfbJ6KA
 85XznEi55mbD5kRG+aO+hFV8kMLBEJO3NazYu/7PB0JK708NdMyeJFzTWbdnHnrXz+St
 8LX5S3toIHpThzAuDthQ2mPVUnVFTcrF62LSn/8wCGVUwa89D9QtB9/8MO2iBFQ4lRsY
 y5RcxM+TR3g2ZBvDg95YlzBY8opCDJB328BlsSU46JXxPlnCLiHmBirrmMOkpjC5NOt4
 fkNXlVEC+jg3dMchLSbSjb13a6d3ta9kJxT8wN+W6XmI/NEEDXdar09oUYb26GnBRK64
 Mz0A==
X-Gm-Message-State: APjAAAWAEKT6BYqqkTJ11NV9yNZwua3qRMzKp+34Y4lBWsGBcKE9Q9qq
 Ol/50tJ/Duha9p6HnxDdE3ov1Q==
X-Google-Smtp-Source: APXvYqzBVrbGf9H8H0xE3Tl8a6MHqOc8mGvBDzjxj+XxAWfcZRIriICIOhEBQ7bqUBsJ4PCl2qfiUA==
X-Received: by 2002:adf:f6c4:: with SMTP id y4mr37904326wrp.37.1558706602884; 
 Fri, 24 May 2019 07:03:22 -0700 (PDT)
Received: from boomer.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id t7sm2797114wrq.76.2019.05.24.07.03.21
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 24 May 2019 07:03:22 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 0/2] arm64: dts: meson: sei510: add sound card
Date: Fri, 24 May 2019 16:03:16 +0200
Message-Id: <20190524140318.17608-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190524_070325_161608_7D589408 
X-CRM114-Status: UNSURE (   7.95  )
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

This patchset adds the sound card of sei510 board.

Note #1:
The patchset (build) depends on the tohdmitx ASoC patch [0] for the dt
bindings of the tohdmitx glue. It also (run) depends on the mpll clock
series [1] to get a correct clock sources.

Note #2:
I would normaly prefer to use the HIFI pll dedicated to audio to provide
the base rate for the 48kHz audio family. HIFI pll rate precision is a
little bit better than the MPLL. However, the HIFI pll may sometimes,
rarely, take a long time to report a lock. I'm still debugging this.
In the mean time, let's use MPLL2 instead.

[0]: e35f5ad6a965 ("ASoC: meson: add tohdmitx DT bindings")
[1]: https://lkml.kernel.org/r/20190513123115.18145-1-jbrunet@baylibre.com

Jerome Brunet (1):
  arm64: dts: meson: sei510: add sound card

Maxime Jourdan (1):
  arm64: dts: meson: sei510: add max98357a DAC

 .../boot/dts/amlogic/meson-g12a-sei510.dts    | 207 ++++++++++++++++++
 1 file changed, 207 insertions(+)

-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
