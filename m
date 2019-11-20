Return-Path: <SRS0=YQie=ZM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D95DCC432C0
	for <linux-amlogic@archiver.kernel.org>; Wed, 20 Nov 2019 11:15:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ABBDA223D0
	for <linux-amlogic@archiver.kernel.org>; Wed, 20 Nov 2019 11:15:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hYnRqMC3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="yDKsahxL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ABBDA223D0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FxWuIgrFUS1CuAammfh288uIALM/xqhMeO6Go88dNOY=; b=hYnRqMC3eQB1Xb
	FmC57v/EwHD2BCvmh8QarCwd7nYtGQ5FZRxS5bNuvKa+fjfdwYm454iGTCBuWTnmB/3dk+9fO69k8
	k/wBJxzhUliApDTAY7ejCTGeNe8/7QgZIUEd+bLgm6E/+97486UhCavxm32r0M9XQ3mz1QDs/Bdsr
	vBWfCGlJFa/hCgJf1JiingimVOem/oNWZmANPiygw9aE6Yi0D1qgO7LPoiONnUACNxlDZRrKtjFVF
	tFr2PXKT5Vn2FwDdIJWOVvKsLVhrPgGGGrLqUwKsyTTNE3MgujfH+f7v3P+g5EQ6Fjd54WPr/ZqAu
	ek6uqualNBgAvmAcpNXg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iXNxU-0000cL-7X; Wed, 20 Nov 2019 11:15:40 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iXNwV-0006p2-3r
 for linux-amlogic@lists.infradead.org; Wed, 20 Nov 2019 11:14:44 +0000
Received: by mail-wr1-x431.google.com with SMTP id t2so891715wrr.1
 for <linux-amlogic@lists.infradead.org>; Wed, 20 Nov 2019 03:14:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ja7kn8nM5rQg+IdSoiS0Hj6iA3DSp06ChG/PAIh+vCY=;
 b=yDKsahxL4XEoVTSy9nI9vw6XP4e0ElslXK2PKtL1dSHo0DKVnDOCN7B+ptZDtjfvN/
 RZdtvW9hYYy2wtEZmwnr0dqku1ywWgdHJTjgcmAOwuWWo1QQK98mEEYLDSb9dv5sWv+K
 z9mDI9XIj1D5chjio5BHM3FirH67Ih7oucgqayFM4uxsHOqDoeurQWgaqMLeE3WUtvnl
 9wEVug9zAW7upPRi5AiKDJ/NtLpr33gPro8NWKIJ03yQv8QNO05EuF+v3tKQKjTzRQbg
 hYUiIdB2P/YSQZfEwIOqAhsXSLOP3Cy+tluNXV69i28MsNFb/HuHAtVNF4PKJptluxJV
 t9jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ja7kn8nM5rQg+IdSoiS0Hj6iA3DSp06ChG/PAIh+vCY=;
 b=lNt3Lv52KZyUL6wjukimFdfDwBBZfz+w2J0lqrx8yP1WXCRPrmXK6cMsRMzSRjrGOD
 MZAfDwHA/q1LD5fkKu1YN8glEOHsKgDNQ0O/NPDKIC2ZzXffIlgvahlN7Cryh6R3aRuU
 UBxjrs3LCBn6/rpzrNi2AXdvU7RF57BlaGswYWvnH5tmeF2ybmHqNdcP3zqn0A2DDbxq
 oeY8oucx/TACDDNBzD69K3bRJ56SekMNGI8PngQmrcn4rdg/oZxFWlZwfEZnx3x4Izyp
 H2Ylu2swuF3bRSz4vydIHwbNxGd69BLy+A7kL6O8YT0p6BOUbT4UcUGBuBhjj2oSV/mF
 Jw3A==
X-Gm-Message-State: APjAAAVGrwjwBqoT1MwE0o5e1ZD0SApgrz+c9O4cvKzDnNiEeEhs/j1K
 +Q0LA0Os/NJrx5iTRx/zGNoAzw==
X-Google-Smtp-Source: APXvYqwH4aS6TrfN/psjDpRkojuL6BjXTzCTMYaIzigeYCPayBYWGt9XP2jw+vQf19vd5P/yzoZvcg==
X-Received: by 2002:adf:ef8a:: with SMTP id d10mr2647778wro.314.1574248475978; 
 Wed, 20 Nov 2019 03:14:35 -0800 (PST)
Received: from bender.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id u1sm6061748wmc.3.2019.11.20.03.14.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Nov 2019 03:14:35 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: mjourdan@baylibre.com,
	devicetree@vger.kernel.org
Subject: [PATCH 2/4] dt-bindings: media: amlogic,
 gx-vdec: add bindings for G12A family
Date: Wed, 20 Nov 2019 12:14:28 +0100
Message-Id: <20191120111430.29552-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191120111430.29552-1-narmstrong@baylibre.com>
References: <20191120111430.29552-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191120_031439_188142_3599E58D 
X-CRM114-Status: UNSURE (   8.91  )
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
Cc: linux-amlogic@lists.infradead.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add bindings to support the Amlogic Video Decoder on the Amlogic G12A
family.

For the G12A family, a supplementary clock is needed to operate the
HEVC/VP9 decoder.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../bindings/media/amlogic,gx-vdec.yaml       | 57 +++++++++++++++----
 1 file changed, 46 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/amlogic,gx-vdec.yaml b/Documentation/devicetree/bindings/media/amlogic,gx-vdec.yaml
index 878944867d6e..8ea979bb97e6 100644
--- a/Documentation/devicetree/bindings/media/amlogic,gx-vdec.yaml
+++ b/Documentation/devicetree/bindings/media/amlogic,gx-vdec.yaml
@@ -27,12 +27,15 @@ description: |
 
 properties:
   compatible:
-    items:
+    oneOf:
+      - items:
+        - enum:
+          - amlogic,gxbb-vdec # GXBB (S905)
+          - amlogic,gxl-vdec # GXL (S905X, S905D)
+          - amlogic,gxm-vdec # GXM (S912)
+        - const: amlogic,gx-vdec
       - enum:
-        - amlogic,gxbb-vdec # GXBB (S905)
-        - amlogic,gxl-vdec # GXL (S905X, S905D)
-        - amlogic,gxm-vdec # GXM (S912)
-      - const: amlogic,gx-vdec
+        - amlogic,g12a-vdec # G12A (S905X2, S905D2)
 
   interrupts:
     minItems: 2
@@ -59,13 +62,9 @@ properties:
 
   clocks:
     minItems: 4
+    maxItems: 5
 
-  clock-names:
-    items:
-      - const: dos_parser
-      - const: dos
-      - const: vdec_1
-      - const: vdec_hevc
+  clock-names: true
 
   amlogic,ao-sysctrl:
     description: should point to the AOBUS sysctrl node
@@ -77,6 +76,42 @@ properties:
     allOf:
       - $ref: /schemas/types.yaml#/definitions/phandle
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - amlogic,gx-vdec
+
+    then:
+      properties:
+        clock-names:
+          minItems: 4
+          items:
+            - const: dos_parser
+            - const: dos
+            - const: vdec_1
+            - const: vdec_hevc
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - amlogic,g12a-vdec
+
+    then:
+      properties:
+        clock-names:
+          minItems: 5
+          items:
+            - const: dos_parser
+            - const: dos
+            - const: vdec_1
+            - const: vdec_hevc
+            - const: vdec_hevcf
+
 required:
   - compatible
   - reg
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
