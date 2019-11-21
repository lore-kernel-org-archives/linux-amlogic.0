Return-Path: <SRS0=mf6+=ZN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8925BC432C0
	for <linux-amlogic@archiver.kernel.org>; Thu, 21 Nov 2019 10:15:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 57FA0206CB
	for <linux-amlogic@archiver.kernel.org>; Thu, 21 Nov 2019 10:15:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NgCXUhWY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="sgQbSuyR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 57FA0206CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N7Gi8RjEPtD7Sj3ykrpUwx9HdP88ao7uCDZr6b4E4mY=; b=NgCXUhWY39rmHG
	IQeaZ5tk5kuF0eczhhIeJUl3GJlx2M8yGqRNShDhGv2o115NxcpK3KCdtIkliueW30mEuZRaqq1yR
	qROdRVQySeianea6VTVILvZ9V6sD7C/u3gVujh65JmVcQrInA9lLcJEdtOexW8w9zLL2np7fk29/T
	rZ6oehqKZQjXDs9X7XQwdwb7DvfuRtqJNnlQPC1zM3h/qphQ00OVS2rGFc3eWO+m3RaiT4vwe1rRZ
	xbOoRjziCd5eOwxfUqxiprUB4rxAdR+e9ZTdqJofG7SkSxa8Dw9WDD7kUB9R6lhz+rhrXrPIr+8H6
	f+4iMw5Z+SrHRDv7JVEg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iXjUW-0004bH-VE; Thu, 21 Nov 2019 10:15:12 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iXjTw-000414-UP
 for linux-amlogic@lists.infradead.org; Thu, 21 Nov 2019 10:14:40 +0000
Received: by mail-wr1-x444.google.com with SMTP id 4so319855wro.7
 for <linux-amlogic@lists.infradead.org>; Thu, 21 Nov 2019 02:14:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9Uj/OJizfCMV+pm8Bm80+o6nYf9xOidEjQZOmhbw7Tk=;
 b=sgQbSuyRaTjHtb50b5Ns8I+KWD74RpH72vWeYkSEw5qOkc4dTlhWmfpSKp2d9KBo1R
 5lIpurfOlRUpmLLsGEbbwEH1Mklf7Attq2+b3KkSJqZvwIqOlmMMLkYyjIEDmZuvb5a5
 c3N2ZchOyTXhU0rCSD39k31tKb46cpMWRTA8jLS57lpw0qa8LfujBe6PdpfodQxamnrQ
 6AnHGvfUWPCcAmK3kW/k+9GMZnS9UB/l0sUWlAfICUGyq33D5M2xt2DenAamLzr7FEt1
 qPEt1mN5TLHesyMZQMrVEWsR5UqUt0efpdBbkyH9i/awhCWFxMaAlnIQWbF5r+iFPauy
 zZSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9Uj/OJizfCMV+pm8Bm80+o6nYf9xOidEjQZOmhbw7Tk=;
 b=SuKwsV703bSQXYO1EjThqqI2QPmKpnoxRZ9HGxsnx0zwwqFvc9xj5/VZS7j1sSApcr
 7GsdcfNFy78qoBdSHsd6vkoLYThh7fNfuu65nL9QUF2pvd0gO3kNI6r+jQIVOres0d+k
 fMBGvMd/SmK5yNRU0Ogd5CTOamlqFpou9YQsLpJ7gEWPHnxMLoHFekIbPbbiDEXJQ5O4
 WChSEf5zVbiVCoGU3yDQur7/KwOOyIpO/tMPAWxQfbaJj470xybiNJc8Twi70ZGqH0iO
 etwIzSpq2r8U2/HlMfiVLZnZvgW9mNAwAXNSdHO91tfPk52SxMP4RWuQjJU2E7xne0F9
 hyaQ==
X-Gm-Message-State: APjAAAXr52CZgtOd7v3APBFvSWuF2lLdf6wm6HnnDn6hD4uGH/riHtDs
 8ONobGitLdrsgIgJoz1fcMyGoQ==
X-Google-Smtp-Source: APXvYqyH/ovyemEL/zz1cttC+sZ2PiFUJwPCumuv2fNDV5bChB+c10N4Ys6A9Lzh7HcYx+2s+N1h5g==
X-Received: by 2002:adf:fc0a:: with SMTP id i10mr9942497wrr.105.1574331272916; 
 Thu, 21 Nov 2019 02:14:32 -0800 (PST)
