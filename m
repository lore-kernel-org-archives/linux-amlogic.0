Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03499C7EE2F
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 May 2023 08:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1EMdpENlTHqku9u8oidw+6bfCLG6zTswhNgCyTr775M=; b=R7ScOPCAMr7gfW
	PdXgdJY5dM7CBJL6whHu0C2h+AJUTB3R8mk7TGAgd83sHOS9BALYBWXHoq/5FbiG3Xp6hP/iLFjAX
	/piZd97YiA3pV1jZQqBJaGKwRWvG4V+O5GPYnVlTa5hPTiHCPP44JpSEDf5FRkVqRnb8NAxM3FpVF
	35WzNJly3kvGJnoX6CthFwUT7UIPxn0jTWs4e7Lqt759x3cobJmHDV+Z9vnK+UUjeEa3mXBprwSfD
	AkGmfvQtIvzI74+HqMWVy2gP08j/30cWwMlMN8J3MAxq3hyO4VshzjBXTOJc0dwkV3I9JWPWC9/Ug
	GcZCB+nA6VU/vRIbV8AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3utx-00Cyni-1s;
	Tue, 30 May 2023 08:40:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3utq-00Cyi6-0B
	for linux-amlogic@bombadil.infradead.org;
	Tue, 30 May 2023 08:40:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=iahTtbvqWeLBpjX1+R6MOcvn8qRZV/bBO4iQlxKXPRc=; b=MgpW4QaP7wRkv7Z05pyqiS8Wux
	2WXQbdbMP8OgsNCHF37QRnx76VGTv7J6qTivsq++927dSXLgunGjhWoWRPQGHrAHaO1tJF2ZcxQNe
	rEopJUol10zbAg/VAFOw9teV8mcV/G5EVGnq3/7eFExkzJ2EtDDeYLPUHTODXlV4hMw2aBEOhyMEu
	Oww2Ky0x4rLAABc8mBHeCBRCzz+9A8e0B3SC1MK1RrlFWmr+Ezv+Bwms+kgrsIJ7NaCznif7vk8vy
	mh04PRn+x27GDfNimk72PnQYiUiBdo1tHhU6DYgderdeMrGZiet6L7f1eIagGc2P8u3TINB9fRDXz
	WdYpJcSg==;
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3tw2-00DbtQ-1d
	for linux-amlogic@lists.infradead.org;
	Tue, 30 May 2023 07:38:38 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-3f6d7abe934so27245415e9.2
        for <linux-amlogic@lists.infradead.org>; Tue, 30 May 2023 00:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685432303; x=1688024303;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iahTtbvqWeLBpjX1+R6MOcvn8qRZV/bBO4iQlxKXPRc=;
        b=qKIJNodFI1eDSMKvOuX+HN31BbwkJxrLHUnP+3O5xRrglxzicL47QtkmEZyZPTZ+ED
         xQ1T5DZbGNH5okD7A4EFrbGC8/vImRvcHlTUNzio/XYVnBEajm9idnuEKUPFQliKXaxl
         DfmuD1Y59t/Snu0y7i6OGE6oZU9yeDJNBnp1g5HXnCNYjJ8ovgIbx8p+hib7niIK/eoX
         2tE3z0UinH99WlDiFzmR917ZB2bai/NQvIgPxUj7r+A+e9GFwsrJesHiCWGuBi/vCu5M
         K83y7juuBVpBYBxF6ZJIjaueFylPdy7kuB1dbJT2CHRIHMPlpd7B7chZEHxYbYcPvOM0
         MEug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685432303; x=1688024303;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iahTtbvqWeLBpjX1+R6MOcvn8qRZV/bBO4iQlxKXPRc=;
        b=BAON5dUheT5Uft929E+I1S5l2F0zAXCfiWePIzAGDkMd19VzDYRST8AxOavt0lJyv4
         XKjYWfhWlxctZ+D23qEr8El6n+0GVK8ly9HBC2ESoU0iUAPc75OVBTw1VaTTL2pp0fXy
         L9VrLXk6KzruSn76nUZ8mlSvcKbNO9kfHhWngYuvTYusdXLCltk+qrx93ZEIPYZoKHvM
         WgkJ9tROCmOIjweQwdWtkNg1dLDrXBi+U+sQhetPx2ymx8f25FA2pZBFnCeVS3FsMJNP
         dV5weo9D84qmrEefJ5rMeRQhc0lVbgWjA6qXo3EhvG/5Wqeqw0B+1utP/oG+qZxldHQI
         Sy9w==
X-Gm-Message-State: AC+VfDxdN6fUB3rV7ZoYhxzqwQP2kGkasRZXrTl3XR+1E/adj+1BOYxa
	R31YTXDJeum+zYry1gv2DdwNNQ==
X-Google-Smtp-Source: ACHHUZ7hEv+SRU+om5OwekpJritdJ/v9ZXDhPMZ+N2a+X/vXmaRr91zRHO9sgLtMSUvFH4uBhSUDtA==
X-Received: by 2002:adf:e8c5:0:b0:30a:f2a5:83dd with SMTP id k5-20020adfe8c5000000b0030af2a583ddmr853668wrn.7.1685432302819;
        Tue, 30 May 2023 00:38:22 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id m4-20020a5d4a04000000b003079c402762sm2312013wrq.19.2023.05.30.00.38.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 00:38:22 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 30 May 2023 09:38:09 +0200
