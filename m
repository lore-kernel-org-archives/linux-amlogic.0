Return-Path: <SRS0=K5c1=PX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3F68C43387
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Jan 2019 12:33:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C4EDD2085A
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Jan 2019 12:33:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JJufPtt6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="HBom914s"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C4EDD2085A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MKQF3DFJYPxgIyqzbWxTWo22TNV3gyrkRG6vNcHlWdk=; b=JJufPtt6KoZ4c+
	adKLvBKa6SZFnl4nibSnyMZbFNw0B1DTUDsVGvyoLIwloiuJs5RKZbbIBcIALrCL/SUMhApmR3Nw9
	rQhkixG/Tt3ZmzAZd5X02V8Kk8IrpzIg+GHFlGBmQ3cOZzDD4MX6BZt3bc0OMmSFInfaxNY6PDrRS
	JggP7oxoPmG4lt3OgLphjj5GKKifzybQaRSQ5lA/92IhnhYfYAZ1UuRH78klRp5AKALPb4v4pC8+i
	Zb0zxl70VxWEWtH1+R4UzvoznNYQEVar9KwP0gEgCk/34TZ4QAGqLrC8sEauBUumfpvqgCKsaTZ+y
	rJ3aOmC1PwiPWPYC6FiQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gjNuS-0006r9-W6; Tue, 15 Jan 2019 12:33:37 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gjNuJ-0006gt-VR
 for linux-amlogic@lists.infradead.org; Tue, 15 Jan 2019 12:33:32 +0000
Received: by mail-wm1-x342.google.com with SMTP id n190so3130214wmd.0
 for <linux-amlogic@lists.infradead.org>; Tue, 15 Jan 2019 04:33:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BUfwTqoMPR8UzZypqTJDh+Fm2T1kEFvs4nZ2QeLkUPU=;
 b=HBom914sYtVT9MM8OI9PQvgsUTpfwAJCnkLKf+GefDBt8AtPBp2tzzJLJtrUm+mPSl
 +0gBwOJZsER9Gqm38ZLbuoH6RmEWkgbiJ7erf8bYqJdcmUxEvJk0qN1+f6jN5rSRCqVK
 FcN84FVaLaj+La8RqHisoqYhMwk6THvwL0MbBm2xNDAAGQfgm+x2mc1vc3L6a7UpSsMn
 OUhUELnnOflCgH+oL6UooWbw3YRkOcqjarKCCghcXn9amxY//Dhwv3UQhdO0ma9IOtwV
 m19XnKAoW/UxBC059wTfRje/gaFyiN1QFa04qVfM0jlhF3p1mvzqJXaesDfNJzwqubgA
 FlgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BUfwTqoMPR8UzZypqTJDh+Fm2T1kEFvs4nZ2QeLkUPU=;
 b=c6opN0UHQkJ30C0Lkxu4NxCptBb/Q+6DiYTo4g6CufkZHC1/bTivoXpgSyjn6w6Hi8
 lI7oe1adtlPXdHCTBsButnBETwqzEXRJuJWjs3PlCNt9TurdYnvn45X2Rt2mOSGkDWgV
 SvMEtNt23q9b8AOpB+9cgKo2z59pnz1eWzEqrplicqFMmv9kQQDx6vfzmgDBlrNH0ope
 +jT6DuGldwGbS3fDsxA6HmQg51Co2nOnl2nmO+HPNI7vCjvRSHFbQX/JqeREDLaoPRMy
 lm95pimf+yncznrfFjD3lPt38K51XGgFYIPVx5RFa6BTeIYR3myYmpUXJ0I3AOJCLfXL
 BRbw==
X-Gm-Message-State: AJcUukdqKe6ebYcmQ+J0inDXGfRgapt44aLVZvAuWIF+3pjJvufaws4g
 vDsQUUEgeyB+lMLpryFxZiEqOA==
X-Google-Smtp-Source: ALg8bN6BxR3WgrQy7Tb5sH0N7HiyYqaHgXyfiWbKrC9IbeBRedCzujVGXEcsa2J5be40krADBnmm7w==
X-Received: by 2002:a1c:c2d5:: with SMTP id s204mr3488704wmf.144.1547555606337; 
 Tue, 15 Jan 2019 04:33:26 -0800 (PST)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id x15sm75658842wrs.27.2019.01.15.04.33.25
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 15 Jan 2019 04:33:25 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com,
 Philipp Zabel <p.zabel@pengutronix.de>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 maxime.ripard@bootlin.com
Subject: [PATCH 5/8] drm/bridge: dw-hdmi: support dynamically get input/out
 color info