Received: from bender.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id o21sm1289932wmc.17.2019.11.21.02.14.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2019 02:14:32 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: mjourdan@baylibre.com
Subject: [PATCH 2/3] media: meson: vdec: add sm1 platform
Date: Thu, 21 Nov 2019 11:14:28 +0100
Message-Id: <20191121101429.23831-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191121101429.23831-1-narmstrong@baylibre.com>
References: <20191121101429.23831-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191121_021437_008262_BF8D332B 
X-CRM114-Status: GOOD (  13.20  )
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
Cc: linux-amlogic@lists.infradead.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add support for the Amlogic SM1 platform for the current MPEG1 & MPEG2
support.

The SM1 family, very close to the G12A SoCs, has a slighly different power
management control, thus needing a separate compatible and family id.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/staging/media/meson/vdec/vdec.c       |  5 +++-
 drivers/staging/media/meson/vdec/vdec_1.c     | 29 ++++++++++++++----
 .../staging/media/meson/vdec/vdec_platform.c  | 30 +++++++++++++++++++
 .../staging/media/meson/vdec/vdec_platform.h  |  2 ++
 4 files changed, 59 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 875a12be9c9e..a8a4c380ccc9 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -958,6 +958,8 @@ static const struct of_device_id vdec_dt_match[] = {
 	  .data = &vdec_platform_gxl },
 	{ .compatible = "amlogic,g12a-vdec",
 	  .data = &vdec_platform_g12a },
+	{ .compatible = "amlogic,sm1-vdec",
+	  .data = &vdec_platform_sm1 },
 	{}
 };
 MODULE_DEVICE_TABLE(of, vdec_dt_match);
@@ -1008,7 +1010,8 @@ static int vdec_probe(struct platform_device *pdev)
 	of_id = of_match_node(vdec_dt_match, dev->of_node);
 	core->platform = of_id->data;
 
