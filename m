Return-Path: <SRS0=aHVS=3F=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08E58C33CB1
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Jan 2020 13:35:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 58E242075B
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Jan 2020 13:35:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sFl90R6x";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="1Bs13GLW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 58E242075B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3qqH5JpWpOrSFSDhqsjh4j7pVxK6/WwJifbGSJulONE=; b=sFl90R6xItxFO1
	Q6XBct1BaDEJWEOryfoLOY0aMekhH9L4WLjHc5oRnc6NjO1kM5VoXl000mrehx5bhSsDW+r9Bqnn0
	WpN83KeoJIO3s3z4hTmiFGttpDFq0PcvcmfASF7R3WPN53GFbVA1YKhuSHZRwusKOSecQ87OXS3lX
	UmXKZ1Ni1bhpYFgMgTF4bwIacLpQX7WsRe45jM4lL151IdGvd1dp/yxksWDxCVL/D+IH7B8TLWem0
	YTm5Z1cRk2jdlxH69xdFaQ7flXrJoecPF3fnB+aTW2iqBHpk4Wv2IyduZanZdBpfw+cuojsNP2ou4
	clo80A1wNnz9Rz2jGmZA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1is5J6-0007ex-I2; Thu, 16 Jan 2020 13:35:32 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1is5IK-00075f-7g
 for linux-amlogic@lists.infradead.org; Thu, 16 Jan 2020 13:34:51 +0000
Received: by mail-wm1-x341.google.com with SMTP id 20so3822420wmj.4
 for <linux-amlogic@lists.infradead.org>; Thu, 16 Jan 2020 05:34:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tsG/kNWOY1oaLEfx3AisRYovgh6oCd1Sk94EaWADP1A=;
 b=1Bs13GLWG0q2oepJBkkMKBXN55AsJyFVIq83RdE7FstgXFKYTqAM1fdoPdTjTsIfPa
 kkqRNS1Wk8ISL8gDFtyPgSQq3Z1zlqP/Ns4yWx3XFdbmT1KYDVkIbjTpwmQdyn8QwUYs
 M4oMN04iFRP7BThXs5qLF4c2HLvGKJ0cEONeHTkZu0ZSn4qLZi8dp0qD2+teA/o+g4Gc
 YvKsoYRTPQgj/5F0YUO26C/UV6jOi2Z5hR/vNQdbt3TdlF6FmbWvaziQxi2xhF/7mVlL
 8dOOGV81WYjpsLXe+f6lJa5oVU1BrICKWOs6oI6dh187EIZm8ZLKyLbcu8N0Z6GbBitP
 nIxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tsG/kNWOY1oaLEfx3AisRYovgh6oCd1Sk94EaWADP1A=;
 b=DvyRWhjjjCmF8l8VE6sPKVXIMMDFYmZ05d0C9A+KIsTqWRrSXiHgk4jzBQCBnSUdFQ
 LbvFjqq16U8Z8Z6ztempe8KWtarO6VsM1qTUeXYPEY6zznQev20HEBf+ve4cTPxmG6Vx
 JJp39Guwj3k2nxUvqYHoOMpoFgsv7VrF4bne5bb59/vvIf/pxUPhO8LGomH8wZ+UO2ke
 yVfmAHY5G4oCV+zMfUrS2MFMvAZ8j61O/hkq4CHi+EyWr0iHiPmZ8JLylGiaZJQ9aVQ7
 iS97EFy9gzz/78fgR0XfPvRAtkKduLtx4EG1YiI8+pzkeM0KEzg8RGtaCYgUAhJzY+jC
 QXHQ==
X-Gm-Message-State: APjAAAWq7p5ul8gTxR2jyxT87gkXkyGY63uxWXXiqWHIM7Zz8R+gM0B1
 O/48gCHL9xCXdlhTH92jZpTRIg==
