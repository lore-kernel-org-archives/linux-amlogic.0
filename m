Return-Path: <SRS0=IdmP=CQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49EC1C433E2
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Sep 2020 08:18:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F11E32145D
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Sep 2020 08:18:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Xv7E63kO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="jgO6nuaR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F11E32145D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=US0PxywvwWc2asrCRGrhY2f1RfPJBMGIpr4gUkHpcE0=; b=Xv7E63kOV3eHp4QSr2XIRUTFx
	652NM9v20prLnEJRjDoCPgg1aO5SGTlnv2ZswEtrW0BhE9IktIv8fl7Jle055Q462Hn17C3AJ4uBY
	ZjHh+Wl5HWxuBrN7HnTKbX5yMCDtUotS9RLT91xl3u7gIH+9886m70j7i1FJXkYFTDlnZhG/LS6lw
	N/NS0WahicL1ymwpoG4KMM6FpJ5hp09+PXt/2NTpLcWZWRR1MfFC2F1Cq7NIdeS9rX06Mtaju3dZK
	UNLqQ0WOLIHGKa6sosX7AOUdd8CwbIfP3D39IbkdyjMsQJ1uCHuHRb9tB6lQNqU1dwp2Y5HKC/L84
	QL8L4i0EQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFCMF-00010f-42; Mon, 07 Sep 2020 08:18:35 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFCMC-0000zY-Mf
 for linux-amlogic@lists.infradead.org; Mon, 07 Sep 2020 08:18:33 +0000
Received: by mail-wm1-x341.google.com with SMTP id w2so13480164wmi.1
 for <linux-amlogic@lists.infradead.org>; Mon, 07 Sep 2020 01:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=miWW6H6jXaFE/FyCEk5bY4nk7z7nkaDQEzvoX6DPlkA=;
 b=jgO6nuaRnlo0R2OYFX2vcDkqIExJA3JJthDEk7bvwcmzptmlrdmL9LVBaBYN+tgFno
 3Xy+PA6367n1pTE12o5y1KJC0pJan5XYQdAxgLIvpfe0/eYP3DeMjz+ck5qtw8SYM9qo
 J0AaFTHJ0hi2U58MsHU8vsIOh8yMo6JhUTSVtPjedZCyBClJAtST6EI2aUNnERV67TZa
 YxodpFCjL3Zli9Wgpg53hQ9fkU0GKZpETAQypmWG5MaFv9H51Mv0klk23hVicKOVW4iG
 3DaIltmO1vFQnyrBIMtX5/Sg2ECwSDcurrC2TGyBfPUxu9o94hsBvBuknTsJsT/RjFZT
 ZI1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=miWW6H6jXaFE/FyCEk5bY4nk7z7nkaDQEzvoX6DPlkA=;
 b=R2ikM9etPUtTkT/h1hTtPAFjKRa3U9ReSqNLoqzDzmXpprJxZSZbZ1ez5d29rAManS
 QWWMC+e0D3IJvcBiLgx0CU++dLQ1dRr56b6nyH6QThdY/HP/HF1ANUd3Oe6exbMkKcuY
 ev+FJAxGtPXKqJ1zbU0v/Os1AuhmakRI69dk5NVI7rHnVsBVsyQ9ym9fjck4i6/N/LLg
 Hef0ZT8OJcGD98o2UQL+CqsTJafEw276x/jhwc/0ACAZ8iNiCBSNPtgpKGcDVO3Tqf2A
 23jHdA7hxIS/NdyfZ7D+gWpwm2EBtXtt+f2tWDt9CjT31FIpvqOXdpPLyJd2r9KfTg+B
 1kdg==
X-Gm-Message-State: AOAM5311SY8mlCtIh4ud/rJSaGEkKAypeoKq/beV9gAesAK3N5ZSalJ2
 Hkk/an1K5ReoeAxH8njvIBA3UooxaENmjfDk
