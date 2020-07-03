Return-Path: <SRS0=oWvG=AO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 292A5C433DF
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 Jul 2020 08:08:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA8AD207DA
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 Jul 2020 08:08:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vXVIDhG6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="irvooNni"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA8AD207DA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ErKlKhRPdZtLLp0HxOh0rDN1jbfhisyDaLT0u61SMcQ=; b=vXVIDhG65GTE/8W/h946aVs8w
	4+SU+G6ppXL5XETIGUh4ML/y/wpuBNvCPWcA9bgjgO/3RuzpZDjGYSe3uhT6o1ZZ7DUuE8Cwj2Gmi
	HNdsbYciMBihVnWMYYwcp0w3bSPaxe6DtzBQwPndLxMHeDVDmblJNDN0AhoLpI4gHjNBlTolURy9T
	HUXQKGglJVkQ0X5rwLd97mrd+ybSko+rAIUPfZ8DucQwYB44dsLzClYApmsUlZKsUmQ7rZGNeguP1
	oReT5eA7fh8IfTVWYUjyaNi4GhFAUf6JJ1qA6WskXATW2Cko5k7IPkhp9W5tOcCrJMbuJSwW9hiUm
	jzNf5ph3w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jrGjx-0002Pf-8i; Fri, 03 Jul 2020 08:08:09 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jrGjU-0002AF-08
 for linux-amlogic@lists.infradead.org; Fri, 03 Jul 2020 08:07:44 +0000
Received: by mail-wr1-x441.google.com with SMTP id z2so9424674wrp.2
 for <linux-amlogic@lists.infradead.org>; Fri, 03 Jul 2020 01:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=S/mjHwVM8f0rq/Zev4sBdcwtGb3gRo37tSIraZ81Plk=;
 b=irvooNni8ppF3zhYSkb/ma6Pn6BlcuWTZojl7IUEdTWT36NOdSsRD7FBBpzx1dKc8V
 bHL83/EEdFaG4ln+dbldWAHt3tysxIGry6zJbQCDHs1ic6yUaWjCtwpVlIJOUr/DbeI4
 gj7InTpRBK+jW4ZY8HJGoEnGI/+Gj5FkuUwqwgzImwxdUrHtDUpnRwhD6xW71WXwngaM
 59H2nEh0/s3yO91j0l/BeQ5zenmqSKX2pxb3U0loZqupj8XUqoCzsl2D92mP9YhbLxzg
 BZuRrPE3qsgAVBEDdaCGopVWl9gCfSC94SERSvCLnz5cQyp8uq6IrGiMaKVrQ+gz1pF7
 MCIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S/mjHwVM8f0rq/Zev4sBdcwtGb3gRo37tSIraZ81Plk=;
 b=S/kd2B2Da3re91jBa1XO9JdS8y4WxuyNDk+qB6q6u0A5iYX4uHTnTBVM67IXbR+BB/
 6Fm+GIBYjk1gNDmv7kA6J+sIY8TWWn1Gna1ooXWsQeyVh46sG4kmqdW9i2ge9IDFuoF4
 pFVkeQD1xKc5kpiH1ey6kfF1jsc2HtgdFEdfGyv6BvOlIfu7TsQpaJLzXTPMY5x1MuZa
 ELJj8TvqaRu9iE0lYnkyHei4nyiHtIf7GjPnYhJNdBRE6LN3YTa7tXXWnIicIE+f9YXq
 IfEgsKrtxBVMdF8fDWARv0/DkK9337/K7l1m/YizWAv05bIrF1gZy/5j1HwnL4SW4Utr
 LTFg==
X-Gm-Message-State: AOAM531RZfasMNn2b32TAC03l9VBDc2OQSL2szXRASzKSZSspPOpJQtT
 u3HWHdtevzrg553sbvXcB8kpvg==
X-Google-Smtp-Source: ABdhPJxJJLudOK1rkxvKjKdG1LD8N7XgXA9RJ1vkVwlFVeqM2UG9fzwUDJOU18lmeGymV5QC28y1RQ==
X-Received: by 2002:adf:e74e:: with SMTP id c14mr37517057wrn.143.1593763658916; 
 Fri, 03 Jul 2020 01:07:38 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:6959:e617:6562:cabf])
 by smtp.gmail.com with ESMTPSA id 1sm12682403wmf.0.2020.07.03.01.07.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2020 01:07:38 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v9 1/6] drm/fourcc: Add modifier definitions for describing
 Amlogic Video Framebuffer Compression
