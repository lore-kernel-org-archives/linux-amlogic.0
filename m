Return-Path: <SRS0=yw6d=O4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06A0EC43387
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Dec 2018 23:35:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C887E20869
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Dec 2018 23:35:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="F1DpU3s4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="lm0vozWz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C887E20869
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8sFfwaPwqVSIZo0dMxvg+K3EqvjL3r7fFO3StMHBoWg=; b=F1DpU3s4hRCPuo
	bwVeO+oS25NsD6/GgImIczJxzwOHQ5XRcjy0b5/AE568JD7tFdpzYUyvfxwWv7WPe4q4nwcboFr1V
	pLy49vcsiDdougFdC4yunwN3PMfpjg3FHYq9T1KAiAAfMAAvUPbUJbD3NdmbkeKdqdhM4jn5b3G+t
	9GUkpNG7PAuI3Wcq8gke+EN92nE6vmW2OMMh3TJWGSL9DDmm9N228KkMM7vdbuW4L95W3MWYcrC/7
	uS4WY5cNJ8oSn70ji9AcU+2UURq19THMNgpiBcb5iBV2Zjsg2WscO/fMYoPC3khURysVii9Snfs0f
	4xtotQHN0L3CbJQZ4PSQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gZlNH-0002R5-6c; Wed, 19 Dec 2018 23:35:35 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gZlNE-0002Pi-99
 for linux-amlogic@lists.infradead.org; Wed, 19 Dec 2018 23:35:33 +0000
Received: by mail-pf1-x444.google.com with SMTP id q1so10560343pfi.5
 for <linux-amlogic@lists.infradead.org>; Wed, 19 Dec 2018 15:35:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fM4yF5XC/CAQiBy4ThvTvJ1DsvWxr4n59kQ4YqGRqpM=;
 b=lm0vozWzqIMqSzNqPkOgcAURyg5cohtOOHkVCjZB1gLCtYPHOZVruQDE9iYb3dSXd4
 5xdkdqUg4SK3vpO/lkvlfIVSJgTOq8auhv6lmaEcKer/tLdo2t4IM9lHcxAuJs/BMHWl
 iYQfRBtz2iJ9HwlgsvgXQ5apoPKuBsBTI8Z3SfX2pI3jbViElLLrD4RqLK5OAAN/M4id
 SJhIWt1/XCl+HK8BEGQv6+3LhCrpJX3X+rdVID0cV3r2ELQsVbHSArFuvWOtyeUo6lU/
 mVRri/Iw3PeJfBRoMVRKGJTEYHZHtjmD25XBKdWA4dk5SA8GToQnt4+pn+R0ibCW+8pg
 JPQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fM4yF5XC/CAQiBy4ThvTvJ1DsvWxr4n59kQ4YqGRqpM=;
 b=VnBFok/Gdj2qwwW+uM3f6MjYHCmn1cAf+S2GZQC8OWSf4pgJzpEF8qIT7oiw4+UNLQ
 8nvEn6mps8nUnKuZH968cK0xkFzkkoOotU9ebZEkhTGGHnNqb8HCwpmCU+YvkbBraXCZ
 dumyPsbOFpqngJwiDV8P20G7dWLAVSNc2+lRiu4P0s45CYiDVrJMaQBTLbvTY1UFIfr/
 6GznYhNtFBFLGgW6b6WHqySdAhVe3DHqEmXg8MfrrHZw1U6Wa5wy1NSwKZAeQXnr0IV/
 /1YchnUqJ0M50eX5FbbCRJzgim3hy1EJnWqqLdoXmmLdQI9p0UcMRXG3jEqHKV1crA24
 Mrlw==
X-Gm-Message-State: AA+aEWaJMkwlb3G5DAaBEOqWGm8wMffqWUHBFYeBUnSUorlmEdAVWswT
 Sb59HcdYNe+lnfwl73kicmMr7TRER+s=
X-Google-Smtp-Source: AFSGD/URNddIK30HEXqw6ZADC+5p/tkf7IwJUk5WjGmzW5mEu7OMjI9RUJRrChHM577ksoagRlal/Q==
X-Received: by 2002:a63:334a:: with SMTP id z71mr21409240pgz.400.1545262521018; 
 Wed, 19 Dec 2018 15:35:21 -0800 (PST)
Received: from localhost ([2601:602:9200:a1a5:da9d:67ff:fec6:ee6b])
 by smtp.gmail.com with ESMTPSA id i21sm23692663pgm.17.2018.12.19.15.35.20
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 19 Dec 2018 15:35:20 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: linux-amlogic@lists.infradead.org
Subject: [PATCH v2 1/2] dt-bindings: arm: amlogic: add amediatech x96-max
 bindings
Date: Wed, 19 Dec 2018 15:35:18 -0800
Message-Id: <20181219233519.35287-1-khilman@baylibre.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181219_153532_324685_DB8340FB 
X-CRM114-Status: UNSURE (   9.59  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add new vendor for amediatech, and initial board: x96-max

Signed-off-by: Kevin Hilman <khilman@baylibre.com>
---
 Documentation/devicetree/bindings/arm/amlogic.txt     | 1 +
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.txt b/Documentation/devicetree/bindings/arm/amlogic.txt
index 8dbc259081e4..c50b084b6c59 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.txt
+++ b/Documentation/devicetree/bindings/arm/amlogic.txt
@@ -99,6 +99,7 @@ Board compatible values (alphabetically, grouped by SoC):
   - "amlogic,p281" (Meson gxl s905w)
   - "oranth,tx3-mini" (Meson gxl s905w)
 
+  - "amediatech,x96-max" (Meson gxm s912)
   - "amlogic,q200" (Meson gxm s912)
   - "amlogic,q201" (Meson gxm s912)
   - "khadas,vim2" (Meson gxm s912)
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 8c413d8cc2a5..c1bb0c220429 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -24,6 +24,7 @@ amarula	Amarula Solutions
 amazon	Amazon.com, Inc.
 amcc	Applied Micro Circuits Corporation (APM, formally AMCC)
 amd	Advanced Micro Devices (AMD), Inc.
+amediatech	Shenzhen Amediatech Technology Co., Ltd
 amlogic	Amlogic, Inc.
 ampire	Ampire Co., Ltd.
 ams	AMS AG
-- 
2.19.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
