Return-Path: <SRS0=fUxg=V2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41D1AC433FF
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Jul 2019 13:02:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 142AC206DD
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Jul 2019 13:02:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NeUJHWwt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="VlPXaYyP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 142AC206DD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ToWxhxv9JTSwmNfpxGEWHXsuY3dZ9bYfP/EMnZOws7g=; b=NeUJHWwtXw6TNH
	G6KNk3/O3cCQQufxXpoYw102O2Phc8zCvus1wwivcXkevP/0YXMQvY7hfzITz7gCNhmLJKUe3PmR5
	bo8BRpNz2KdEnu8VBb4YDURg51TLMkH23N3zp5BRujUlUDfhIYGyN0Myfy3AC3Q4+X/cSIu77hOWD
	hr531OeHCadpN7XZeh+Hr0WR2uL9N/IucXIAqzDT4M4dQpA9KAtWiPuF/ZRNEPssKGyt1lOwHl6ou
	/Sb/CTim7flelcoN0D+o+/IGyJeDInQi1DAsxhJYQZMWtaCVc3toF6AdddZMau900o7rOTDbhRNW0
	WlbxjA5BC/Id5DQNx+Zg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hs5IL-0007ph-5o; Mon, 29 Jul 2019 13:02:29 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hs5IH-0007mL-Cz
 for linux-amlogic@lists.infradead.org; Mon, 29 Jul 2019 13:02:26 +0000
Received: by mail-wm1-x344.google.com with SMTP id x15so53785733wmj.3
 for <linux-amlogic@lists.infradead.org>; Mon, 29 Jul 2019 06:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EvlHbCW1OevHbW9Yaby9CFqayEK2s/Y2m4Jve2BO5WQ=;
 b=VlPXaYyPE4XBjSsfVxe3EjW4kowH8F7+G6YW+blqO2MW2TSUgeQr0Zuos0Ma6FWy/Q
 5jcd3ND8KK+L+x0oslsy145/BK7NM9ViNdZo/8QCWFQprAkPDSwl2KYfBBp6HiI2qZE2
 rdQyfzIZwe0u/l9+AyZKwG+LVikNAaoJwCMevQEkp+n1IpRQXYiF2NnpIB2iXNBQZ6KF
 94G4LF7tuhl/TLiFfMZ9THMM5mSQLg+tdfLsLD0x1JagkBkV2Q9sc7UV4TzvAvJyZDgf
 k8pu5zAAvVwvgZi7bvs7ogdjx7dL6M3AZ42kEuUVUXwcGX03X4tQAA/PN7iXN/iAcahm
 iOew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EvlHbCW1OevHbW9Yaby9CFqayEK2s/Y2m4Jve2BO5WQ=;
 b=a4aiCGP3/RtpT2uGn77/DI8gpDj1OroYWAuf+jWQ8v64Qfu4rcmWzkVO5N9bXnvgCx
 ld5BT1OyKUMnH8l/RcBKV7GlxSNWcxCfmU81KYmbwdo4wVV+mcOxZV6G9yvMHLTnhopR
 +bWu5fGpVXtX216FCqiIfNyGQVfCI+8/TCCIO/T0eNdHc9pVHMdsbodqRMNx2nJCldlk
 qB3tc3Y4iR6Dzj6r/jHbryp4WFfsi48vFwXsQDXm6ptYFM1EkTdevL6jNPc075QyJmNI
 GJBvNgtHvtcsGj1giBt+tD5DouCvdHaUlKuQbHihexBegdgkt6NwJwSZrffXvnFGGGpa
 oLWw==
X-Gm-Message-State: APjAAAURoFUchnb0ykdnP6I+jOM9KzK1h3gpkq5GPSpQBvbEtk08+4LS
 k2A3rykih+TD9A9IdtyToUguLw==
X-Google-Smtp-Source: APXvYqwQo1q5iaW3jvl4f3ZJ8VQMUpxNO5ykvWK67eymaccK4cp71AzuQkWF8mYx0Mt+HvpBngFHmw==
X-Received: by 2002:a7b:c1c1:: with SMTP id a1mr104511842wmj.31.1564405343272; 
 Mon, 29 Jul 2019 06:02:23 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id x185sm52990545wmg.46.2019.07.29.06.02.22
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 29 Jul 2019 06:02:22 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 1/2] soc: amlogic: meson-clk-measure: protect measure with a
 mutex
Date: Mon, 29 Jul 2019 15:02:17 +0200
Message-Id: <20190729130218.6635-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190729130218.6635-1-narmstrong@baylibre.com>
References: <20190729130218.6635-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190729_060225_443221_0B0B5D52 
X-CRM114-Status: GOOD (  10.82  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

In order to protect clock measuring when multiple process asks for
a measure, protect the main measure function with mutexes.

Reviewed-by: Kevin Hilman <khilman@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/soc/amlogic/meson-clk-measure.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/amlogic/meson-clk-measure.c b/drivers/soc/amlogic/meson-clk-measure.c
index 19d4cbc93a17..c470e24f1dfa 100644
--- a/drivers/soc/amlogic/meson-clk-measure.c
+++ b/drivers/soc/amlogic/meson-clk-measure.c
@@ -11,6 +11,8 @@
 #include <linux/debugfs.h>
 #include <linux/regmap.h>
 
+static DEFINE_MUTEX(measure_lock);
+
 #define MSR_CLK_DUTY		0x0
 #define MSR_CLK_REG0		0x4
 #define MSR_CLK_REG1		0x8
@@ -360,6 +362,10 @@ static int meson_measure_id(struct meson_msr_id *clk_msr_id,
 	unsigned int val;
 	int ret;
 
+	ret = mutex_lock_interruptible(&measure_lock);
+	if (ret)
+		return ret;
+
 	regmap_write(priv->regmap, MSR_CLK_REG0, 0);
 
 	/* Set measurement duration */
@@ -377,8 +383,10 @@ static int meson_measure_id(struct meson_msr_id *clk_msr_id,
 
 	ret = regmap_read_poll_timeout(priv->regmap, MSR_CLK_REG0,
 				       val, !(val & MSR_BUSY), 10, 10000);
-	if (ret)
+	if (ret) {
+		mutex_unlock(&measure_lock);
 		return ret;
+	}
 
 	/* Disable */
 	regmap_update_bits(priv->regmap, MSR_CLK_REG0, MSR_ENABLE, 0);
@@ -386,6 +394,8 @@ static int meson_measure_id(struct meson_msr_id *clk_msr_id,
 	/* Get the value in multiple of gate time counts */
 	regmap_read(priv->regmap, MSR_CLK_REG2, &val);
 
+	mutex_unlock(&measure_lock);
+
 	if (val >= MSR_VAL_MASK)
 		return -EINVAL;
 
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
