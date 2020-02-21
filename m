Return-Path: <SRS0=5fWL=4J=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67531C35641
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Feb 2020 09:09:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36E2820679
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Feb 2020 09:09:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qX7QrXKP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="bmtEkaEZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 36E2820679
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZMvfQthpPeN+1/q1JEa9Kr5gNPq0+vxsMzx0/ScHybY=; b=qX7QrXKPbHD4eG
	JcwMfO+QyDE9j16loKOPuS9cl7xq57lpnOBq9jrCW/kGDkVQH8j+v+5zNERcsLMscZNDhTJaFwTlv
	+hz73a6yhg/uclsS+MrJXLACf47k7gPCYWMEf99+mMBCWY6sLX/FdXpaZ+sMvcjW5+QGCGx8BcGFE
	vt/irDkTSbxI/7T1q0Xq6ibZEJq+Cry6fM04Mi71z2zhg14mrXyYo43rFLO15uUTsQLX/X7uxoOg+
	vRKmK8W5V8oj/MsGur+SBnCLJvBThjBi9yLbyeWYgQGkyeiAfB8w4jp7WenVnkuCtsToJ1hIiDDCL
	4iKB3kw2s1LpjylZO2fA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j54JN-000735-K0; Fri, 21 Feb 2020 09:09:29 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j54Im-0006Vy-MY
 for linux-amlogic@lists.infradead.org; Fri, 21 Feb 2020 09:08:54 +0000
Received: by mail-wr1-x441.google.com with SMTP id m16so1068690wrx.11
 for <linux-amlogic@lists.infradead.org>; Fri, 21 Feb 2020 01:08:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9ZPNY6eETpZNcp3QuqXzHqt5QrKJ6DQWjlcqya6MZlM=;
 b=bmtEkaEZQVDuBjGZWI82M+/IsDgVMHVVQjAzBDHWki9q2OsN0culoXtjRzi8Dz/XNh
 EogN5A1BN0w3+0KFBjUVnsF6korHn+5I2GEdvK9r0fhwRZl2hfOK9W5embpdYRKxQB9p
 twl7tMUmYXwIc2GF2v1KcITFU9GFjt4aYz6pp8GKs8CnmjZRDNvr6XM7K3CQpPp/Va6t
 LshrGPJ79xKiYRzVdHK/vreUPm6Ve55M4v4E8dPdBiWn6N7g/ld2kWYNt7TG6u9ZXQqz
 Qz/oX+weRZr6SkNwgeFsvj8SZVo3/OtQem9zhQa5BD55Aa8JS/CJW2jaiB50AF+k5aTW
 HPJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9ZPNY6eETpZNcp3QuqXzHqt5QrKJ6DQWjlcqya6MZlM=;
 b=cu+bFAnQyh5TnbMAyRtRmBuZZPaGaFcUTPwjx+Yii+mXt/LkMnQgmcj1PwrZNZJnOV
 W/EFgnM42LFrZSAGyB0IfY+fuivJjZPHyZXbfsWUBbG1Lt4jMFDoJEO81W6x+951mxq8
 Y4CnPA0EwnOrasz0tuCdsWXRarD/FwE37t5tvTTfnBdogrCmduoVBwSSBVghyt6h1z0A
 xwX/VsLGyR+sptHJexrtqy9kFAaSeICsQcYSkAfHS7cy/sxbx6bPCxLuGoFTDsuaE1EQ
 zEIHR5IZcSQbizF7IX3eJZsR9AQtCfDhBpR/4TJtu5KXGJI8nqh9hp1fMRnLkIc4coXe
 M2vQ==
X-Gm-Message-State: APjAAAXEE7ijj6EcyCBnwXMbOSowuLmNJNcKzae8JzENHDYd07H8emAT
 fz5W1xxC2MjAYe6DERP/r54zcA==
X-Google-Smtp-Source: APXvYqwrTul8MwamrflnqNdrhD9N5bYYaYFfP2VJ6rRFuo8i5A14iZUL5tCkRQmBlBfNjrWJApYCJA==
X-Received: by 2002:a05:6000:1012:: with SMTP id
 a18mr46758161wrx.113.1582276129963; 
 Fri, 21 Feb 2020 01:08:49 -0800 (PST)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:4ca8:b25b:98e4:858])
 by smtp.gmail.com with ESMTPSA id
 h5sm3173288wmf.8.2020.02.21.01.08.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2020 01:08:49 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 1/4] drm/fourcc: Add modifier definitions for describing
 Amlogic Video Framebuffer Compression
