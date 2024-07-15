Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96B17C3DA55
	for <linux-amlogic@archiver.kernel.org>; Mon, 15 Jul 2024 06:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nDzlDVxdMa5IMjErA6d71oy4Lgag1c/KOugmC67u3nI=; b=4yH1/QaZ63tKbF
	SUKHB+n5Z7N650WuIPST3ky2BVlQph0yAnsvu6B0Gkw4qU3Hk4c27m+WBPazqtdaY55Z7LMmxqnz4
	J7XC7yVZOh04DDcqv+Ylyb1LSDmCplG6NIfQQ0EJGEKIUJGWmBM/tFwq2Mdm6DKb0PYJZGNouADam
	JOTUKwse/a09L1b4PKHnqREXG3AGuhj+WgOUzumRFjPV55zy8I/10LeDtXY6+K1cmePdP+QUY97Oj
	jR3shKP5V0yDRtSbGYYC6Vjh1ylOc4C8kpY68ZZbMmoXoxM4eSkRHAzNnwnebq0y4Zo8NpfV4IIXG
	hlH6P9LnfAVwDnJEW2YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTFHW-000000062x2-2TRD;
	Mon, 15 Jul 2024 06:33:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTFH6-000000062Yf-113Z
	for linux-amlogic@bombadil.infradead.org;
	Mon, 15 Jul 2024 06:33:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=cowQ2MZs44p/k7+ocTvDEJFCYMvt/Fw411UD/yRIuZk=; b=GdkjIz5R6mzFb6RLkp2x3iV1Qz
	XoG9F4+7jjo5kfea/iyT+E+alR9TM3f5ov93Ecd31Y5b0g1zev/RGPAHGhfdnA1nv0+4/jrDJ57it
	QU6P3C2pAjNclCPCeB6flAFHc96DQcb4JgAR+NBLTHWzQGT2MBjgxS1y4dg6YrjLs5bLh6Z7z6lWJ
	N1GARoZXsqOcUfYeMBKrRhhAOj+RmzZ94sy+2WCVG/ls963+gXfofHK5Q6rQwL/MRNwnmFQkFUtKf
	E4WFg2s9vixnmzYTz4wWYKk5Fa1Ac4fdHmjkgppc8cAsQx9sTqi2QJ5am+1EmH34nNX4ZyDQZGPKn
	9uPJR0NA==;
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTFH2-00000001kNQ-059U
	for linux-amlogic@lists.infradead.org;
	Mon, 15 Jul 2024 06:33:26 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-52e98087e32so4599042e87.2
        for <linux-amlogic@lists.infradead.org>; Sun, 14 Jul 2024 23:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721025199; x=1721629999; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cowQ2MZs44p/k7+ocTvDEJFCYMvt/Fw411UD/yRIuZk=;
        b=YFbDHi2bP/xqTJdmMqqyhyPh2AyZOMc1Lz+lbGVnE8A/iJoGkcdFq5uRfwltEIldjv
         W/RFJ4cicUaKx9bc+aUeY6XNXto3heySX65HOzYMxOgqtBDXg/4i5r+FxcrmmXhva00v
         JQYwiRbBtJHgSfPaHOgmvxrlSihEWxK+fbiKFvv+kRi1UYaJALA53r54OHqCjjfKBI4s
         GojmqoYrfHEpgkZyIAXta2rw+IZZ/vkWezduPARemd3NLaEFnYnTJLap2F4QMhJy8Vii
         wx8ye2ehYmFdGVMFh4BqTxRumnmWZzDp4ufGFItbj4gUihfTAbsZkdyEJOxfLQ9MbOqZ
         7/ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721025199; x=1721629999;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cowQ2MZs44p/k7+ocTvDEJFCYMvt/Fw411UD/yRIuZk=;
        b=sjZhs2rki3ASoIYKeUc6dQTk/M7zv/eIgFixryuMK+cbQa5i/2uNyy0hoIhBjjgk5x
         m1f03sa6RpGA4xRHN4eUt1umj41nWwq/toC7Yc+Rl1D2DkfkbCsEnz21s3phitHHey02
         h99+IjBhD5QMelcvrH3aP020OsC+1SsA1lRWqkJzXyngwREAPBsRRuxU4/ZDnCw2PtnZ
         TLy38xFTqxb+yNr4/jXtZFRwj0wpviezoiY5pOckhEn/77DgAwl/YJRtjZGzSGZVekHM
         jsY1ogrkm/6BkKGLgYzYjKlXd1kkGGH0R+47Y1WnnOwo6g8QCUiRyZtZFbLrQm5AzAMh
         jW4A==
X-Forwarded-Encrypted: i=1; AJvYcCWAproMJLEIYkDIBDhdXzfeFneaCZ/Ph2ACAl33KOx9wXSTzhNXmzTF859W5Vo2yWW6bE0txe172Lc7RwKNiv8S9XXSqfgobD9/Qe0D4B/pXag=
X-Gm-Message-State: AOJu0YxIFOiCZSKe3OQO6PBiSGJ0fU0ntpbS992J38K/5ljUTdq5tmxT
	Udhd5oJ6ZNyClws7CfVlUHb3xgRRyLhtVFtNVpJUucrBwYx7h+9DqDgDdf+fOU0=
