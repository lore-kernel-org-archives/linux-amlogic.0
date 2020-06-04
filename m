Return-Path: <SRS0=K8/M=7R=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF1E3C433E0
	for <linux-amlogic@archiver.kernel.org>; Thu,  4 Jun 2020 13:54:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B5356207D0
	for <linux-amlogic@archiver.kernel.org>; Thu,  4 Jun 2020 13:54:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="E/qpNQAr";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="XyuF7akh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B5356207D0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w9uk48I1os8P2o8XSzvFYloqqFpJ3jww/M9ncW0HEv4=; b=E/qpNQArhiJDRl
	ZHOI0bCMSwjkOTb8CLoMcHJXuiPUE32Z3vn7tlXETSJjAlK2ne9xGzUWbC2QINPJ3NoJNsLVPqeNG
	AFAdfOPnHgxweJPlGn5MwCuu4JWL2NacZpPDwLEz0W2HBPvDgYZwkwULApODdZtlvMxOFiWFbpdxG
	l+Q82U9wKKFk9JT2NZDBdg2N/b/CWs8LsOMpdWS1gpbdEQWKpqwgXLIgyFY5m2G3f7ETf8i8NFOXo
	8HiPgiHpm4IA2WvBGPuOkBaBRCsK3LVhHfnT1zlfJC5UuufsdK4bzdSCXh7gPJA+b88NrdnyMt8LL
	uG0F/saNVIfc4DT9rQdw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jgqJn-0001ac-4x; Thu, 04 Jun 2020 13:54:03 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jgqJJ-000131-3d
 for linux-amlogic@lists.infradead.org; Thu, 04 Jun 2020 13:53:34 +0000
Received: by mail-wm1-x344.google.com with SMTP id g10so5323266wmh.4
 for <linux-amlogic@lists.infradead.org>; Thu, 04 Jun 2020 06:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WTN9hKVRvS3SB3HTMfGE7UGBs+9KNxbyg3Yusfgv+rE=;
 b=XyuF7akhxZYqkjEdda9jL2OlbN0kGPXJPHJ0ss5AJZFIm7yaqkJ70UFt397DKdBTTy
 LkysXfSu9XsXPGq1ID7H1auU1t3o5k0fJr+9ipc5zC1uDNIVS9a6lO7HiJSMM5ke/Vyh
 U4IPCGpq3r09LTUCHE/F46tvaQJWRMqsdWCzlzPW6KYO/505VDb/T7Q42z23eGQE7z6Z
 72ekSvLROK+9p6ZCe38kEP+yGRvhGpOsD8lrv4WBaqHrAnYrxmr2Tn9T2oRvMg/H8LnU
 igUmQBOWOMLCuTbzTJ8RUUrZiJqr3vm3VVIfo/NiZePI42xwckDiJmy4cK4CdbrEplxc
 4BPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WTN9hKVRvS3SB3HTMfGE7UGBs+9KNxbyg3Yusfgv+rE=;
 b=itcsBoUSXAWyci9g+oBbCY7EzonYdSXHrMMFgrEOgF3KfacgkSH5cTwVZXoa1JAN8C
 jAO6WbhSLhSCsSXbJJ9gMn5VqY/7EBc/T5vXA6IsiA9ookV/Ty7bG/c8rXu5znoQjT3U
 LUXa10DodlRUMSuoY33y7WHiRf5p0n/XP/EkZDVyrai/InbQ/JyKDt9A572nbGvJU87M
 HwZspx6RcCUzSDRDMjYqwDpyjdbWsd0EGC3/NvnBsQtCgJV8ZjHHYGzubRhoik7Tf6pt
 XZIy5Hte56GWkKnGfIHXY5PZ/vKZ7280VCLEnD5dR56+N7D5fEF2oKZCWFZfzm/TSt7v
 yZxA==
X-Gm-Message-State: AOAM531pzXQ2vfbNAcshIYXgCClyUYqU4JcoGY8VxxA0uPcQr+gTIzWX
 31SMcbaQUw1CcIO/fViEac3+mw==
X-Google-Smtp-Source: ABdhPJwd9WGnr6Q/FV1RFyKfSIpbxLo2wXPQ8ohJw62dgXc/LSq0+CrfVHbTBTa4n1Fkmh1H7CwwIg==
X-Received: by 2002:a1c:9d53:: with SMTP id g80mr4410607wme.13.1591278811002; 
 Thu, 04 Jun 2020 06:53:31 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:22:5867:d2c6:75f4])
 by smtp.gmail.com with ESMTPSA id
 i74sm8185599wri.49.2020.06.04.06.53.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jun 2020 06:53:30 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: hverkuil-cisco@xs4all.nl
Subject: [PATCH 2/5] media: meson: vdec: handle bitdepth on source change
Date: Thu,  4 Jun 2020 15:53:14 +0200
Message-Id: <20200604135317.9235-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200604135317.9235-1-narmstrong@baylibre.com>
References: <20200604135317.9235-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200604_065333_154473_DB6CF2A9 
X-CRM114-Status: GOOD (  11.43  )
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
Cc: Maxime Jourdan <mjourdan@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Maxime Jourdan <mjourdan@baylibre.com>

In order to handle Compressed Framebuffer support, we need to handle
the switch between 8bit and 10bit frame output.

