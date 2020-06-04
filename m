Return-Path: <SRS0=K8/M=7R=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09968C433DF
	for <linux-amlogic@archiver.kernel.org>; Thu,  4 Jun 2020 13:54:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D268520772
	for <linux-amlogic@archiver.kernel.org>; Thu,  4 Jun 2020 13:54:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="D/WrwlTH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="bTpVL1yf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D268520772
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=utpJkVRVkyZKoOQLOAdxVxSWssG8Q72Gyohv3bWxisk=; b=D/WrwlTHmInaUA
	VLrRLBwbax0msP4puduN/zqnoLPTcmSkwVUx8cYQPxoehmES9oM1SDPqMS39HapHwN1f/YUO+9s1Z
	myf+FthMf3U4kSdHYJkvAYkzA0qaO3g+qIIX5sCN2pe2Vkg+zZFcwzKpEBlJn8Ca8aKYOaluznSju
	SiLfpwukVJDcJm4Zgp2C8Y3Swz4iyMr3J86Link4lgR8K6p5bvdpYeqHVn/Mqvga/XZza50HMj/6e
	bHU0jXbvprnPOo/cYt+gFoOhFoujRpmcdVLBx17eGFXGKkpWaoI9uCkLdTYLPJR/hx/+KTprpm+1u
	HgkQN2Ecdt3Ap5ZConMA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jgqJl-0001YD-Gu; Thu, 04 Jun 2020 13:54:01 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jgqJG-00012C-R9
 for linux-amlogic@lists.infradead.org; Thu, 04 Jun 2020 13:53:33 +0000
Received: by mail-wr1-x443.google.com with SMTP id x13so6205903wrv.4
 for <linux-amlogic@lists.infradead.org>; Thu, 04 Jun 2020 06:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Fs26md6QbBGAquJwpk095GGSGBX/m/yeaPP+lwPf4x8=;
 b=bTpVL1yfwhHL564oV9oXTuVi5bwYohXzTpcKvqoytnCDbbMUIAeZsrdq92E0qwRRSg
 UfSDj3lzKt+diIWgtJqYc2UKsOBY/ArWO+KMdr64+3lR8Puu98hTn/h1lbs8pZD3z0a5
 6ShQ9QS2p4Zr3km9dLUyszhnICzksvQjbCrHKAfOpH8DBiP7RsMzrXzBw1bJT3KiwTm3
 9xZUp0uS871oMpIXbSrQ/0KnqXJ/ZEg8yRFTESmOv1jd2O4crFzKduVGLDXRc8vcZgCD
 uUtou4MeMzMCIRxtSYLva3dOgaRLMh0YBcvkdPYbchEEWfISZiUqH0diRmCqtZ42LoKm
 G+jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Fs26md6QbBGAquJwpk095GGSGBX/m/yeaPP+lwPf4x8=;
 b=NeVkcOn/jYtGYd5IeTCt3gphsOuna9j41L4pM1lt/Il2hqP6A+LM/XU/nUpQW9OpuD
 6crQNrPENCnQz2roD9LuGd2nv72hNoHZEi3mwlYd3EOavfTrUdP+9daUozRox0qVwyik
 NQ+R6rgksczPxE2LG8/DxdKuZwxwUAs5cWuLILgg5aV5eRhVDId+neQ+Dy19uFUztHsd
 Ls4Nad0ECchZjfBj/wsxACR1LYo+x7Jwe2gYyStHoftcVwzKRVPfTbb9gP7lYLLqUkgD
 EMsuF/S9zFbCbqpjXf+oVch9L9UQFQVMO41ouWtXp4x+qCWpLljQ9U9g30b9+1YnECjm
 4jeg==
X-Gm-Message-State: AOAM530s1YOAdY5QcJy9IOpHVrATuLFeq4c9koD3TAjbsCoek0u59T4b
 Y7pmm6OzLd/yrk+AyH0vgYG1BQ==
