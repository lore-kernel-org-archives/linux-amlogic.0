Return-Path: <SRS0=I4qu=6A=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0281C2BB85
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Apr 2020 15:27:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 72CF12223D
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Apr 2020 15:27:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="svF9YcWL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="WhOJRALY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 72CF12223D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cQP2qEzneSsCFhr0K35EYg5L+If1zGVtKUVmyUyXSFM=; b=svF9YcWL76vkTG
	CNRC3SO351KkaGA9TCigcEqO+kn2kp9ROlG0s3JHZvnBVaVFbmoNYzJbeBUrNDdVL10kvQ+H/+NZF
	JFX5Tn5Ykn2Hzf79tRCAbs5f3vPqiwcTuUanowCPPi/mmAGmkhrGAE2lz9I63epH2BFaHxFBoWKIf
	XBmGi0zTH1wSAXtFRRhmfWjP0hQHHoYhjlUF9hBgay6S1qAzqBKQ6omMmYzUvzvkC4eNWMdpAkcVF
	SbajmGwjMU6WWyziGLpQ2qGObD7pO4F/zFaFBhBiybQ916ZbVRzUmUgrKY4k9EzwN+i/9sFjg4Xku
	+hfEXlYRKWPMv7cwpsnQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jP6QT-0000pp-ON; Thu, 16 Apr 2020 15:27:37 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jP6OE-0006wf-4c
 for linux-amlogic@lists.infradead.org; Thu, 16 Apr 2020 15:25:23 +0000
Received: by mail-wm1-x342.google.com with SMTP id g12so5353013wmh.3
 for <linux-amlogic@lists.infradead.org>; Thu, 16 Apr 2020 08:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DzaSKn4cSSk3k+NN0i6pGCPn8vqE61m//mTImjLqruU=;
 b=WhOJRALYh24x37/GjVj9Zd9bfz3f/KUeQQrju/ctwcoa/3SdbeZoJf5HHRF+xv8u8I
 CBScgJnoMMs+kI3bS5XlCxMaqGGLVaQgjyqxYNqQ27vLL2/h1/XlWP6212Y5/3+4/YeH
 qu53cPfcioCAb2Z772lwuoyf16sGAxRYn+QRFcbkdfSsocBM7izk25GEFRTVKKdCX0CZ
 0wWoLh8MZTN4Euk3OPB5hHS5NsFRSEufZvhXKucOistUQdMennsoN6PuLN4uzCl/8MxV
 6X3KOXwVmVoTKmbf+WCJKhcgKcTbzjNovBgTGWUkOeOFbG4j9B/K2/0p9Ez2QROiy1w4
 i/Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DzaSKn4cSSk3k+NN0i6pGCPn8vqE61m//mTImjLqruU=;
 b=miwWGQu+V5bIGfQpLniaEWbAqg6OQBB4jEdvVjBEwPo9nw7jcotANGJYmKRjwPW/I5
 0sUj3wbmb8JVJaLYwnz8SjO4d3ZJlB/qkVwPqMspZPsYL+Xi60y9gDS0aHeo+fkkq5Qy
 7HEabKSWvy0ZSDoZSbgV9eRH7U4TY9SLghQpJImolXSLIDO3KIDSmpP0N83Vco0eY7w9
 LsKDltqfQ8jNgVwclm+KIpRUMYO4d4fOedeOjrG6CbRLrtPoR5kxJD1Z+EZJMaBYucWa
 eADVPfFVDe5Hlv9O7ZcLlreN3VQWi2OED5xfgF50llNatizacEJF86C4GhvTHg1Y8vJb
 F3Og==
X-Gm-Message-State: AGi0PuYcgKEWuHLXV/bPi6VVKrZIibDdAin/AZpHRfmalkF9hQJtk2Tj
 VrLfXZ/CrC5T6244FQ56XdVu6g==
X-Google-Smtp-Source: APiQypLaZFDZc8S5mgnDvOeQEVBVo+Ns/ShJ+crrWMRHJL15JEjj44C7VXY4PkyqeskL3CNTJD4UKQ==
X-Received: by 2002:a7b:c0d5:: with SMTP id s21mr5340614wmh.107.1587050715289; 
 Thu, 16 Apr 2020 08:25:15 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:39cc:a07:8b48:cc56])
 by smtp.gmail.com with ESMTPSA id
 i17sm18019489wru.39.2020.04.16.08.25.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Apr 2020 08:25:14 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v5 5/8] drm/fourcc: amlogic: Add modifier definitions for
 Memory Saving option
Date: Thu, 16 Apr 2020 17:24:57 +0200
Message-Id: <20200416152500.29429-6-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200416152500.29429-1-narmstrong@baylibre.com>
References: <20200416152500.29429-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200416_082518_280511_2AA1109A 
X-CRM114-Status: UNSURE (   8.39  )
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

An option exist changing the layout superblock size to save memory when
using 8bit components pixels size.

Tested-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 include/uapi/drm/drm_fourcc.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index a1b163a5641f..664dd238574a 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -843,6 +843,21 @@ extern "C" {
  */
 #define DRM_FORMAT_MOD_AMLOGIC_FBC_LAYOUT_BASIC		(1ULL << 0)
 
+/* Amlogic FBC Layout Options */
+#define DRM_FORMAT_MOD_AMLOGIC_FBC_OPTIONS_MASK		(0xf << 8)
+
+/*
+ * Amlogic FBC Memory Saving mode
+ *
+ * Indicates the storage is packed when pixel size is multiple of word
+ * boudaries, i.e. 8bit should be stored in this mode to save allocation
+ * memory.
+ *
+ * This mode reduces body layout to 3072 bytes per 64x32 superblock with
+ * the basic layout.
+ */
+#define DRM_FORMAT_MOD_AMLOGIC_FBC_MEM_SAVING	(1ULL << 8)
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
