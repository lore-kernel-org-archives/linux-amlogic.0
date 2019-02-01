Return-Path: <SRS0=EwLr=QI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 987BFC282DB
	for <linux-amlogic@archiver.kernel.org>; Fri,  1 Feb 2019 12:59:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6AEBF218AC
	for <linux-amlogic@archiver.kernel.org>; Fri,  1 Feb 2019 12:59:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="L92lkZOo";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="OIF/Hknd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6AEBF218AC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l9AVab1qzAykAe/slo2qCdYsIHWItrontVoVeRpdPQ8=; b=L92lkZOoxdo+e4
	GG++9dwDJn5MC47RYmBOk4DcTq4LqWXcLXyuSSqiSvFWhk/T9MUjLimqHA3t3bCT6mVO3lIXFKdPL
	4dqL9bbeVRVNIjnhQQpMHqKXX2syyBBcM58qeAlaPTxkyljGKz+7UNZt++xj/119kOcpy3md34oCj
	cUpav1/bJmloPJSb49yZHhCccxEGeW/GXvtSyXIW8d8fQtg9C+K4BNdWxsSz9jrTWgsz6pIu+xulf
	JHoqORXHVniTDCoBHXWptRRT5gn24SXM3YmT9IyyLNI4LBmMMEnBa6NNdjMgVk8g2dwRe4EvgsvPU
	5lWku5Z5rDUjMdWsYClg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gpYPS-0005ea-NF; Fri, 01 Feb 2019 12:59:06 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gpYPD-0005O7-CJ
 for linux-amlogic@lists.infradead.org; Fri, 01 Feb 2019 12:58:52 +0000
Received: by mail-wm1-x342.google.com with SMTP id b11so6042977wmj.1
 for <linux-amlogic@lists.infradead.org>; Fri, 01 Feb 2019 04:58:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Cl+T+BPNCxXXA5ox3kofUWAwnqL2Ija54XfDMQkeCfA=;
 b=OIF/HkndosfayBf1nS22cv3hPfxo4/iHwLmHRfTfEdad4fKGYaNoLAP05RuKV8sawy
 l8BmIocCsSWIh4YvijyUDEOxdTX8JxDdiQ6WXCWPeyW60l6LHtaWIqIuCSYTluhp5Vdi
 w+iNU7zstBcs0Ydo88DEzRdolGMbqLzky20tQImE0NRIwcvQh02+U7+Dr3FKrbYk8OCn
 ltX/XPEvsChhnATbPITSJy8HrynDjlqzVIzpDCJNAFztyTaOdlNIFThd+t8IZ/9izX3K
 a3M/VQd7O+6DMp7v5E+GorNrKFvFkGKSfg7flACC5VCrHkQVSfIeErwxUHlWCL8xy7sG
 q1lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Cl+T+BPNCxXXA5ox3kofUWAwnqL2Ija54XfDMQkeCfA=;
 b=YVV6tWeFqDvCj0EPVsDU0lNiEu97pnQME2Sh89hXbYvi8KVIoBEmeigRBO0cabZBUd
 swycenhYv3jbQzKrQfrbvrz0m94UxjoO0b2wKflmHg6JAWqrfgGSjr1q4pb6cDgvZF1H
 1oFOBVuiDxPXcz1WRr+2ZgrVW5AHysKY6sPuCHVt/1p2rf9EJ8UMVWfUlzfXrsVztMbg
 RBcCkLwjwDacUovHhNqqpbE0AgMLeVC0T6IOqvYEbw/vgXsV1xKTQ9Q1fCbuiVGqatBW
 lgh70QAok9o4X5dvH6f7R72qFLt/qZ6We+gxY9J06/XAKeknpME5KYcUVhTv4mvLEbjF
 sP9Q==
X-Gm-Message-State: AHQUAuZ9sQz3+Fo4PohaaKACPUVHn4kiH95whADXqp6PYzZjc+WBuZKa
 ta6V8h36aU9tfnknAdqGpAOavQ==
X-Google-Smtp-Source: AHgI3IYl82796Wmyzg4/NZIdiQZCBvp12XuiMBRUrSPIp0Qb7hiUqCkI/ySIWWP6JZLsY5uLR3GL8A==
X-Received: by 2002:a1c:19c2:: with SMTP id 185mr2460560wmz.8.1549025929982;
 Fri, 01 Feb 2019 04:58:49 -0800 (PST)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.googlemail.com with ESMTPSA id w16sm8709750wrp.1.2019.02.01.04.58.48
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 01 Feb 2019 04:58:49 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>
Subject: [PATCH v2 2/4] clk: meson: use CONFIG_ARCH_MESON to enter meson clk
 directory
Date: Fri,  1 Feb 2019 13:58:39 +0100
Message-Id: <20190201125841.26785-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190201125841.26785-1-jbrunet@baylibre.com>
References: <20190201125841.26785-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190201_045851_414159_0311B4D4 
X-CRM114-Status: GOOD (  10.18  )
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

Use CONFIG_ARCH_MESON to let make enter the meson clock directory.
As part of a rework, CONFIG_COMMON_CLK_AMLOGIC is about to be removed.

Acked-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index 8a9440a97500..8d780c4390f1 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -78,7 +78,7 @@ obj-$(CONFIG_ARCH_K3)			+= keystone/
 obj-$(CONFIG_ARCH_KEYSTONE)		+= keystone/
 obj-$(CONFIG_MACH_LOONGSON32)		+= loongson1/
 obj-y					+= mediatek/
-obj-$(CONFIG_COMMON_CLK_AMLOGIC)	+= meson/
+obj-$(CONFIG_ARCH_MESON)		+= meson/
 obj-$(CONFIG_MACH_PIC32)		+= microchip/
 ifeq ($(CONFIG_COMMON_CLK), y)
 obj-$(CONFIG_ARCH_MMP)			+= mmp/
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
