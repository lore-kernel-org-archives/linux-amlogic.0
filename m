Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6383C4829D
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Feb 2024 13:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ah42O82ncTWGORlsJrxxvri1TqmymEZQ1Asv2KQ4Mkc=; b=IPEg+u/ntPzgbY
	pnWGEU5UF6khpbKeCDkU9kaNbMp4SiWOaHHNpsNP78vfzqlOW4H3erwCuV/BMcINONhcetTlZyBgq
	Yio0o8P4rndUqvHd0R5d/kczlrPL0QPSiNwsPjocOdD533j2Ec46Cu1XCFlFfY3lcWMU8QXIxGdmI
	iC5n0eXCLnFf18uBRLmyfrmhxPpWDAyqeIsFB4sjbupbYGegNT9C6ku2am6kdHtzZu1ZxAl8Mpe5f
	F3Ow8kh5c83xfdv7JHR5iV/OsLCoB3hOlp6KlQtEBJMMBUacI/PYaiGyzSht23uqgFsPKsG9yfxFW
	Xuq7IuLP41sf7V/3IK2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZWkH-00000005dTI-3QvX;
	Mon, 12 Feb 2024 13:53:17 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZWir-00000005cNQ-0sAH;
	Mon, 12 Feb 2024 13:51:55 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id B42A310001D;
	Mon, 12 Feb 2024 16:51:47 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru B42A310001D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1707745907;
	bh=IRwgLeIR6ybauKW+ejxf9w28ns0m/CaiGYPhKUCYNTk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=dOOWvn0V4n+eHiKOTyBoulWgFXfNrzDewGNY9ZADOxNpkONMEV59gnVIfIDtGJToI
	 iQ428GiWVWUcwSf5e2gP7yWSAAwKTSBPnIarY86xKeKhwcxlQFZSZHus0uf71MZsDt
	 llLOo+oBE/1SopdfCWfQNbuoo+RXUi2WFYldGwPQdTqp7acu7BeQGCeHwVHZvzego2
	 6y4dV/QRqLQh/YDuXQTLKlflU0ebMY+yivozYycAxp9yhOgjYiE+w1nFAL9jsxCU1W
	 5S/x6nGsm5qfkXL2kaHqwn4wkNs0vOwK/nufeKDcHhvgQNgiXMNhdIeEYkzXMEJXNC
	 tuG3m66ebvVPg==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Mon, 12 Feb 2024 16:51:47 +0300 (MSK)
Received: from user-A520M-DS3H.sberdevices.ru (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 12 Feb 2024 16:51:47 +0300
From: Alexey Romanov <avromanov@salutedevices.com>
To: <neil.armstrong@linaro.org>, <clabbe@baylibre.com>,
	<herbert@gondor.apana.org.au>, <davem@davemloft.net>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
	<khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <vadim.fedorenko@linux.dev>
CC: <linux-crypto@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <kernel@salutedevices.com>, Alexey
 Romanov <avromanov@salutedevices.com>
Subject: [PATCH v4 16/20] dt-bindings: crypto: meson: support new SoC's
Date: Mon, 12 Feb 2024 16:51:04 +0300
Message-ID: <20240212135108.549755-17-avromanov@salutedevices.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240212135108.549755-1-avromanov@salutedevices.com>
References: <20240212135108.549755-1-avromanov@salutedevices.com>
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 183368 [Feb 12 2024]
X-KSMG-AntiSpam-Version: 6.1.0.3
X-KSMG-AntiSpam-Envelope-From: avromanov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 7 0.3.7 6d6bf5bd8eea7373134f756a2fd73e9456bb7d1a, {Tracking_from_domain_doesnt_match_to}, 100.64.160.123:7.1.2;smtp.sberdevices.ru:7.1.1,5.0.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;salutedevices.com:7.1.1;127.0.0.199:7.1.2, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/02/12 07:49:00 #23556813
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_055149_861265_26B9C5D1 
X-CRM114-Status: GOOD (  10.14  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Now crypto module available at G12A/G12B/S4/A1/SM1/AXG.

1. Add new compatibles:
  - amlogic,g12a-crypto
  - amlogic,s4-crypto (uses g12a-crypto as fallback)
  - amlogic,a1-crypto (uses g12a-crypto as fallback)
  - amlogic,axg-crypto

2. All SoC's, exclude GXL, doesn't take a clock input for
Crypto IP. Make it required only for amlogic,gxl-crypto.

3. All SoC's, exclude GXL, uses only one interrupt flow
for Crypto IP.

4. Add power-domains in schema.

Signed-off-by: Alexey Romanov <avromanov@salutedevices.com>
---
 .../bindings/crypto/amlogic,gxl-crypto.yaml   | 43 ++++++++++++++++---
 1 file changed, 36 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml b/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml
index 948e11ebe4ee..41f0153d58c8 100644
--- a/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml
+++ b/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml
@@ -11,20 +11,30 @@ maintainers:
 
 properties:
   compatible:
-    items:
-      - const: amlogic,gxl-crypto
+    oneOf:
+      - items:
+          - enum:
+              - amlogic,a1-crypto
+              - amlogic,s4-crypto
+          - const: amlogic,g12a-crypto
+      - enum:
+          - amlogic,gxl-crypto
+          - amlogic,axg-crypto
+          - amlogic,g12a-crypto
 
   reg:
     maxItems: 1
 
   interrupts:
-    items:
-      - description: Interrupt for flow 0
-      - description: Interrupt for flow 1
+    minItems: 1
+    maxItems: 2
 
   clocks:
     maxItems: 1
 
+  power-domains:
+    maxItems: 1
+
   clock-names:
     const: blkmv
 
@@ -32,8 +42,27 @@ required:
   - compatible
   - reg
   - interrupts
-  - clocks
-  - clock-names
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: amlogic,gxl-crypto
+    then:
+      required:
+        - clocks
+        - clock-names
+      properties:
+        interrupts:
+          items:
+            - description: Interrupt for flow 0
+            - description: Interrupt for flow 1
+    else:
+      properties:
+        interrupts:
+          items:
+            - description: Interrupt for flow 0
 
 additionalProperties: false
 
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
