Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A123C05027
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Jan 2023 20:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uNhOdZF7PMynPrxd3ZPJFZ7NMtzWUTXvQO2sAMusZS0=; b=goYNplkm0I+DRC
	SKcEBuWnGNEH5ZRZpp+WwceLjy/Ft6jhpTN/xnNP/MlyIlrUZHlTc3Q1hvGTC4xgyLzmbmKLz3wrY
	HDa0gWprrFaAm9urfC9ONExhkMHGJ0boW9yxmFpYVF84xgY/bCzI4NwR0jHIjE+t9FKF16+H4GkHT
	Z2Vo7hXZ1N900YskzlUzeXm5SvfpNh10oRoHM6WRWyxXuLodATQqPN6sGOjJES7IR+A7qtyUcib0t
	6SgWWUQCPvjZz5JrtFwS8GqlIYmtfjNLkuaJ8UzdysIzOnYtPzysU5ni7GNaFrafGiM4DraYRSvJ4
	u7eXO9Y13kXUqVs6wlfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL91y-00CUw7-L7; Thu, 26 Jan 2023 20:39:34 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL91n-00CUtw-Sf; Thu, 26 Jan 2023 20:39:25 +0000
Received: by mail-wm1-x32d.google.com with SMTP id l41-20020a05600c1d2900b003daf986faaeso1973810wms.3;
        Thu, 26 Jan 2023 12:39:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GZgatdbWz2FD9GEgxsoRHVJqmbzaK52XW7ywAP+xink=;
        b=FEBcBjO9m3Eod0WdkjmxkiGRB9P0AFYQuuJjQU5gqHy7eQEt+uJ7TvE7pm+9ZeBHMY
         spHhdQUgReDcMSfcmJOewZWIrDwOfrPxftwGBjDpQGRJaQsEOZzTyJcCKM+EGjI6/xC4
         xuOm8fmfvzJV7nxAUxK8zHt4t2iHNeuAYFFjukBmwcMfdqQHf/Cmo3oPlvPHTH5XCcfO
         deByPeM2l8kq85zcZDNUqs9Fu1kpCeJz2P1lyqEdkEp3q95mvhzh2BBBsHgrR1AsvzYn
         F0bY//iCPGe53ZfhvqohOFsZAEOjQBRPLv4KeCgx2Y0IWEWQxrmtmfcDkldTWVH52Mae
         4V5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GZgatdbWz2FD9GEgxsoRHVJqmbzaK52XW7ywAP+xink=;
        b=Tn1lRizKMD+XTbmZr2aP9kvtoRqxC2EMpPgNqqOs4/KbRTDxeXR7Xm8izMPnsPHOJy
         cdMbABoqFo6FYIvIVPBI/7Tj33gHqmnDAuw12aBXEURLH/Wh8o855KXdMbIU9BwwyXZ1
         TigxskN4hiqlJUD1CiICq8e4kJY2nEwQJYr7Kf6lrkuE8LYRZje1rCtH9azMnMGhj0cB
         7akOOzmi9yoMECEnicIdnL1PKS12a0j/4vE4bl0tc4qSjiDSRBVDNuIv9Gk7q4TBCmOC
         T40y/GcKrWn2s/UJ6TLE+sIO0kuDaTZDExKpvFPSlH4InwAGls5HVO/9EzQYA0Vy6A82
         UbWw==
X-Gm-Message-State: AFqh2kpQhs5UI8Y74y1UGYeFrLnZ0BIY8MmYEyXcf1LO7higCizryVZW
	wakGFmt1FV81lel8+tD8wAY=
X-Google-Smtp-Source: AMrXdXuejlGmeFkAbAis+YK9cjGTabhluoIdNOWdbcp2kIed5bwpGZdjyz1CMpaKMXk98+KbgkvpYQ==
X-Received: by 2002:a05:600c:6001:b0:3da:f80a:5e85 with SMTP id az1-20020a05600c600100b003daf80a5e85mr36084368wmb.26.1674765562233;
        Thu, 26 Jan 2023 12:39:22 -0800 (PST)
Received: from ?IPV6:2a01:c23:c0e4:9a00:897e:7437:5b21:dc78? (dynamic-2a01-0c23-c0e4-9a00-897e-7437-5b21-dc78.c23.pool.telefonica.de. [2a01:c23:c0e4:9a00:897e:7437:5b21:dc78])
        by smtp.googlemail.com with ESMTPSA id e19-20020a05600c439300b003cfd4e6400csm2353520wmn.19.2023.01.26.12.39.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jan 2023 12:39:21 -0800 (PST)
Message-ID: <84fb199a-d459-646f-8522-0fe1f7455e26@gmail.com>
Date: Thu, 26 Jan 2023 21:39:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: Andrew Lunn <andrew@lunn.ch>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 David Miller <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH net-next] net: mdio: mux-meson-g12a: use __clk_is_enabled to
 simplify the code
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230126_123923_959226_7C3227AF 
X-CRM114-Status: GOOD (  12.66  )
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

By using __clk_is_enabled () we can avoid defining an own variable for
tracking whether enable counter is zero.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/net/mdio/mdio-mux-meson-g12a.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/net/mdio/mdio-mux-meson-g12a.c b/drivers/net/mdio/mdio-mux-meson-g12a.c
index 1c1ed6e11..9d21fdf85 100644
--- a/drivers/net/mdio/mdio-mux-meson-g12a.c
+++ b/drivers/net/mdio/mdio-mux-meson-g12a.c
@@ -52,7 +52,6 @@
 #define MESON_G12A_MDIO_INTERNAL_ID 1
 
 struct g12a_mdio_mux {
-	bool pll_is_enabled;
 	void __iomem *regs;
 	void *mux_handle;
 	struct clk *pll;
@@ -152,14 +151,12 @@ static int g12a_enable_internal_mdio(struct g12a_mdio_mux *priv)
 	int ret;
 
 	/* Enable the phy clock */
-	if (!priv->pll_is_enabled) {
+	if (!__clk_is_enabled(priv->pll)) {
 		ret = clk_prepare_enable(priv->pll);
 		if (ret)
 			return ret;
 	}
 
-	priv->pll_is_enabled = true;
-
 	/* Initialize ephy control */
 	writel(EPHY_G12A_ID, priv->regs + ETH_PHY_CNTL0);
 	writel(FIELD_PREP(PHY_CNTL1_ST_MODE, 3) |
@@ -183,10 +180,8 @@ static int g12a_enable_external_mdio(struct g12a_mdio_mux *priv)
 	writel_relaxed(0x0, priv->regs + ETH_PHY_CNTL2);
 
 	/* Disable the phy clock if enabled */
-	if (priv->pll_is_enabled) {
+	if (__clk_is_enabled(priv->pll))
 		clk_disable_unprepare(priv->pll);
-		priv->pll_is_enabled = false;
-	}
 
 	return 0;
 }
@@ -338,7 +333,7 @@ static int g12a_mdio_mux_remove(struct platform_device *pdev)
 
 	mdio_mux_uninit(priv->mux_handle);
 
-	if (priv->pll_is_enabled)
+	if (__clk_is_enabled(priv->pll))
 		clk_disable_unprepare(priv->pll);
 
 	return 0;
-- 
2.39.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
