Return-Path: <SRS0=NajJ=V5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB2E0C19759
	for <linux-amlogic@archiver.kernel.org>; Thu,  1 Aug 2019 13:57:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A391C20838
	for <linux-amlogic@archiver.kernel.org>; Thu,  1 Aug 2019 13:57:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mYA3iXZ3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="ucI0/5rQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A391C20838
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JYAgbrLCLscGrHcQznYQhgSFmhKNJakHsHpCosgr+A4=; b=mYA3iXZ3xWlBII
	MLERJUhcImVHYOGdPLyGygCb2qqU44dRbl51NzkBE1Bh/0NAj0SqR/vCzFeE1+SEurrWpEhUqngPu
	yKmNM2zHUBUzsPI6UGFaIHPIxq52Qo1XjRqiW/PBF6v6CmRWyxYO0PM80UVBhTea9flePfU+AedlQ
	pfXvFS7kiA+GZrj4jgSI04buoEof7wmwPd9FL1T8R0EtT8hUPansD1s0BFktna4xDhBBjvyEDNKMg
	075lQFv1HCAqN3S5Bz+Tta9hsyuOEsPH2rQHTC06EmwdbeeD/OZJ+y0OQnzuXLzL3HUD2tQEf/SS4
	EoacbEab6erVGT6KM17Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1htBaG-0001mT-Rl; Thu, 01 Aug 2019 13:57:33 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1htBZa-0000zc-Om
 for linux-amlogic@lists.infradead.org; Thu, 01 Aug 2019 13:56:54 +0000
Received: by mail-wm1-x343.google.com with SMTP id s3so64732992wms.2
 for <linux-amlogic@lists.infradead.org>; Thu, 01 Aug 2019 06:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pSLblDT1YKW8Afz4DjDElhvTYG2p3Mxb+10IzzVXgtY=;
 b=ucI0/5rQdHTSxdJdYemT9PDdqOARI3UUZkH6O0xd7g8wM48+t9yXTvlgzxD7g2R24E
 lLZ78/XiwJfnNa4MJ/OafucujFyV0Gn8lJdLGwKq2RtOXvAdBzALsB1rgo+xHG6LwGwI
 s3L8u9aycO26fTsHxnIx/tf/eEnkyL+/5JkWmb21o3/C6biyg0lSjXjwlNJXC3eieNIn
 xOcItVB3gKdG6VaHVj2t5pL5GohWo3w3FUZS1t1121B9Jkc90ujqeHaLnMc/Le2XM1A1
 vdDhE5iexQkHFXsLrhBHx+sS4Ua7LDUlN7QtVRZcj7VPVxOD075d4wHK8VxxA9tKVqJG
 O+2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pSLblDT1YKW8Afz4DjDElhvTYG2p3Mxb+10IzzVXgtY=;
 b=oFekuJci1fiIqGWKJrGsagE13tBnqr0Uvb5GP0Kjleq2TJEktQ88YqPz8p5Yd6aVEH
 SH6WV9nL1yaGPBG8zJLRkNsCsoivN29NRHBeB9l/PmiYTq/LbI2hKibzB26nNFDPBtjC
 ig1NJQCSpmOMdkT6IBbUpkT/qtLxFejQDOYMzPV/lOVZf09rnP2SkxB3cAHAp4OEAZTq
 7qqQ96GobdGmcQzHHachqIiMwZqBN//cB63SpqndDEpRcaaeuFMoywDzi/sMD/igcPeE
 frj73rxA1oaVt5SAaSiLj/l6FDyUEqony+7IM24MrkAuelr9kV+OkuffKN7RZhiV5KWq
 l7LQ==
X-Gm-Message-State: APjAAAWm4KrmctiUrkCgu0d5RULoHU59KCUhDyvDJfS8mQ+iFSKhNNHx
 3/ov1Io9JdM2i/KKzIgkpz9MTg==
