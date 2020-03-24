Return-Path: <SRS0=WAM1=5J=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 379EAC41621
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Mar 2020 14:20:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E0ED20788
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Mar 2020 14:20:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Lnf5q6gs";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Xsl08M/P"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E0ED20788
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G6acIv2KgHlMp3wLDvfO3lnixiyFoQy2TKUXtVrr2h8=; b=Lnf5q6gsn7CD4c
	mddnqUhDXoyCkXpcDdw92pGWP2nz9+hzyZvd34NysIcl+6GHAPqq9qBD9ejyJTg2yQbdON4KjKads
	oMgEoQC2EQ1nvUQS5FgVC7VJyHyQTyrt3bH1E1eoU2W9xu04cIRFNcJ3cKzJ44ZiWpU9sLE/c87EV
	Hsps9npfXMFb8PQL9+GJ17X4sMQI4ncYVqeTJb8MtJNPeFGm9HjXMKhz2SmIWLR5OnPNvTNYTmFrk
	yu0GvjfLE11XS/1YOtzFPg+MDjUepz42FRqVLCAfkd1WQhhryNAg/2WQnPski4+N4gQwxuAgCTtyw
	rBU/I5VqRaYGe8mLOglA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jGkPu-00074d-Ir; Tue, 24 Mar 2020 14:20:30 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jGkPp-00070k-Uo
 for linux-amlogic@lists.infradead.org; Tue, 24 Mar 2020 14:20:27 +0000
Received: by mail-wr1-x443.google.com with SMTP id 31so15640198wrs.3
 for <linux-amlogic@lists.infradead.org>; Tue, 24 Mar 2020 07:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wAwZJvvwLgZDn1ywdQ6nPmOn7qCnl4VE3QuxXpY3Nzg=;
 b=Xsl08M/PvJVLWLPPkngG3LxHwcqqyhr1PyrntQo1Pjna55EDs/31lpg+TG8gyM5/HN
 3qsQEuzohclevTKn8dveoyUoF6SPBqe9oy0xahadz23jBugTJ6u3GqH6gID8E2tNcGR3
 UwHXHkoUTt/s20spoekxsaOKiGnKxhmDvMc3ZkpCIltoF5iM4f5siceEK58bjtzDZnnp
 zUyCUP0ZPizxM5h//4JTGHjyIMgA2B0r8ok+mhu4vaIWN7364GedTRyqqbs5YNhYELKs
 NEYFvYUjqli9tU9gd6UxpnDofklf/imdf613vFbnVFKXDQC9CcbZYullWH7c+K4ejNM6
 QfEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wAwZJvvwLgZDn1ywdQ6nPmOn7qCnl4VE3QuxXpY3Nzg=;
 b=ikug/zy0iXwW+Lg3MvYnCQDEcu+p10q2n4TYgM/HnVZaYNDi/00BSniQu0QQY7PFPS
 EWbGYcjxU1iKsbsKxyBp+m7Wz5MjkXa9DB2Fh9bp6DhmaL6R0EHxBD7jMY8Yz1Com2ou
 qkS5SjStK67E7LzCRDOFivY5e/+tzAQpZ0iSh4GWGaW7dqJ8hckIOs7BJgMJ27RHM/0c
 WxPiNeK9NVl6yext5jGJlEYW724R5Vq92nczrkZ+7jHCUAsRjLR4DSRC3B/0Mu4rKhFk
 XghVEnyuMdomSYX9UiiU97aQiJXzikegq4aIRA8SQmLibuPBbyGwtQCpBevGFr6XI9og
 LFDw==
X-Gm-Message-State: ANhLgQ3gZ9aMAY54p71pFpA9ErS0enh7dJzSNjSv2Txw2RjpEOJnbdG2
 xTkBrpsigTDv0M2Ywcw1NH9WGt6O1YDA1w==
X-Google-Smtp-Source: ADFU+vuWKFRgRnFG7irPanaxg/SMcv7FNJEKjQfKU2zqGDySjvyd/47d3NcTB7S4cBNrQ3ZYXpAi9g==
X-Received: by 2002:a5d:49c8:: with SMTP id t8mr22990127wrs.5.1585059624463;
 Tue, 24 Mar 2020 07:20:24 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5c5f:613e:f775:b6a2])
 by smtp.gmail.com with ESMTPSA id o4sm28688472wrp.84.2020.03.24.07.20.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Mar 2020 07:20:23 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3 1/7] drm/fourcc: Add modifier definitions for describing
 Amlogic Video Framebuffer Compression
Date: Tue, 24 Mar 2020 15:20:10 +0100
Message-Id: <20200324142016.31824-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200324142016.31824-1-narmstrong@baylibre.com>
References: <20200324142016.31824-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200324_072026_001694_510B7F38 
X-CRM114-Status: UNSURE (   8.90  )
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
Cc: mjourdan@baylibre.com, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, ppaalanen@gmail.com,
 linux-amlogic@lists.infradead.org, brian.starkey@arm.com,
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

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 include/uapi/drm/drm_fourcc.h | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index 8bc0b31597d8..6564813d2f7a 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -309,6 +309,7 @@ extern "C" {
 #define DRM_FORMAT_MOD_VENDOR_BROADCOM 0x07
 #define DRM_FORMAT_MOD_VENDOR_ARM     0x08
 #define DRM_FORMAT_MOD_VENDOR_ALLWINNER 0x09
+#define DRM_FORMAT_MOD_VENDOR_AMLOGIC 0x0a
 
 /* add more to the end as needed */
 
@@ -804,6 +805,35 @@ extern "C" {
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
+ */
+#define DRM_FORMAT_MOD_AMLOGIC_FBC(__modes) fourcc_mod_code(AMLOGIC, __modes)
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
+#define DRM_FORMAT_MOD_AMLOGIC_FBC_LAYOUT_BASIC		(1ULL << 0)
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
