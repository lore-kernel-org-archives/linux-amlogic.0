Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A950C4332F
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Dec 2022 11:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qzU2aQEp+BnVYd/Z2Ipgy31OPhy/Ua/VXUJV5zICKWQ=; b=JitpsEDH9Kg3H4
	pB96Emoo5UAyR28tJ2bgsveOvNtKXhh7Q/kVS6H3L9zCVccS4DhVMgOLxWIC/XvdcMyue0e6USKMx
	qvRY/bQhkmaK69nR3PvK8AxIWsp33WHAauhzSMuMZFFsOIfBPkXEDB+HbigPOpF/2H8140UWkOjSt
	6yfQSIVJs8S1rXma3jj3XarQp0YOz1ptBEhhNcMJQWc9i+zAxFev55g4ql1Wi81QCBYR66CA4v2xZ
	BFMAF9X8rdu98hrPiH2rQGgjtvSrc1omVRB81jmHYJnluyc5RZpVdSPSTFcNRG7TAVUUAkE+6vYuB
	3hD85fkfMU3x7Sj8g5EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3F4P-00FEYS-5Z; Thu, 08 Dec 2022 11:28:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3F46-00FDQp-1i
	for linux-amlogic@bombadil.infradead.org; Thu, 08 Dec 2022 11:27:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=1+xgakROSa2tyyNfQUbDwsLUYdUS/rSfQ5IgxtrQvUM=; b=jViYQn0B8pfa4auS3/ti2rLbjw
	gJiNoJWKnGmmKwTJeW/BZbqtdmYYV6U8mnj8Hqm6JPODP7U9hMOKMD/KVujFv/jIOWCjcC+u6wiLx
	5tuny0iRDfhi4XTMqyMLsDI1fYva3QO3ZHg6uteDBH5d4yyn6uRRkxeMaLXMxf1trMNnlv1S80jwk
	eZ/STvi65YUMuutjbRfavbW1e51owxefenOZYy8fwT5EszBF91Pk0WzMolRTME3D656swh446gYTs
	Iv2GInHdvpvofFYcSN0KhBGkN453+S9+bWoi80FW9GiQXwn9dSPjIgZyxs0fgemsk5E30xHO3vSzR
	EQamhE+g==;
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3EBt-008ULG-8b
	for linux-amlogic@lists.infradead.org; Thu, 08 Dec 2022 10:31:48 +0000
Received: by mail-lf1-x12e.google.com with SMTP id cf42so1394799lfb.1
        for <linux-amlogic@lists.infradead.org>; Thu, 08 Dec 2022 02:31:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1+xgakROSa2tyyNfQUbDwsLUYdUS/rSfQ5IgxtrQvUM=;
        b=LWYhpiQGZcljQmKqXE0nzGnQ+/Xt4SK3zRwV0uDp4Sa5q5GaZMEb3tKeG3bFvYMrFK
         MrGzfhJ3kGPa856SsR3tflHMiU4nByAp3ECuciU5Q7abOa365oluhz3zmOGT42nTVhye
         z/9lX8nMtCI58JXJiBmEM0BM9e39Hy1X/6oygVowka6jOiEQH7kJ3hhED5wYhwC5slB4
         pkklhnpJ5g+7YI09TdUX7o/sk/X/vEd8XR8mLJpcvm1GyVFwPYBxsBTu4r0K/+HF5hRK
         GrT4yDKldhHuxLF+Jd3RigIXC+Rqykt9qV3sAnUIIGevqnA+MrCspDIyL5MmB99NDBdw
         6bCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1+xgakROSa2tyyNfQUbDwsLUYdUS/rSfQ5IgxtrQvUM=;
        b=rMAReqYkGrGLp3DUUNF6YuXoXmTXfohBCoOyOQsnH8R8BD7gHnFoY6jjPYdEWCdzPU
         v8MSX9DDA/8QBph6kTRi6wFaeQJ8faDkQFuinhg09nYwXo39MvVRkga4tB8jbpCOgH5O
         Wzr7l/n5wmRjvnN6r9CuDPbN9FXz7GS5A9og42XZmO2rBqgbPfWLFgEy3/ZNN3ZEsr9Y
         9HJEC35Yw8ieDABFD+scqzEphcRoLFPZE3cYXrFPzT1qTwQDsqtLp2ocA1NbQHFj1jBX
         WrqVgk3CgwSgJoTRafNDUDlUkWNtmu/NzBf7eJG3NvxvQzP+GfYKViNowZyjrkbEP+JD
         Xv9A==
X-Gm-Message-State: ANoB5pknbACrYJyhu9lUX6DR1cNZcb/9Q2Yh8289m0eFbCpFzCN8Sjyb
	ua9uaLJe2EwEQ/GfuvFPX0xmEw==
X-Google-Smtp-Source: AA0mqf7IIpnAZdER30ZNR4/8dvaWUTKWeHA+46Hr5MPcrEEGtcgkvblAk2HVaimF1GRTwBTFp6kXeA==
X-Received: by 2002:ac2:4ac8:0:b0:4b3:ac9d:9354 with SMTP id m8-20020ac24ac8000000b004b3ac9d9354mr30478020lfp.85.1670495500019;
        Thu, 08 Dec 2022 02:31:40 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id h18-20020a2eb0f2000000b00279e5247dabsm1699580ljl.18.2022.12.08.02.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Dec 2022 02:31:39 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Joe Tessler <jrt@google.com>,
	Yannick Fertre <yannick.fertre@foss.st.com>,
	Jeff Chase <jnchase@google.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v4 7/9] media: dt-bindings: cec-gpio: convert to DT schema
