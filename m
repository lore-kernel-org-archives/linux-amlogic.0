Return-Path: <SRS0=czMH=V4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2C34C32751
	for <linux-amlogic@archiver.kernel.org>; Wed, 31 Jul 2019 08:41:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95674206A2
	for <linux-amlogic@archiver.kernel.org>; Wed, 31 Jul 2019 08:41:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nVGG7Zoq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="MV63+/qR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 95674206A2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GsSltk+Lze0nojxRWnjqkLieGRgRh61DxXFoxJO92Rk=; b=nVGG7ZoqDDwcvO
	5nNg0F0CBWbEUHe7JwDPsi4dCScWBCqEbNR9pwHByImux6UPZGAUPr7a2dB1injSLVJP5WfBefygO
	Q82r/oPGsGB7Pk4BeIreQMk3mhUEmwBkMcy98U9OxiBWeu8tKPibMU96bg7Y+CZWm+r/WxMBjLtv7
	NzOUk+O2OsQJUTF1QeEybeLJdqhp4twSCOdFOXN6TSq/bYUtWkGHLSxRrZLvm3r6Kcz7Qqb6KlUQR
	5KLFYPU2rYYOGQPlmZQ63+K8ZgG232xkVI1Sc/mx+VTpeQ4TC0o75cxHbW/G8nELTiFw9+xyncI1q
	gow9qJBZN5IF2bD9TK9w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hskAp-0006s9-Qu; Wed, 31 Jul 2019 08:41:27 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hsk9p-00060R-7j
 for linux-amlogic@lists.infradead.org; Wed, 31 Jul 2019 08:40:28 +0000
Received: by mail-wr1-x443.google.com with SMTP id n9so43614038wrr.4
 for <linux-amlogic@lists.infradead.org>; Wed, 31 Jul 2019 01:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sLpjjKS1ce8bNQv8q/Qa2SJ22ctxx4jp20Vf7E5q7wU=;
 b=MV63+/qRVHk4pEL2HzlA9UVoc85DydE09k+CdU0asPODTFDtlVpRZcRLzSaAP0rUVm
 yi9qfx+pp21tlii4qTwgjeQVCMcugVuRyMpv+afoyKd4NMGKn42BJwxvqcBc7XYEgSUy
 Y02feLyW5nr4y+pPzjYnWIuzJF7q9aCqkio42k105UNNp1Y3SHilEVpJcVSYh2JJUqd0
 ZQfPsY/uuHth24yNpFCe0d1+UmcIZupfhlO+Sit5CsTagbQVc+wOcaFx9wlEC1r2q6YU
 DFmP6Me6nEMfvIU2AupxORQCbyYdfJ9ro2OYQwK/U4gvqdzrcbtA5q4UjiPNwYkvBR4G
 xqDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sLpjjKS1ce8bNQv8q/Qa2SJ22ctxx4jp20Vf7E5q7wU=;
 b=QJNpZ+WR1iogNi8D5Uh+ivP6H4T6/c+pdBYp9lqQIdG0jvvpLik2BWszQ82fJTT1oO
 Qu8gp/SU34OiPYRd0EcF73cYUI5sx5t08V8PTB1FLcc5DQJvYuBKjk9PjRvux79g0pOm
 R38q+PCm9cVORUPicsgwRiMLUTfdISpAzmZq3AzxK0cBEsyIBuX2dbllbq1CTDN2tagT
 uWk3djIy1lNugSVNUpH+KKCH+266MzjrnmCaOu3PZ9kRSWBWGJYTz3amiqeHFn5TnNPz
 3OGg71/HQwVR6OAYIpC/HKkmeEonzmxgjR+xsOvtTbOwnnlf8GZJBNW681EBM3Gt97SM
 djiw==
X-Gm-Message-State: APjAAAVMq0gzelmtUVX4WXADZoKxEn4D7+RerNpesBICbIvBh/ZMacv+
 19et4h0Zl422N71coCFysAJiYQ==
X-Google-Smtp-Source: APXvYqzqvEbqRWHT70qD1Gd6GbwhoKcTb1xDRKV5uUOaWJtUJ43Ikrt6tSU+oew0L9HjDkTlKmV47A==
X-Received: by 2002:adf:f186:: with SMTP id h6mr5501169wro.274.1564562423669; 
 Wed, 31 Jul 2019 01:40:23 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id 18sm56049308wmg.43.2019.07.31.01.40.22
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 31 Jul 2019 01:40:23 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: sboyd@kernel.org,
	jbrunet@baylibre.com
Subject: [PATCH v2 1/4] clk: core: introduce clk_hw_set_parent()
Date: Wed, 31 Jul 2019 10:40:16 +0200
Message-Id: <20190731084019.8451-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190731084019.8451-1-narmstrong@baylibre.com>
References: <20190731084019.8451-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190731_014025_273398_6A1DC61F 
X-CRM114-Status: UNSURE (   8.64  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Introduce the clk_hw_set_parent() provider call to change parent of
a clock by using the clk_hw pointers.

This eases the clock reparenting from clock rate notifiers and
implementing DVFS with simpler code avoiding the boilerplates
functions as __clk_lookup(clk_hw_get_name()) then clk_set_parent().

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/clk/clk.c            | 6 ++++++
 include/linux/clk-provider.h | 1 +
 2 files changed, 7 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index c0990703ce54..c11b1781d24a 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2487,6 +2487,12 @@ static int clk_core_set_parent_nolock(struct clk_core *core,
 	return ret;
 }
 
+int clk_hw_set_parent(struct clk_hw *hw, struct clk_hw *parent)
+{
+	return clk_core_set_parent_nolock(hw->core, parent->core);
+}
+EXPORT_SYMBOL_GPL(clk_hw_set_parent);
+
 /**
  * clk_set_parent - switch the parent of a mux clk
  * @clk: the mux clk whose input we are switching
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 2ae7604783dd..dce5521a9bf6 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -817,6 +817,7 @@ unsigned int clk_hw_get_num_parents(const struct clk_hw *hw);
 struct clk_hw *clk_hw_get_parent(const struct clk_hw *hw);
 struct clk_hw *clk_hw_get_parent_by_index(const struct clk_hw *hw,
 					  unsigned int index);
+int clk_hw_set_parent(struct clk_hw *hw, struct clk_hw *new_parent);
 unsigned int __clk_get_enable_count(struct clk *clk);
 unsigned long clk_hw_get_rate(const struct clk_hw *hw);
 unsigned long __clk_get_flags(struct clk *clk);
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
