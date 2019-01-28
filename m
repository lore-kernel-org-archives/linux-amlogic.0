Return-Path: <SRS0=PsYD=QE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79185C282C8
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Jan 2019 18:05:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2739E2148E
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Jan 2019 18:05:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oSoq+2RW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="zokui+Tl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2739E2148E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bkKOwTfot8+8Byk4wJqWxD5zvXY+JiboQAhRkqnPkGE=; b=oSoq+2RWTGH1dq
	N6A6zX31kQ6fYs2BIiCvGTtBKyLRLtHzFotrqMdAZrnm++Dcx1mDJH71tdx/ClnbaNn60RB7es2Gt
	mxDmD2cVIfp0cSlwmHThNrs49HjUZyNKP1KZLdgeXwx8iQMy9ZG+iVtmPV3SQeuBhwwiTAUPA624D
	xPutMot0PLwGEfVKXGvu9S1n6pyssQ3Ywv0IgelRgpRZl/aXrdJkdSp8cFexwLijY2SNO7Ug8NJMF
	TDl7f53qnuVgl7EXIWzEVLbRzFuYJmcf51MHnTTvjEusgYYEuv8z0qVTb972Ry07YD75OlhIECu1B
	Nhg1gISXWj/hGHWbLu/g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1goBHY-0004Yb-9t; Mon, 28 Jan 2019 18:05:16 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1goBH6-0003gR-Sd
 for linux-amlogic@lists.infradead.org; Mon, 28 Jan 2019 18:04:52 +0000
Received: by mail-wm1-x342.google.com with SMTP id f188so14882185wmf.5
 for <linux-amlogic@lists.infradead.org>; Mon, 28 Jan 2019 10:04:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jxiL0ybfHeOFIjwNJisaDSjhHM5fwBbvxrHh17glkpo=;
 b=zokui+Tl7nAaqnJAKhYpH4JjWiX/OfsRcgUjR3xJeQw8lYVobavil06hUxjJuBEnDm
 KAMD2RXczMKyM39dSfM7U2ehwwYomCWvGyxJE5YyuCZlZ+N8bHDtdcrkmLfYf8lJLl3N
 MY7ybdbq1BqImrwNPAASlT4e+D/rbtd9GyRn/4bAxtwJHKWGIFb9PIlMXIshamcCScru
 kC2lVQHd4vLOlvsOAGwB+5tz1CBNaok5ayecQgQ2OMCPy3RsxoJJq0fMMO6HmJM8ihR1
 XnpuXvMEmxLuGLZ5ibkKP8Sol4+JckazGsGbWTLxFo8Ao9lS/RJeNfOtRLehQ1+SNXrw
 /ElA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jxiL0ybfHeOFIjwNJisaDSjhHM5fwBbvxrHh17glkpo=;
 b=ctqapXnZqWMjZJWc3Xb9N2mwr/CQr4SqWL+TcqQfA8xmkA3ajejbrYsUfwCqMqzo1T
 LF1nUk5u96sHDK12L1ojAioPvqjL65n22FJwcZX65Uq8pkeZLXSJfDvCe2jF9K2oSlOk
 gxnQz/sbfR9hDaV2RdIpW1YjK9aZwe4jhIZBr2sukYhwvGJZwvptlfrZ85G3pI6r/EB+
 S5iSsulVjahcYSEIY7690wsGzcZxev0oetbGy4WOIPjyzIHTBe+gKOcSixgI78H+Rphn
 G8yr0y5ntORK7nchfxMiZLurKBQc/4BOXAfpq2YQHx6xjGcyhYFGx+mybGfb5f3zaaHE
 VBaA==
X-Gm-Message-State: AJcUuke+/yeWf3hOLBp1UbSWJ+dErC8M4W9fIrTWN02g84d8Mi28KFcn
 U9w2ev2u6ieaMFYy6/03XqKsVA==
X-Google-Smtp-Source: AHgI3IaWxr5X1uid7/Vo1ZeiTLguHcKoXOrRKhtR6Fxy68C9dTQWMzJCEFqyUhlczJcOOPAZ85Q95A==
X-Received: by 2002:a1c:488b:: with SMTP id v133mr8620594wma.31.1548698686336; 
 Mon, 28 Jan 2019 10:04:46 -0800 (PST)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.googlemail.com with ESMTPSA id p6sm145548193wrx.50.2019.01.28.10.04.44
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 28 Jan 2019 10:04:45 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>
Subject: [PATCH 03/14] clk: meson: axg-audio does not require syscon
Date: Mon, 28 Jan 2019 19:04:19 +0100
Message-Id: <20190128180430.28689-4-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190128180430.28689-1-jbrunet@baylibre.com>
References: <20190128180430.28689-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190128_100449_089950_91168404 
X-CRM114-Status: GOOD (  10.79  )
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
Cc: Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The axg audio clock controller uses regmap mmio, not syscon.

Fixes: 1cd50181750f ("clk: meson: axg: add the audio clock controller driver")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
index efaa70f682b4..2479dab09d70 100644
--- a/drivers/clk/meson/Kconfig
+++ b/drivers/clk/meson/Kconfig
@@ -50,7 +50,7 @@ config COMMON_CLK_AXG_AUDIO
 	tristate "Meson AXG Audio Clock Controller Driver"
 	depends on COMMON_CLK_AXG
 	select COMMON_CLK_AMLOGIC_AUDIO
-	select MFD_SYSCON
+	select REGMAP_MMIO
 	help
 	  Support for the audio clock controller on AmLogic A113D devices,
 	  aka axg, Say Y if you want audio subsystem to work.
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
