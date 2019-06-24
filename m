Return-Path: <SRS0=y5YC=UX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A876BC43613
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 Jun 2019 14:50:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E5D52063F
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 Jun 2019 14:50:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PorkqcIm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="OgoQ6QB8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E5D52063F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:
	References:Date:Subject:To:From:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=q6/kBQG5MWLAyyolCcvzMbP+CmIlyy6+DVy1lePVMIA=; b=PorkqcImTfqysh
	HSPDmU4lmp9QqKHIGGUhqvp4kKxcZwZNog2zqlOUD+btHe5rUPRtqF1nCA/CvtwfFvtIZYJK8IyOX
	WnE3dQjbqVOgL5Md7T9aysXBP/oadgY35TwiqQVCoN8BAtWA5zfrFckgqqoaGcuAX+jWiq57Ycv8m
	MR00t3uLR7fo1iummXzCmDqk6iL5teRX0EZCHceOT+fvaLzwTjIQdY+yH9ubdqhCf4Nq+FrzsWOhC
	Pu8a6f2IVgVnlbdeuTV/bsNhYyOlnJ5HYZIh20VPDwhtm9+H7OMcQy/tB8fP2pRhrDSUx/eXHBXkv
	OOMEi9PZUFLaTEUa3EFw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hfQIC-0000a2-U8; Mon, 24 Jun 2019 14:50:01 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hfQGr-0007rx-AI
 for linux-amlogic@lists.infradead.org; Mon, 24 Jun 2019 14:48:38 +0000
Received: by mail-wm1-x344.google.com with SMTP id w9so140041wmd.1
 for <linux-amlogic@lists.infradead.org>; Mon, 24 Jun 2019 07:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:references:reply-to:message-id:mime-version;
 bh=t3gx4CW2mBs3JN+/WIyX7pTLkZS3fRc0wyPs3jrglog=;
 b=OgoQ6QB8KfytnEKNbqfHjNm8UJkRclyxG8kKItYXWzuLf2+ItMLuqzZYvR87PvjPT8
 I1Nr4mRS2NWL+Wcl/BEGIH88enr3Z8oWN3Xrg+rLK4Ts+QBpE0n5oVxZT0L/vbwTEqgh
 VXRGYMOjF+mvNyvaZNbNINR6W28R0EUIDfHbQMvuVw5c4El9SNhb6dq4lNY+roQEtBSB
 1kTeXMaJqzyLiVfsD8gUn+wGwbPLKTE/8M7pJ2PBHUpW2gZmMjA+3LXcNg1GGH+7vsYK
 amzV/RxgVLqs1ml/G1HH7trn59/KUOv6UAmdmCLG30ShA93zBPEcpPNPmj8Zle9KhNp2
 S3fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:references:reply-to
 :message-id:mime-version;
 bh=t3gx4CW2mBs3JN+/WIyX7pTLkZS3fRc0wyPs3jrglog=;
 b=NtMwGX9QqmrIkkVynQTFgY0WSaqIQA4AKj/HQKjVAr6OPsc5lDz18zFzjUsZsrA6gI
 oEUjl4DwH4DqBhZShtcnAGeLOcQpkyL7xKOciXMS3gIthvDHrQs4l/gvJjftEMZDrGA8
 OnBiJQV5jEi3fLM8uoSVlrqOh5jq5fjetAetz6X5Yg8tCIH3IJLHiP37pwlVSgD03IZs
 jRPTC+dQ1FsRqVqVQ1v3NPJFk5mS9IS/SUo8X3+iKk8oB/3rNvuehxhE5+nKmfaZaxHt
 BxdVImFjdgMdg+7arXBMp75hjgFxPlZsxbm53jygZgvfJIcsShuEmRhzndd2FRasD73T
 OKOg==
X-Gm-Message-State: APjAAAUW5+X29WgszOdV0HfTNp8aYdXspg/ZSoRsotZyT18u0P+OuLj2
 igMRKZHKPBHoNaeNY4iuXiGaOw==