Subject: [PATCH v5 08/17] drm/meson: fix unbind path if HDMI fails to bind
MIME-Version: 1.0
Message-Id: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v5-8-56eb7a4d5b8e@linaro.org>
References: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v5-0-56eb7a4d5b8e@linaro.org>
In-Reply-To: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v5-0-56eb7a4d5b8e@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Sam Ravnborg <sam@ravnborg.org>
Cc: "Lukas F. Hartmann" <lukas@mntre.com>, 
 Nicolas Belin <nbelin@baylibre.com>, linux-amlogic@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-phy@lists.infradead.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2139;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=8CpWFO/23ohWXtlw9VlUvRSsoZjkvEPG4DEcAI5MYHo=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkdafgS67it5Xd/IPSiDYVRkKBdEU3k4dSZcRJg6IY
 IKzsY56JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZHWn4AAKCRB33NvayMhJ0VUhEA
 DBaG9ujzD1I8t4CF/PcaEnEZkX3oRDTeUQ2mqXuf8uqKMsWiwUq4ejxXcT3M9558+/alirvGZSMGJR
 je5yXs+uY81A+lDAN/Kfki1r5nLbnqchdCedEoVmGvFwsnzV/kgppLF9dnxOflfOb2BS3BccuktlSL
 I6v0HTTCGbUJaDDms7NEHyl55fK0+CB7BCXNf68MpylOUs548WCOy8fl2QcPeR05x1BRjOIDHQT66Q
 XY0Kh1vJYWOe7xhxE1oCFrJqYdv0s+w9WIIF5QjNd54oUF1/jCVL26uYwy6QniOrq+quZU4vav2B8A
 9x3xioYs6uEAbKQo8WCDtg/7xMRg+6436OB/XKOSITB/1bCelI1aAYCOhaJ2uf4uGhESocQtsgfS+y
 1Sz6eUxltr2DVz6vtzP5PIjalX4CvEzPEbBZdRdnLWpoxVCbI5PJIUtLDNSTEwxsNMm2I4jM5VcjmD
 gdhMqkdV2yk/e7tSqEafcitTrOsrcQoFgbWgwDLYvTTUCIsmpat11MkLYGrODn/SjzfM0m2yYz9dc4
 PyUwkUPBoyGcjqdSadGHYXLggtZQ/8WOTu9EUQPxzU3Tv8nQdfdkbWp4JsglxXP+A2HOxZYYFzib8i
 Kp0vzZvGcm36bLWM3Btf2WRSkwVaM/nsMwg2nO/4Uq5h5NhDaL067x7/sKOQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_083829_432946_5BAC92E6 
X-CRM114-Status: GOOD (  11.64  )
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

If the case the HDMI controller fails to bind, we try to unbind
all components before calling drm_dev_put() which makes drm_bridge_detach()
crash because unbinding the HDMI controller frees the bridge memory.

The solution is the unbind all components at the end like in the remove
path.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/meson/meson_drv.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
index ca6d1e59e5d9..e060279dc80a 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -316,32 +316,34 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
 		goto exit_afbcd;
 
 	if (has_components) {
-		ret = component_bind_all(drm->dev, drm);
+		ret = component_bind_all(dev, drm);
 		if (ret) {
 			dev_err(drm->dev, "Couldn't bind all components\n");
+			/* Do not try to unbind */
+			has_components = false;
 			goto exit_afbcd;
 		}
 	}
 
 	ret = meson_encoder_hdmi_init(priv);
 	if (ret)
-		goto unbind_all;
+		goto exit_afbcd;
 
 	ret = meson_plane_create(priv);
 	if (ret)
-		goto unbind_all;
+		goto exit_afbcd;
 
 	ret = meson_overlay_create(priv);
 	if (ret)
-		goto unbind_all;
+		goto exit_afbcd;
 
 	ret = meson_crtc_create(priv);
 	if (ret)
-		goto unbind_all;
+		goto exit_afbcd;
 
 	ret = request_irq(priv->vsync_irq, meson_irq, 0, drm->driver->name, drm);
 	if (ret)
-		goto unbind_all;
+		goto exit_afbcd;
 
 	drm_mode_config_reset(drm);
 
@@ -359,15 +361,18 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
 
 uninstall_irq:
 	free_irq(priv->vsync_irq, drm);
-unbind_all:
-	if (has_components)
-		component_unbind_all(drm->dev, drm);
 exit_afbcd:
 	if (priv->afbcd.ops)
 		priv->afbcd.ops->exit(priv);
 free_drm:
 	drm_dev_put(drm);
 
+	meson_encoder_hdmi_remove(priv);
+	meson_encoder_cvbs_remove(priv);
+
+	if (has_components)
+		component_unbind_all(dev, drm);
+
 	return ret;
 }
 

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
