Return-Path: <SRS0=I4qu=6A=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D7C3C3815B
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Apr 2020 15:25:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D7E421927
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Apr 2020 15:25:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="o6Aw4mOM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="LWOSh6J4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D7E421927
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iznjekmDIERyRk4+cQDTQfREvc+xe5bKrhf9H7v/bQQ=; b=o6Aw4mOM0jpmRw
	Gq9yvvagwFetrRdau9gVmzKij+TfPFGaH19tTEilUhYMp7T+NsGo2ma02UDoG0artXYgTEPfZiCHa
	X5ATg1HVpyzWpB8KFH4UCvZD/s0c0+V5Ha/h7L5m2/AtP2Ek+R0W7mt4Rq3mwa7DBwYwJohWc8cqC
	MTyxw91FsxEYDnVk2jH49Y8OjgaqZmvtlAlAb0obXPRx90nRM8rrcyZ8aL8nE/DN3lNxBh1o7N6Ce
	Pe80ZDIPIQkpWNYNW1YH1FAeNzQJz0WYVPhvQJTToDFYR8DMapckcOCNggMy/mILwPMm5HMVM6vyE
	8nUH7U59CJ4LZQjvgiJQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jP6On-0007RR-NG; Thu, 16 Apr 2020 15:25:53 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jP6O4-0005Ru-NT
 for linux-amlogic@lists.infradead.org; Thu, 16 Apr 2020 15:25:11 +0000
Received: by mail-wr1-x444.google.com with SMTP id j2so5298723wrs.9
 for <linux-amlogic@lists.infradead.org>; Thu, 16 Apr 2020 08:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hlAyBA8CcMUXp85BDwBKC42D/qldDHdyj7qKWzB2WdM=;
 b=LWOSh6J4oHdRqocw6T+gupl4SfkmDILSRdedkw9pNCBnbVeVMJ3p1vQ1jCXYGKSc9P
 G0TA75egWRpZcSgxW5QXjT5T6mgsnueYjjSx9mGvHqaYdLtSaspzusSO94UPUN+DouSZ
 YL8ZnEfEjC2DLNwASGkAg6MFSdsEZDekgema+Db2EoTTBZcR/Nkbp/j9cVxdKpaNpBAA
 ygQy9iRIzRrLeevaU+aGRWNGMt9BbEtSSS7diKjj3kezmFZRztjSvWPX+/rpsxr2B+Ck
 xSWSrg8bO2kyHv7vtQ7cLw8FXu+gjR3cfceCa7AzvF08UuE+wX+dbOjizaaXH6DNugSE
 4rqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hlAyBA8CcMUXp85BDwBKC42D/qldDHdyj7qKWzB2WdM=;
 b=Ei7nFu1QexXCvTAA6cy7avrpUwe8kJQw1sS5c19qbKdKPaMz05bpAuLbAhaBGZCFqw
 6nhMTO1Z+1wHHwGEpdHkPfjiKXQ5gPuOqFLPidgG+SLJHjT5SjqOiJzH9FRsHnRggiMC
 2aUtOQ73r2rDXmOJicAHUvSTVq9C7PxSj4BCwlnLoke+1Djx5INDw2NVyWe7M4G1PVoY
 zYxU7m25UOebxzU+pwhM+d6zrDJph3EV+D1T6UoZK8ONrk5W0QKTl5qvrmV/6NByAluD
 EvhAeYSi3SZ+YA3GizrCvo524JtIs5sJ/2QSKdSkhR7mR/ngd12hcB18qDVinK2FqBO1
 /rhg==
X-Gm-Message-State: AGi0PuaJJIuQhsLrT6RfZUPd645o1zcRH2eJ2HqNmWT9wzlGA91KnXG8
 szLbUGMys0KA+sM3I9PdkbV1VQ==
X-Google-Smtp-Source: APiQypLqBg7kl4HJjT8KQzhJlt3fJAI3Rp5CAv4vKPEYnCZ6J+g5WvsII7utk6pPSMtnCGw9RSueSA==
X-Received: by 2002:adf:cd84:: with SMTP id q4mr20565789wrj.320.1587050706682; 
 Thu, 16 Apr 2020 08:25:06 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:39cc:a07:8b48:cc56])
 by smtp.gmail.com with ESMTPSA id
 i17sm18019489wru.39.2020.04.16.08.25.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Apr 2020 08:25:05 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v5 1/8] drm/fourcc: Add modifier definitions for describing
 Amlogic Video Framebuffer Compression
Date: Thu, 16 Apr 2020 17:24:53 +0200
Message-Id: <20200416152500.29429-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200416152500.29429-1-narmstrong@baylibre.com>
References: <20200416152500.29429-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200416_082508_784922_FDBF9875 
X-CRM114-Status: GOOD (  10.33  )
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
Cc: linux-amlogic@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
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

Tested-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 include/uapi/drm/drm_fourcc.h | 39 +++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index 8bc0b31597d8..a1b163a5641f 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -309,6 +309,7 @@ extern "C" {
 #define DRM_FORMAT_MOD_VENDOR_BROADCOM 0x07
 #define DRM_FORMAT_MOD_VENDOR_ARM     0x08
 #define DRM_FORMAT_MOD_VENDOR_ALLWINNER 0x09
+#define DRM_FORMAT_MOD_VENDOR_AMLOGIC 0x0a
 
 /* add more to the end as needed */
 
@@ -804,6 +805,44 @@ extern "C" {
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
+#define DRM_FORMAT_MOD_AMLOGIC_FBC(__modes) fourcc_mod_code(AMLOGIC, __modes)
+
+/* Amlogic FBC Layouts */
+#define DRM_FORMAT_MOD_AMLOGIC_FBC_LAYOUT_MASK		(0xf << 0)
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
