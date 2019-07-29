Return-Path: <SRS0=fUxg=V2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 345B2C7618B
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Jul 2019 13:02:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 038C5206DD
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Jul 2019 13:02:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RLMWFVAL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="wBqZVt+2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 038C5206DD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=M+izCQGsDtIcKR4813a5FKu9DHJDt565kApz+/s2PBk=; b=RLMWFVALvp7Okc
	c+M6diildjuFA/y51m9BJ8lsauqOQVNqfkbCnRkk2GBVr+SculNzzeDQQtvRafUKL/jlWUbMaLLv4
	yazFAsUGbNB0OhZ3aR7Nz5ST+x6rWx6aYBN2NM5zJOv6mO/PPAHzSuZ9s4gPvmEiKNzuEHljD2BuM
	b3FPZ+hFjmGmPBaE4w07VXoLyKLW7lbCgUWOw2xCsl29wRFr4Imy/F5G6VnmiDKEd1d+B6aFiaicg
	GGikYjp8SKjhLIpDQPuoHkXpy/BTBe8WlqhMroGj2Ti/o2qBBM1Vu1DUH4GtUuvALKnr+sSZUKUBy
	iyOB0Z4ICyqk6Ux6I1kw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hs5IT-000824-GQ; Mon, 29 Jul 2019 13:02:37 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hs5II-0007mH-2l
 for linux-amlogic@lists.infradead.org; Mon, 29 Jul 2019 13:02:28 +0000
Received: by mail-wm1-x343.google.com with SMTP id v19so53426611wmj.5
 for <linux-amlogic@lists.infradead.org>; Mon, 29 Jul 2019 06:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FZSqbY3GL0p/+O6r5hxQ7rW4Fn6zYsGa/G8TU990Zm4=;
 b=wBqZVt+24e7MrGM6D4QtCK7dwOo2lLvjmbEMiiR2UAiOclH3Z0IkE+1YEqWi444eZZ
 BTinoNCv6aAiIAej53vbi2ctu+BdemPyD8nsGUT+dOv2UzXg+UTsAYTPYuhRuMchE+gt
 +veg2+BMuV2/znnE27+G9YAXckBQCHi8lyj7M0BMoqCwVr173gbD7mAO/ZQvs5W8HxAe
 +7eddFQCTJ8EYeg9ZJpQWp1SVW8tmKgj3eUmhUYTOvljecr/OA1hMXvkrLTp+ieZTVPy
 SpgUB4f5arNhAUGxfadqhcYSuDn4MfwyaJpFyD6x6oYObxfV/KfAlRfqWB3bMmPElw0K
 fGNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FZSqbY3GL0p/+O6r5hxQ7rW4Fn6zYsGa/G8TU990Zm4=;
 b=fYUbzZ81OXnmhNGdEgicmx4SIvI9IGojcbIqnlS5Qm/e3LezklrOzEFw/Kc1Y2RUFq
 TTLcWhdSvL35GLgso9cnpqhmnOcCeeitRXy04tAD232Zq6DPibwS3FBQ/5O0sXsoy+Aw
 HlF2u3OFMQ+ZcwyMSMyM5iQH51rdQ/Ey3SPN4xdBh4VSofF8S/RG2/10w4rQ3Jwlcfgh
 3FNc002QGHsv40/P3Wm8Vf7lK64rBDTrcitDbStdTFI98CwMl54rpEPYmR3btfnwU68M
 Nrcih8fTOrotbQP7JxifYmylb94jorAP4t5Wvk58t2+udDLpLNezTrSYua5Nhijsj6cz
 IbmA==
X-Gm-Message-State: APjAAAV7GZ5mTAu6KEyTdUtCsvnYBCeaW01OP/jHFuK0nSekDetTuDp0
 kC0dTpWcCM92EAVhNe8vWu819Q==
X-Google-Smtp-Source: APXvYqxMg4urTCpn21CaeGSw5dY2M7MMMl9NxfF6J2eFyFENSaHryb1CSNKJONpXaiV6dCAu4t76rA==
X-Received: by 2002:a1c:6555:: with SMTP id
 z82mr102462120wmb.129.1564405342535; 
 Mon, 29 Jul 2019 06:02:22 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id x185sm52990545wmg.46.2019.07.29.06.02.21
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 29 Jul 2019 06:02:22 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 0/2] soc: amlogic: meson-clk-measure: g12a/b DVFS support
Date: Mon, 29 Jul 2019 15:02:16 +0200
Message-Id: <20190729130218.6635-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190729_060226_126448_91F2B30F 
X-CRM114-Status: UNSURE (   5.92  )
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
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patchset :
- protects the measure with a mutex, between concurrent user space debugfs reads
- adds entries for the G12B secondary cluster SYS_PLL and CPU clock

Neil Armstrong (2):
  soc: amlogic: meson-clk-measure: protect measure with a mutex
  soc: amlogic: meson-clk-measure: add G12B second cluster cpu clk

 drivers/soc/amlogic/meson-clk-measure.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
