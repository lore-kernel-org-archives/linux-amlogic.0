Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B98BAC25B50
	for <linux-amlogic@archiver.kernel.org>; Sat, 21 Jan 2023 17:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FMg+74/FRRSgVfA6ttuTIF2bPMtia9OvRk3pnayYqsE=; b=q1CT0/F/r9CISq
	wYm3xdTsIUkFfYIEKrXVCWqGoTugEgpjG9W3/susZoaHFwuok+LYHBt4bgNtVTuqfUpi/ocGstP5Q
	04PAgU6thiSKucZ0mJnQ8EVT2e54CJRkcqYRXsT9ZWiKn6QEHtQSAv9UxQ04q6MRmxX5eVedESUpR
	F4orrhXMeWAim6V4ASVe36HEXf48LX2KBmlqrwlCYSzdFmoseGBVjYeT6Frh3N4jcmBdNqEhOK3CU
	4mhKU18NhgI4W728DlVVQZIAmHG1AgFUdQg5vFPBLtr3ZKXJ5fQXbO+bV/USDWu6X679LcSssaNaa
	pSTOXzMPaHDqgRvJyffw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJI7X-00EEDS-3z; Sat, 21 Jan 2023 17:57:39 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJI7T-00EEAe-MB
	for linux-amlogic@lists.infradead.org; Sat, 21 Jan 2023 17:57:37 +0000
Received: by mail-pj1-x1035.google.com with SMTP id x24-20020a17090ab01800b00229f43b506fso6871671pjq.5
        for <linux-amlogic@lists.infradead.org>; Sat, 21 Jan 2023 09:57:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YWhDX4KFx106+qYAgyDcB+XV4NL80nKQ25X8LQ/8aus=;
        b=ptnIGJ7DHlTlXBsb2o7MvDKWy8JBZq11tBcdFBh4UHANl+tKS+pEJZ8tT7YNHuAnyA
         TSufAnWU1xEd3/+wEjZxB6rDVlH5WeOl6Poo/QwTSMsYdnEpGyznE0IDCxNk2Ob0dUXl
         aCOfkWwWk/+76atl6KE0kb9cDkgsYb5EY4KfOxSlraTC02RehhvwRUGBJEUfEVv/xmjQ
         OJ8bda9FoymRtpZNoFKAqotul3t9BkNOyz1/KqMkyCdSats/qU5zirhpKBuHzDXP6N1f
         B0HaBrk8luJEYD7LQzp9vQN0GtsB2RdF6MZV8WSHiHuega+vq/biFnbASLT0/49mQXH0
         h0ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YWhDX4KFx106+qYAgyDcB+XV4NL80nKQ25X8LQ/8aus=;
        b=UttrYfxERR9jXcISJCgOb/RWJ+AU0bE63RlgJxOlFX6P4fH0MZR7B5iMf1Sf6cI7LE
         c8w4r4mY/C4WXdgFVWYcbBGv22diNkVaBd7pDfCsZjo7JYvUnv1h1jEzHXKS1G++eOyE
         f3ha/dksrUmWoA3NB0Xh6VtoA524lmeuSB6iXmn2xI/4DorOFd2+kXPKbwyeTFxc6bdk
         B/57WhP00ZeT1TO6k+sB1J2B86LvR3t98r1Lq5EwqvP+ddkDmBkrLls/7ySCeEA6AlqC
         0StPxEpWlso1Dn8AfR5M9d9ylNsb8m9Ic/h2yRI84AsNYP4YfZuJ2OS9tovJl9h7hu56
         lGDw==
X-Gm-Message-State: AFqh2kpd3PbxEE6Vp8qSzfJMhjIJObnYepGu+8Y0TO8nKw7MsEt4bm0D
	ZrhbAVHodu27ROgFnQhiPVQ=
X-Google-Smtp-Source: AMrXdXtkECfuRVbf5RNXn7jC9dWHZYTvp6jDX/+/JRhq0UUsYz3F5pz49H/ZJ7msZ33qySMylf336w==
X-Received: by 2002:a05:6a20:a593:b0:af:aa38:12e0 with SMTP id bc19-20020a056a20a59300b000afaa3812e0mr22380250pzb.34.1674323854075;
        Sat, 21 Jan 2023 09:57:34 -0800 (PST)
Received: from localhost.localdomain ([45.112.3.15])
        by smtp.gmail.com with ESMTPSA id r3-20020a632b03000000b00478e14e6e76sm24857374pgr.32.2023.01.21.09.57.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jan 2023 09:57:33 -0800 (PST)
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
Subject: [PATCH v3 6/9] dt-bindings: usb: Add Via lab VL817 hub
Date: Sat, 21 Jan 2023 17:56:34 +0000
Message-Id: <20230121175639.12818-7-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230121175639.12818-1-linux.amoon@gmail.com>
References: <20230121175639.12818-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230121_095735_744625_718F42C1 
X-CRM114-Status: GOOD (  17.23  )
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
v3 - address review coments - Krzysztof
     dropped dr_mode
v2 - fix the compatible string and fix the $id
   - update the commit message.
   - update the example for use peer-hub node because it
     combo of USB 2.0 and USB 3.0 hub.
   - rename the yaml file from vialab,vl817q7.yaml to vialab,vl817.yaml
     as q7 suffix is ued for USB 3.1 and q5 suffix is used for USB 2.0.
---
 .../devicetree/bindings/usb/vialab,vl817.yaml | 71 +++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/vialab,vl817.yaml

diff --git a/Documentation/devicetree/bindings/usb/vialab,vl817.yaml b/Documentation/devicetree/bindings/usb/vialab,vl817.yaml
new file mode 100644
index 000000000000..23a13e1d5c7a
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/vialab,vl817.yaml
@@ -0,0 +1,71 @@
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
+    enum:
+      - usb2109,2817
+      - usb2109,817
+
+  reg: true
+
+  reset-gpios:
+    maxItems: 1
+    description:
+      GPIO controlling the RESET# pin.
+
+  vdd-supply:
+    description:
+      phandle to the regulator that provides power to the hub.
+
+  peer-hub:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      phandle to the peer hub on the controller.
+
+required:
+  - compatible
+  - reg
+  - reset-gpios
+  - vdd-supply
+  - peer-hub
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    usb {
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
