Return-Path: <SRS0=FfFd=D4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86810C55179
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Oct 2020 16:22:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ADEC022283
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Oct 2020 16:22:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2rCNylh1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="C8IiecTV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ADEC022283
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=U8SzAu0wLiCqe1ix58wiC9Av8qPRjjpVezpwXem/RRI=; b=2rCNylh1bnlueFEEkHJGCYxY5
	2YS3SnDtraxWdrqkPnVZMS4aRx33mdM3PnkkEQr5aXApXRnD53voD1b5alaqF7LhGnVvPNCTRwLTA
	tJgA5uXStNOnOf9mCHGsuDst22uEUBVtM+9mMJO1s5/fm/twcb/JLwVCp8gw+S3VvvZuywt/Gtdik
	aChBWV6kG+ehyY1eOFUE5MSzRgyb+NfoLRv2zJfpqiQlp5DVrSur+2++TutcA1hCbPciVsbQFI8cs
	quU4mMgINB3Pd4QTf6jjaPxVdf1hVteXR8Vw1uMZoEO1F4kI/90PWyghvZEqBJoZY4h4nmMTpUkQo
	jnDzeOhog==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVGsF-0003qP-2r; Wed, 21 Oct 2020 16:22:03 +0000
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVGs9-0003nE-I9
 for linux-amlogic@lists.infradead.org; Wed, 21 Oct 2020 16:21:59 +0000
Received: by mail-ej1-x642.google.com with SMTP id p5so4120118ejj.2
 for <linux-amlogic@lists.infradead.org>; Wed, 21 Oct 2020 09:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=q55g9eud64WpGhGaDa2Dvtt/hAwehZmCVZltK6UXP+c=;
 b=C8IiecTVGT1P3sYupPuqXGfRgdRRrllku4/9/WB8lckeu/jILHTWJy3B5zpSZyjidT
 atUg8s0QUes2oxWPMwZaQgc7aW4jFqhIh/dS2Rv0A8FxIfwsIdqxc5Zcd3cS1nlHVP0X
 +l5Q3URFShXC990ojgt4igfaCwLJjQqkxDZoR66LbHrjv6mO+6UndtcNzKWAP+at5sJ8
 XJJT7hE4BAcPwZQ/7j/1+F84Cp7ISEpLXSHvhtfxd/e/OFeJwbuUxYpZJEs0YTIxNhjB
 neNko+1u4H7RJzazj3QYvOE3w75o3HnCie8sXXcbAgtRd5XvPayvu7g3jZPCtB/L6dcG
 KFGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q55g9eud64WpGhGaDa2Dvtt/hAwehZmCVZltK6UXP+c=;
 b=iz+O5Y8Rew2oxnlOyjtyO0My5unD69juwz4tDdwQ45UdfX7jicrTOYIXaocVHFnnf4
 NCMtxZKlV2pUs0J2sIkYe9Mdln9a5EOQQp7VHqI+jMgieuI4AeV5TLV465mLGQA0seAK
 wuW260q3jbyN2eVCmRIm74CVCNB7JgJKNbknQ2TnyVlQUvickGK71as7Ozex39c0GosL
 r1Vv74WT6ah+Wg9MAj8SrevvuNrEQaKqL47Trjn50E1tRNEAu0aK3ofP7uwuBaP56q8G
 NFosGdwuvEebbb+/scBNyu4YaaDfFekUI+GmDC0fdWT5y7rXyKBDtmtUf0VM03b9dVIv
 CW5w==
X-Gm-Message-State: AOAM530CEfFFhgzFlkT0szZiTwkhwpD71Q0ZVRYOPXXZMtLqr/7hodIz
 tsNmwpDjzzhIMuZ5uyA+vML7wA==
X-Google-Smtp-Source: ABdhPJz+G1dBjBjCpnBLdWHbW1tSyTbYS7kPkAsPqhbosb2z4K4f83WPnTBKLviiVvM6Z1MI0t69sg==
X-Received: by 2002:a17:907:206e:: with SMTP id
 qp14mr4330789ejb.76.1603297316070; 
 Wed, 21 Oct 2020 09:21:56 -0700 (PDT)