Date: Thu,  8 Dec 2022 11:31:13 +0100
Message-Id: <20221208103115.25512-8-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221208103115.25512-1-krzysztof.kozlowski@linaro.org>
References: <20221208103115.25512-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_103145_516615_2F52F245 
X-CRM114-Status: GOOD (  19.45  )
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

Convert HDMI CEC GPIO bindings to DT schema.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Reviewed-by: Rob Herring <robh@kernel.org>

---

Changes since v3:
1. Add missing SPDX.
---
 .../devicetree/bindings/media/cec-gpio.txt    | 42 -----------
 .../bindings/media/cec/cec-gpio.yaml          | 74 +++++++++++++++++++
 MAINTAINERS                                   |  2 +-
 3 files changed, 75 insertions(+), 43 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/cec-gpio.txt
 create mode 100644 Documentation/devicetree/bindings/media/cec/cec-gpio.yaml

diff --git a/Documentation/devicetree/bindings/media/cec-gpio.txt b/Documentation/devicetree/bindings/media/cec-gpio.txt
deleted file mode 100644
index 47e8d73d32a3..000000000000
--- a/Documentation/devicetree/bindings/media/cec-gpio.txt
+++ /dev/null
@@ -1,42 +0,0 @@
-* HDMI CEC GPIO driver
-
-The HDMI CEC GPIO module supports CEC implementations where the CEC line
-is hooked up to a pull-up GPIO line and - optionally - the HPD line is
-hooked up to another GPIO line.
-
-Please note: the maximum voltage for the CEC line is 3.63V, for the HPD and
-5V lines it is 5.3V. So you may need some sort of level conversion circuitry
-when connecting them to a GPIO line.
-
-Required properties:
-  - compatible: value must be "cec-gpio".
-  - cec-gpios: gpio that the CEC line is connected to. The line should be
-    tagged as open drain.
-
-If the CEC line is associated with an HDMI receiver/transmitter, then the
-following property is also required:
-
-  - hdmi-phandle - phandle to the HDMI controller, see also cec.txt.
-
-If the CEC line is not associated with an HDMI receiver/transmitter, then
-the following property is optional and can be used for debugging HPD changes:
-
-  - hpd-gpios: gpio that the HPD line is connected to.
-
-This property is optional and can be used for debugging changes on the 5V line:
-
-  - v5-gpios: gpio that the 5V line is connected to.
-
-Example for the Raspberry Pi 3 where the CEC line is connected to
-pin 26 aka BCM7 aka CE1 on the GPIO pin header, the HPD line is
-connected to pin 11 aka BCM17 and the 5V line is connected to pin
-15 aka BCM22 (some level shifter is needed for the HPD and 5V lines!):
-
-#include <dt-bindings/gpio/gpio.h>
-
-cec-gpio {
-	compatible = "cec-gpio";
-	cec-gpios = <&gpio 7 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
-	hpd-gpios = <&gpio 17 GPIO_ACTIVE_HIGH>;
-	v5-gpios = <&gpio 22 GPIO_ACTIVE_HIGH>;
-};
diff --git a/Documentation/devicetree/bindings/media/cec/cec-gpio.yaml b/Documentation/devicetree/bindings/media/cec/cec-gpio.yaml
new file mode 100644
index 000000000000..64d7ec057672
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/cec/cec-gpio.yaml
@@ -0,0 +1,74 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/cec/cec-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: HDMI CEC GPIO
+
+maintainers:
+  - Hans Verkuil <hverkuil-cisco@xs4all.nl>
+
+description: |
+  The HDMI CEC GPIO module supports CEC implementations where the CEC line is
+  hooked up to a pull-up GPIO line and - optionally - the HPD line is hooked up
+  to another GPIO line.
+
+  Please note:: the maximum voltage for the CEC line is 3.63V, for the HPD and
+  5V lines it is 5.3V. So you may need some sort of level conversion
+  circuitry when connecting them to a GPIO line.
+
+properties:
+  compatible:
+    const: cec-gpio
+
+  cec-gpios:
+    maxItems: 1
+    description:
+      GPIO that the CEC line is connected to. The line should be tagged as open
+      drain.
+
+  hpd-gpios:
+    maxItems: 1
+    description:
+      GPIO that the HPD line is connected to.  Used for debugging HPD changes
+      when the CEC line is not associated with an HDMI receiver/transmitter.
+
+  v5-gpios:
+    maxItems: 1
+    description:
+      GPIO that the 5V line is connected to.  Used for debugging changes on the
+      5V line.
+
+required:
+  - compatible
+  - cec-gpios
+
+allOf:
+  - $ref: cec-common.yaml#
+  - if:
+      required:
+        - hdmi-phandle
+    then:
+      properties:
+        hpd-gpios: false
+
+  - if:
+      required:
+        - hpd-gpios
+    then:
+      properties:
+        hdmi-phandle: false
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    cec {
+        compatible = "cec-gpio";
+        cec-gpios = <&gpio 7 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
+        hpd-gpios = <&gpio 17 GPIO_ACTIVE_HIGH>;
+        v5-gpios = <&gpio 22 GPIO_ACTIVE_HIGH>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 05acbaecef52..197351d3bb57 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4848,7 +4848,7 @@ L:	linux-media@vger.kernel.org
 S:	Supported
 W:	http://linuxtv.org
 T:	git git://linuxtv.org/media_tree.git
-F:	Documentation/devicetree/bindings/media/cec-gpio.txt
+F:	Documentation/devicetree/bindings/media/cec/cec-gpio.yaml
 F:	drivers/media/cec/platform/cec-gpio/
 
 CELL BROADBAND ENGINE ARCHITECTURE
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
