Return-Path: <SRS0=YQie=ZM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDB65C432C0
	for <linux-amlogic@archiver.kernel.org>; Wed, 20 Nov 2019 11:15:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96B98223D0
	for <linux-amlogic@archiver.kernel.org>; Wed, 20 Nov 2019 11:15:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SU0fYLY1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="TiQtiHkg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 96B98223D0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9kebknWGpd+CGKnBRpf2nwSru3UIMxDgOq0rdkvqrmU=; b=SU0fYLY1Ew57fC
	Ps/stVF6aCIapgAZ0bRj9EulVBgL0lXlsDeSQ11ryRuErev1lP3k86C++UCpuXsH7+Yt7TEAcIj6N
	4rqUGazFYwoVBvJykhSp9P9IrWeCbQuLAR+0rsvuKJLNKzHOf2vYC0rY4T5qQDT6kvS5OW5KfuiDg
	a+Fn3E/VaKihO6e35Go7hH4bDzvnHWwv0ic8THNwClAFafdrBzj6PtEqiF2WiuKtMvTLGIxjfcAdt
	f92iNWxp7TWrN1ZBmdyG0BZlYumFxvaRRTrxlXJPRBock6HX14IiyDm/qYDVxlbfVZRV24bV80X73
	ZfKcnF7Gm1vPAaf2N2Jw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iXNxT-0000Zr-0l; Wed, 20 Nov 2019 11:15:39 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iXNwU-0006pX-8d
 for linux-amlogic@lists.infradead.org; Wed, 20 Nov 2019 11:14:41 +0000
Received: by mail-wr1-x444.google.com with SMTP id q15so14842413wrw.7
 for <linux-amlogic@lists.infradead.org>; Wed, 20 Nov 2019 03:14:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UaaaJx+p0JcZMcJnhGqWQZjIziF6Ba/MI0EsQk5V9qA=;
 b=TiQtiHkg0RMZ4S1Hs+toam+n7rYmoAgGqr2fC0USfYF5jbHTN26ImCnqI+q6vBmfWC
 DPjb+lCTY9oewXNbiW/iLqfrdOhTSyLYUfZFtalDNjXTBp7qe544NZwVvg3nUPeVP36Y
 Zb6xGy99sZg42k9nanEDwH0/H43gZBKK1FekzfDRXJpGAPGWUVbdSx+AK/IhzMZXDCbn
 vlO+4HhsJgJLHcdWQVLJPXN3SLHR6K1YQQxyqQEiKc6A7VXWuXV5STmD1U0BhbFtO350
 9lOT0q2m+fPKelLaCjuzXVltIzPrdVOa2Ep1VUqmtYSyn4Zbah6jGKlEwzh75/ePaHuO
 21iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UaaaJx+p0JcZMcJnhGqWQZjIziF6Ba/MI0EsQk5V9qA=;
 b=jf+ycOi5SahVKo2g8UTKFHpw/ulBArC5jZm7DrYolAjiT/+LEoagF1fWbtK8pb1fP5
 q7JfPHjpguXxy8yi8/2RcSDm+rxZGOquuq2xI2ybWUGmpFFdEiUF0S5jxqk4eN1Ehd90
 kcFjxudzXmzLLQjNinsXsmxZwnvNlmXrRCfvfECCuUsjjPYMQXXlh7bJIHHG8x1nHdW9
 zvIMmyWMVdVEm5vaeTKc7QFLqUZHS2M3yHeTucvOnEJMRs10SIrNZGTimmUVY0/npE9U
 RsYZxKAFoUwCb01GaiE6mQ2NOp4whDHIYG3YeCGaOA50BmXW0uyr3h2Fap9LDPichhWH
 4W2g==
X-Gm-Message-State: APjAAAU1/yzX2ulTltGhXVU2BU+RPXk5IFUrSF0SQKbcMzglDUN5fuHi
 5WK8snUas4n2ukKcz9z0PSjOAA==
X-Google-Smtp-Source: APXvYqwLPjL06Kr41Bjy6DnwXl4SgLoNVUW1i3UYwiHotB5RWxvZ4emQVFEOMzeVHlniyLpXWeeRww==
X-Received: by 2002:adf:e312:: with SMTP id b18mr2650458wrj.203.1574248476778; 
 Wed, 20 Nov 2019 03:14:36 -0800 (PST)
Received: from bender.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id u1sm6061748wmc.3.2019.11.20.03.14.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Nov 2019 03:14:36 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: mjourdan@baylibre.com
Subject: [PATCH 3/4] media: meson: vdec: add g12a platform
Date: Wed, 20 Nov 2019 12:14:29 +0100
Message-Id: <20191120111430.29552-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191120111430.29552-1-narmstrong@baylibre.com>
References: <20191120111430.29552-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191120_031438_304926_9F2C5052 
X-CRM114-Status: GOOD (  12.84  )
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
