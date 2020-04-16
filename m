Return-Path: <SRS0=I4qu=6A=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE9F3C352BE
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Apr 2020 15:27:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B1D6214D8
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Apr 2020 15:27:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hzLF39SA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Q9sFCx/Q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B1D6214D8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iS7vXmLZ80D2GRDLurjRBwneLZRsoifx+QRkjwrxVUU=; b=hzLF39SAHDcxcw
	ZT3RvsmYX+jXV6hx84QZX8ik7C9keq4r/SwGjLayiglFaVCyr/IBI5QLLnHC4N87//rs6uIa+Ai7g
	x8n7dZPtGpiamzKQsGV3l70ibnPbZjFCCTgA0VWvzpsiKfu3A0+aBJvA9Mf8kkhw9vgqYK2Hlx3Hs
	sXQIIoYncZUQwrVzBtTyjDKvKCAMMIcnfb0Rt275AdEHWoLArhWKar4EKz9iPVyMxpSHyso4uKmsC
	HbPlOtWRRB60Elhp5MNuIj9VVCZUVNkYJiNferqnl6ryfOpRW8qToUYWvkLbCit+bSyCV1GUjnz05
	uaSW3vfpstBo5ElHpYjw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jP6Pz-0000L1-Tl; Thu, 16 Apr 2020 15:27:07 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jP6OF-0006z6-S9
 for linux-amlogic@lists.infradead.org; Thu, 16 Apr 2020 15:25:24 +0000
Received: by mail-wr1-x441.google.com with SMTP id d27so5374883wra.1
 for <linux-amlogic@lists.infradead.org>; Thu, 16 Apr 2020 08:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x74ZNY2Ii0Wq7WqU8UNzlM4qIe5Anz5MtvDWgXAqJ8U=;
 b=Q9sFCx/QxugMEbo/HrWaN7/l9wYvrDBzi+BaORQLde30NDU+pchUv6x2xo4yNFqJcW
 C7a7bKJTD9UtwfKR/BnAmmVHoYgycsF/kf1jx7CZXLkJJdvmLuZwyV4JBs3AXkqFod0M
 xv6XoDI8LhXY2WeJ6sQ+JyFUoxrljmxSmAK74DPbUQ0DNDoRYoxPB78f+pOGzlALSGKa
 psP4tH29K6BIye15yiigPWJW5F9yOpvQC36gvol17c1syMD22b8bMVf3nd0ZnIXa+KhO
 VSUkeR03lEnZd5cj7EsuDZjzUFWToJYoGX7UjSOD+EOpIijnNMkc1r3zIYrPXd3oKar8
 /9kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x74ZNY2Ii0Wq7WqU8UNzlM4qIe5Anz5MtvDWgXAqJ8U=;
 b=BpKgjMd2dHfVcJDawkZgDB16WaxDpTwMrYe8UF27Yn/3Pi/bcw4vLO1kqBMLSoyMOu
 tdgTG3uOl2eCr3GFAgRJmNQl9rxCikkguVUxqN0DfLmNbVaKl5SrrYTiQh6JSyZg2A7v
 3a5cpm2lUApiNdLWIIJ+EgkWCPC+91ieYfqIUjklHlskdxRFy2ewjLQejj8mMQ/EI1gi
 TKFBHxrepcKdvvrqhm0Hacz5uiVpKVnEUsLKgobUz3TxuixXXMdZzvKFHVs68slvDj6u
 eIIgop40n9Pa0VvpBkZFBN7P4c7WqKY9+av0Nxz09/YocjIwu65FJ9n7ALOgO+iq5jg2
 YAcA==
X-Gm-Message-State: AGi0PuYXybrJInatEG0p8EoKKTpbZEY0wju3hm/JAscm1A+KO3XetCxR
 nRsfKF+txKSQ0FPN2dBsUPMjiw==
X-Google-Smtp-Source: APiQypJD88ybgaDtDKq1U3lq0cPR53Jd+LyWH4BTyYS5P/piMZdjIcsHLVxv0kGThgLlWqtQbsiCcQ==
X-Received: by 2002:adf:f2c5:: with SMTP id d5mr35893659wrp.409.1587050718352; 
 Thu, 16 Apr 2020 08:25:18 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:39cc:a07:8b48:cc56])
 by smtp.gmail.com with ESMTPSA id
 i17sm18019489wru.39.2020.04.16.08.25.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Apr 2020 08:25:17 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v5 7/8] drm/fourcc: amlogic: Add modifier definitions for the
 Scatter layout
Date: Thu, 16 Apr 2020 17:24:59 +0200
Message-Id: <20200416152500.29429-8-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200416152500.29429-1-narmstrong@baylibre.com>
References: <20200416152500.29429-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200416_082519_988340_46B12EA8 
X-CRM114-Status: UNSURE (   9.66  )
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

This introduces the Scatter Memory layout, means the header contains IOMMU
references to the compressed frames content to optimize memory access
and layout.

In this mode, only the header memory address is needed, thus the content
memory organization is tied to the current producer execution and cannot
be saved/dumped neither transferrable between Amlogic SoCs supporting this
modifier.

Tested-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 include/uapi/drm/drm_fourcc.h | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index 664dd238574a..ac2d4753eb6d 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -843,6 +843,19 @@ extern "C" {
  */
 #define DRM_FORMAT_MOD_AMLOGIC_FBC_LAYOUT_BASIC		(1ULL << 0)
 
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
+ */
+#define DRM_FORMAT_MOD_AMLOGIC_FBC_LAYOUT_SCATTER	(2ULL << 0)
+
 /* Amlogic FBC Layout Options */
 #define DRM_FORMAT_MOD_AMLOGIC_FBC_OPTIONS_MASK		(0xf << 8)
 
@@ -854,7 +867,8 @@ extern "C" {
  * memory.
  *
  * This mode reduces body layout to 3072 bytes per 64x32 superblock with
- * the basic layout.
+ * the basic layout and 3200 bytes per 64x32 superblock combined with
+ * the scatter layout.
  */
 #define DRM_FORMAT_MOD_AMLOGIC_FBC_MEM_SAVING	(1ULL << 8)
 
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
