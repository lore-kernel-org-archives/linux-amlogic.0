Return-Path: <SRS0=+CC3=YH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68E2FC4CECE
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Oct 2019 05:19:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3EECD21783
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Oct 2019 05:19:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pp70boAw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HqkvtcIx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3EECD21783
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4Gok7TtWrEd2lXd4uvJ2uPXzpNP25f4/nTknZUH/u18=; b=pp70boAw1uO4SR
	SkfBfmALKvsYriP+mfK+URyLFvGYGCfHGqsCXlLQGw15DXlsLW44Do1ZQGcYrOFb96N/P+qtDQGYA
	DNTUHs1N+cUIBANeCb7igHnJ/u4JTJ3wcz/dBydadAgKc80NkTxPDP772kgwuCIyE46jJjNBs30wP
	XPnoxkZPb34KwM5joZOm0YNvD2VJRW/wgYzspLRSJIez74zC+tlEx7Sl38GTVndNtlw/8MDNH74Sn
	ga+5CATvzlXgqhDZcY7DJNfS0WBnaUUlSqZYP4UZPfIePlhLWnm9dryEXbMPWToAsqS09jr4dtD26
	X7eB1BraOtoNynEODE8A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iJslE-0007Tt-AH; Mon, 14 Oct 2019 05:19:12 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iJskq-00076w-8u; Mon, 14 Oct 2019 05:18:50 +0000
Received: by mail-wr1-x443.google.com with SMTP id p4so2128606wrm.8;
 Sun, 13 Oct 2019 22:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EBOdxnEDjlDgTl8vnBYCTotGM7/cUtbcpepjO3ITy9M=;
 b=HqkvtcIx4fKEctevUUEDQOTu5HEOMNeeAb9/shYTajmx2Re/0dOg1GgHRiGwRty25s
 SBXJQNvNb2cGCcm5Pr+mmn3TFcjitR29pNr5hTE5vHoaExHo8O3GchfAqK8qhCxwcp0M
 To+wZDV4lGbYpLkAXnxH4Y+TOzbDmZA5CBbj45dpvNfib4XDDh/qM+S/SQWi4SfmEmrD
 9tHxoOaHiMbQtyH49+CbHYjrOwcU2Ii4+hAdRWN8tmtzEHtWJi5/iGX2Y3EKm+TyvPNj
 rYhmL7eE99NfYYG6be3fuPNZU/N6+HPDQjBYtYFyDho9EIJYOP/CJ5ZOOn37Cg2iujeY
 YseA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EBOdxnEDjlDgTl8vnBYCTotGM7/cUtbcpepjO3ITy9M=;
 b=Vkmth2L1MlEd7Myx3d4hr6iMfBcdfCwAxy4H9yb2C8w7+uMLLyeCcDR/4dzo712lst
 VrppweqrNXqF4A4iLXe641sBQ3JKOBwP2HjrWlwBogv5P5GclLstkKvyuL/nVJ35XB7E
 BDcUOJQuzW48uIoAOTNv1UkgLT4I4VYyBgrLZXO+xX1eAlDMRP0g9emq5R0HizTDuwOH
 SwOmzmmGR8sbaXAxFacEanj9GxOD+MkRME9nriZCDZwtQ9TneLMjNdyDTBc2cfuLA220
 IE7m9tg81Rk0O1lnIAkaEf+awfHKbE5Lq3xJ0UEn+JpeAMoOJwPCrd18It+yIVsVRlgg
 O/og==
X-Gm-Message-State: APjAAAUsUSLaRx/MNVlU2ZoBOGMCtS+kqk0WXaSP+blLp9wBUoamDCqp
 GLpkTFchBbSGt7Xe1ON+MLQ=
X-Google-Smtp-Source: APXvYqwQWNWKOAY7LNNHT2Gdp/MtDgCTCxVyDv07ozqa2/PmSE2211R5Hb8liynHEB7CXUTmglwy8Q==
X-Received: by 2002:adf:dd88:: with SMTP id x8mr13266930wrl.140.1571030325603; 
 Sun, 13 Oct 2019 22:18:45 -0700 (PDT)
Received: from Red.localdomain ([2a01:cb1d:147:7200:2e56:dcff:fed2:c6d6])
 by smtp.googlemail.com with ESMTPSA id 5sm14660340wrk.86.2019.10.13.22.18.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Oct 2019 22:18:45 -0700 (PDT)
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: davem@davemloft.net, herbert@gondor.apana.org.au, khilman@baylibre.com,
 mark.rutland@arm.com, robh+dt@kernel.org,
 martin.blumenstingl@googlemail.com
Subject: [PATCH v2 1/4] dt-bindings: crypto: Add DT bindings documentation for
 amlogic-crypto
Date: Mon, 14 Oct 2019 07:18:36 +0200
Message-Id: <20191014051839.32274-2-clabbe.montjoie@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191014051839.32274-1-clabbe.montjoie@gmail.com>
References: <20191014051839.32274-1-clabbe.montjoie@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191013_221848_310064_173E9DEA 
X-CRM114-Status: GOOD (  10.15  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Corentin Labbe <clabbe.montjoie@gmail.com>, linux-crypto@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patch adds documentation for Device-Tree bindings for the
Amlogic GXL cryptographic offloader driver.

Signed-off-by: Corentin Labbe <clabbe.montjoie@gmail.com>
---
 .../bindings/crypto/amlogic,gxl-crypto.yaml   | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml

diff --git a/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml b/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml
new file mode 100644
index 000000000000..5becc60a0e28
--- /dev/null
+++ b/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/crypto/amlogic,gxl-crypto.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic GXL Cryptographic Offloader
+
+maintainers:
+  - Corentin Labbe <clabbe@baylibre.com>
+
+properties:
+  compatible:
+    items:
+    - const: amlogic,gxl-crypto
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: "Interrupt for flow 0"
+      - description: "Interrupt for flow 1"
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: blkmv
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/gxbb-clkc.h>
+
+    crypto: crypto@c883e000 {
+        compatible = "amlogic,gxl-crypto";
+        reg = <0x0 0xc883e000 0x0 0x36>;
+        interrupts = <GIC_SPI 188 IRQ_TYPE_EDGE_RISING>, <GIC_SPI 189 IRQ_TYPE_EDGE_RISING>;
+        clocks = <&clkc CLKID_BLKMV>;
+        clock-names = "blkmv";
+    };
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
