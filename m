Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5AD1C32793
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Jan 2023 04:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5WP2sOxwRUM0tga9aSyy3zEgumi+gsNVKzOHIg8MpRw=; b=YUosxYfUgfRzLk
	dE88XDNbC2u4Gj0wLoL/JrvftNwp3bb5yp96uuO659LoSZHbbMRxeLWO/5+28vWLniuTXMK3EZoIA
	BUAsJygPAHWtqNGB3onu2W55FoKANO+EWrtjfClbUam68q5x07aZqmgBRojxtuoZbY4qqUK0VOMFa
	+Qs4YEK0PwR8QlDvsOPJQPCL1/Bm3NwmlfoN9rRv+ynO8Pwtn8iexV6Wu85N1gy7FeqI1iQfTq/Wd
	JuT3kWH2EsTzQo2OCzgC4rT2FdzYTjMYJjJVJlGAYPUy76iR2UfkvOYuVSLL4E1uxft7Y97NRLMIr
	6OJSQZ+mIsXgLdm8COVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI0K4-00Gt90-Ph; Wed, 18 Jan 2023 04:45:16 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI0K1-00Gt6B-24
	for linux-amlogic@lists.infradead.org; Wed, 18 Jan 2023 04:45:14 +0000
Received: by mail-pj1-x102c.google.com with SMTP id q64so34597161pjq.4
        for <linux-amlogic@lists.infradead.org>; Tue, 17 Jan 2023 20:45:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D9wEzdn/c8hs3xBU3OhkMlpPcDlGtL5RVLAepqVXl6k=;
        b=NoE/U94AsD+nnLqS+qyPulEfwZ6sTlpux/8dEzgM5sVE10YacMHwL/POKz6F744lNw
         E95VHpCINwOpN6j0fvHU2iqNSb8yO9WqbHeRVM/+LPnoAoPdWiydWTw+PfgBs/Hbf/vK
         IZoAl111CVJHa3nT+AoG/TWPuUSs/2buJRjrmYl355FjZadYJPRVwEAvxeWlGWIVhbcH
         6Vw5/MxSGpAbk0HxkDvOD+M2Fc660onxKYqGvuMJOL0PwgUXDlAxcsxyZWHVk6dj1zip
         c48JmGa8yjKifc2EGERR3GxkaYJj8gQAGliYo/SqTYcx7J7lbQY3xq4cnIF8TBJC/irw
         rl4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D9wEzdn/c8hs3xBU3OhkMlpPcDlGtL5RVLAepqVXl6k=;
        b=PGKc+c6Z8LtxOMfKi+ZVlRTrLEwVjKayRNuy2UkQsKDms0XCmwLvxWoMRNrBrDSWMp
         IHRAIE3zIz29AELrh6hU4rzHj6v2ZgE4+KcYzrlG6C23OU9AxQi4JNiXIE6dTBDzfJ5f
         Q342tNexzhkV1hAiXJh3YGgCcFIY4ZM6RZ6HfX7eu1LNrBt7Q3mSNIfPpfBVys7mmkjf
         K4sMtkg7QWp6BnXO/1KCgvnDhyR7vOsr5I0KlOnJ3AOPyxh5q2PLmD17nSr7gjB1S8fV
         DdO6vU9EQgjTBRG9zJsK9HcLgkn8QlppDXU8QnL/4DOd4uDw0jqK+9elhUMiwolBXxB6
         LaAg==
X-Gm-Message-State: AFqh2kpABPfdRmuvow5moEwsn5steXySrzclGr95OVeYzFmrb992Tsky
	SzJrdYSBPkzaZq40eY9/wKY=
X-Google-Smtp-Source: AMrXdXvKywVQxAnIW9BTyCOwR8hLsk1e+HSxDANbUVb82JskdxL3cpHUWELs3aDIuvWhv+HJOLhYag==
X-Received: by 2002:a05:6a20:1611:b0:b5:d50a:4aad with SMTP id l17-20020a056a20161100b000b5d50a4aadmr7989744pzj.39.1674017111729;
        Tue, 17 Jan 2023 20:45:11 -0800 (PST)
Received: from localhost.localdomain ([45.112.3.15])
        by smtp.gmail.com with ESMTPSA id i1-20020a056a00004100b00581a156b920sm8682770pfk.132.2023.01.17.20.45.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 20:45:11 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-amlogic@lists.infradead.org,
	Matthias Kaehlcke <mka@chromium.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Johan Hovold <johan@kernel.org>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/9] dt-bindings: usb: Add binding for Via lab VL817 hub controller
Date: Wed, 18 Jan 2023 04:44:14 +0000
Message-Id: <20230118044418.875-7-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230118044418.875-1-linux.amoon@gmail.com>
References: <20230118044418.875-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230117_204513_123235_67D38B95 
X-CRM114-Status: GOOD (  17.64  )
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

The VIA Lab VL817 is a USB 3.1 Gen 1 hub and USB 2.0 hub
controller that features 4 downstream ports and 1 otg, with
an internal 5V regulator and has external reset pin.

Add a device tree binding for its USB protocol part.
The internal LDO is not covered by this and can just be modelled
as a fixed regulator.

Add combo of USB 2.0 and USB 3.0 root hub using peer-hub.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v2 - fix the compatible string and fix the $id
   - update the commit message.
   - update the example for use peer-hub node because it
     combo of USB 2.0 and USB 3.0 hub.
   - rename the yaml file from vialab,vl817q7.yaml to vialab,vl817.yaml
     as q7 suffix is ued for USB 3.1 and q5 suffix is used for USB 2.0.
---
 .../devicetree/bindings/usb/vialab,vl817.yaml | 69 +++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/vialab,vl817.yaml

diff --git a/Documentation/devicetree/bindings/usb/vialab,vl817.yaml b/Documentation/devicetree/bindings/usb/vialab,vl817.yaml
new file mode 100644
index 000000000000..5f9771e22058
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/vialab,vl817.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/vialab,vl817.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Via labs VL817 USB 3.1 hub controller
+
+maintainers:
+  - Anand Moon <linux.amoon@gmail.com>
+
+allOf:
+  - $ref: usb-device.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - usb2109,2817
+          - usb2109,817
+
+  reg: true
+
+  reset-gpios:
+    description: GPIO controlling the RESET# pin.
+
+  vdd-supply:
+    description:
+      phandle to the regulator that provides power to the hub.
+
+  peer-hub:
+    $ref: '/schemas/types.yaml#/definitions/phandle'
+    description:
+      phandle to the peer hub on the controller.
+
+required:
+  - peer-hub
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    usb {
+        dr_mode = "host";
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        /* 2.0 hub on port 1 */
+        hub_2_0: hub@1 {
+            compatible = "usb2109,2817";
+            reg = <1>;
+            vdd-supply = <&vcc_5v>;
+            peer-hub = <&hub_3_0>;
+            reset-gpios = <&gpio 20 GPIO_ACTIVE_LOW>;
+        };
+
+        /* 3.1 hub on port 4 */
+        hub_3_0: hub@2 {
+            compatible = "usb2109,817";
+            reg = <2>;
+            vdd-supply = <&vcc_5v>;
+            peer-hub = <&hub_2_0>;
+            reset-gpios = <&gpio 20 GPIO_ACTIVE_LOW>;
+        };
+    };
-- 
2.38.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
