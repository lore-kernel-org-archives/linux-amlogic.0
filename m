Return-Path: <SRS0=PsYD=QE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C6A5C282C8
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Jan 2019 18:23:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B8552147A
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Jan 2019 18:23:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bmor6U2X";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="tdpOCcRQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B8552147A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=r6YP41VEyCDAU3vgzeBQSoEAIgLMdvJU79BcPpz3zSI=; b=bmor6U2XN4iA9n
	H+JNvFejeZ9g0g2OM+6XiflNoyue8m6df3LX+BeDPeDGIiqKQ923/SNsmRVxADGArMfbXaOD82dkz
	S143ouvWmPb4PjbeJqFM04fay1kwYmko16d86oMmZuRakDJITkIrwMgpjclItmQoxILLdFGdoZxFl
	LtnyjXxRDRW846VB+p5fGI1Ea6bmffBPChEm2bhjUa5vm5Ldq2k0Fmxhq3pfZyhrbVlAlsxy5DFUV
	scJO3Fp+ArB8pwDWKfMNdMi8lQkQsm/ulkYZECTYlKURoAEDNJg8mVqnQIuog3ctxB5zJJBcbzOKb
	tNV8Zwrw+ir/cSSNjAgQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1goBYl-0007zE-UE; Mon, 28 Jan 2019 18:23:03 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1goBYi-0007xa-2N
 for linux-amlogic@lists.infradead.org; Mon, 28 Jan 2019 18:23:01 +0000
Received: by mail-wr1-x442.google.com with SMTP id 96so19233784wrb.2
 for <linux-amlogic@lists.infradead.org>; Mon, 28 Jan 2019 10:22:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sqA5ZhkAoBvdzuv086TvCXgnTe2F7DoAV3CeohA+KlQ=;
 b=tdpOCcRQF5RfdDxRMKgumHKV1zlZh/oJbAfa0YKlfdW8OUiAUN23fghZygJIAk3bc2
 dMdDFDOiFnkFvZ0Dh5TDoSNuYI0iqHMCtAkuQFtDf5p5Q4GcrTxdiSjQcTyvKW5xGWqV
 5rec/WfbYhmDXJpd73MAC+r0wMyFhrKv39HuVx2ziBJ96bGSyTyzkEhHHLsE1yfDZsrD
 KrcoMzCpM4RgMon7/3+8kEmL86YqXpeSoa2Gba2lKc5MDhrxjGxyhYfYkg42ix0obO1n
 FK40aAaQ0flqxtV52w+Lt4Y3YHIebqgUUx50KlC+4v92hQ3TZX/xt6PSc98Ez9fDWOhu
 qToA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sqA5ZhkAoBvdzuv086TvCXgnTe2F7DoAV3CeohA+KlQ=;
 b=XFoS3BCZeQX+aP+luuT1aTcU/ATCNlaCVNs74/56pq677mzm2xR74+N9SsQpU20T5i
 XbzoTwnzlnumM6NM6G+oIoanUnz50wCbf+alRGYNMMUfIVHiClKcodGSpUq/Nt/NVyr2
 5EcndhiYrpMCCp+iNRH16GYrU9Iq4/7PKUVGJ/4c0kIAXEFm3EvPDubpZlotBdtPhYDg
 1KF7bkCssJTEmaCZ5D+cpUAIPLRIH0zn5+2ImdQ6nfVitCFgUqcjhJ4oQ2GhyyapCP2w
 kvTdb2BbOFKr//PLHLJ9ERn8t8rqAtpdkbfktouO0w1Xv/6nV2pkhHIH7aE3G6nIkPW1
 GhWg==
X-Gm-Message-State: AJcUukfb5fFlGUiVxC6Blt+N+q+PBtQN/8Fhww7aqHGc5jC5keMi0p1M
 w20t6vH4tybWmze+USPlYXG8+A==
X-Google-Smtp-Source: ALg8bN5mghuBM+ajiV5psAYVHnFDrRLNxLgTfnFWOfw5+6S7U8av1hig8IjFL+RS8tBUOjrNOta+lA==
X-Received: by 2002:adf:e407:: with SMTP id g7mr22302220wrm.277.1548699778535; 
 Mon, 28 Jan 2019 10:22:58 -0800 (PST)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.googlemail.com with ESMTPSA id s1sm169223758wro.9.2019.01.28.10.22.57
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 28 Jan 2019 10:22:57 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 0/2] ARM: meson: do not select COMMON_CLK_AMLOGIC
Date: Mon, 28 Jan 2019 19:22:50 +0100
Message-Id: <20190128182252.32589-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190128_102300_116026_38FF1F20 
X-CRM114-Status: UNSURE (   7.64  )
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
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The patchset remove the selection of CONFIG_COMMON_CLK_AMLOGIC.
This CONFIG symbol:
* Is already selected by controller driver which requires it.
* Is being removed by this changeset [0]

Whether or not series [0] is merged, selecting CONFIG_COMMON_CLK_AMLOGIC
is not necessary and it is safe to remove it.

[0]: https://lkml.kernel.org/r/20190128180430.28689-1-jbrunet@baylibre.com

Jerome Brunet (2):
  arm64: meson: remove COMMON_CLK_AMLOGIC selection
  ARM: meson: remove COMMON_CLK_AMLOGIC selection

 arch/arm/mach-meson/Kconfig  | 1 -
 arch/arm64/Kconfig.platforms | 1 -
 2 files changed, 2 deletions(-)

-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
