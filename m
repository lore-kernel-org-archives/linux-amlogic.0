Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE54EC77B75
	for <linux-amlogic@archiver.kernel.org>; Fri, 12 May 2023 13:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NlwC50Y5UI5glvGgNRrxa+niEV11MO0mjlRrljT6qxc=; b=ad8jAUiMVw/3Mw
	4fojZobGIsx2eJV9AiN+Zbm/PzN7smBZh+54ECxGCrB+rSyfqzb/bSFMOW/dKjq4kpEzAJOuv31nV
	u8SM1MDyX5wGbtBOCvWMMjxf9xEdESfPz6V0uLipkfpbzkCzOoq+koX9mDY2SHeSWAV1zK2h0NjOK
	gCHfHJbpWyvWJp2Pt1K2UJbzChcAPSd1Ji0L4+M9c88sjQDuEYzDr7QSBSkOgK+YQpq4N0cO2rvC1
	s0uKwmsUi6lX6Wa1SmlHEfA+6N2qg3PMOCLG3VEAR0sj51nGo3+ou88vilZh1oawj8XSGYL0mnNpY
	IQSWwDeQm4IvoSPjpmOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxT0V-00C2yh-1x;
	Fri, 12 May 2023 13:40:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxT0T-00C2w4-2d
	for linux-amlogic@bombadil.infradead.org;
	Fri, 12 May 2023 13:40:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=SLBWgiMNwkyCqNWdGx1K4+ygLk3VG9D6DZvu6fKUhDY=; b=gzy60N2ByC4y/7x1uSclqrmQ+j
	rQGZf13qfk3hV8S50avx1GGBhjgOZi4N5NKd7j1ZTjw1lnYVqNxGfELgEhNyAO1PHdxKiJ1Bk/dD9
	DCkprfxtarkbbFc3pgmoHY7ig1/y5xa1Rvv8qKEtpUTNbcC4F6xmJ2ej6FbRB1dXVWGamFd+OyqfW
	aqkM9ItdAOsF539e3ccfwg2WEfbp+qrOJHce3vx0bCLITPtTaYy5kQIQ8//S/Y3te7NpfL05oa5nh
	1qphgxCrZMzafpdFJQK4UenUcfxpTyi9HICETZa8imz0Ci8YiHt6S2KDg3zzAdL7RGbtUWv7fZWed
	qle7A+Vw==;
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxSZ8-0099PO-0D
	for linux-amlogic@lists.infradead.org;
	Fri, 12 May 2023 13:12:12 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-3f41dceb9d1so71873845e9.1
        for <linux-amlogic@lists.infradead.org>; Fri, 12 May 2023 06:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683897125; x=1686489125;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SLBWgiMNwkyCqNWdGx1K4+ygLk3VG9D6DZvu6fKUhDY=;
        b=kYz0ju11D6jUTa4HLXMUI85kDspC8Jjx1paZ1AgUvlNEARse9VXMp67EppR0eALwn+
         rON/U5JQf1qFpk72jiCjxTvJ+mMPKvQLO84oXFvSd+f8Uf3sHhp8Aj0FT0EaiCJ2G9Ug
         8u9OhYquKpxtVOHwm4MOEmS65MpzV7bRgKTlYHC7l0ss5eYzgP71CRacXDtsys6US5e3
         ckFtgA8JfPVM06HtNNLE9cE41REzpGjbgtBDRzGubaWC7Dfu9UEx3Sb6dqXVXT7YzhDQ
         wyh5BrdOZuANfwrWAvJY7RdWfXkNTeHZ2+kcDhoZxfGIapZv3iAmKzCAObbGks2C4asp
         seKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683897125; x=1686489125;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SLBWgiMNwkyCqNWdGx1K4+ygLk3VG9D6DZvu6fKUhDY=;
        b=aFdPwQ7zxADMS56fbAvxBoNGcaLLyhCQjQPRHM/qu6p34ABf/00gewPOziwXfGXYkS
         GGQoT6L9983ERhmTg92gzUPKf4YTKL0EZ3OqZGjhFzJtJwfRlycm9LRnPeWe3USyaOzx
         ROkYcReamDT/FaNZvA/CvIdM5hNDMGcWi9vDF8Za/jrernV6sX6pUKzFbYWXW3yksLfI
         cxtZBTB+agKpVp8PGWQOtFUgOK18m8uU4QhBFBWZ9oFvWnNHXqCNUPtK8Wqih8IeadHe
         E3QYixjxczy0fOjhe2MX2tgAcX4uRQzdIlhtwqOeeXnmCXJ/cdS20BLb3YTiVFe4pF14
         ZZcg==
X-Gm-Message-State: AC+VfDxUG+QwDXHDUBtmRejRAjXgRhc5sTwUv4lJRRzLe5ZYl8LfBNZH
	gDmJsZ0pMiK2/PoYGHkUUPm8Bw==
