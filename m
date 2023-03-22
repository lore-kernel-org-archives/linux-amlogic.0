Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 307F2C76196
	for <linux-amlogic@archiver.kernel.org>; Wed, 22 Mar 2023 15:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gLOZcyEfczV8IN1utnaFx6NsqL4hktt3SsU7lyAfQ70=; b=IIH2HtKREArmYL
	WCEd3MLMCEZTPb0TwXq49keK1jv91I8ZWgr/fHpxwIoRpWGoF1bxiZGzuZq7KkftHq4Tnq64cZo1a
	ACSvmKIftwDrCue1q6t9Y94gCMKgVGYxV6CUuwx7+gOIhwdleahlni1e15br661xt26c/IrmjZ5/l
	ILxm/QNNVDV81rDs2N5TJsbqkknkTg6VEJ3sroUaL9nKqE2dtYtrXJGiwP15iEbkxPoeMYuZnvxLH
	P6OaOt4NYxFHcY7xkxuPQixmOwRlPqQiQ9ou4Q/urD+K2cQOwjaEw9+GigP6aurgynP2LxIFWZ22A
	7PlnFevmOI22VDLqYK8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pf02h-00GQoL-0F;
	Wed, 22 Mar 2023 15:06:23 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pf02a-00GQiC-0K;
	Wed, 22 Mar 2023 15:06:19 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id BA4355FD42;
	Wed, 22 Mar 2023 18:06:03 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1679497563;
	bh=L/cZhXKdgtCamQglShAZ97PbA1w3JdiautYGqxltivc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=kO4DuoLRQa2nQjI/QpH5Rmx3n4zAO8rfTC2pfj2Ykor5jwZlV8hUgal1C0AwQbghG
	 jUtLRIEF2iN9SYny7Ifsr71hC0wTUrhhAXYsJZEQGo3igrbM5KjLIDnmFQvP2LtpyE
	 xlbgg2Mq9EjtFV/kQClAKCc/FsB/Tq+Ow7AQzZ4oxb+dRMOzRl5iSP0VHeCK9kpiG9
	 nEPiA3b3lgGTUAPhglsNGQf/n9Bwk9almp518koq81yS4P+3P78Tp3UtakCebiHZ42
	 Lai/0Uzcmn79OW/YeRf6+78YmmGFTPsxCyixsALvEenyB5wQmRNQ1Enm0kYa5CoDrh
	 Y1vUB2o66TNPA==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Wed, 22 Mar 2023 18:06:03 +0300 (MSK)
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
Subject: [PATCH v1 1/2] dt-bindings: spi: add binding for meson-spifc-a1
Date: Wed, 22 Mar 2023 18:04:57 +0300
Message-ID: <20230322150458.783901-2-mmkurbanov@sberdevices.ru>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230322150458.783901-1-mmkurbanov@sberdevices.ru>
References: <20230322150458.783901-1-mmkurbanov@sberdevices.ru>
MIME-Version: 1.0
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH02.sberdevices.ru (172.16.1.5) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/03/22 10:34:00 #20990985
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_080616_332831_5BFE02B5 
X-CRM114-Status: GOOD (  12.60  )
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

Add YAML devicetree binding for Amlogic Meson A113L (A1 family)
SPIFC Driver.

Signed-off-by: Martin Kurbanov <mmkurbanov@sberdevices.ru>
---
 .../bindings/spi/amlogic,meson-a1-spifc.yaml  | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spi/amlogic,meson-a1-spifc.yaml

diff --git a/Documentation/devicetree/bindings/spi/amlogic,meson-a1-spifc.yaml b/Documentation/devicetree/bindings/spi/amlogic,meson-a1-spifc.yaml
new file mode 100644
index 000000000000..5f84063b01f8
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/amlogic,meson-a1-spifc.yaml
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/spi/amlogic,meson-a1-spifc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic Meson A113L SPI Flash Controller
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
+          compatible = "amlogic,meson-a1-spifc";
+          reg = <0xfd000400 0x290>;
+          clocks = <&clkc_periphs CLKID_SPIFC>;
+          #address-cells = <1>;
+          #size-cells = <0>;
+    };
-- 
2.40.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