Date: Tue, 15 Jan 2019 13:33:12 +0100
Message-Id: <20190115123315.11069-6-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190115123315.11069-1-narmstrong@baylibre.com>
References: <20190115123315.11069-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190115_043328_463587_F05A0C35 
X-CRM114-Status: GOOD (  14.09  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Zheng Yang <zhengyang@rock-chips.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Zheng Yang <zhengyang@rock-chips.com>

To get input/output bus_format/enc_format dynamically, this patch
introduce following functions in plat_data:
	- get_input_bus_format
	- get_output_bus_format
	- get_enc_in_encoding
	- get_enc_out_encoding

Signed-off-by: Zheng Yang <zhengyang@rock-chips.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Tested-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 28 +++++++++++++++++------
 include/drm/bridge/dw_hdmi.h              |  5 ++++
 2 files changed, 26 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 4a9a24e854db..bd564ffdf18b 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -1810,6 +1810,7 @@ static void hdmi_disable_overflow_interrupts(struct dw_hdmi *hdmi)
 static int dw_hdmi_setup(struct dw_hdmi *hdmi, struct drm_display_mode *mode)
 {
 	int ret;
+	void *data = hdmi->plat_data->phy_data;
 
 	hdmi_disable_overflow_interrupts(hdmi);
 
@@ -1821,10 +1822,13 @@ static int dw_hdmi_setup(struct dw_hdmi *hdmi, struct drm_display_mode *mode)
 		dev_dbg(hdmi->dev, "CEA mode used vic=%d\n", hdmi->vic);
 	}
 
-	if ((hdmi->vic == 6) || (hdmi->vic == 7) ||
-	    (hdmi->vic == 21) || (hdmi->vic == 22) ||
-	    (hdmi->vic == 2) || (hdmi->vic == 3) ||
-	    (hdmi->vic == 17) || (hdmi->vic == 18))
+	if (hdmi->plat_data->get_enc_out_encoding)
+		hdmi->hdmi_data.enc_out_encoding =
+			hdmi->plat_data->get_enc_out_encoding(data);
+	else if ((hdmi->vic == 6) || (hdmi->vic == 7) ||
+		 (hdmi->vic == 21) || (hdmi->vic == 22) ||
+		 (hdmi->vic == 2) || (hdmi->vic == 3) ||
+		 (hdmi->vic == 17) || (hdmi->vic == 18))
 		hdmi->hdmi_data.enc_out_encoding = V4L2_YCBCR_ENC_601;
 	else
 		hdmi->hdmi_data.enc_out_encoding = V4L2_YCBCR_ENC_709;
@@ -1833,21 +1837,31 @@ static int dw_hdmi_setup(struct dw_hdmi *hdmi, struct drm_display_mode *mode)
 	hdmi->hdmi_data.video_mode.mpixelrepetitioninput = 0;
 
 	/* TOFIX: Get input format from plat data or fallback to RGB888 */
-	if (hdmi->plat_data->input_bus_format)
+	if (hdmi->plat_data->get_input_bus_format)
+		hdmi->hdmi_data.enc_in_bus_format =
+			hdmi->plat_data->get_input_bus_format(data);
+	else if (hdmi->plat_data->input_bus_format)
 		hdmi->hdmi_data.enc_in_bus_format =
 			hdmi->plat_data->input_bus_format;
 	else
 		hdmi->hdmi_data.enc_in_bus_format = MEDIA_BUS_FMT_RGB888_1X24;
 
 	/* TOFIX: Get input encoding from plat data or fallback to none */
-	if (hdmi->plat_data->input_bus_encoding)
+	if (hdmi->plat_data->get_enc_in_encoding)
+		hdmi->hdmi_data.enc_in_encoding =
+			hdmi->plat_data->get_enc_in_encoding(data);
+	else if (hdmi->plat_data->input_bus_encoding)
 		hdmi->hdmi_data.enc_in_encoding =
 			hdmi->plat_data->input_bus_encoding;
 	else
 		hdmi->hdmi_data.enc_in_encoding = V4L2_YCBCR_ENC_DEFAULT;
 
 	/* TOFIX: Default to RGB888 output format */
-	hdmi->hdmi_data.enc_out_bus_format = MEDIA_BUS_FMT_RGB888_1X24;
+	if (hdmi->plat_data->get_output_bus_format)
+		hdmi->hdmi_data.enc_out_bus_format =
+			hdmi->plat_data->get_output_bus_format(data);
+	else
+		hdmi->hdmi_data.enc_out_bus_format = MEDIA_BUS_FMT_RGB888_1X24;
 
 	hdmi->hdmi_data.pix_repet_factor = 0;
 	hdmi->hdmi_data.hdcp_enable = 0;
diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.h
index 7a02744ce0bc..2e797f782c51 100644
--- a/include/drm/bridge/dw_hdmi.h
+++ b/include/drm/bridge/dw_hdmi.h
@@ -142,6 +142,11 @@ struct dw_hdmi_plat_data {
 	int (*configure_phy)(struct dw_hdmi *hdmi,
 			     const struct dw_hdmi_plat_data *pdata,
 			     unsigned long mpixelclock);
+
+	unsigned long (*get_input_bus_format)(void *data);
+	unsigned long (*get_output_bus_format)(void *data);
+	unsigned long (*get_enc_in_encoding)(void *data);
+	unsigned long (*get_enc_out_encoding)(void *data);
 };
 
 struct dw_hdmi *dw_hdmi_probe(struct platform_device *pdev,
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
