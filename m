Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20A58C982EE
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Sep 2026 19:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3TkFRSLia/RnXkEXod+cM2OosbVjvrYOfgi+raC9zKE=; b=yl7NDld2G8jKuO
	NGtsf9jPh1pMef/DzWUmDnXkvxWC2hD4d0Hs2YuyjnQWZPlglZVF7e+g+3Lx6DZTIR7zWiKpoX5Lj
	SOVRBO1nenBs4LMCq59W8n+aIUf8jn/Ed9OUweaSovDr6nLGxNXAQw6uDGaudIzABZmNthJlNSd9u
	RuCuwF2ZUPEV2Ids/vXOIM1go1sgiYDy1L1KxylSqNogOdyxExPhtj3Rv+r6RKEzSMp9xxfackM6V
	Cg5VVpY9lNhemTpAz232zRT/tnnqhS286rE4GGEmF9Cdg+ft2QkeBvy//PPmBrBnLGSVJ3r3TtrGA
	XROR2685yLZJGwj3zGfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8jSR-00000003DBL-2u0T;
	Mon, 21 Sep 2026 19:13:43 +0000
Received: from mail-qv2-x10.google.com ([2607:f8b0:4864:33::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8jSO-00000003D9w-2w1a
	for linux-amlogic@lists.infradead.org;
	Mon, 21 Sep 2026 19:13:42 +0000
Received: by mail-qv2-x10.google.com with SMTP id 6a1803df08f44-9107051ba26so22816416d6.1
        for <linux-amlogic@lists.infradead.org>; Mon, 21 Sep 2026 12:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brivo.com; s=google; t=1790018019; x=1790622819; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rgouXHW55aIbAEz+yxgGnRtHE3IVMg92WaPFZm2OsIo=;
        b=tNbuP18+ggdvHeod17x1GzIxVCEV4OVFmU7piyxZgzmp+DgiwKtrvbvWu8zr9NIDZ1
         exf1o0kC39E4hB7svOCnHkvIghw4uhCbD2dc2XemuAQndf053nj6XSBR/JNHpfl93fg6
         KYxz8UQiK6VuOCO52C1acdm2Givxk1uHIy4dIEYs+v2p1SNrQEHyV57h3ENhs1uMh8Xe
         6T/oy+k+chvtT+exCyNXbKuTVtnuXOGw66Y4Yof+Ge+MT1TjhLiVmareZOVrvYRX3I6Y
         mjg42kV0586oFEPU+BD2pNYKTVb8/fj4i4kT5HXR9B6xTuLAN0mSJvnLYn0YuFl3xe0B
         8S/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790018019; x=1790622819;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rgouXHW55aIbAEz+yxgGnRtHE3IVMg92WaPFZm2OsIo=;
        b=BwaNipdEkda3QXgqg7JFqbGq4npfavJV1Wb1IAQP2zy+bSEGV6s46VUsnAZf1gg06f
         68vvfQsePb3QV6hpuy7B2n50oF7cG8JZqQtvsvQ6em+l65pebjwoJPDyY7dS92i1yayr
         Jhpc14W++A4fIF34qh3wpM6NckXvcvLlEqfTLTDQtKtYfMpGIpvDExeTBa5Yf4IzyENi
         2X/TTy5hj/kkowgRWmU0cF/3rZ/MPvLPbL7zzcIz6S8QE32elT12lFDXY5aU+A27H2mY
         0axM1KjaPJFExU1Gqti9vUpsMYH82PVMMvw+hCjqeFJ2PZXB/XuAd48KtovKDTqZT8uC
         wvvw==
X-Forwarded-Encrypted: i=1; AKwUvBzyM6w84XZD9RVmqX3P0P3h0YLXzZLJygzNXIYYD1gJgQU+kh4B3CTWcLGbdpFmiIe5jAkgthlmo/TgFHvg@lists.infradead.org
X-Gm-Message-State: AFuF++k/vq0RWPc8CgJfMZMzqPB+sZQuujRJeg57id+XzCsImqrwPLPe
	slwS94sa6ZmareBw4hHNhrm1Wyet4b066QmOtectV8/v2fK5vFysDr0RRp/2WhhtaWppUobB1ON
	Pfzg760ShPK5Re7lVj26DbBQdC1JC14SDaktG3gEZQfCTJh8r2robUMnKfvmse9A8Gg==
X-Gm-Gg: AYBFou19u9PDAK+YDUOf2w7ycH72ET2S1GMH8Jb1PiuykzCxNLX6z/5P9cbAx7UkafK
	7xKydM9BFWmWiiZFncK592VzskLYrGEzw7VC8R/9UPOLqHn0FIVG0Hznua5Te0TrbNRhPpWUHbK
	7wvDBnKxv1QiiRyXrAh9lXO7DpTInyxe+42swq1o7gbMt4PvxLfVrkDlMEHx5aKk5El46+k/Biq
	6WRpkWYEggjO0Iw2ERJizLR2DD6hCQ84cTMir2mduwipZwTHEgOnyIZ6WO2uZ1aYk/EO7NMTbvG
	BN/woFbA/a53yNio6lua8Fux1NHifiO5BVT7immOo6pNjO2POy61SN/qJt4gsLmoMnakqTBCJMe
	cs3U5aS2ocN31DCJFECVnG0zErHLJuEVXzs0SOuecav27/zxxDT0qY/pLJGOS2jlKLlHWudvhXk
	vsvBzZvjz1Eu8332Qva7SJY0V9HGAe3Lu/EEJNfXXo1i/rRZUU5nH8OYjvFPIk7Q5HJYhypofr1
	A==
X-Received: by 2002:a05:6214:19cc:b0:912:12cf:f6b7 with SMTP id 6a1803df08f44-913fc8a23f8mr21513036d6.7.1790018019138;
        Mon, 21 Sep 2026 12:13:39 -0700 (PDT)
Received: from strozzi ([66.193.28.125])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91260a61570sm75443526d6.23.2026.09.21.12.13.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 12:13:38 -0700 (PDT)
From: Sean Anderson <sanderson@brivo.com>
To: Ulf Hansson <ulfh@kernel.org>,
	linux-mmc@vger.kernel.org
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	Jerome Brunet <jbrunet@baylibre.com>,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	Sean Anderson <sanderson@brivo.com>
Subject: [PATCH] mmc: meson-gx: Convert host->lock to raw spinlock
Date: Mon, 21 Sep 2026 15:13:08 -0400
Message-ID: <20260921191326.2146363-1-sanderson@brivo.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_121340_750970_603D4272 
X-CRM114-Status: GOOD (  11.96  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The primary handler for IRQF_ONESHOT interrupts is always run without
threading, even on PREEMPT_RT. Therefore, we must use a raw spinlock,
which will never sleep (even on PREEMPT_RT).

Fixes: 066ecde6d826 ("mmc: meson-gx: add SDIO interrupt support")
Signed-off-by: Sean Anderson <sanderson@brivo.com>
---

 drivers/mmc/host/meson-gx-mmc.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index 694bb443d5f3f..d5365c0404cb9 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -176,7 +176,7 @@ struct meson_host {
 
 	bool needs_pre_post_req;
 
-	spinlock_t lock;
+	raw_spinlock_t lock;
 };
 
 #define CMD_CFG_LENGTH_MASK GENMASK(8, 0)
@@ -953,10 +953,10 @@ static irqreturn_t meson_mmc_irq(int irq, void *dev_id)
 	cmd = host->cmd;
 
 	if (status & IRQ_SDIO) {
-		spin_lock(&host->lock);
+		raw_spin_lock(&host->lock);
 		__meson_mmc_enable_sdio_irq(host->mmc, 0);
 		sdio_signal_irq(host->mmc);
-		spin_unlock(&host->lock);
+		raw_spin_unlock(&host->lock);
 		status &= ~IRQ_SDIO;
 		if (!status)
 			return IRQ_HANDLED;
@@ -1112,9 +1112,9 @@ static void meson_mmc_enable_sdio_irq(struct mmc_host *mmc, int enable)
 	struct meson_host *host = mmc_priv(mmc);
 	unsigned long flags;
 
-	spin_lock_irqsave(&host->lock, flags);
+	raw_spin_lock_irqsave(&host->lock, flags);
 	__meson_mmc_enable_sdio_irq(mmc, enable);
-	spin_unlock_irqrestore(&host->lock, flags);
+	raw_spin_unlock_irqrestore(&host->lock, flags);
 }
 
 static void meson_mmc_ack_sdio_irq(struct mmc_host *mmc)
@@ -1225,7 +1225,7 @@ static int meson_mmc_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_init_clk;
 
-	spin_lock_init(&host->lock);
+	raw_spin_lock_init(&host->lock);
 
 	if (host->dram_access_quirk) {
 		/* Limit segments to 1 due to low available sram memory */
---
base-commit: 587858367581b9c55c3690f4e63382ad622719d4
branch: meson_mmc_raw

-- 
2.53.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