X-Google-Smtp-Source: ABdhPJzt7+ODbEr1nL9IMe4B5idhevglKUu034LrO7TAnTPbUIolpz1hDb42Mq+Viw7CjTrnT2KwwQ==
X-Received: by 2002:a1c:5605:: with SMTP id k5mr14600574wmb.142.1599466711691; 
 Mon, 07 Sep 2020 01:18:31 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5405:9623:e2f1:b2ac])
 by smtp.gmail.com with ESMTPSA id q186sm28032205wma.45.2020.09.07.01.18.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2020 01:18:31 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: daniel@ffwll.ch,
	devicetree@vger.kernel.org
Subject: [PATCH 1/6] dt-bindings: display: amlogic,
 meson-vpu: add bindings for VPU found in AXG SoCs
Date: Mon,  7 Sep 2020 10:18:20 +0200
Message-Id: <20200907081825.1654-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200907081825.1654-1-narmstrong@baylibre.com>
References: <20200907081825.1654-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200907_041832_739479_DC3FF7D1 
X-CRM114-Status: GOOD (  11.34  )
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
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The Amlogic AXG SoC family has a downgraded VPU supporting only MIPI-DSI output
after it's ENCL DPI encoder output.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../bindings/display/amlogic,meson-vpu.yaml   | 36 +++++++++++++++++--
 1 file changed, 33 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml b/Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml
index a8d202c9d004..e2e7d99d8ace 100644
--- a/Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml
+++ b/Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml
@@ -31,8 +31,10 @@ description: |
 
   The Video Input Unit is in charge of the pixel scanout from the DDR memory.
   It fetches the frames addresses, stride and parameters from the "Canvas" memory.
+  On the AXG family, the Video Input Unit direclty reads from DDR memory.
   This part is also in charge of the CSC (Colorspace Conversion).
   It can handle 2 OSD Planes and 2 Video Planes.
+  On the AXG family, only a single OSD plane without scalins is supported.
 
   VPP: Video Post Processing
   --------------------------
@@ -49,11 +51,13 @@ description: |
   The VENC is composed of the multiple pixel encoders
    - ENCI : Interlace Video encoder for CVBS and Interlace HDMI
    - ENCP : Progressive Video Encoder for HDMI
-   - ENCL : LCD LVDS Encoder
+   - ENCL : LCD DPI Encoder
   The VENC Unit gets a Pixel Clocks (VCLK) from a dedicated HDMI PLL and clock
   tree and provides the scanout clock to the VPP and VIU.
   The ENCI is connected to a single VDAC for Composite Output.
   The ENCI and ENCP are connected to an on-chip HDMI Transceiver.
+  On the AXG and G12A family, the ENCL is connected to a DPI-to-DSI
+  transceiver.
 
 properties:
   compatible:
@@ -65,6 +69,7 @@ properties:
               - amlogic,meson-gxm-vpu # GXM (S912)
           - const: amlogic,meson-gx-vpu
       - enum:
+          - amlogic,meson-axg-vpu # AXG (A113D, A113X)
           - amlogic,meson-g12a-vpu # G12A (S905X2, S905Y2, S905D2)
 
   reg:
@@ -92,6 +97,11 @@ properties:
     description:
       A port node pointing to the HDMI-TX port node.
 
+  port@2:
+    type: object
+    description:
+      A port node pointing to the DPI port node.
+
   "#address-cells":
     const: 1
 
@@ -102,11 +112,31 @@ required:
   - compatible
   - reg
   - interrupts
-  - port@0
-  - port@1
   - "#address-cells"
   - "#size-cells"
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          enum:
+            - amlogic,meson-gx-vpu
+            - amlogic,meson-g12a-vpu
+
+    then:
+      required:
+        - port@0
+        - port@1
+  - if:
+      properties:
+        compatible:
+          enum:
+            - amlogic,meson-axg-vpu
+
+    then:
+      required:
+        - port@2
+
 additionalProperties: false
 
 examples:
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