X-Google-Smtp-Source: APXvYqyXmfYjyCLjI7Jq4nu3MhkiOKk2tOb7dImKfGrnqC+3eVJikhsp0cBodESHkU94cTJ8uUFX7g==
X-Received: by 2002:a05:600c:145:: with SMTP id
 w5mr6598741wmm.157.1579181682932; 
 Thu, 16 Jan 2020 05:34:42 -0800 (PST)
Received: from bender.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id x14sm162559wmj.42.2020.01.16.05.34.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2020 05:34:42 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: mchehab@kernel.org,
	hans.verkuil@cisco.com
Subject: [PATCH v3 1/5] media: meson: vdec: align stride on 32 bytes
Date: Thu, 16 Jan 2020 14:34:33 +0100
Message-Id: <20200116133437.2443-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200116133437.2443-1-narmstrong@baylibre.com>
References: <20200116133437.2443-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200116_053444_275231_810812F9 
X-CRM114-Status: UNSURE (   9.76  )
X-CRM114-Notice: Please train this message.
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

The HEVC/VP9 aligns the plane stride on 32, so align the planes stride
for all codecs to 32 to satisfy HEVC/VP9 decoding using the "HEVC" HW.

This fixes VP9 decoding of streams with following (not limited) widths:
- 264
 -288
- 350
- 352
- 472
- 480
- 528
- 600
- 720
- 800
- 848
- 1440

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/staging/media/meson/vdec/vdec.c         | 10 +++++-----
 drivers/staging/media/meson/vdec/vdec_helpers.c |  4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 20e95b71c2d6..5514d2d259a4 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -527,20 +527,20 @@ vdec_try_fmt_common(struct amvdec_session *sess, u32 size,
 		memset(pfmt[1].reserved, 0, sizeof(pfmt[1].reserved));
 		if (pixmp->pixelformat == V4L2_PIX_FMT_NV12M) {
 			pfmt[0].sizeimage = output_size;
-			pfmt[0].bytesperline = ALIGN(pixmp->width, 64);
+			pfmt[0].bytesperline = ALIGN(pixmp->width, 32);
 
 			pfmt[1].sizeimage = output_size / 2;
-			pfmt[1].bytesperline = ALIGN(pixmp->width, 64);
+			pfmt[1].bytesperline = ALIGN(pixmp->width, 32);
 			pixmp->num_planes = 2;
 		} else if (pixmp->pixelformat == V4L2_PIX_FMT_YUV420M) {
 			pfmt[0].sizeimage = output_size;
-			pfmt[0].bytesperline = ALIGN(pixmp->width, 64);
+			pfmt[0].bytesperline = ALIGN(pixmp->width, 32);
 
 			pfmt[1].sizeimage = output_size / 4;
-			pfmt[1].bytesperline = ALIGN(pixmp->width, 64) / 2;
+			pfmt[1].bytesperline = ALIGN(pixmp->width, 32) / 2;
 
 			pfmt[2].sizeimage = output_size / 2;
-			pfmt[2].bytesperline = ALIGN(pixmp->width, 64) / 2;
+			pfmt[2].bytesperline = ALIGN(pixmp->width, 32) / 2;
 			pixmp->num_planes = 3;
 		}
 	}
diff --git a/drivers/staging/media/meson/vdec/vdec_helpers.c b/drivers/staging/media/meson/vdec/vdec_helpers.c
index ff4333074197..fc59d8801643 100644
--- a/drivers/staging/media/meson/vdec/vdec_helpers.c
+++ b/drivers/staging/media/meson/vdec/vdec_helpers.c
@@ -154,8 +154,8 @@ int amvdec_set_canvases(struct amvdec_session *sess,
 {
 	struct v4l2_m2m_buffer *buf;
 	u32 pixfmt = sess->pixfmt_cap;
-	u32 width = ALIGN(sess->width, 64);
-	u32 height = ALIGN(sess->height, 64);
+	u32 width = ALIGN(sess->width, 32);
+	u32 height = ALIGN(sess->height, 32);
 	u32 reg_cur = reg_base[0];
 	u32 reg_num_cur = 0;
 	u32 reg_base_cur = 0;
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
