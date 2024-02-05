Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 032AEC48297
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Feb 2024 17:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cLTueFW61W0CbfcpXlZYuyb89RXczNMnXZvxU3Y+sy0=; b=hqkrzCWoYQPUSF
	4LrPhMxu7ns7+dIU6krGEoozeA4YLzRb6gpToQkA/TO4p//VRtSjUlXv6vntDoH6WyVcIsMAhV36/
	N6VVUGPa38aXISovwAZJDw2PXuzpCOtDKA8ocY8tePlPLgrbsFaWawjTmbqNjgaSeYXYu8yQw335l
	kkkycsZX3OcBgnbkVQyOd3mMPILi+0H+HU8NmrMFecyuXLvcZ1wfW+Fg/b8AGjyVlPhjBSQoQjTrD
	9obK/MZJmtQCKYKWXb2fcOQbsaVNUE9pOCCu7g+EehPxJYLJDRwcgiTWH/lTXtOJu4hhF7VG0Tl5e
	lRghG//jvQ2lFkvT96ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX3CL-00000004GVS-35m3;
	Mon, 05 Feb 2024 17:56:01 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX3C2-00000004GCj-3nhv
	for linux-amlogic@lists.infradead.org;
	Mon, 05 Feb 2024 17:55:44 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-40fdd65a9bdso7455085e9.2
        for <linux-amlogic@lists.infradead.org>; Mon, 05 Feb 2024 09:55:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707155741; x=1707760541; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/kTGO29vezq1Gc7J5O9OI72ko2OnA3sM69gX9LY6c8Y=;
        b=cgbTrtK3pXnM9XDQVTvMg0diBMlpAUS9paN/68+jkquW48t0T97/ffKOz/bQifwqJp
         sxdXSje1Ru4h45ISQE+MJJTjZ4pxH0wLL+cXiveLIvj805FppBqZaKPd3yW2+uMQMS1M
         1lSAZLRxIPuHUToPph3IGhNzpuIaIopJ5614AhVXq96X6AbmouPAaJqkTH4H24oXnwZC
         VnnoMWQDmxt8B7ZacyOc1hAZGiMFEfLgIr34CeLQWVST2biK4m4dwqXLcTW8FV0OOqov
         kDGIBd6Nom99WtBM3D0txAACpNCj/Hppun/rOZuxeBGYlIsFwGSFVYnyjtgV+TQbHeOG
         sjxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707155741; x=1707760541;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/kTGO29vezq1Gc7J5O9OI72ko2OnA3sM69gX9LY6c8Y=;
        b=p0HbykjhCr1mbt0/BmxFObm766vv7obawKimK0CyamYjXUzP+O6CmrK/MZPFyBmS+K
         UT0NL4pCLa+IWWHX/4TRy2rBHjcPKxY2nE4EBYPIxbKflHdagUi9dNXJNWSGms1dCb43
         PTBSKQfIERDyI0fVDl8IpwiCDsSl/YrW9DRI4t9kbTSZrgafzmrFwvgapwuCNO0nU84s
         BexBjTtAXHj8K0D7twNyTmiZmS0PjRYVJsYo3tUMgSOQZgA8JP9yZl/l8t0GfvGUwUvk
         mt5q0KCda9+NarPIDezOlA6g+0XH2fLEtHKjApYkEpAkm2BVQPzzdj42+1plcixc6UTe
         g6oA==
X-Gm-Message-State: AOJu0YwRp9U1hNNMEnPuYkW93p/OnMZnp0bFWdlnvLKiPJBUuVoiTZbH
	7j5X8Asoj2n0fSBmPsWhTNPOZn4ecvARQuS37yfrSShe98TzZhcqV4oakQ0QfG4=
