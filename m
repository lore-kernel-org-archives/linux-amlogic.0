Return-Path: <SRS0=NajJ=V5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0096FC433FF
	for <linux-amlogic@archiver.kernel.org>; Thu,  1 Aug 2019 13:58:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C751320838
	for <linux-amlogic@archiver.kernel.org>; Thu,  1 Aug 2019 13:58:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="R8elLYze";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="jGmz044j"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C751320838
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cYcR1//vM8NqJJfeVut8dTH8BB3dauwZ+GhDUhqVOpU=; b=R8elLYze8vy+ih
	7wYIBC61/LOWDaoFqsHAj/zGTewB3gKab/qwThqCqtvjVIEXtZHQ919qQIlkRlb3tZFm4ncJ5gG1E
	dimvzJmDTbyJKqq8X0CsGZ3HZoFViuAfvkv0/RKSprCUvpvQ/IsewKNElwp/9ePPBoUSV3kRIxP2M
	pVxumy5EH9tyLEHWAlTNBCLtU+eYYHESyiIFOtMfgoTrtbgzHsIz8lITT0e8GLZqZfRi+Fg2x/PMC
	f4pxERo1Gw3cSSRn2ZDnYc5XYEPUUY1jAQ1ri33NT3rw94AiKt0lGe5qOLXLh4AAKWn4dr2PlseHp
	Eb5cMypo9q68dhnJy8xQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1htBan-0002N2-2a; Thu, 01 Aug 2019 13:58:05 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1htBZc-00010u-Lf
 for linux-amlogic@lists.infradead.org; Thu, 01 Aug 2019 13:56:56 +0000
Received: by mail-wm1-x329.google.com with SMTP id x15so64786127wmj.3
 for <linux-amlogic@lists.infradead.org>; Thu, 01 Aug 2019 06:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FZwarWOpNsfuBiNZZzA2jg0GZdzk9/OxZhy/FP0yQ7I=;
 b=jGmz044jcrShOXq7CzTm7BxILFJc768gBT775ECewrSwU9tfB1EhhhESHHaAOMEPI9
 c5VUFoqxlIkkGYVGlqz4ahJc9dgEFju/iJRqCEm0fCEPdm0NaQEehFtrFUunyFPUATjE
 EsQ2eD+zsdnBbjnrlAF8lPnmNpgwDABwageVh7wvetyc5RARTGlx2PczcEfqUcZd4/MY
 QGOTHxvSuv/YT87sNQR9SdJYL9eqWDiSVwMx2oTAU3Soux69viI+mW0Da7Kg8pFH6XYO
 PDYlwVUpf7dYPqrzQHP960592DagEL86TUKuPRKKh9Ocg9Ea+evLn0X3Wa83ufc79lz+
 gyRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FZwarWOpNsfuBiNZZzA2jg0GZdzk9/OxZhy/FP0yQ7I=;
 b=igJVOvOEfvSMVT20sbQZi2ZmbBsrqRw6ibRe1JRqZcMzZVuRib92Z+pjI5GXs5bpyS
 k+VOcaQC2Sr1qz5CfvXfrWXrrSD0C8QRFm58L7XzVRbUV1Gl722q6FbsfZTECWv4LIGx
 rNMeqGtEWJUy7+U51dCyIwpRdG/mWLwkjdhoUmmiu+AEKUm7U5Nix2IWbCdCw0n+xeDW
 2BkhWOoI8+SzVeKLVZ2XX0twY0CGm3+K/Ma4H7h+X3h3ycEgu7Z1y6SlXw8uvzBhd8Vm
 PBkQ/hrAjZCOdZpZ6jQ/31gjn7NH1iPkGpU2YIXdyxMBfQfOId+jax70+LDfb6b/5tLT
 EJ8w==
X-Gm-Message-State: APjAAAXkxDGmXThFDMUuOTayNFOJ1mccGnS/DJCHsP2vqyZ9owNyCaRM
 CfUIu7n2lmwj/igyKxSb7SPD4g==
X-Google-Smtp-Source: APXvYqxIBCJNuUpkuBySMJgg64UolSv7bllV7knpcysRMFeaE4PZjgGi0kujrQ5yqkvJRph35LtR5w==
X-Received: by 2002:a05:600c:254b:: with SMTP id
 e11mr108630801wma.171.1564667810828; 
 Thu, 01 Aug 2019 06:56:50 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id u6sm69659952wml.9.2019.08.01.06.56.50
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 06:56:50 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: robh+dt@kernel.org
Subject: [RFC 4/9] dt-bindings: reset: amlogic,meson-reset: convert to yaml
Date: Thu,  1 Aug 2019 15:56:39 +0200
Message-Id: <20190801135644.12843-5-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190801135644.12843-1-narmstrong@baylibre.com>
References: <20190801135644.12843-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190801_065652_746884_ACBEEBF2 
X-CRM114-Status: GOOD (  10.12  )
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
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 p.zabel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../bindings/reset/amlogic,meson-reset.txt    | 19 ---------
 .../bindings/reset/amlogic,meson-reset.yaml   | 40 +++++++++++++++++++
 2 files changed, 40 insertions(+), 19 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/reset/amlogic,meson-reset.txt
 create mode 100644 Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml

diff --git a/Documentation/devicetree/bindings/reset/amlogic,meson-reset.txt b/Documentation/devicetree/bindings/reset/amlogic,meson-reset.txt
deleted file mode 100644
index 28ef6c295c76..000000000000
--- a/Documentation/devicetree/bindings/reset/amlogic,meson-reset.txt
+++ /dev/null
@@ -1,19 +0,0 @@
-Amlogic Meson SoC Reset Controller
-=======================================
-
-Please also refer to reset.txt in this directory for common reset
-controller binding usage.
-
-Required properties:
-- compatible: Should be "amlogic,meson8b-reset", "amlogic,meson-gxbb-reset" or
-	"amlogic,meson-axg-reset".
-- reg: should contain the register address base
-- #reset-cells: 1, see below
-
-example:
-
-reset: reset-controller {
-	compatible = "amlogic,meson-gxbb-reset";
-	reg = <0x0 0x04404 0x0 0x20>;
-	#reset-cells = <1>;
-};
diff --git a/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml b/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml
new file mode 100644
index 000000000000..dd211bf84f25
--- /dev/null
+++ b/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml
@@ -0,0 +1,40 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2019 BayLibre, SAS
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/reset/amlogic,meson-reset.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Amlogic Meson SoC Reset Controller
+
+maintainers:
+  - Neil Armstrong <narmstrong@baylibre.com>
+
+properties:
+  compatible:
+    oneOf:
+     - enum:
+       - amlogic,meson8b-reset
+     - enum:
+       - amlogic,meson-gxbb-reset
+     - enum:
+       - amlogic,meson-axg-reset
+
+  reg:
+    maxItems: 1
+
+  "#reset-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - "#reset-cells"
+
+examples:
+  - |
+    reset-controller@c884404 {
+          compatible = "amlogic,meson-gxbb-reset";
+          reg = <0xc884404 0x20>;
+          #reset-cells = <1>;
+    };
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
