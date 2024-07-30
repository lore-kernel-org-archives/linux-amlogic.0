Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44D3FC52D54
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 Jul 2024 12:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1a95Eo6zepnVFpQ2MBoM24lS8bnqY3jUVs6+BoiQMwc=; b=ZDMogGuc+X/bLv
	xRBuR+Mtx+hJmugKH3tUxz23ltT4KL/K6kkhJvJ07DN562cVvy6yJuyhsT0y9ufcpcyEu3okK1UA9
	P/q4sIM614d8AxU1ahfCgCRwcSBiAyYA0zFf3ovpUbvl6zWmr97hXYx8214nL6LghvJxT2gxeZRhr
	GyhxJIJBqBYIiSojL+X5n1jIBJxbquqExdrc3k/mRgh8HigwKPBofZaQxiAC49yJFXmNjPYq6HeHe
	YDHBSW7+ZdNC8iCzJarC4t4X81SMkRgKdCJN/jWxAZUGo3r1DNfKjYe8tnLV0GPYxMV2eTp9hO38b
	P8O1u7/tGXRyvZlLs9Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYmJS-0000000FA0w-3hTF;
	Tue, 30 Jul 2024 12:50:46 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYmJM-0000000F9uJ-3Ywm
	for linux-amlogic@lists.infradead.org;
	Tue, 30 Jul 2024 12:50:42 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-42809d6e719so26935285e9.3
        for <linux-amlogic@lists.infradead.org>; Tue, 30 Jul 2024 05:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1722343839; x=1722948639; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nb/qSKjbB/ZuPlpTHCI0SwTZiwfEpxk2uiLYY2slQL4=;
        b=D3uPSOjXVoK7wKlkSwsWcVV9Nnq+WSqwESXZl/H8V5SM95SON3xDel8zFxTfxsaz5m
         tgnM2qm7wf9vHCMjbK7xdnf3Up5jqIgCVmgthRLmdTzFx/nU8AQ7z4N/NI2xaaIHjlfu
         dIzjz2lb09IiDTRbhyTkl50oaWnofC1n4EQVDdIGrRIGxRcChWEtz9D/Hf5lh5kMz5M3
         jhr9FqQawqSD8Rbs0g3kM2rU7YMDIPzD1paY5J7DWkzXdeu/gEa3RHXfdw+FeB4L4Ng+
         Hw8y5bU3/XjviezcXbn6ITz6WVsxHYcZ19mnfnyer43a2O60XQTmmR5a8AimM7kWXgKQ
         aWeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722343839; x=1722948639;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nb/qSKjbB/ZuPlpTHCI0SwTZiwfEpxk2uiLYY2slQL4=;
        b=jFnQp/SzwOMRxL+gHgyuMOuZPNRlTLZmLgfl4fRu9zCxW/XdHcS6VjvzmSTZdDMPXt
         Z9PvrSkBdfnJo7EoNUD9/RYnosiD5fV9vUvR5/DFC8fD/kWpc2jKRqdXdSwe3PUc0r/7
         aqQ4GZGbf/UzyeWiYhFrh6uCHUPJ+bAxh77nGo2Q9es5Ak7IbDTCNGXZawtIeJFTWEwS
         PJhFl+voUa43m+lykQTS6LtqWcQ2jZzuk4Y4+OflU2OC8TlQDZQy/uG2pxhqaO8UKEs2
         4QK1dYAoUyaxdDJaxOM57tSGaneFdOjkADL8zMyymDPGfOUWBW2OlKZ2NCfWeW/fnFdW
         qGfw==
X-Forwarded-Encrypted: i=1; AJvYcCVglIvEQczBY6o/yKDnGk2uvL6A9OhdSmq+X+GLk2ZTL4tGUoBkunpwqUnGmu/XGLxKrlOj0JDa+suQXXJ21u36PCFbRGkqZS9IZcFYDKEuF2U=
X-Gm-Message-State: AOJu0YzhAQkzqGbsYwcdiXa/Pxrr3kYUS+QhmzecHOy/UJsRN5GJCx93
	nQGW0bUrtjpS9RvCv30exeJ0AW5uGfywakSUNLooa7gqMXlYt65XS6Nri7Idal4=
X-Google-Smtp-Source: AGHT+IGtrN/qyndOtU5EbVTBBPgvlT3scXPmXKI31g3Y8pvJ2hEwbqVrraWIOB4B+x6XQNOoMWE1ow==
X-Received: by 2002:a05:600c:1ca3:b0:427:dac4:d36 with SMTP id 5b1f17b1804b1-42811d73a0cmr67316145e9.7.1722343838742;
        Tue, 30 Jul 2024 05:50:38 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:291e:4a48:358e:6f49])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-42805730e68sm216521405e9.9.2024.07.30.05.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 05:50:38 -0700 (PDT)
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
Subject: [PATCH 5/9] drm/meson: dw-hdmi: split resets out of hw init.
Date: Tue, 30 Jul 2024 14:50:15 +0200
Message-ID: <20240730125023.710237-6-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240730125023.710237-1-jbrunet@baylibre.com>
References: <20240730125023.710237-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240730_055041_057089_96350579 
X-CRM114-Status: GOOD (  13.00  )
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

This prepares the migration to regmap usage.

To properly setup regmap, the APB needs to be in working order.
This is easier handled if the resets are not mixed with hw init.

More checks are required to determine if the resets are needed
on resume or not. Add a note for this.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/gpu/drm/meson/meson_dw_hdmi.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
index 5cd3264ab874..47aa3e184e98 100644
--- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
@@ -581,11 +581,6 @@ static void meson_dw_hdmi_init(struct meson_dw_hdmi *meson_dw_hdmi)
 	/* Bring HDMITX MEM output of power down */
 	regmap_update_bits(priv->hhi, HHI_MEM_PD_REG0, 0xff << 8, 0);
 
-	/* Reset HDMITX APB & TX & PHY */
-	reset_control_reset(meson_dw_hdmi->hdmitx_apb);
-	reset_control_reset(meson_dw_hdmi->hdmitx_ctrl);
-	reset_control_reset(meson_dw_hdmi->hdmitx_phy);
-
 	/* Enable APB3 fail on error */
 	if (!meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A)) {
 		writel_bits_relaxed(BIT(15), BIT(15),
@@ -675,6 +670,10 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
 		return PTR_ERR(meson_dw_hdmi->hdmitx_phy);
 	}
 
+	reset_control_reset(meson_dw_hdmi->hdmitx_apb);
+	reset_control_reset(meson_dw_hdmi->hdmitx_ctrl);
+	reset_control_reset(meson_dw_hdmi->hdmitx_phy);
+
 	meson_dw_hdmi->hdmitx = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(meson_dw_hdmi->hdmitx))
 		return PTR_ERR(meson_dw_hdmi->hdmitx);
@@ -765,6 +764,11 @@ static int __maybe_unused meson_dw_hdmi_pm_resume(struct device *dev)
 	if (!meson_dw_hdmi)
 		return 0;
 
+	/* TODO: Is this really necessary/desirable on resume ? */
+	reset_control_reset(meson_dw_hdmi->hdmitx_apb);
+	reset_control_reset(meson_dw_hdmi->hdmitx_ctrl);
+	reset_control_reset(meson_dw_hdmi->hdmitx_phy);
+
 	meson_dw_hdmi_init(meson_dw_hdmi);
 
 	dw_hdmi_resume(meson_dw_hdmi->hdmi);
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