Received: from starbuck.lan (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.googlemail.com with ESMTPSA id 11sm2566667ejy.19.2020.10.21.09.21.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Oct 2020 09:21:55 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v2 2/3] clk: add api to get clk consumer from clk_hw
Date: Wed, 21 Oct 2020 18:21:46 +0200
Message-Id: <20201021162147.563655-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20201021162147.563655-1-jbrunet@baylibre.com>
References: <20201021162147.563655-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201021_122157_643662_60445BA9 
X-CRM114-Status: GOOD (  19.16  )
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
Cc: linux-amlogic@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

clk_register() is deprecated. Using 'clk' member of struct clk_hw is
discouraged. With this constraint, it is difficult for driver to
register clocks using the clk_hw API and then use the clock with
the consumer API

This adds a simple helper, clk_hw_get_clk(), to get a struct clk from
a struct clk_hw. Like other clk_get() variant, each call to this helper
must be balanced with a call to clk_put(). To make life easier on the
consumers, a memory managed version is provided as well.

Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/clk.c            | 61 ++++++++++++++++++++++++++++++++++++
 include/linux/clk-provider.h |  5 +++
 2 files changed, 66 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 88e5797bb6b4..d27153f26fa9 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -3667,6 +3667,24 @@ struct clk *clk_hw_create_clk(struct device *dev, struct clk_hw *hw,
 	return clk;
 }
 
+/**
+ * clk_hw_get_clk: get clk consumer given an clk_hw
+ * @hw: clk_hw associated with the clk being consumed
+ * @con_id: connection ID string on device
+ *
+ * Returns: new clk consumer
+ * This is the function to be used by providers which need
+ * to get a consumer clk and act on the clock element
+ * Calls to this function must be balanced with calls clk_put()
+ */
+struct clk *clk_hw_get_clk(struct clk_hw *hw, const char *con_id)
+{
+	struct device *dev = hw->core->dev;
+
+	return clk_hw_create_clk(dev, hw, dev_name(dev), con_id);
+}
+EXPORT_SYMBOL(clk_hw_get_clk);
+
 static int clk_cpy_name(const char **dst_p, const char *src, bool must_exist)
 {
 	const char *dst;
@@ -4187,6 +4205,49 @@ void devm_clk_hw_unregister(struct device *dev, struct clk_hw *hw)
 }
 EXPORT_SYMBOL_GPL(devm_clk_hw_unregister);
 
+static void devm_clk_release(struct device *dev, void *res)
+{
+	clk_put(*(struct clk **)res);
+}
+
+/**
+ * devm_clk_hw_get_clk: resource managed clk_hw_get_clk()
+ * @dev: device that is registering this clock
+ * @hw: clk_hw associated with the clk being consumed
+ * @con_id: connection ID string on device
+ *
+ * Managed clk_hw_get_clk(). Clocks got with this function are
+ * automatically clk_put() on driver detach. See clk_put()
+ * for more information.
+ */
+struct clk *devm_clk_hw_get_clk(struct device *dev, struct clk_hw *hw,
+				const char *con_id)
+{
+	struct clk *clk;
+	struct clk **clkp;
+
+	/* This should not happen because it would mean we have drivers
+	 * passing around clk_hw pointers instead of having the caller use
+	 * proper clk_get() style APIs
+	 */
+	WARN_ON_ONCE(dev != hw->core->dev);
+
+	clkp = devres_alloc(devm_clk_release, sizeof(*clkp), GFP_KERNEL);
+	if (!clkp)
+		return ERR_PTR(-ENOMEM);
+
+	clk = clk_hw_get_clk(hw, con_id);
+	if (!IS_ERR(clk)) {
+		*clkp = clk;
+		devres_add(dev, clkp);
+	} else {
+		devres_free(clkp);
+	}
+
+	return clk;
+}
+EXPORT_SYMBOL_GPL(devm_clk_hw_get_clk);
+
 /*
  * clkdev helpers
  */
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 03a5de5f99f4..86b707520ec0 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -1088,6 +1088,11 @@ static inline struct clk_hw *__clk_get_hw(struct clk *clk)
 	return (struct clk_hw *)clk;
 }
 #endif
+
+struct clk *clk_hw_get_clk(struct clk_hw *hw, const char *con_id);
+struct clk *devm_clk_hw_get_clk(struct device *dev, struct clk_hw *hw,
+				const char *con_id);
+
 unsigned int clk_hw_get_num_parents(const struct clk_hw *hw);
 struct clk_hw *clk_hw_get_parent(const struct clk_hw *hw);
 struct clk_hw *clk_hw_get_parent_by_index(const struct clk_hw *hw,
-- 
2.25.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