Date: Fri,  3 Jul 2020 10:07:23 +0200
Message-Id: <20200703080728.25207-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200703080728.25207-1-narmstrong@baylibre.com>
References: <20200703080728.25207-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200703_040740_189063_00B9BD60 
X-CRM114-Status: GOOD (  14.26  )
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
Cc: jianxin.pan@amlogic.com, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
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

This introduces the basic layout composed of:
- a body content organized in 64x32 superblocks with 4096 bytes per
  superblock in default mode.
- a 32 bytes per 128x64 header block

This layout is tranferrable between Amlogic SoCs supporting this modifier.

The Memory Saving option exist changing the layout superblock size to save memory when
using 8bit components pixels size.

Finally is also adds the Scatter Memory layout, meaning the header contains IOMMU
references to the compressed frames content to optimize memory access
and layout.

In this mode, only the header memory address is needed, thus the content
memory organization is tied to the current producer execution and cannot
be saved/dumped neither transferrable between Amlogic SoCs supporting this
modifier.

Tested-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Reviewed-by: Kevin Hilman <khilman@baylibre.com>
---
 include/uapi/drm/drm_fourcc.h | 81 +++++++++++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index 993c1b342315..cbf92fdf2712 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -331,6 +331,7 @@ extern "C" {
 #define DRM_FORMAT_MOD_VENDOR_BROADCOM 0x07
 #define DRM_FORMAT_MOD_VENDOR_ARM     0x08
 #define DRM_FORMAT_MOD_VENDOR_ALLWINNER 0x09
+#define DRM_FORMAT_MOD_VENDOR_AMLOGIC 0x0a
 
 /* add more to the end as needed */
 
@@ -950,6 +951,86 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 modifier)
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
+ *
+ * The underlying storage is considered to be 3 components, 8bit or 10-bit
+ * per component YCbCr 420, single plane :
+ * - DRM_FORMAT_YUV420_8BIT
+ * - DRM_FORMAT_YUV420_10BIT
+ *
+ * The first 8 bits of the mode defines the layout, then the following 8 bits
+ * defines the options changing the layout.
+ *
+ * Not all combinations are valid, and different SoCs may support different
+ * combinations of layout and options.
+ */
+#define __fourcc_mod_amlogic_layout_mask 0xf
+#define __fourcc_mod_amlogic_options_shift 8
+#define __fourcc_mod_amlogic_options_mask 0xf
+
+#define DRM_FORMAT_MOD_AMLOGIC_FBC(__layout, __options) \
+	fourcc_mod_code(AMLOGIC, \
+			((__layout) & __fourcc_mod_amlogic_layout_mask) | \
+			((__options) & __fourcc_mod_amlogic_options_mask \
+			 << __fourcc_mod_amlogic_options_shift))
+
+/* Amlogic FBC Layouts */
+
+/*
+ * Amlogic FBC Basic Layout
+ *
+ * The basic layout is composed of:
+ * - a body content organized in 64x32 superblocks with 4096 bytes per
+ *   superblock in default mode.
+ * - a 32 bytes per 128x64 header block
+ *
+ * This layout is transferrable between Amlogic SoCs supporting this modifier.
+ */
+#define AMLOGIC_FBC_LAYOUT_BASIC		(1ULL)
+
+/*
+ * Amlogic FBC Scatter Memory layout
+ *
+ * Indicates the header contains IOMMU references to the compressed
+ * frames content to optimize memory access and layout.
+ *
+ * In this mode, only the header memory address is needed, thus the
+ * content memory organization is tied to the current producer
+ * execution and cannot be saved/dumped neither transferrable between
+ * Amlogic SoCs supporting this modifier.
+ *
+ * Due to the nature of the layout, these buffers are not expected to
+ * be accessible by the user-space clients, but only accessible by the
+ * hardware producers and consumers.
+ *
+ * The user-space clients should expect a failure while trying to mmap
+ * the DMA-BUF handle returned by the producer.
+ */
+#define AMLOGIC_FBC_LAYOUT_SCATTER		(2ULL)
+
+/* Amlogic FBC Layout Options Bit Mask */
+
+/*
+ * Amlogic FBC Memory Saving mode
+ *
+ * Indicates the storage is packed when pixel size is multiple of word
+ * boudaries, i.e. 8bit should be stored in this mode to save allocation
+ * memory.
+ *
+ * This mode reduces body layout to 3072 bytes per 64x32 superblock with
+ * the basic layout and 3200 bytes per 64x32 superblock combined with
+ * the scatter layout.
+ */
+#define AMLOGIC_FBC_OPTION_MEM_SAVING		(1ULL << 0)
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
