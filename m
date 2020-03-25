Return-Path: <SRS0=FVXd=5K=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5FA1C18E5B
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Mar 2020 08:52:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 71BF3206F8
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Mar 2020 08:52:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RK5q3CsV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="pgsyudR/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 71BF3206F8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FKuNuZHe+icPePmMeGSKnx2oTsELMrDCMqVc/kkVmEo=; b=RK5q3CsV8dJ/Pw
	2VgDFR7C4Q/oC6gp2fKNM5gJN8VbkMqMMOvYx0cWThVURfywImVj5nNtiAHhtAaWFiify+T8Ryi4z
	IETOCkNTzHc/ZTtvQM2tlQnzsnlhJlbbD7APx/ImU6KN0MuOxdx1qePsc7mmP8k1tLTo+QMhY0m+s
	N/ta/gVsvNI47+1TsB6HKZYIIfe6zbYtohDSVMEbPGRl6z9WveD+S/R7BOGdfEkUHF98JR2Y+Ggrq
	u9y4rWAlNbA3wO1jTkuGYerElbVOhjjGfNUKF/5gy022x9TgdTjvAqI8pAHWmDK/WL/X3QTeynybH
	NDRQPlTM7iWc4Cx21dyA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jH1m8-00056n-W5; Wed, 25 Mar 2020 08:52:37 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jH1kD-0002ki-L7
 for linux-amlogic@lists.infradead.org; Wed, 25 Mar 2020 08:50:46 +0000
Received: by mail-wm1-x344.google.com with SMTP id b12so1387748wmj.3
 for <linux-amlogic@lists.infradead.org>; Wed, 25 Mar 2020 01:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ANDOlCT1ZqrnKgx/+UtkXPnR52K04rx8cZE8y2hTCQU=;
 b=pgsyudR/D2KpBB4/CqRb3vU07WoAY4c5vp9glayeMsrR3uDiTPhmtEDK+AWoQqkzHQ
 bvypr/WDimmRzKQ48OxtHMcKAjTT6iIXBdLTWhlFb+93oRxsvpeczFkVeg4aKq/wQ/Je
 rfl4bK1txMY3ppAZIm4afopOmNjNpExwGRpAeB14dZhpkQZNQb4VbGA0ALzAiWLVotmU
 +UiL8ZI9SrjEu3Uucu2dCRVRqDazHya8qIot8dJIp1DRUN6vEj9i3TURcaiYWPdGPb7v
 OTSR7GbpUra2bCrJH7EkC9JQfY3865RiKJi4lJo1XeMHh9yhUeU3NBZvxqC8MdfvsC0R
 pc5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ANDOlCT1ZqrnKgx/+UtkXPnR52K04rx8cZE8y2hTCQU=;
 b=gx78oQpm0xo/Fs8sSPrxiiMB27eWupAi2q4UNEqADsb0brCKq4clKhx6kwdv/JogR2
 zWgF1NyR6mWVdsu9vPQ4hnqmpWMVkCk9UjV4kI7ojtfJy4+fsACjKmqtS68qIIBXY51A
 jiAAs3CFSq1pd8ajXLy18QL/9AQSc/2WtmQMorhVDn2/L23xqc5oi+o8zxqfPYWGxd4v
 r1nRiUdd6zH8pZhAcA2vIZ1Kyv4+HaUtdQUta1XkAI2nAy6BZaadj9Tz/a+YCQIJWR1F
 lUsJyoGg5ISAiB4kl3jdFezEkOf9E1S65kc9mElXRPbbyKLJ0hTFGoRe9VNv5JNvAALH
 RrXw==
X-Gm-Message-State: ANhLgQ1xkNt3WDr1nfKxltDd/J8Af8wceggKNdAFmtSTtnyTz3rrVwNZ
 afFswpQyyJz2rw9B6krj71sXRA==
X-Google-Smtp-Source: ADFU+vur2MxTtHCjMfpHGxgRx4ZUbLJ6QSkqLw6sapP5tKS8pwjf38c2XDZiJmEAsfp/QTuirs7tBQ==
X-Received: by 2002:a1c:81:: with SMTP id 123mr2218819wma.97.1585126236258;
 Wed, 25 Mar 2020 01:50:36 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5c5f:613e:f775:b6a2])
 by smtp.gmail.com with ESMTPSA id o16sm33892229wrs.44.2020.03.25.01.50.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Mar 2020 01:50:35 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v4 5/8] drm/fourcc: amlogic: Add modifier definitions for
 Memory Saving option
Date: Wed, 25 Mar 2020 09:50:22 +0100
Message-Id: <20200325085025.30631-6-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200325085025.30631-1-narmstrong@baylibre.com>
References: <20200325085025.30631-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200325_015037_726154_750B4593 
X-CRM114-Status: UNSURE (   9.71  )
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
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 ppaalanen@gmail.com, linux-amlogic@lists.infradead.org, brian.starkey@arm.com,
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

Tested-by: Kevin Hilman <khilman@baylibre.com>
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
