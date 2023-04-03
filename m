Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6B43C76188
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Apr 2023 18:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=duaXCCXQiRH/7j5agSibreYdUlrr9h/8mbt0i8M4h2g=; b=3ejFyG391x6ew+
	wmcrslIhFRuvy6J5ak3Bs9Mky4WRK9d2Q2R6fo2uUlGLRBd2dcVCUNJCg7QY1LiPdMwBkQyRRMuma
	lgtqx+q2CzJsaGJz+d/6fmlQCuEyS/xXKovTTLsUdXv53WUkbgOmx4eD5D5WlWija6VID2lGQcS7y
	Gd4dQdWeMQnINzlBZfgSn2kEEbydY7oQOBv49xMwIqhL3clcze1rdvaByoxrAeDokPZxOoRrZ90C3
	e/FS8dR2K7Tzo511DzujP7m44dbX5zg6LOSslpmD5q72S03EjoFxQbwZiUpJaxWUYNqH/8HHFzPmN
	mn4REo8kvGv4Z5MbHrhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjOyw-00GDrC-16;
	Mon, 03 Apr 2023 18:32:42 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjOyt-00GDp9-0I;
	Mon, 03 Apr 2023 18:32:41 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id A07EA5FD35;
	Mon,  3 Apr 2023 21:32:35 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1680546755;
	bh=DHDyHk/Pj446xdaKqd95W4mapo90ZP6LvwdXXHadk4g=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=SmPZcTUEC/r/hmqWA/RXtzYGsxgvLoChyG8kQjKU/HL31+tReLvkPAA3TthzeVsVg
	 VzSeT+GKap7p/CePDVf1ApNhDaCmgEgakY0botQZv35ZHiCziL4gEUSGZkRxuexRB3
	 BKpBofnL7lsxwM2esYIpgMhIQ03rFS9fLEnuqlvERRfv2T8Ayonn9YxcGJe0l6zoQx
	 SIWHE/kVIRbnn6Wy5djfW/xlc+O/BvdiNQBs++pTFoCsmhC9tvEpIurnHgftiOsDlC
	 cXgZnNDSGyrKZTqqalFt3hKtrox+nKSJilVrXJqqKAUHeAD3GBa+7NMyeiR/OUalES
	 5wAs3UbYTTGpQ==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Mon,  3 Apr 2023 21:32:35 +0300 (MSK)
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
Subject: [PATCH v3 1/2] dt-bindings: spi: add Amlogic A1 SPI controller
Date: Mon, 3 Apr 2023 21:32:16 +0300
Message-ID: <20230403183217.13280-2-mmkurbanov@sberdevices.ru>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230403183217.13280-1-mmkurbanov@sberdevices.ru>
References: <20230403183217.13280-1-mmkurbanov@sberdevices.ru>
MIME-Version: 1.0
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/04/03 14:17:00 #21028104
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_113239_518795_3830622F 
X-CRM114-Status: GOOD (  12.21  )
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

Add YAML devicetree Amlogic A1 (A113L SoC) SPIFC.

Signed-off-by: Martin Kurbanov <mmkurbanov@sberdevices.ru>
---
 .../bindings/spi/amlogic,a1-spifc.yaml        | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spi/amlogic,a1-spifc.yaml

diff --git a/Documentation/devicetree/bindings/spi/amlogic,a1-spifc.yaml b/Documentation/devicetree/bindings/spi/amlogic,a1-spifc.yaml
new file mode 100644
index 000000000000..ea47d30eef43
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/amlogic,a1-spifc.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/spi/amlogic,a1-spifc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic A1 SPI Flash Controller
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
+      - amlogic,a1-spifc
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
+    spi@fd000400 {
+        compatible = "amlogic,a1-spifc";
+        reg = <0xfd000400 0x290>;
+        clocks = <&clkc_clkid_spifc>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+    };
--
2.37.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
