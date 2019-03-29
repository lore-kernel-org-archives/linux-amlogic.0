Return-Path: <SRS0=wRYZ=SA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20A33C43381
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Mar 2019 15:34:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5B6220693
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Mar 2019 15:34:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ss+xnT9E";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="JFlOjZCu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E5B6220693
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RpH7dh7vdIxx/kfst24qyPyt4GD6/3oxI6Auza7T29I=; b=Ss+xnT9E7PYDd1
	FFkZsLWWOmWTqwPP4eRlatnM16JrBqU58mu36EqjuIg2jLHDIyDnvcxLibQ+8lKanpFN9wTpaatA1
	yWveq4DoA62Y5LIrf0fiDcjrtSlpDE1C+xzm6CV+k9Qjegyys/p0Tr+LHlJAlmM7jhOuoHWaLmTh8
	1fR7H9Vg4fLw1sUChyqfU3bR5grGWGUaQgQHxUOfeqKNlnt+exvl3zOxkc7jkXPSLD5hnEDsPAUBj
	0BIVGEzCkqDUEsIrrNRcOYsto/NJPsVhEVbOU9o8RhIpU1X6JBIBoq1XtLPn3FFAO+pzHqbx3snW7
	VtaG3q1hPrWZ2lWk9TVw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9tW8-0005Xl-6X; Fri, 29 Mar 2019 15:34:04 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9tVg-00050K-3y
 for linux-amlogic@lists.infradead.org; Fri, 29 Mar 2019 15:33:43 +0000
Received: by mail-wr1-x442.google.com with SMTP id g3so3100721wrx.9
 for <linux-amlogic@lists.infradead.org>; Fri, 29 Mar 2019 08:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GPit8v+Q7DtocOZEXU4jiFZqiXXyIE54mF68t3axNAg=;
 b=JFlOjZCuBF4USFLbmGUtrAoPYawoUOO5wzWamoY/Tyuudb+4Gu2K4bS484QHyG0il3
 GOq9ccl7t08dBEtKgSNnmy554RdlGvJs9vcKT20n7kZq2+WSD4fjeic11WWGQudS2z+9
 L5jhk/mBV3ZShqtJnnDPv+b8OcPLQ0G9GXNXSffdzMc+AWP3KjrQkJlnFormY9M74haX
 ijyHZ5Pab+pbsIfSSR7/1q0WElWoAPw4ob70hS2m3xPFQkSZb8bIkbgrUXPnicKQE0ss
 gmT/YLwB7QlBtEe9HfXfZF1mv7UUt+4FjMoYv7KcugC+hW6TEZ/VDjtU/WSlEdnPIm1E
 8FIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GPit8v+Q7DtocOZEXU4jiFZqiXXyIE54mF68t3axNAg=;
 b=gDs0mn/gHSMwCh2ujBgplfp8GRab/rdcJ3+X9+TpdMZmfmXd1XyrAPZtsPmNfZmgIK
 QJ29NEXAmeVBVT8YWt7HdAnrPTEI6UeHnnbuzC/j4sI/GvG5QI9B/c4OupOgWuQVr8Gr
 jZMoFh+ijwZt7j7auLLKCtg1EE5Qsu8PD3QjJY+jDGIOKFvOMLhiPQQbEUwTJYxf6yc2
 YWwkWSdD5Snrri7xAXrSBPRmfyIFIaOR1037486chBx4GxkT8yIJqahJ8Acb0UHWc48T
 43VwNGHByVaryVAh00wf7tC1AbEllsPwKj3JLs9gh4C7nWUWEMCAYqgEkIxlPSHeqNqd
 d2JA==
X-Gm-Message-State: APjAAAVCJ6/hWJhGDfgU4OiY9AM5xEoHFHyyjK3tyMlDMqad2/YcnBNF
 fM6uvNHZpAdHMvZ6TIJLIcjMCQ==
X-Google-Smtp-Source: APXvYqwGgnk+y67GmSfAmgzYWFvp/+mQnKnCZOHwrdAllmxhqeMRmGvfJSQ3hwjYPPM9OpM+pidCzA==
X-Received: by 2002:adf:db10:: with SMTP id s16mr23886951wri.181.1553873614583; 
 Fri, 29 Mar 2019 08:33:34 -0700 (PDT)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.googlemail.com with ESMTPSA id s18sm1930173wmc.41.2019.03.29.08.33.33
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 29 Mar 2019 08:33:34 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 1/3] clk: meson: mpll: properly handle spread spectrum
Date: Fri, 29 Mar 2019 16:33:23 +0100
Message-Id: <20190329153325.23869-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190329153325.23869-1-jbrunet@baylibre.com>
References: <20190329153325.23869-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190329_083336_548655_28C0E3E8 
X-CRM114-Status: GOOD (  13.51  )
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
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The bit 'SSEN' available on some MPLL DSS outputs is not related to the
fractional part of the divider but to the function called
'Spread Spectrum'.

This function might be used to solve EM issues by adding a jitter on
clock signal. This widens the signal spectrum and weakens the peaks in it.

While spread spectrum might be useful for some application, it is
problematic for others, such as audio.

This patch introduce a new flag to the MPLL driver to enable (or not) the
spread spectrum function.

Fixes: 1f737ffa13ef ("clk: meson: mpll: fix mpll0 fractional part ignored")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/clk-mpll.c | 9 ++++++---
 drivers/clk/meson/clk-mpll.h | 1 +
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/meson/clk-mpll.c b/drivers/clk/meson/clk-mpll.c
index 64d31c8ba3d0..2d39a8bc367c 100644
--- a/drivers/clk/meson/clk-mpll.c
+++ b/drivers/clk/meson/clk-mpll.c
@@ -141,9 +141,12 @@ static void mpll_init(struct clk_hw *hw)
 	/* Enable the fractional part */
 	meson_parm_write(clk->map, &mpll->sdm_en, 1);
 
-	/* Set additional fractional part enable if required */
-	if (MESON_PARM_APPLICABLE(&mpll->ssen))
-		meson_parm_write(clk->map, &mpll->ssen, 1);
+	/* Set spread spectrum if possible */
+	if (MESON_PARM_APPLICABLE(&mpll->ssen)) {
+		unsigned int ss =
+			mpll->flags & CLK_MESON_MPLL_SPREAD_SPECTRUM ? 1 : 0;
+		meson_parm_write(clk->map, &mpll->ssen, ss);
+	}
 
 	/* Set the magic misc bit if required */
 	if (MESON_PARM_APPLICABLE(&mpll->misc))
diff --git a/drivers/clk/meson/clk-mpll.h b/drivers/clk/meson/clk-mpll.h
index 2925fb939fdd..a991d568c43a 100644
--- a/drivers/clk/meson/clk-mpll.h
+++ b/drivers/clk/meson/clk-mpll.h
@@ -25,6 +25,7 @@ struct meson_clk_mpll_data {
 };
 
 #define CLK_MESON_MPLL_ROUND_CLOSEST	BIT(0)
+#define CLK_MESON_MPLL_SPREAD_SPECTRUM	BIT(1)
 
 extern const struct clk_ops meson_clk_mpll_ro_ops;
 extern const struct clk_ops meson_clk_mpll_ops;
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
