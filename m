Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37CBDC3DA49
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 Jul 2024 12:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+4q3VJhnIjAh2Rwl7SWCkzDCPfGENqHJUBUAR5JFBjw=; b=i9logF/Zj0okuT
	ovyyOp6P9Jf8Ohy0hfvjNMmxSx6dJgcqf5nxai7HDeFpp4j8vfV9j5ehlccVCa7ATEMxrXlHyct6D
	nM5JZAlvsPADHI4kz7A22DM6gC32HUtlFm8Kg0OF3tF9ugFxmxlWG2kMeCmg6JlSfi9hDFF/F0PcH
	zxVzTOOeFPO3s24MxYOYIVreO1hpZj5kycV2Ok4X0AH8PRATorVo/O++pAmhwm+Glr7SqRZGdxIt5
	S6mNDGkEGa+XAHdGeGS3D7rhMqmJgZmR8PI7/iinS/afaSLwQRCQTTBV2cYAaPQdqRv6ka0jZQdSc
	9LaCCfxGbWwJtS72UEoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYmJQ-0000000F9yi-46jc;
	Tue, 30 Jul 2024 12:50:44 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYmJL-0000000F9tT-19en
	for linux-amlogic@lists.infradead.org;
	Tue, 30 Jul 2024 12:50:40 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-42816ca782dso24812535e9.2
        for <linux-amlogic@lists.infradead.org>; Tue, 30 Jul 2024 05:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1722343837; x=1722948637; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kFGOubNsNVn1OpgYJCvY0DMJojSWylMPMeeJsgWseOI=;
        b=BMRN+FR1xdBczUxmHutwodYe5otzuj+3+pb80BDbopl0u/DjN5X/gWkkiHkIh6wfum
         dq/2hbD7fKMb+JQoCAjAbLnv4XYEAsgc2MM1xVSism+yiFmIJYohQLKMQhXMf25EJ4xV
         odqA0G5n2iDINtMjlPMIMFr8mkFNFICIut9OE/o8ltnE916hmsvo10o6OchHgvtazZ6A
         el2ah8l1BL1/AgnYX+ESbaY+e+UVtC5uRC6G9X7X9lg57y3jsjolf6vZxawBh73QiGG4
         qSZmPMZ/j+5C9dTew2A2S3lOOgphzxImb7aKKzSg0y8yIVlV/ciD4/GpB23TGDZlX889
         E4RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722343837; x=1722948637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kFGOubNsNVn1OpgYJCvY0DMJojSWylMPMeeJsgWseOI=;
        b=OuviWmwVVGcZsnMLC2o1CnZqcu1nyaFCQtjiLXHKR7nLGM4UZWCjyl+ezjM9XUQLA4
         RijnWnY2BRx7tJp3eSzeGqSIsXFmtFLVSc1/dcTISQc0EA/Lnuw1doDq6KxEASxsI/fM
         oQxMgDTcwxAKkOqDlNWDhk9tWIkzsJj3QQ2I0yrADexbe9Cmg2X/7JpwEoxt4TcpFcpJ
         fVf3gbIAw4d/98SNjCy1K/du9YiRQOvKO8GEe13vl+C01gtsCN5QxlvAcmWMpzAeF15m
         LDW9CDxZ0H48dauFLN2+t918mQtQuI6fo7lWGC5filFAv01gOfRHd+DJv9nWkf6kGdIR
         hXeg==
X-Forwarded-Encrypted: i=1; AJvYcCWGj+/9XDY8t3o4C96tMiwHUymhvxrZXVa5a+ERRSuyG9C9rFOp9J04Tp8KLRqB1CO7ucUCsPFKY+fHMADpDlp0W2do3n1QhFIFWa3wi/68qqY=
X-Gm-Message-State: AOJu0Ywn4PeFuvnCyx7mlx1n7wqJSpt7rDwZa5TFJRZClOlvmalLmTyq
	ONX1z/4qwPRXkWskaOiEPxTbfye8qBYupzfuO3lgwK6kLkkMv3pkHbyePGMgtYE=
X-Google-Smtp-Source: AGHT+IFYy4B/g5w5Y3B19jbk4N8IBnPQwvEBCaNr6l0tavtJI1kbi8Yq6wQAsMTGuLdyiEwuv2pLaA==
X-Received: by 2002:a05:600c:3b07:b0:426:4978:65f0 with SMTP id 5b1f17b1804b1-42811d9e0dcmr82301025e9.18.1722343837035;
        Tue, 30 Jul 2024 05:50:37 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:291e:4a48:358e:6f49])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-42805730e68sm216521405e9.9.2024.07.30.05.50.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 05:50:36 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	dri-devel@lists.freedesktop.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/9] drm/meson: dw-hdmi: use generic clock helpers
Date: Tue, 30 Jul 2024 14:50:13 +0200
Message-ID: <20240730125023.710237-4-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240730125023.710237-1-jbrunet@baylibre.com>
References: <20240730125023.710237-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240730_055039_344881_9065D6A9 
X-CRM114-Status: GOOD (  12.51  )
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

The Amlogic HDMI phy driver is not doing anything with the clocks
besides enabling on probe. CCF provides generic helpers to do that.

Use the generic clock helpers rather than using a custom one to get and
enable clocks.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/gpu/drm/meson/meson_dw_hdmi.c | 36 +++------------------------
 1 file changed, 3 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
index bcf4f83582f2..2890796f9d49 100644
--- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
@@ -619,29 +619,6 @@ static void meson_dw_hdmi_init(struct meson_dw_hdmi *meson_dw_hdmi)
 
 }
 
-static void meson_disable_clk(void *data)
-{
-	clk_disable_unprepare(data);
-}
-
-static int meson_enable_clk(struct device *dev, char *name)
-{
-	struct clk *clk;
-	int ret;
-
-	clk = devm_clk_get(dev, name);
-	if (IS_ERR(clk)) {
-		dev_err(dev, "Unable to get %s pclk\n", name);
-		return PTR_ERR(clk);
-	}
-
-	ret = clk_prepare_enable(clk);
-	if (!ret)
-		ret = devm_add_action_or_reset(dev, meson_disable_clk, clk);
-
-	return ret;
-}
-
 static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
 				void *data)
 {
@@ -651,6 +628,7 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
 	struct drm_device *drm = data;
 	struct meson_drm *priv = drm->dev_private;
 	struct dw_hdmi_plat_data *dw_plat_data;
+	struct clk_bulk_data *clks;
 	int irq;
 	int ret;
 
@@ -701,17 +679,9 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
 	if (IS_ERR(meson_dw_hdmi->hdmitx))
 		return PTR_ERR(meson_dw_hdmi->hdmitx);
 
-	ret = meson_enable_clk(dev, "isfr");
-	if (ret)
-		return ret;
-
-	ret = meson_enable_clk(dev, "iahb");
+	ret = devm_clk_bulk_get_all_enable(dev, &clks);
 	if (ret)
-		return ret;
-
-	ret = meson_enable_clk(dev, "venci");
-	if (ret)
-		return ret;
+		return dev_err_probe(dev, ret, "Failed to enable all clocks\n");
 
 	dw_plat_data->regm = devm_regmap_init(dev, NULL, meson_dw_hdmi,
 					      &meson_dw_hdmi_regmap_config);
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