X-Google-Smtp-Source: ABdhPJwqpOH22rRrTWj54Pu3JjP2wensOE1kRwQ6BI5hptsY6t27TXlnHJBKfdM8GJs/L3uqecz/Pw==
X-Received: by 2002:a5d:4dc9:: with SMTP id f9mr4441675wru.407.1591278809353; 
 Thu, 04 Jun 2020 06:53:29 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:22:5867:d2c6:75f4])
 by smtp.gmail.com with ESMTPSA id
 i74sm8185599wri.49.2020.06.04.06.53.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jun 2020 06:53:28 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: hverkuil-cisco@xs4all.nl
Subject: [PATCH 1/5] media: videodev2: add Compressed Framebuffer pixel formats
Date: Thu,  4 Jun 2020 15:53:13 +0200
Message-Id: <20200604135317.9235-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200604135317.9235-1-narmstrong@baylibre.com>
References: <20200604135317.9235-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200604_065330_880958_F19AD4B9 
X-CRM114-Status: UNSURE (   9.98  )
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
Cc: Maxime Jourdan <mjourdan@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Maxime Jourdan <mjourdan@baylibre.com>

Add two generic Compressed Framebuffer pixel formats to be used
with a modifier when imported back in another subsystem like DRM/KMS.

These pixel formats represents generic 8bits and 10bits compressed buffers
with a vendor specific layout.

These are aligned with the DRM_FORMAT_YUV420_8BIT and DRM_FORMAT_YUV420_10BIT
used to describe the underlying compressed buffers used for ARM Framebuffer
Compression. In the Amlogic case, the compression is different but the
underlying buffer components is the same.

Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 2 ++
 include/uapi/linux/videodev2.h       | 9 +++++++++
 2 files changed, 11 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 2322f08a98be..8f14adfd5bc5 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1447,6 +1447,8 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 		case V4L2_PIX_FMT_S5C_UYVY_JPG:	descr = "S5C73MX interleaved UYVY/JPEG"; break;
 		case V4L2_PIX_FMT_MT21C:	descr = "Mediatek Compressed Format"; break;
 		case V4L2_PIX_FMT_SUNXI_TILED_NV12: descr = "Sunxi Tiled NV12 Format"; break;
+		case V4L2_PIX_FMT_YUV420_8BIT:	descr = "Compressed YUV 4:2:0 8-bit Format"; break;
+		case V4L2_PIX_FMT_YUV420_10BIT:	descr = "Compressed YUV 4:2:0 10-bit Format"; break;
 		default:
 			if (fmt->description[0])
 				return;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index c3a1cf1c507f..90b9949acb8a 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -705,6 +705,15 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_FWHT     v4l2_fourcc('F', 'W', 'H', 'T') /* Fast Walsh Hadamard Transform (vicodec) */
 #define V4L2_PIX_FMT_FWHT_STATELESS     v4l2_fourcc('S', 'F', 'W', 'H') /* Stateless FWHT (vicodec) */
 
+/*
+ * Compressed Luminance+Chrominance meta-formats
+ * In these formats, the component ordering is specified (Y, followed by U
+ * then V), but the exact Linear layout is undefined.
+ * These formats can only be used with a non-Linear modifier.
+ */
+#define V4L2_PIX_FMT_YUV420_8BIT	v4l2_fourcc('Y', 'U', '0', '8') /* 1-plane YUV 4:2:0 8-bit */
+#define V4L2_PIX_FMT_YUV420_10BIT	v4l2_fourcc('Y', 'U', '1', '0') /* 1-plane YUV 4:2:0 10-bit */
+
 /*  Vendor-specific formats   */
 #define V4L2_PIX_FMT_CPIA1    v4l2_fourcc('C', 'P', 'I', 'A') /* cpia1 YUV */
 #define V4L2_PIX_FMT_WNVA     v4l2_fourcc('W', 'N', 'V', 'A') /* Winnov hw compress */
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