This handles the bitdepth in the codec amvdec_src_change() call to handle
a source change/decode resume when the stream bitdepth changes.

Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/staging/media/meson/vdec/codec_h264.c   |  3 ++-
 drivers/staging/media/meson/vdec/codec_vp9.c    |  3 ++-
 drivers/staging/media/meson/vdec/vdec.h         |  1 +
 drivers/staging/media/meson/vdec/vdec_helpers.c | 10 ++++++----
 drivers/staging/media/meson/vdec/vdec_helpers.h |  3 ++-
 5 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/codec_h264.c b/drivers/staging/media/meson/vdec/codec_h264.c
index c61128fc4bb9..d53c9a464bde 100644
--- a/drivers/staging/media/meson/vdec/codec_h264.c
+++ b/drivers/staging/media/meson/vdec/codec_h264.c
@@ -353,7 +353,8 @@ static void codec_h264_src_change(struct amvdec_session *sess)
 		frame_width, frame_height, crop_right, crop_bottom);
 
 	codec_h264_set_par(sess);
-	amvdec_src_change(sess, frame_width, frame_height, h264->max_refs + 5);
+	amvdec_src_change(sess, frame_width, frame_height,
+			  h264->max_refs + 5, 8);
 }
 
 /*
diff --git a/drivers/staging/media/meson/vdec/codec_vp9.c b/drivers/staging/media/meson/vdec/codec_vp9.c
index 897f5d7a6aad..4c6a644ab1a7 100644
--- a/drivers/staging/media/meson/vdec/codec_vp9.c
+++ b/drivers/staging/media/meson/vdec/codec_vp9.c
@@ -2132,7 +2132,8 @@ static irqreturn_t codec_vp9_threaded_isr(struct amvdec_session *sess)
 
 	codec_vp9_fetch_rpm(sess);
 	if (codec_vp9_process_rpm(vp9)) {
-		amvdec_src_change(sess, vp9->width, vp9->height, 16);
+		amvdec_src_change(sess, vp9->width, vp9->height, 16,
+				  vp9->is_10bit ? 10 : 8);
 
 		/* No frame is actually processed */
 		vp9->cur_frame = NULL;
diff --git a/drivers/staging/media/meson/vdec/vdec.h b/drivers/staging/media/meson/vdec/vdec.h
index f95445ac0658..e3e4af73447a 100644
--- a/drivers/staging/media/meson/vdec/vdec.h
+++ b/drivers/staging/media/meson/vdec/vdec.h
@@ -234,6 +234,7 @@ struct amvdec_session {
 	u32 width;
 	u32 height;
 	u32 colorspace;
+	u32 bitdepth;
 	u8 ycbcr_enc;
 	u8 quantization;
 	u8 xfer_func;
diff --git a/drivers/staging/media/meson/vdec/vdec_helpers.c b/drivers/staging/media/meson/vdec/vdec_helpers.c
index 7f07a9175815..eed7a929c5d0 100644
--- a/drivers/staging/media/meson/vdec/vdec_helpers.c
+++ b/drivers/staging/media/meson/vdec/vdec_helpers.c
@@ -436,7 +436,7 @@ void amvdec_set_par_from_dar(struct amvdec_session *sess,
 EXPORT_SYMBOL_GPL(amvdec_set_par_from_dar);
 
 void amvdec_src_change(struct amvdec_session *sess, u32 width,
-		       u32 height, u32 dpb_size)
+		       u32 height, u32 dpb_size, u32 bitdepth)
 {
 	static const struct v4l2_event ev = {
 		.type = V4L2_EVENT_SOURCE_CHANGE,
@@ -451,7 +451,8 @@ void amvdec_src_change(struct amvdec_session *sess, u32 width,
 	if (sess->streamon_cap &&
 	    sess->width == width &&
 	    sess->height == height &&
-	    dpb_size <= sess->num_dst_bufs) {
+	    dpb_size <= sess->num_dst_bufs &&
+	    sess->bitdepth == bitdepth) {
 		sess->fmt_out->codec_ops->resume(sess);
 		return;
 	}
@@ -460,9 +461,10 @@ void amvdec_src_change(struct amvdec_session *sess, u32 width,
 	sess->width = width;
 	sess->height = height;
 	sess->status = STATUS_NEEDS_RESUME;
+	sess->bitdepth = bitdepth;
 
-	dev_dbg(sess->core->dev, "Res. changed (%ux%u), DPB size %u\n",
-		width, height, dpb_size);
+	dev_dbg(sess->core->dev, "Res. changed (%ux%u), DPB %u, bitdepth %u\n",
+		width, height, dpb_size, bitdepth);
 	v4l2_event_queue_fh(&sess->fh, &ev);
 }
 EXPORT_SYMBOL_GPL(amvdec_src_change);
diff --git a/drivers/staging/media/meson/vdec/vdec_helpers.h b/drivers/staging/media/meson/vdec/vdec_helpers.h
index cfaed52ab526..f059cf195cca 100644
--- a/drivers/staging/media/meson/vdec/vdec_helpers.h
+++ b/drivers/staging/media/meson/vdec/vdec_helpers.h
@@ -76,9 +76,10 @@ void amvdec_set_par_from_dar(struct amvdec_session *sess,
  * @width: picture width detected by the hardware
  * @height: picture height detected by the hardware
  * @dpb_size: Decoded Picture Buffer size (= amount of buffers for decoding)
+ * @bitdepth: Bit depth (usually 10 or 8) of the coded content
  */
 void amvdec_src_change(struct amvdec_session *sess, u32 width,
-		       u32 height, u32 dpb_size);
+		       u32 height, u32 dpb_size, u32 bitdepth);
 
 /**
  * amvdec_abort() - Abort the current decoding session
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