-	if (core->platform->revision == VDEC_REVISION_G12A) {
+	if (core->platform->revision == VDEC_REVISION_G12A ||
+	    core->platform->revision == VDEC_REVISION_SM1) {
 		core->vdec_hevcf_clk = devm_clk_get(dev, "vdec_hevcf");
 		if (IS_ERR(core->vdec_hevcf_clk))
 			return -EPROBE_DEFER;
diff --git a/drivers/staging/media/meson/vdec/vdec_1.c b/drivers/staging/media/meson/vdec/vdec_1.c
index 3a15c6fc0567..3fe2de0c9331 100644
--- a/drivers/staging/media/meson/vdec/vdec_1.c
+++ b/drivers/staging/media/meson/vdec/vdec_1.c
@@ -18,6 +18,7 @@
 #define AO_RTI_GEN_PWR_SLEEP0	0xe8
 #define AO_RTI_GEN_PWR_ISO0	0xec
 	#define GEN_PWR_VDEC_1 (BIT(3) | BIT(2))
+	#define GEN_PWR_VDEC_1_SM1 (BIT(1))
 
 #define MC_SIZE			(4096 * 4)
 
@@ -142,12 +143,20 @@ static int vdec_1_stop(struct amvdec_session *sess)
 	amvdec_read_dos(core, DOS_SW_RESET0);
 
 	/* enable vdec1 isolation */
-	regmap_write(core->regmap_ao, AO_RTI_GEN_PWR_ISO0, 0xc0);
+	if (core->platform->revision == VDEC_REVISION_SM1)
+		regmap_update_bits(core->regmap_ao, AO_RTI_GEN_PWR_ISO0,
+				   GEN_PWR_VDEC_1_SM1, GEN_PWR_VDEC_1_SM1);
+	else
+		regmap_write(core->regmap_ao, AO_RTI_GEN_PWR_ISO0, 0xc0);
 	/* power off vdec1 memories */
 	amvdec_write_dos(core, DOS_MEM_PD_VDEC, 0xffffffff);
 	/* power off vdec1 */
-	regmap_update_bits(core->regmap_ao, AO_RTI_GEN_PWR_SLEEP0,
-			   GEN_PWR_VDEC_1, GEN_PWR_VDEC_1);
+	if (core->platform->revision == VDEC_REVISION_SM1)
+		regmap_update_bits(core->regmap_ao, AO_RTI_GEN_PWR_SLEEP0,
+				   GEN_PWR_VDEC_1_SM1, GEN_PWR_VDEC_1_SM1);
+	else
+		regmap_update_bits(core->regmap_ao, AO_RTI_GEN_PWR_SLEEP0,
+				   GEN_PWR_VDEC_1, GEN_PWR_VDEC_1);
 
 	clk_disable_unprepare(core->vdec_1_clk);
 
@@ -170,8 +179,12 @@ static int vdec_1_start(struct amvdec_session *sess)
 		return ret;
 
 	/* Enable power for VDEC_1 */
-	regmap_update_bits(core->regmap_ao, AO_RTI_GEN_PWR_SLEEP0,
-			   GEN_PWR_VDEC_1, 0);
+	if (core->platform->revision == VDEC_REVISION_SM1)
+		regmap_update_bits(core->regmap_ao, AO_RTI_GEN_PWR_SLEEP0,
+				   GEN_PWR_VDEC_1_SM1, 0);
+	else
+		regmap_update_bits(core->regmap_ao, AO_RTI_GEN_PWR_SLEEP0,
+				   GEN_PWR_VDEC_1, 0);
 	usleep_range(10, 20);
 
 	/* Reset VDEC1 */
@@ -183,7 +196,11 @@ static int vdec_1_start(struct amvdec_session *sess)
 	/* enable VDEC Memories */
 	amvdec_write_dos(core, DOS_MEM_PD_VDEC, 0);
 	/* Remove VDEC1 Isolation */
-	regmap_write(core->regmap_ao, AO_RTI_GEN_PWR_ISO0, 0);
+	if (core->platform->revision == VDEC_REVISION_SM1)
+		regmap_update_bits(core->regmap_ao, AO_RTI_GEN_PWR_ISO0,
+				   GEN_PWR_VDEC_1_SM1, 0);
+	else
+		regmap_write(core->regmap_ao, AO_RTI_GEN_PWR_ISO0, 0);
 	/* Reset DOS top registers */
 	amvdec_write_dos(core, DOS_VDEC_MCRCC_STALL_CTRL, 0);
 
diff --git a/drivers/staging/media/meson/vdec/vdec_platform.c b/drivers/staging/media/meson/vdec/vdec_platform.c
index 7845a889ce24..ea39f8209ec7 100644
--- a/drivers/staging/media/meson/vdec/vdec_platform.c
+++ b/drivers/staging/media/meson/vdec/vdec_platform.c
@@ -106,6 +106,30 @@ static const struct amvdec_format vdec_formats_g12a[] = {
 	},
 };
 
+static const struct amvdec_format vdec_formats_sm1[] = {
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
@@ -129,3 +153,9 @@ const struct vdec_platform vdec_platform_g12a = {
 	.num_formats = ARRAY_SIZE(vdec_formats_g12a),
 	.revision = VDEC_REVISION_G12A,
 };
+
+const struct vdec_platform vdec_platform_sm1 = {
+	.formats = vdec_formats_sm1,
+	.num_formats = ARRAY_SIZE(vdec_formats_sm1),
+	.revision = VDEC_REVISION_SM1,
+};
diff --git a/drivers/staging/media/meson/vdec/vdec_platform.h b/drivers/staging/media/meson/vdec/vdec_platform.h
index 7c61b941b39f..731877a771f4 100644
--- a/drivers/staging/media/meson/vdec/vdec_platform.h
+++ b/drivers/staging/media/meson/vdec/vdec_platform.h
@@ -16,6 +16,7 @@ enum vdec_revision {
 	VDEC_REVISION_GXL,
 	VDEC_REVISION_GXM,
 	VDEC_REVISION_G12A,
+	VDEC_REVISION_SM1,
 };
 
 struct vdec_platform {
@@ -28,5 +29,6 @@ extern const struct vdec_platform vdec_platform_gxbb;
 extern const struct vdec_platform vdec_platform_gxm;
 extern const struct vdec_platform vdec_platform_gxl;
 extern const struct vdec_platform vdec_platform_g12a;
+extern const struct vdec_platform vdec_platform_sm1;
 
 #endif
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
