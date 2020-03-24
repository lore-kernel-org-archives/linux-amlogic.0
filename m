Return-Path: <SRS0=WAM1=5J=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E727DC43331
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Mar 2020 14:21:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA70E20788
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Mar 2020 14:21:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ws86CBG2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="kgvsjSTR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA70E20788
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jDXfb1y32yNtYj0qw35+URK8nbejHueWdsKNB4yepvY=; b=Ws86CBG2Z6DYMF
	4Ttne0XAZmR8MrernLy5XJ+4ybAtffaiF1YE3MoNbjrcB7uy2j0/nZH6Wg4H94SJz5z0mlDrr5pjR
	a402xY0sefwhuECHI2gqHzFpToUGj4dPsBdgYbWjFWyYqGFPO7CbpjkRORFymRfsZA+xq5DJUF7IU
	W82uQGBsX5FqOrIAp6zcQML9pXBUCCBXkwTk1pihBVFpt18L3zJZXgeb1MP6f22OGrFSDnE5XHg+7
	n4UlqMnInxnRjP3MH0LHTw5ylcoyBwhc20zTStSmmnAK2VBlPqTjlz3EyJ5/AcLSWvk2tHzHl28P1
	696r2gUoXu8lrDZE8fcw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jGkR9-0008CF-Vi; Tue, 24 Mar 2020 14:21:48 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jGkPv-00075X-NF
 for linux-amlogic@lists.infradead.org; Tue, 24 Mar 2020 14:20:34 +0000
Received: by mail-wr1-x441.google.com with SMTP id m17so12685690wrw.11
 for <linux-amlogic@lists.infradead.org>; Tue, 24 Mar 2020 07:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/WyG+n8djNvIo3nOPxwWbAPG6RneB4WAm9wKQe+zHsY=;
 b=kgvsjSTRISrTA5t190/L3CdCx53KraHUPzxQJAdGOT+B+wo7Q++j7C4esQEoaZ7m9h
 lqxHe1yA3pKLxXcTcp1PZBy/RGQYypcaCqsD1do5Q5HE503nZClU6tjyBP2B+2+A3Bbl
 YrqdoRemrNhhrEP+Iwf/fd4QFc35y00KP3OxbGbUnMZVN+odWo1UrlH+wGIuxv1F2NSy
 30Fjn/Y8zBVVMHsDHd/L2UiwFCuDo34GQCisSPQ6D3S9iPjaF45260jNChtx78S0RlM4
 8jNTxmBnzt2nbGrv3cFc2u33hMfxJkXl2hz+cYC9bumk9LkB7atxovFX3Y6A6lxGneHw
 b3BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/WyG+n8djNvIo3nOPxwWbAPG6RneB4WAm9wKQe+zHsY=;
 b=o6eyxtlfPlf7P9RCgEaZ10FcDWaZOAAgOy3rRWH7EeHaQxx106S44OHsHC1uqpkNNc
 LZzr9P+jutGO6MvJvnTP38gsyGGrmgCRGs7gu0ZNaZL5CV1OoE6jkKjAkfeV+rlZ+DsB
 rHsCQlVPJqlL9ZSb80Rdqw6XvZ4HLM/5Cfe7PuITMJY5gn6uGUL9K0Z/0XgYZZIEUCKR
 zpZBsUQS/zp27HpxX8DfwiTkgHykjZO+J11XJJ9qXHqcQ3FOl8009iXbDS42yUrpdQTn
 unQLHZmJzkH7whFQTbJk79DLYfoe4inOTpIuDLB456MXeAJ9bmRQIwaN3fnbclKRKgxL
 Z0qw==
X-Gm-Message-State: ANhLgQ3meiKIbvQQxPpXWDoAtF2JzEDEhrhbH5WLyBWLKHuKwxq0Bi+R
 cLcMlYeAKgC3P22yGzeZQ63K+A==
X-Google-Smtp-Source: ADFU+vu2pPTHrxXiQqwlVpbFf/IYZjooPuR+f8p2vHH2AMc5SvS3CVLEsI6qLMJRtysQLUQ01BwuVA==
X-Received: by 2002:a05:6000:10c6:: with SMTP id
 b6mr36580657wrx.130.1585059630058; 
 Tue, 24 Mar 2020 07:20:30 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5c5f:613e:f775:b6a2])
 by smtp.gmail.com with ESMTPSA id o4sm28688472wrp.84.2020.03.24.07.20.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Mar 2020 07:20:29 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3 5/7] drm/fourcc: amlogic: Add modifier definitions for
 Memory Saving option
Date: Tue, 24 Mar 2020 15:20:14 +0100
Message-Id: <20200324142016.31824-6-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200324142016.31824-1-narmstrong@baylibre.com>
References: <20200324142016.31824-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200324_072031_858372_A16D7479 
X-CRM114-Status: GOOD (  10.14  )
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

An option exist changing the layout superblock size to save memory when
using 8bit components pixels size.

The layout options starts at the 8th bit, keeping the first 8bits of the
modifiers bits to define the layout.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 include/uapi/drm/drm_fourcc.h | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index 6564813d2f7a..84edc5d69613 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -819,6 +819,12 @@ extern "C" {
  * per component YCbCr 420, single plane :
  * - DRM_FORMAT_YUV420_8BIT
  * - DRM_FORMAT_YUV420_10BIT
+ *
+ * The first 8 bits of the mode defines the layout, then the following 8 bits
+ * defined the options changing the layout.
+ *
+ * Not all combinations are valid, and different SoCs may support different
+ * combinations of layout and options.
  */
 #define DRM_FORMAT_MOD_AMLOGIC_FBC(__modes) fourcc_mod_code(AMLOGIC, __modes)
 
@@ -834,6 +840,22 @@ extern "C" {
  */
 #define DRM_FORMAT_MOD_AMLOGIC_FBC_LAYOUT_BASIC		(1ULL << 0)
 
+/*
+ * Amlogic FBC Layout Options
+ */
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
