Return-Path: <SRS0=R0qk=Z3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47AA4C43603
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Dec 2019 15:35:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1823521823
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Dec 2019 15:35:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Osw9CmIq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="SsQlx0Ed"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1823521823
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9kebknWGpd+CGKnBRpf2nwSru3UIMxDgOq0rdkvqrmU=; b=Osw9CmIqZAG6Ck
	e08bvbDVkrA7jVN5LIqcVPXLxyCDP299FbWwn2SXWDkj6K4DSRQTDcnSz52pYLTRZUjj0Emf+kNUK
	bYqD8BsAfloImu1w6UxDPtDgL7A3g02yUHsHEwFYbXK/U4buvSXYwWiEiIvCeF7CT2nm6l973ibkx
	g5ZjpDRxtX3GCmFFT2FscAt5HPhF2mWvK0st6loUscy+LezFoZsMz56HpjqqH7ei8PN/rKJpTeDmI
	J1dBMVbu9Lj7+infDdmogcIyQo0UOV8mS4wIVMVT4V5sAEBqA0ozL3/B1Ute9OAMYrHFQ97WO3J08
	LKoU01Ccrr92hEdfH29Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ict9z-0005eP-PP; Thu, 05 Dec 2019 15:35:19 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ict8z-0003Uh-JI
 for linux-amlogic@lists.infradead.org; Thu, 05 Dec 2019 15:34:19 +0000
Received: by mail-wr1-x443.google.com with SMTP id g17so4178830wro.2
 for <linux-amlogic@lists.infradead.org>; Thu, 05 Dec 2019 07:34:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UaaaJx+p0JcZMcJnhGqWQZjIziF6Ba/MI0EsQk5V9qA=;
 b=SsQlx0EdEl63XJ/HnmbRpjA+iF4o0EXju+t87rSKoPFMp+JTSzYbVSxit2KzmBjYzx
 o64hxlj56w8J9TBpeUhcTwOeKq401gVOYgejhgGSIOVOe7csfMP6z2JPKNINHh+95D7P
 T1oGIjVQDgAu4YTBwBr5HhnnNSXqGQ/a9dprBEDJgSIHFPFn+2Uvfnxrf1IBZw9xj/XT
 R55tIodbyRoG06aEswk/uEcMlwDZbCL5QSpcB21HE4mjKOPyj5mw1Wjt7/8zsG5CYFzl
 EcVObHYYUD5j2GyDtYbPIth5sUPk0iZnglS7xmTC+0LHxOeFv6r+rRzoNCAh0G1drmnr
 Hj5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UaaaJx+p0JcZMcJnhGqWQZjIziF6Ba/MI0EsQk5V9qA=;
 b=Q9tziST+LpQi4V+43C7u8AZ893S5sP3wMI5ut9JwB4Ywl1dZDYzIazTRhgI719NDS0
 AzwfI3Bia0l/3k+bvoOqcJw46coVzxsqJa1vvN3bd6WhtywhlbSp/nw86pdi2HP83wTe
 iSvxo0HmsFsNWJPjZJNWOzWNitz/y/80N2klFATtqBwINJI+rb3pHOSFQzft+2Z6Z/2U
 wNFWOnPRHviRWSmlaksF+cWovzUfOad/kXFj61+2GSROOSAaDcYthsIK45M72U2rVNl6
 DIlFXln8agKIbFmjqnXCXMTM7tK8EjwC1DUuvTNGeCdXqvRzw9Cm4agFfD9ESdHXXs5a
 S1FA==
X-Gm-Message-State: APjAAAX6nY0pZcuc/u3GccbYJHdWc21QnQdd4CQTQw0Rs/5jDwSBQvfv
 FVVIoMsoG62nTBbg7ctoaT+cqQ==
X-Google-Smtp-Source: APXvYqzSDhJjXYGJIJ+YYADKAvJe9L/6vuvfpBWFKy0dLuJZWqEeXFx7aeIqHxKr25C1dYADLH5f0Q==
X-Received: by 2002:adf:e6c5:: with SMTP id y5mr10667279wrm.210.1575560056101; 
 Thu, 05 Dec 2019 07:34:16 -0800 (PST)