Date: Fri, 21 Feb 2020 10:08:42 +0100
Message-Id: <20200221090845.7397-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200221090845.7397-1-narmstrong@baylibre.com>
References: <20200221090845.7397-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200221_010852_747152_B10B56F5 
X-CRM114-Status: GOOD (  11.70  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Amlogic uses a proprietary lossless image compression protocol and format
for their hardware video codec accelerators, either video decoders or
video input encoders.

It considerably reduces memory bandwidth while writing and reading
frames in memory.

The underlying storage is considered to be 3 components, 8bit or 10-bit
per component, YCbCr 420, single plane :
- DRM_FORMAT_YUV420_8BIT
- DRM_FORMAT_YUV420_10BIT

This modifier will be notably added to DMA-BUF frames imported from the V4L2
Amlogic VDEC decoder.

At least two options are supported :
- Scatter mode: the buffer is filled with a IOMMU scatter table referring
  to the encoder current memory layout. This mode if more efficient in terms
  of memory allocation but frames are not dumpable and only valid during until
  the buffer is freed and back in control of the encoder
- Memory saving: when the pixel bpp is 8b, the size of the superblock can
  be reduced, thus saving memory.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 include/uapi/drm/drm_fourcc.h | 56 +++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index 8bc0b31597d8..8a6e87bacadb 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -309,6 +309,7 @@ extern "C" {
 #define DRM_FORMAT_MOD_VENDOR_BROADCOM 0x07
 #define DRM_FORMAT_MOD_VENDOR_ARM     0x08
 #define DRM_FORMAT_MOD_VENDOR_ALLWINNER 0x09
+#define DRM_FORMAT_MOD_VENDOR_AMLOGIC 0x0a
 
 /* add more to the end as needed */
 
@@ -804,6 +805,61 @@ extern "C" {
  */
 #define DRM_FORMAT_MOD_ALLWINNER_TILED fourcc_mod_code(ALLWINNER, 1)
 
+/*
+ * Amlogic Video Framebuffer Compression modifiers
+ *
+ * Amlogic uses a proprietary lossless image compression protocol and format
+ * for their hardware video codec accelerators, either video decoders or
+ * video input encoders.
+ *
+ * It considerably reduces memory bandwidth while writing and reading
+ * frames in memory.
+ * Implementation details may be platform and SoC specific, and shared
+ * between the producer and the decoder on the same platform.
+ *
+ * The underlying storage is considered to be 3 components, 8bit or 10-bit
+ * per component YCbCr 420, single plane :
+ * - DRM_FORMAT_YUV420_8BIT
+ * - DRM_FORMAT_YUV420_10BIT
+ *
+ * The classic memory storage is composed of:
+ * - a body content organized in 64x32 superblocks with 4096 bytes per
+ *   superblock in default mode.
+ * - a 32 bytes per 128x64 header block
+ */
+#define DRM_FORMAT_MOD_AMLOGIC_FBC_DEFAULT fourcc_mod_code(AMLOGIC, 0)
+
+/*
+ * Amlogic Video Framebuffer Compression Options
+ *
+ * Two optional features are available which may not supported/used on every
+ * SoCs and Compressed Framebuffer producers.
+ */
+#define DRM_FORMAT_MOD_AMLOGIC_FBC(__modes) fourcc_mod_code(AMLOGIC, __modes)
+
+/*
+ * Amlogic FBC Scatter Memory layout
+ *
+ * Indicates the header contains IOMMU references to the compressed
+ * frames content to optimize memory access and layout.
+ * In this mode, only the header memory address is needed, thus the
+ * content memory organization is tied to the current producer
+ * execution and cannot be saved/dumped.
+ */
+#define DRM_FORMAT_MOD_AMLOGIC_FBC_SCATTER	(1ULL << 0)
+
+/*
+ * Amlogic FBC Memory Saving mode
+ *
+ * Indicates the storage is packed when pixel size is multiple of word
+ * boudaries, i.e. 8bit should be stored in this mode to save allocation
+ * memory.
+ *
+ * This mode reduces body layout to 3072 bytes per 64x32 superblock and
+ * 3200 bytes per 64x32 superblock combined with scatter mode.
+ */
+#define DRM_FORMAT_MOD_AMLOGIC_FBC_MEM_SAVING	(1ULL << 1)
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
