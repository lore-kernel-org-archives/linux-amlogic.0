Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3250CCA47C
	for <linux-amlogic@archiver.kernel.org>; Fri, 17 Jun 2022 07:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/422eNYgtuvUo5bZG0OYreFJ2cL7TxG0sySvj3Fkqt0=; b=hWiIOhBGeeUSa3
	2p23BUj+ZyeUcBQDz4WwBY0lKZVL6C5rZhtSTFmYuO0fJNvhhRURrYq6FG+QwFfKJ4xWqftz7RM5V
	drTFNHdc7rxYFaq66cpBTlpw8+owOPpdTe3LcI5GXBnk5jZjAQwKYztquI9pofYqziA7WzAtEw4D6
	pS+Qs4fjAOzG0ccUkjxYoD+GvXtKPrCxPtSqNIA/6XPitJxcDb+KN/D76kXw3ZLa2CUcMR8FfsrhH
	7ytHoQ22r4EhiTyLz3MygbdWup+8cRf3p1rN5PSZIA8OHqX0DJoqEAIjNpadQOsKtAkl7d7FUozgm
	45U7MQuesfC5cLCHfyEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o26dJ-0063HZ-70; Fri, 17 Jun 2022 07:43:09 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o26OK-005x5L-GP
	for linux-amlogic@lists.infradead.org; Fri, 17 Jun 2022 07:27:43 +0000
Received: by mail-ej1-x629.google.com with SMTP id o7so7139826eja.1
        for <linux-amlogic@lists.infradead.org>; Fri, 17 Jun 2022 00:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VFZwn07Jf42Rg7k/gx/lsnWK8vEpodBGY1nxYIP45Co=;
        b=p1oU7GeoNQu6awHQ0aGj9MhjLXK0wKEVYnKJXK/czTcHCbWD809coenj5JBeIO1lPt
         TqfQ71qu/DpVseqo7ZOJ89CwEcAm2TO/Nmo+rg4U1RlaF/sxCHzmp8jwvn4gtBv42mAW
         j8rS6NoGZo2q54fMem/9hBmMtob7tPi4TeU8NndN3lwmT8cfsUKwYjNjBBB+XBDk0U0f
         o3JDsJKDiBD+3PBUBvGTlDikfLPVhhPZ032STPNWE4vAsWW2cHsxOBlbzYxyr+Y+bWyw
         Yl6bS+FBeLvaUNRz57n2sigJxm+6IVkOiAuWDguM79BKZB/sCevO/d7TzMGm/YjiQLdn
         xXzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VFZwn07Jf42Rg7k/gx/lsnWK8vEpodBGY1nxYIP45Co=;
        b=dhGfyVHNF+iAvXqa508QS5k0oZzhZFWHQidOpSD8TnVR3n7IlBzARkc/6EjVx+kRMA
         9qhiSHCIChyWSWjHsvFDylV/6GxIN/6ybZSjjFeNV9ChyTWhqf3Ccl/AUi2PTOVvN0Cd
         TmsBc59F394cMfwiAZa/2OeY/h8uz+eUmHGHs2YxMs/eyJpAfC+2PPe0O2NiQxNkz4K6
         r2E9Dc8j3JXzrFTlchMUjKvOg+cqiE61VLK5NIQEanSbnxb3t7qj59So4qZTGmwC6Au7
         8GMo2hmVuHSF5YKmq8pgYdCBTWoiKw226uV4+3TbgLvhUF3qQBrrZeRJNo3OsB1fHrxm
         GJzw==
X-Gm-Message-State: AJIora+wK+msV+GK5z6ggl3tOgDSog9KlD4G92Og1BLeSM8v7KJu09QY
	Ma0EytIPJ2MQToGeaMegA3kbGA==
X-Google-Smtp-Source: AGRyM1sqUWRr2IgX7mP5yp58eUlwZ45seC2wUZzYvVtMcnG9xRXijqPFlEHY6srrV4CeDwLouWejYA==
X-Received: by 2002:a17:907:8692:b0:711:d49f:994d with SMTP id qa18-20020a170907869200b00711d49f994dmr7812873ejc.578.1655450855721;
        Fri, 17 Jun 2022 00:27:35 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:44c0:66c0:d227:8f3c:286a:d9d8])
        by smtp.gmail.com with ESMTPSA id n9-20020a170906840900b006fec56a80a8sm1762556ejx.115.2022.06.17.00.27.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jun 2022 00:27:35 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: dri-devel@lists.freedesktop.org,
	martin.blumenstingl@googlemail.com