Received: from bender.baylibre.local
 (wal59-h01-176-150-251-154.dsl.sta.abo.bbox.fr. [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id u26sm191894wmj.9.2019.12.05.07.34.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Dec 2019 07:34:15 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: mjourdan@baylibre.com
Subject: [PATCH v2 3/4] media: meson: vdec: add g12a platform
Date: Thu,  5 Dec 2019 16:34:07 +0100
Message-Id: <20191205153408.26500-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191205153408.26500-1-narmstrong@baylibre.com>
References: <20191205153408.26500-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191205_073417_669049_000C5CDF 
X-CRM114-Status: GOOD (  12.85  )
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
Cc: linux-amlogic@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Maxime Jourdan <mjourdan@baylibre.com>

Add support for the G12A platform by:
- adding the G12A codec support, here MPEG1 & MPEG2
- getting the new hevcf clock for the upcoming HEVC/VP9 decoding support

Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/staging/media/meson/vdec/vdec.c       | 13 ++++++--
 drivers/staging/media/meson/vdec/vdec.h       |  1 +
 .../staging/media/meson/vdec/vdec_platform.c  | 30 +++++++++++++++++++
 .../staging/media/meson/vdec/vdec_platform.h  |  2 ++
 4 files changed, 44 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 0a1a04fd5d13..875a12be9c9e 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -956,6 +956,8 @@ static const struct of_device_id vdec_dt_match[] = {
 	  .data = &vdec_platform_gxm },
 	{ .compatible = "amlogic,gxl-vdec",
 	  .data = &vdec_platform_gxl },
+	{ .compatible = "amlogic,g12a-vdec",
+	  .data = &vdec_platform_g12a },
 	{}
 };
 MODULE_DEVICE_TABLE(of, vdec_dt_match);
@@ -1003,6 +1005,15 @@ static int vdec_probe(struct platform_device *pdev)
 	if (IS_ERR(core->canvas))
 		return PTR_ERR(core->canvas);
 
+	of_id = of_match_node(vdec_dt_match, dev->of_node);
+	core->platform = of_id->data;
+
+	if (core->platform->revision == VDEC_REVISION_G12A) {
+		core->vdec_hevcf_clk = devm_clk_get(dev, "vdec_hevcf");
+		if (IS_ERR(core->vdec_hevcf_clk))
+			return -EPROBE_DEFER;
+	}
+
 	core->dos_parser_clk = devm_clk_get(dev, "dos_parser");
 	if (IS_ERR(core->dos_parser_clk))
 		return -EPROBE_DEFER;
@@ -1045,8 +1056,6 @@ static int vdec_probe(struct platform_device *pdev)
 		goto err_vdev_release;
 	}
 
-	of_id = of_match_node(vdec_dt_match, dev->of_node);
-	core->platform = of_id->data;
 	core->vdev_dec = vdev;
 	core->dev_dec = dev;
 	mutex_init(&core->lock);
diff --git a/drivers/staging/media/meson/vdec/vdec.h b/drivers/staging/media/meson/vdec/vdec.h
index d811e7976519..0faa1ec4858e 100644
--- a/drivers/staging/media/meson/vdec/vdec.h
+++ b/drivers/staging/media/meson/vdec/vdec.h
@@ -74,6 +74,7 @@ struct amvdec_core {
 	struct clk *dos_clk;
 	struct clk *vdec_1_clk;
 	struct clk *vdec_hevc_clk;
+	struct clk *vdec_hevcf_clk;
 
 	struct reset_control *esparser_reset;
 
diff --git a/drivers/staging/media/meson/vdec/vdec_platform.c b/drivers/staging/media/meson/vdec/vdec_platform.c
index 824dbc7f46f5..7845a889ce24 100644
--- a/drivers/staging/media/meson/vdec/vdec_platform.c
+++ b/drivers/staging/media/meson/vdec/vdec_platform.c
@@ -82,6 +82,30 @@ static const struct amvdec_format vdec_formats_gxm[] = {
 	},
 };
 
+static const struct amvdec_format vdec_formats_g12a[] = {
+	{
+		.pixfmt = V4L2_PIX_FMT_MPEG1,
+		.min_buffers = 8,
+		.max_buffers = 8,
+		.max_width = 1920,
+		.max_height = 1080,
+		.vdec_ops = &vdec_1_ops,
+		.codec_ops = &codec_mpeg12_ops,
+		.firmware_path = "meson/vdec/gxl_mpeg12.bin",
+		.pixfmts_cap = { V4L2_PIX_FMT_NV12M, V4L2_PIX_FMT_YUV420M, 0 },
+	}, {
+		.pixfmt = V4L2_PIX_FMT_MPEG2,
+		.min_buffers = 8,
+		.max_buffers = 8,
+		.max_width = 1920,
+		.max_height = 1080,
+		.vdec_ops = &vdec_1_ops,
+		.codec_ops = &codec_mpeg12_ops,
+		.firmware_path = "meson/vdec/gxl_mpeg12.bin",
+		.pixfmts_cap = { V4L2_PIX_FMT_NV12M, V4L2_PIX_FMT_YUV420M, 0 },
+	},
+};
+
 const struct vdec_platform vdec_platform_gxbb = {
 	.formats = vdec_formats_gxbb,
 	.num_formats = ARRAY_SIZE(vdec_formats_gxbb),
@@ -99,3 +123,9 @@ const struct vdec_platform vdec_platform_gxm = {
 	.num_formats = ARRAY_SIZE(vdec_formats_gxm),
 	.revision = VDEC_REVISION_GXM,
 };
+
+const struct vdec_platform vdec_platform_g12a = {
+	.formats = vdec_formats_g12a,
+	.num_formats = ARRAY_SIZE(vdec_formats_g12a),
+	.revision = VDEC_REVISION_G12A,
+};
diff --git a/drivers/staging/media/meson/vdec/vdec_platform.h b/drivers/staging/media/meson/vdec/vdec_platform.h
index f6025326db1d..7c61b941b39f 100644
--- a/drivers/staging/media/meson/vdec/vdec_platform.h
+++ b/drivers/staging/media/meson/vdec/vdec_platform.h
@@ -15,6 +15,7 @@ enum vdec_revision {
 	VDEC_REVISION_GXBB,
 	VDEC_REVISION_GXL,
 	VDEC_REVISION_GXM,
+	VDEC_REVISION_G12A,
 };
 
 struct vdec_platform {
@@ -26,5 +27,6 @@ struct vdec_platform {
 extern const struct vdec_platform vdec_platform_gxbb;
 extern const struct vdec_platform vdec_platform_gxm;
 extern const struct vdec_platform vdec_platform_gxl;
+extern const struct vdec_platform vdec_platform_g12a;
 
 #endif
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