X-Google-Smtp-Source: APXvYqxXU06So5Pals1RaZnKSyC27tttAB15Zd1eoyj2ze5k4q4HC26blumIHYeeqBiyLih9oLDmgA==
X-Received: by 2002:a1c:6a17:: with SMTP id f23mr54493426wmc.91.1564667808925; 
 Thu, 01 Aug 2019 06:56:48 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id u6sm69659952wml.9.2019.08.01.06.56.48
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 06:56:48 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: robh+dt@kernel.org
Subject: [RFC 1/9] dt-bindings: mailbox: meson-mhu: convert to yaml
Date: Thu,  1 Aug 2019 15:56:36 +0200
Message-Id: <20190801135644.12843-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190801135644.12843-1-narmstrong@baylibre.com>
References: <20190801135644.12843-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190801_065650_806758_3686BEEC 
X-CRM114-Status: GOOD (  12.13  )
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
 jassisinghbrar@gmail.com, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../devicetree/bindings/mailbox/meson-mhu.txt | 34 ------------
 .../bindings/mailbox/meson-mhu.yaml           | 53 +++++++++++++++++++
 2 files changed, 53 insertions(+), 34 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mailbox/meson-mhu.txt
 create mode 100644 Documentation/devicetree/bindings/mailbox/meson-mhu.yaml

diff --git a/Documentation/devicetree/bindings/mailbox/meson-mhu.txt b/Documentation/devicetree/bindings/mailbox/meson-mhu.txt
deleted file mode 100644
index a530310772b9..000000000000
--- a/Documentation/devicetree/bindings/mailbox/meson-mhu.txt
+++ /dev/null
@@ -1,34 +0,0 @@
-Amlogic Meson MHU Mailbox Driver
-================================
-
-The Amlogic's Meson SoCs Message-Handling-Unit (MHU) is a mailbox controller
-that has 3 independent channels/links to communicate with remote processor(s).
-MHU links are hardwired on a platform. A link raises interrupt for any
-received data. However, there is no specified way of knowing if the sent
-data has been read by the remote. This driver assumes the sender polls
-STAT register and the remote clears it after having read the data.
-
-Mailbox Device Node:
-====================
-
-Required properties:
---------------------
-- compatible:		Shall be "amlogic,meson-gxbb-mhu"
-- reg:			Contains the mailbox register address range (base
-			address and length)
-- #mbox-cells		Shall be 1 - the index of the channel needed.
-- interrupts:		Contains the interrupt information corresponding to
-			each of the 2 links of MHU.
-
-Example:
---------
-
-	mailbox: mailbox@c883c404 {
-		#mbox-cells = <1>;
-		compatible = "amlogic,meson-gxbb-mhu";
-		reg = <0 0xc883c404 0 0x4c>;
-		interrupts = <0 208 IRQ_TYPE_EDGE_RISING>,
-			     <0 209 IRQ_TYPE_EDGE_RISING>,
-			     <0 210 IRQ_TYPE_EDGE_RISING>;
-		#mbox-cells = <1>;
-	};
diff --git a/Documentation/devicetree/bindings/mailbox/meson-mhu.yaml b/Documentation/devicetree/bindings/mailbox/meson-mhu.yaml
new file mode 100644
index 000000000000..b84c4c05e176
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/meson-mhu.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2019 BayLibre, SAS
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/mailbox/meson-mhu.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Amlogic Meson Message-Handling-Unit Controller
+
+maintainers:
+  - Neil Armstrong <narmstrong@baylibre.com>
+
+description: |
+  The Amlogic's Meson SoCs Message-Handling-Unit (MHU) is a mailbox controller
+  that has 3 independent channels/links to communicate with remote processor(s).
+  MHU links are hardwired on a platform. A link raises interrupt for any
+  received data. However, there is no specified way of knowing if the sent
+  data has been read by the remote. This driver assumes the sender polls
+  STAT register and the remote clears it after having read the data.
+
+properties:
+  compatible:
+    enum:
+      - amlogic,meson-gxbb-mhu
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    minItems: 3
+    maxItems: 3
+    description:
+      Contains the interrupt information corresponding to each of the 3 links
+      of MHU.
+
+  "#mbox-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - "#mbox-cells"
+
+examples:
+  - |
+    mailbox@c883c404 {
+          compatible = "amlogic,meson-gxbb-mhu";
+          reg = <0xc883c404 0x4c>;
+          interrupts = <208>, <209>, <210>;
+          #mbox-cells = <1>;
+    };
+
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
