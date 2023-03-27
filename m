Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D44F9C6FD1D
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Mar 2023 21:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tNfiQL8oUVFagtazrqJ56msodS+G+VQEG4aL4I6nlVk=; b=ewkHInM7yr+oyz
	ippBDctKdG+9xBrxaZ/cusji1uHqmH0s7b3fCOHN6WpW5J6FolT/ySshtlqke8J45MGvGOrmoLiAO
	aeQHzIWCaYl7wESZPqkX0JBBraHCSooBaC4WzFge/eGKI/fI4dXeTfmBdSpLrG6UZmLdkRlWh7VsU
	7uuQK4Bqoq6GyzhX73K1QpLJIKes2meFaV+8lHQBo93k0EO3d7YK6jT8KoSaJ+QwvNcoJIRbr7S5b
	Pjtyu8FCCRLnmspJ3w2iV1UJZXbzU9oDII66p5UiNVn528+NwZ6jTqPqwHK/p0Ca3/yklCFcM5wPO
	dv1C4E7kIY3Lo/d0QT5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pguB3-00CO5G-0o;
	Mon, 27 Mar 2023 21:14:53 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pguAz-00CO1S-2i;
	Mon, 27 Mar 2023 21:14:51 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 2AD935FD0E;
	Tue, 28 Mar 2023 00:14:37 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1679951677;
	bh=9QXWZXXnPKyi89P2UFi4LA2NOPDGvd/gPBu3Hi86flo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=a1W4v1rpgbR45hzPx1oeMVnatKjfjSk9OzA1GGK3oXN4wo4yZ7yowUpjhcEtaWSWR
	 YPuZRxWbsI69Cu2punVFEb6ByUF5O1ilCFe+Ex0WCy236BqHDXTBVF2hlbRZy4f0im
	 zpkJD0uSJdJQFOrREXGFPLbzRneER6mOJibJY9f6zTSQ0MAoZu+q1kQLWbY9f3X/pc
	 Sqh/+7fBTP1iX8evPDMC0SDATt5tnkdehK7tjVPALJ28T/bZbPZqDvgrVuxwmOyN26
	 WcK7osoMnpNOP2X6lqXTjRVqyfnAkrdgwciP5yZSDZOirPn/any85yV5xCqAn+cgqR
	 LbIKVb9LsEb6A==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Tue, 28 Mar 2023 00:14:37 +0300 (MSK)
From: Martin Kurbanov <mmkurbanov@sberdevices.ru>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Neil Armstrong
	<neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>
CC: <linux-spi@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <kernel@sberdevices.ru>, Martin Kurbanov
	<mmkurbanov@sberdevices.ru>
Subject: [PATCH v2 1/2] dt-bindings: spi: add Amlogic Meson A1 SPI controller
Date: Tue, 28 Mar 2023 00:13:50 +0300
Message-ID: <20230327211351.686831-2-mmkurbanov@sberdevices.ru>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230327211351.686831-1-mmkurbanov@sberdevices.ru>
References: <20230327211351.686831-1-mmkurbanov@sberdevices.ru>
MIME-Version: 1.0
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH02.sberdevices.ru (172.16.1.5) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/03/27 19:06:00 #21018749
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_141450_235444_DB7F2AC8 
X-CRM114-Status: GOOD (  12.75  )
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

Add YAML devicetree Amlogic Meson A113L (A1 family) SPIFC Driver.

This patch has dependencies on the A1 clock series which is still under
review - https://lore.kernel.org/all/20230321193014.26349-1-ddrokosov@sberdevices.ru/

Signed-off-by: Martin Kurbanov <mmkurbanov@sberdevices.ru>
---
 .../bindings/spi/amlogic,meson-a1-spifc.yaml  | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spi/amlogic,meson-a1-spifc.yaml

diff --git a/Documentation/devicetree/bindings/spi/amlogic,meson-a1-spifc.yaml b/Documentation/devicetree/bindings/spi/amlogic,meson-a1-spifc.yaml
new file mode 100644
index 000000000000..d2b1c754a6e1
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/amlogic,meson-a1-spifc.yaml
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/spi/amlogic,meson-a1-spifc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic Meson A1 SPI Flash Controller
+
+maintainers:
+  - Martin Kurbanov <mmkurbanov@sberdevices.ru>
+
+allOf:
+  - $ref: spi-controller.yaml#
+
+properties:
+  compatible:
+    enum:
+      - amlogic,meson-a1-spifc
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/amlogic,a1-clkc.h>
+    spi@fd000400 {
+        compatible = "amlogic,meson-a1-spifc";
+        reg = <0xfd000400 0x290>;
+        clocks = <&clkc_periphs CLKID_SPIFC>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+    };
-- 
2.40.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