Cc: linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v3 4/6] drm/meson: vclk: add DSI clock config
Date: Fri, 17 Jun 2022 09:27:21 +0200
Message-Id: <20220617072723.1742668-5-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220617072723.1742668-1-narmstrong@baylibre.com>
References: <20220617072723.1742668-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3768; h=from:subject; bh=wVEu88z9Tki+VwSbbtWc3B9clOhCXc+ZkFmWDGthpuw=; b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBirCyrS/tyPj3lnnn7HteF8IVQnViij4BcDf57V2+t 0uJANG6JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCYqwsqwAKCRB33NvayMhJ0SmLEA CG35qlOumtls9mivNjWPMKCp0/wz5sEksxVdSfbEF8wJWBnhZNsKMBp/xwx6/zZiD9it5SIAa8wZSz sAgkSM9dmFReB6MziDdFqVJfQTCFbJK1FrQhHL4UyulW3wd1TZwjVMulQ3VUsSOMZEVj4FbRkMOEas SUI9VfH6I6vAjXnoOnbCJCzpnXaAczTQa+0PVZrArw+0YPJhlCl7m9a6rexnjPukfBXi1Uen1A2tDL 1VCWWy2XC67I8YKkdAdhcMHNIk8SEUG48yQn1Yd67cZU+djjCIHpARjU4Wzo6RikJcRLSbLH+hVwUf bhIFuHb2aW9/w9KY8TIKd/GK7yYN6JT1Xz7mkv9JQ8kquj0ePxMU+dz8/kitu8EUe/e4zWjks0w+lU MwQgc0skTGmofkzR5U9MCApU5+gEqfD4SRnKdsBs9A4v/6TdDw1XmL4sgo8Tm9eun4XQ9BRVHyGuwh NFA/760V5/jvamDsQaxtwNGXCwOuKbmv+Wc7CemcxnbaXwwSsUxotln3KREDlkVqK0HJ4Q0uEe/3T8 WGdnSxF3MSBNi/PDN2k2qv9iVndUz5QsVEJ3QFmlGcw2BlpIkSYM72HsrM0Ntt9eC0PwtxJZlssPYS vEoZsRijlKN2TxI28TCeEuYrVlxscjUkjwW95b1lDU9ifjZTuMJkXHNg1h6g==
X-Developer-Key: i=narmstrong@baylibre.com; a=openpgp; fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220617_002740_604912_921505A3 
X-CRM114-Status: GOOD (  12.68  )
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

The DSI path used the ENCL pixel encoder, thus this adds a clock
config using the HDMI PLL in order to feed the ENCL encoder via the
VCLK2 path and the CTS_ENCL clock output.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/meson/meson_vclk.c | 47 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/meson/meson_vclk.h |  1 +
 2 files changed, 48 insertions(+)

diff --git a/drivers/gpu/drm/meson/meson_vclk.c b/drivers/gpu/drm/meson/meson_vclk.c
index 2a82119eb58e..5e4d982be1c8 100644
--- a/drivers/gpu/drm/meson/meson_vclk.c
+++ b/drivers/gpu/drm/meson/meson_vclk.c
@@ -55,6 +55,8 @@
 #define VCLK2_DIV_MASK		0xff
 #define VCLK2_DIV_EN		BIT(16)
 #define VCLK2_DIV_RESET		BIT(17)
+#define CTS_ENCL_SEL_MASK	(0xf << 12)
+#define CTS_ENCL_SEL_SHIFT	12
 #define CTS_VDAC_SEL_MASK	(0xf << 28)
 #define CTS_VDAC_SEL_SHIFT	28
 #define HHI_VIID_CLK_CNTL	0x12c /* 0x4b offset in data sheet */
@@ -83,6 +85,7 @@
 #define VCLK_DIV12_EN		BIT(4)
 #define HHI_VID_CLK_CNTL2	0x194 /* 0x65 offset in data sheet */
 #define CTS_ENCI_EN		BIT(0)