X-Google-Smtp-Source: APXvYqzrHd650JT9hi2tr1385IrvFj/niI09iC8N4X0o5wZ49+Tjdpy2oO9/0/usF55unwPrZZ44mA==
X-Received: by 2002:a7b:c310:: with SMTP id k16mr15453054wmj.133.1561387715052; 
 Mon, 24 Jun 2019 07:48:35 -0700 (PDT)
Received: from localhost (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id y1sm8450447wma.32.2019.06.24.07.48.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 24 Jun 2019 07:48:34 -0700 (PDT)
From: Julien Masson <jmasson@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 3/9] drm: meson: drv: use macro when initializing vpu
Date: Mon, 24 Jun 2019 16:48:27 +0200
References: <86zhm782g5.fsf@baylibre.com>
Message-ID: <86v9wv82f1.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190624_074837_517865_5E2C5FF1 
X-CRM114-Status: UNSURE (   9.65  )
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
Reply-To: 86zhm782g5.fsf@baylibre.com
Cc: Julien Masson <jmasson@baylibre.com>, linux-amlogic@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patch add new macro which is used to set WRARB/RDARB mode of
the VPU.

Signed-off-by: Julien Masson <jmasson@baylibre.com>
---
 drivers/gpu/drm/meson/meson_drv.c       | 26 +++++++++++++++++++++----
 drivers/gpu/drm/meson/meson_registers.h |  1 +
 2 files changed, 23 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
index 2310c96fff46..50096697adc3 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -149,10 +149,28 @@ static struct regmap_config meson_regmap_config = {
 
 static void meson_vpu_init(struct meson_drm *priv)
 {
-	writel_relaxed(0x210000, priv->io_base + _REG(VPU_RDARB_MODE_L1C1));
-	writel_relaxed(0x10000, priv->io_base + _REG(VPU_RDARB_MODE_L1C2));
-	writel_relaxed(0x900000, priv->io_base + _REG(VPU_RDARB_MODE_L2C1));
-	writel_relaxed(0x20000, priv->io_base + _REG(VPU_WRARB_MODE_L2C1));
+	u32 value;
+
+	/*
+	 * Slave dc0 and dc5 connected to master port 1.
+	 * By default other slaves are connected to master port 0.
+	 */
+	value = VPU_RDARB_SLAVE_TO_MASTER_PORT(0, 1) |
+		VPU_RDARB_SLAVE_TO_MASTER_PORT(5, 1);
+	writel_relaxed(value, priv->io_base + _REG(VPU_RDARB_MODE_L1C1));
+
+	/* Slave dc0 connected to master port 1 */
+	value = VPU_RDARB_SLAVE_TO_MASTER_PORT(0, 1);
+	writel_relaxed(value, priv->io_base + _REG(VPU_RDARB_MODE_L1C2));
+
+	/* Slave dc4 and dc7 connected to master port 1 */
+	value = VPU_RDARB_SLAVE_TO_MASTER_PORT(4, 1) |
+		VPU_RDARB_SLAVE_TO_MASTER_PORT(7, 1);
+	writel_relaxed(value, priv->io_base + _REG(VPU_RDARB_MODE_L2C1));
+
+	/* Slave dc1 connected to master port 1 */
+	value = VPU_RDARB_SLAVE_TO_MASTER_PORT(1, 1);
+	writel_relaxed(value, priv->io_base + _REG(VPU_WRARB_MODE_L2C1));
 }
 
 static void meson_remove_framebuffers(void)
diff --git a/drivers/gpu/drm/meson/meson_registers.h b/drivers/gpu/drm/meson/meson_registers.h
index 55f5fe21ff5e..a9db49e5bdd6 100644
--- a/drivers/gpu/drm/meson/meson_registers.h
+++ b/drivers/gpu/drm/meson/meson_registers.h
@@ -1496,6 +1496,7 @@
 #define VPU_RDARB_MODE_L1C2 0x2799
 #define VPU_RDARB_MODE_L2C1 0x279d
 #define VPU_WRARB_MODE_L2C1 0x27a2
+#define		VPU_RDARB_SLAVE_TO_MASTER_PORT(dc, port) (port << (16 + dc))
 
 /* osd super scale */
 #define OSDSR_HV_SIZEIN 0x3130
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
