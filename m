Return-Path: <SRS0=R0qk=Z3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4210AC3F68F
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Dec 2019 15:34:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 186B124651
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Dec 2019 15:34:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hY6GhgJ7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="1RAkL/Yq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 186B124651
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PopceeU67LKIVbylKip++C2dliKxAffyhpKoDdE6dF4=; b=hY6GhgJ76J1PHF
	RmZT46iM7Pps61ERKfUFKj2JFzvATYBoxuwgHCpzQUtl1EWRK/cjJPkOUotcjrYbXm/8mMLhRkKIQ
	szQ6KzQ7n5EJ5wkAaTEEKh5Y5nABp6IirM/JlmuXVY6lsRzkQatbJP2b8ReE5C2uta2Pj1ynWvUD3
	OijxWVS93rVwVf62+n2kMg8Uaxs7R8bPrmeduqpTCDRecS3udLvQZ3LCwpx3UH3kx/c7jGFHlThLJ
	5tgJFk7DbpDVTVO+Ps5VNJvpTWsmyeKx34NoDA6g8fj8x414vcmi8M0L7H9S1rtXCif36RSBlUCC7
	Hl+UWQCWzjUM1yvP4jVw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ict9B-0003hQ-MP; Thu, 05 Dec 2019 15:34:29 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ict8y-0003Td-Gj
 for linux-amlogic@lists.infradead.org; Thu, 05 Dec 2019 15:34:18 +0000
Received: by mail-wr1-x42b.google.com with SMTP id t2so4183284wrr.1
 for <linux-amlogic@lists.infradead.org>; Thu, 05 Dec 2019 07:34:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KzKSFA37zQ+fSsnCSfsJqcJWA1YqoEpujyYe82jiosA=;
 b=1RAkL/YqqEmrVPedzEg2Pc0Ov3GvHhQDDskUsdP88FKftcpyQigTss9I7/RJeNaUWJ
 8SxDYfPOP10oekWk/HW52CxH3vycbaZGijkt/iEktSBaQIOyZ+ZFiih4FwRMEvQrBtKt
 q40mxhTIaXZm6rmsGymyE03yDP1zjMp5GsS4ojcVZP+c8ME5ZADLF9qLjLlhNtZPpVna
 v40EMCUiDKqq0m4nYJfbIXt1EDhDHbUXfxR+luG/18Z936G2of2baLTrugjU1n9HO3i+
 M1BlbA/SLFnu4eSJEi3Ts5ZyZKM7eCVemr2cYZJV0SNcv33nR7gSciCyUWMV6MMUmrRs
 bYDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KzKSFA37zQ+fSsnCSfsJqcJWA1YqoEpujyYe82jiosA=;
 b=DryqvTc/0UbaxW9bPQ0bhI3nw565Y9j9Uzp8h6cwSWI5POt7jICsEdft33xPCobojH
 U1EeuhKJR0VhmQcAxLoIdYO9R1P7NA/oB0fUEUc15ih3YIhuKFJZAJRQyPOY3gpTR+Wf
 OCBvNpdxDEkurIC889y4emYkkMJgS15dbTpbNPxv+Yesgy1RNzdguc2Ph3wUeDPjL7nQ
 9PGsQwLQjZHhPTdbyeLxXb20NOMyc3yDnpT1V0u2wcORay8NgVCDq71Oc0hhfO/E/u5C
 OiTpwpSWaITe9dwMy/eke8+Zyz0Occi8xpi7+Bj3iXESwlmhewcBawe6CutUIftwl1oJ
 6D2Q==
X-Gm-Message-State: APjAAAVUxQ39WoUwpF4Pnkl7YpHzLExzxzmW/sFKl0rSb+zs6Emgvw87
 wug+o8tOvAv6fRoRpUy3MW2r3A==
X-Google-Smtp-Source: APXvYqzZBXKnAbQRB+UN+TlYuRc21RIUf2MlSS34PJhj5LkssDhww4cmP6eaWU2qSaFmGTFxlmAbFw==
X-Received: by 2002:adf:83c7:: with SMTP id 65mr10264958wre.368.1575560054836; 
 Thu, 05 Dec 2019 07:34:14 -0800 (PST)
Received: from bender.baylibre.local
 (wal59-h01-176-150-251-154.dsl.sta.abo.bbox.fr. [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id u26sm191894wmj.9.2019.12.05.07.34.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Dec 2019 07:34:13 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: mjourdan@baylibre.com,
	devicetree@vger.kernel.org
Subject: [PATCH v2 2/4] dt-bindings: media: amlogic,
 gx-vdec: add bindings for G12A family
Date: Thu,  5 Dec 2019 16:34:06 +0100
Message-Id: <20191205153408.26500-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191205153408.26500-1-narmstrong@baylibre.com>
References: <20191205153408.26500-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191205_073416_560734_F716F72A 
X-CRM114-Status: UNSURE (   8.59  )
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
 .../bindings/media/amlogic,gx-vdec.yaml       | 42 ++++++++++++++++---
 1 file changed, 37 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/amlogic,gx-vdec.yaml b/Documentation/devicetree/bindings/media/amlogic,gx-vdec.yaml
index 878944867d6e..cc8dc264fc72 100644
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
@@ -59,13 +62,17 @@ properties:
 
   clocks:
     minItems: 4
+    maxItems: 5
 
   clock-names:
+    minItems: 4
+    maxItems: 5
     items:
       - const: dos_parser
       - const: dos
       - const: vdec_1
       - const: vdec_hevc
+      - const: vdec_hevcf
 
   amlogic,ao-sysctrl:
     description: should point to the AOBUS sysctrl node
@@ -77,6 +84,31 @@ properties:
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
+          maxItems: 4
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