X-Google-Smtp-Source: ACHHUZ5uobz/omWHn5suWrUkzrTkBzpmD/f63IcO56rfuCbjWofaJT0wtqRIazvDS1RzoQKBzvVilA==
X-Received: by 2002:a05:600c:214f:b0:3f4:23cd:6dcf with SMTP id v15-20020a05600c214f00b003f423cd6dcfmr14235255wml.15.1683897125511;
        Fri, 12 May 2023 06:12:05 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id v10-20020a5d610a000000b0030647449730sm23461965wrt.74.2023.05.12.06.12.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 May 2023 06:12:05 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 12 May 2023 15:11:42 +0200
Subject: [PATCH v4 11/13] drm/panel: khadas-ts050: update timings to
 achieve 60Hz refresh rate
MIME-Version: 1.0
Message-Id: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v4-11-2592c29ea263@linaro.org>
References: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v4-0-2592c29ea263@linaro.org>
In-Reply-To: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v4-0-2592c29ea263@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Sam Ravnborg <sam@ravnborg.org>
Cc: Nicolas Belin <nbelin@baylibre.com>, linux-amlogic@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-phy@lists.infradead.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1576;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=PM1rVoTLiKdVLACMoQ2eP/3H3+GG4xHNSxcdM1deMu0=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkXjsWCqwAYpj12TIzbwlkf9rcKbazvmpNPhFYFGGi
 4wO5G1CJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZF47FgAKCRB33NvayMhJ0VpWD/
 9DOHdC5AgFrJ1Q9ndeQRh8i4b4H6g8HoCtu/gw1crViqRJUFlOcGhexl5J2mfmiB6r7lsT9+dO/n5b
 rjMPRX/2S8rSw3L15zq+0Ru0idzsr3SCRWs9U0b6xd2EAu0/XKtJdnavjO/nSqVUXbnW0VDZGTW3Pd
 vqcYT0xocfyBd+3kFjqsTRTq7zW9/0+0i7rYYJGfXedE6QIZc5P2NzcfecyBxtltL/o9IMVcDriJqV
 Ox5v4fHagv2aC5O2OrqeqbUdl7i3MnB5W3eshagZwHdXPsWSFeiw8I7WqZ+r2zHe0uD0Ms/oQzgWC9
 nzqUOwazrnR4UBkpkmAOinQDVXpOoviv7qB9TrvIUB37UMJbgmo/wGgPnvbX7aF1RgUQ9ywHDEwmmv
 pvr7YIuF+sMUbDfQGeYfTnjVNYjXWaDRQbbqkZRuLrUaKhKhXOOxmzTfaaRVue4aMXMgNKB3pgwT/3
 IJMg+o4O7TrsSIArWSik5wlsf+pFcT6oDxrKsVqoGzoK3EwAWZZgDcCwskZv/S/Bn8g/86Jh1NX0U0
 uY33smO/L190yI4FYLJd917+c6M7PFebcRd7Lm3+zVYFuFcx9FHYNkhsMqU6d3ZoV4mXrQe0EkDUMs
 F25zx1aZ+UIoKSCg/Ji5H8mByAcYHjH6hn5ziy2VenKxjpoZvIKultpyvFiw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230512_141210_357133_B252D5BF 
X-CRM114-Status: GOOD (  10.36  )
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

This updates the panel timings to achieve a clean 60Hz refresh rate.

Link: https://lore.kernel.org/r/20221025-ts050-timings-v1-1-5c824bbb24d9@linaro.org
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/panel/panel-khadas-ts050.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-khadas-ts050.c b/drivers/gpu/drm/panel/panel-khadas-ts050.c
index 1ab1ebe30882..b942a0162274 100644
--- a/drivers/gpu/drm/panel/panel-khadas-ts050.c
+++ b/drivers/gpu/drm/panel/panel-khadas-ts050.c
@@ -568,7 +568,7 @@ static const struct khadas_ts050_panel_cmd init_code[] = {
 	{0xfb, 0x01},
 	/* Select CMD1 */
 	{0xff, 0x00},
-	{0xd3, 0x05}, /* RGBMIPICTRL: VSYNC back porch = 5 */
+	{0xd3, 0x22}, /* RGBMIPICTRL: VSYNC back porch = 34 */
 	{0xd4, 0x04}, /* RGBMIPICTRL: VSYNC front porch = 4 */
 };
 
@@ -717,15 +717,15 @@ static int khadas_ts050_panel_disable(struct drm_panel *panel)
 }
 
 static const struct drm_display_mode default_mode = {
-	.clock = 120000,
-	.hdisplay = 1088,
-	.hsync_start = 1088 + 104,
-	.hsync_end = 1088 + 104 + 4,
-	.htotal = 1088 + 104 + 4 + 127,
+	.clock = 160000,
+	.hdisplay = 1080,
+	.hsync_start = 1080 + 117,
+	.hsync_end = 1080 + 117 + 5,
+	.htotal = 1080 + 117 + 5 + 160,
 	.vdisplay = 1920,
 	.vsync_start = 1920 + 4,
-	.vsync_end = 1920 + 4 + 2,
-	.vtotal = 1920 + 4 + 2 + 3,
+	.vsync_end = 1920 + 4 + 3,
+	.vtotal = 1920 + 4 + 3 + 31,
 	.flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
 };
 

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