+#define CTS_ENCL_EN		BIT(3)
 #define CTS_ENCP_EN		BIT(2)
 #define CTS_VDAC_EN		BIT(4)
 #define HDMI_TX_PIXEL_EN	BIT(5)
@@ -1024,6 +1027,47 @@ static void meson_vclk_set(struct meson_drm *priv, unsigned int pll_base_freq,
 	regmap_update_bits(priv->hhi, HHI_VID_CLK_CNTL, VCLK_EN, VCLK_EN);
 }
 
+static void meson_dsi_clock_config(struct meson_drm *priv, unsigned int freq)
+{
+	meson_hdmi_pll_generic_set(priv, freq * 10);
+
+	/* Setup vid_pll divider value /5 */
+	meson_vid_pll_set(priv, VID_PLL_DIV_5);
+
+	/* Disable VCLK2 */
+	regmap_update_bits(priv->hhi, HHI_VIID_CLK_CNTL, VCLK2_EN, 0);
+
+	/* Setup the VCLK2 divider value /2 */
+	regmap_update_bits(priv->hhi, HHI_VIID_CLK_DIV, VCLK2_DIV_MASK, 2 - 1);
+
+	/* select vid_pll for vclk2 */
+	regmap_update_bits(priv->hhi, HHI_VIID_CLK_CNTL,
+			   VCLK2_SEL_MASK, (0 << VCLK2_SEL_SHIFT));
+
+	/* enable vclk2 gate */
+	regmap_update_bits(priv->hhi, HHI_VIID_CLK_CNTL, VCLK2_EN, VCLK2_EN);
+
+	/* select vclk2_div1 for encl */
+	regmap_update_bits(priv->hhi, HHI_VIID_CLK_DIV,
+			   CTS_ENCL_SEL_MASK, (8 << CTS_ENCL_SEL_SHIFT));
+
+	/* release vclk2_div_reset and enable vclk2_div */
+	regmap_update_bits(priv->hhi, HHI_VIID_CLK_DIV, VCLK2_DIV_EN | VCLK2_DIV_RESET,
+			   VCLK2_DIV_EN);
+
+	/* enable vclk2_div1 gate */
+	regmap_update_bits(priv->hhi, HHI_VIID_CLK_CNTL, VCLK2_DIV1_EN, VCLK2_DIV1_EN);
+
+	/* reset vclk2 */
+	regmap_update_bits(priv->hhi, HHI_VIID_CLK_CNTL, VCLK2_SOFT_RESET, VCLK2_SOFT_RESET);
+	regmap_update_bits(priv->hhi, HHI_VIID_CLK_CNTL, VCLK2_SOFT_RESET, 0);
+
+	/* enable encl_clk */
+	regmap_update_bits(priv->hhi, HHI_VID_CLK_CNTL2, CTS_ENCL_EN, CTS_ENCL_EN);
+
+	usleep_range(10000, 11000);
+}
+
 void meson_vclk_setup(struct meson_drm *priv, unsigned int target,
 		      unsigned int phy_freq, unsigned int vclk_freq,
 		      unsigned int venc_freq, unsigned int dac_freq,
@@ -1050,6 +1094,9 @@ void meson_vclk_setup(struct meson_drm *priv, unsigned int target,
 		meson_vclk_set(priv, phy_freq, 0, 0, 0,
 			       VID_PLL_DIV_5, 2, 1, 1, false, false);
 		return;
+	} else if (target == MESON_VCLK_TARGET_DSI) {
+		meson_dsi_clock_config(priv, phy_freq);
+		return;
 	}
 
 	hdmi_tx_div = vclk_freq / dac_freq;
diff --git a/drivers/gpu/drm/meson/meson_vclk.h b/drivers/gpu/drm/meson/meson_vclk.h
index 60617aaf18dd..1152b3af8d2e 100644
--- a/drivers/gpu/drm/meson/meson_vclk.h
+++ b/drivers/gpu/drm/meson/meson_vclk.h
@@ -17,6 +17,7 @@ enum {
 	MESON_VCLK_TARGET_CVBS = 0,
 	MESON_VCLK_TARGET_HDMI = 1,
 	MESON_VCLK_TARGET_DMT = 2,
+	MESON_VCLK_TARGET_DSI = 3,
 };
 
 /* 27MHz is the CVBS Pixel Clock */
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