X-Google-Smtp-Source: AGHT+IFaTHgGhy9XHjQX3HZeB2JEULMM1CNBGC9GZqY1QPaVhgAIUfcH9PYMzLk1SOsavnXKC+2l+g==
X-Received: by 2002:a05:600c:1c02:b0:40e:f67d:d5f9 with SMTP id j2-20020a05600c1c0200b0040ef67dd5f9mr355270wms.4.1707155741431;
        Mon, 05 Feb 2024 09:55:41 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXv164Rb/MjNSq/GnHSz2slhbj77T70wXKz076hC/kAWvtWZyXcRewm4yYlOnItzMT+KxRBmLo7ILUP9U+uktRLSu+wywU9KC6I9zzfHukz82cZFIZUZ0crw8ZUQLUdif/0PUH1v/Qb7xyx9raAFJeQBvdGhsSAEQuLppe1OQlipq4cLsmGvgNgxdq6O4syZeQgHAk1oYfrgxgPSOv6U0IMrHoDO4z4FaP6pRhJJwc0+IuwTRG2tdTRBLFYGTqaAZHbvkXCcJV9iJM2BIqqDzVRr3JXV8SUx5pB3dSfC+BTyDbgb3OrFmBWNQ2S1qeRE46NRzyxELs3GKOBh4K4Kde2f/5uT53Fuvjl5E//8GSyjS17ZDGGOZ0xCZlmTEKiC70W+m1V0G0COaHLbxFN07SqoF3vVYXJVr7pCdMz0Bg1GcBWfYQ3OG6sYg9JME0mty+HDfaOmYI6jvMcOK5KC1wrfbRbbz8bp2W2zHr7gqnvm1H/yv0qMk5Q3/z0lD/rHaEug6HpQ0sQ4UfsRmI2Hsr53CRRGmqLlGd/ghhuXwq1wv/vG3totXQhuT6LjnIyvgo3hIzUgg5GuGo51DYrxCRsGItu036VgUcP+XNt/ECkupMwDKZEeC9NJto+neqOvG2rT9/p2XZEFTw9vxU+Qi9tLlhuqjrx6zMth+HAkv3Afxt8WV7yoz8SwLoz/VPd2WWBCjfAirKw+LxsrjxKUKjATCLvIljk7Q5Izh949D6C1Hmv9/UZC4stlAZvYiWw9Tg=
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id je16-20020a05600c1f9000b0040ee8765901sm517556wmb.43.2024.02.05.09.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Feb 2024 09:55:40 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 05 Feb 2024 18:55:31 +0100
Subject: [PATCH v10 4/7] drm/meson: gate px_clk when setting rate
MIME-Version: 1.0
Message-Id: <20240205-amlogic-v6-4-upstream-dsi-ccf-vim3-v10-4-dc06073d5330@linaro.org>
References: <20240205-amlogic-v6-4-upstream-dsi-ccf-vim3-v10-0-dc06073d5330@linaro.org>
In-Reply-To: <20240205-amlogic-v6-4-upstream-dsi-ccf-vim3-v10-0-dc06073d5330@linaro.org>
To: Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Nicolas Belin <nbelin@baylibre.com>, 
 Jagan Teki <jagan@amarulasolutions.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1213;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=IE7LBQJSwmFpro9NRvngqeq31VcV/n9f72AsydUqbws=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlwSEVQAxTmc2Mi1THlqhQKITJhQ6jRe1YxMSAnbv+
 TbbdaV2JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZcEhFQAKCRB33NvayMhJ0cLPD/
 4sXVqcu6M0soSWNW7qB/VG2yRyCqRZlP+HfhrykDyTg+9WG9KEwllxNUC87INl9I0/eYkJbB8tjfl7
 cGB4wluRZIubLWb7oiOlwQOaAM4R0iWsXe16E+SHd0OEEaHrAcfqMdyYyKTD0jgfduGlGfCkoHCB+m
 Hhk1itzbJkMbTvD2TumjnjJ/g70e7CeEt0ez9UN4eDF0rAzQgDxJ9NfUj4oHJhBNgPrWvIKl0++dtq
 Q3pD3gCFhQwuD2DrW4gTZQObKmAHrRFGBqBFhIYOk83pALZmm39fXAuu1KVP+yt46ISyJ84GizN/00
 BKgKW/bJDNL+z8HdbFv6YeWKSP8Ey90aTF6YGPvcGIOj9E1a/ot5iTS5rLdNchvObxeGgCR8jdmbGZ
 ZzEkHtPwEn9rsrCLxUfxXu8HvIi5QBXrKPZAIp3ASTYIcIIKQcBMY5XzqpXreRGGv7rdgLqhuAAbYk
 wktdeESe7TNgfMqSMR1s0in5cmnjEf+BmouAgSpZQ0VJ+Ltr5vBgeaPISg5Ekxp1DJt8W+loq0b+Nl
 W7M2QYAbyZgXjq2biY1pfNtGUOTNkZc42VmAKHwupT5XlPdbarqKluglNXmlZ0NLB6OLw1RTX0EvDv
 qHjPNMXksmy+zHdIIwm3XpX6OUN3/xAjYHtHASedXPRN++zX/U7UTDUuu+oA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240205_095543_073771_A54B4C7D 
X-CRM114-Status: GOOD (  10.19  )
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

Disable the px_clk when setting the rate to recover a fully
configured and correctly reset VCLK clock tree after the rate
is set.

Fixes: 77d9e1e6b846 ("drm/meson: add support for MIPI-DSI transceiver")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/meson/meson_dw_mipi_dsi.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c b/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
index a6bc1bdb3d0d..a10cff3ca1fe 100644
--- a/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
+++ b/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
@@ -95,6 +95,7 @@ static int dw_mipi_dsi_phy_init(void *priv_data)
 		return ret;
 	}
 
+	clk_disable_unprepare(mipi_dsi->px_clk);
 	ret = clk_set_rate(mipi_dsi->px_clk, mipi_dsi->mode->clock * 1000);
 
 	if (ret) {
@@ -103,6 +104,12 @@ static int dw_mipi_dsi_phy_init(void *priv_data)
 		return ret;
 	}
 
+	ret = clk_prepare_enable(mipi_dsi->px_clk);
+	if (ret) {
+		dev_err(mipi_dsi->dev, "Failed to enable DSI Pixel clock (ret %d)\n", ret);
+		return ret;
+	}
+
 	switch (mipi_dsi->dsi_device->format) {
 	case MIPI_DSI_FMT_RGB888:
 		dpi_data_format = DPI_COLOR_24BIT;

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