X-Google-Smtp-Source: AGHT+IHap4bfADCMMdp+9/m6hrqUOR1BGeplBSV1y4IBIjYw8gKprZmmugJo1TIVKbdLpOyzSTxWyQ==
X-Received: by 2002:a05:6512:789:b0:52e:954d:3594 with SMTP id 2adb3069b0e04-52eb99cafa9mr9724397e87.52.1721025199105;
        Sun, 14 Jul 2024 23:33:19 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ed24e188esm743543e87.47.2024.07.14.23.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jul 2024 23:33:18 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 15 Jul 2024 09:33:05 +0300
Subject: [PATCH v4 5/5] drm/bridge-connector: reset the HDMI connector
 state
MIME-Version: 1.0
Message-Id: <20240715-drm-bridge-connector-fix-hdmi-reset-v4-5-61e6417cfd99@linaro.org>
References: <20240715-drm-bridge-connector-fix-hdmi-reset-v4-0-61e6417cfd99@linaro.org>
In-Reply-To: <20240715-drm-bridge-connector-fix-hdmi-reset-v4-0-61e6417cfd99@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, 
 Lucas Stach <l.stach@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Paul Cercueil <paul@crapouillou.net>, 
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>, 
 Edmund Dea <edmund.j.dea@intel.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Biju Das <biju.das.jz@bp.renesas.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Jyri Sarha <jyri.sarha@iki.fi>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 dri-devel@lists.freedesktop.org, igt-dev@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-mips@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-tegra@vger.kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2305;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=RSj/GL8gZoJdjbJyGkKZjzhqoxsZ6wLfYZiTk6CBwIc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmlMKpemzG8GiCsYpbPT9S1Ojj9SgO+0jwg1X5y
 9EPZPxXbKOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZpTCqQAKCRCLPIo+Aiko
 1RfqCACEDU19Qkxz5DVPRYkK7fDdQdzCC7Ex3ixU9rJztEg0cYygQQ7/N1TTSfpbHd/6dnXTQqr
 1EgcPH6TE+tH9eXXMheeF1OS/bhTuKARxi2wWkdHQUGUtyMj8mcHkHdrusMxtne+ZhGO/FIJ2xq
 Rbf1R+hLTh4esRtay58HxYpazr137omA9Gw8f5vvDWH+/fN0hvMicz3Eg/9i+0frpzphu+S7qVc
 FVZeAPpLqP6gaJGOvTRZRx1keGxL2vn+faVwbgsOyaVmNQjvZ71zl4YXnlV8oqwC/teMLyW6umJ
 AqBRzDQGS3iL3PzsMCTRPynE0PUtU41rhweY1t1X4Nq8Idxh
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240715_073324_467351_E334EC5F 
X-CRM114-Status: GOOD (  12.02  )
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

On HDMI connectors which use drm_bridge_connector and DRM_BRIDGE_OP_HDMI
IGT chokes on the max_bpc property in several kms_properties tests due
to the drm_bridge_connector failing to reset HDMI-related
properties.

Call __drm_atomic_helper_connector_hdmi_reset() if the
drm_bridge_connector has bridge_hdmi.

It is impossible to call this function from HDMI bridges, none of the
bridge callbacks correspond to the drm_connector_funcs::reset().

Fixes: 6b4468b0c6ba ("drm/bridge-connector: implement glue code for HDMI connector")
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/Kconfig                |  1 +
 drivers/gpu/drm/display/drm_bridge_connector.c | 13 ++++++++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/Kconfig b/drivers/gpu/drm/display/Kconfig
index 8c174ceb0c4d..3763649ba251 100644
--- a/drivers/gpu/drm/display/Kconfig
+++ b/drivers/gpu/drm/display/Kconfig
@@ -15,6 +15,7 @@ if DRM_DISPLAY_HELPER
 
 config DRM_BRIDGE_CONNECTOR
 	bool
+	select DRM_DISPLAY_HDMI_STATE_HELPER
 	help
 	  DRM connector implementation terminating DRM bridge chains.
 
diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 0869b663f17e..7ebb35438459 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -216,8 +216,19 @@ static void drm_bridge_connector_debugfs_init(struct drm_connector *connector,
 	}
 }
 
+static void drm_bridge_connector_reset(struct drm_connector *connector)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+
+	drm_atomic_helper_connector_reset(connector);
+	if (bridge_connector->bridge_hdmi)
+		__drm_atomic_helper_connector_hdmi_reset(connector,
+							 connector->state);
+}
+
 static const struct drm_connector_funcs drm_bridge_connector_funcs = {
-	.reset = drm_atomic_helper_connector_reset,
+	.reset = drm_bridge_connector_reset,
 	.detect = drm_bridge_connector_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,

-- 
2.39.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
