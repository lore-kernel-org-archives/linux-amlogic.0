Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DD15F3ED40
	for <linux-amlogic@archiver.kernel.org>; Sat, 11 Apr 2026 14:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2wYc/xhRPc9fpfw7yXs1IcliMnK1sAwYCjRXLxEetqU=; b=suL/rgYOdIDFbp
	PB5FTHmOkWs3iBbAonhXGhpL52Huh6RNp/XGtT6oLX6rRoum5TotRd4iAnUChkhn4mG821i7Lz5TG
	W1GwltNfNaW4gbWvXc148xRa94ILhRXAqXX1fpah9PMaQCt2WKmQ8R/qD7dax9DaOiaqo3bExhng9
	YlbUx6lSzbuTVRlXkHZQNrCGe76TYKMTNvXgBLHkKoQ0b7/nTFcTNExeJGk7I0RMpczouqC1mXBoD
	Bl0DESa/BCU4ra+mvrdeeqCCo+DtGqTsCCK/UdNLA3+dnBmBRx4K/cRJPx72q76oUvB/Ry3frYJKy
	PEnwlNdzGd/cLwwnJJTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBZml-0000000DXko-3ilZ;
	Sat, 11 Apr 2026 14:58:11 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBZmh-0000000DXdi-19qe
	for linux-amlogic@lists.infradead.org;
	Sat, 11 Apr 2026 14:58:08 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-488ba840146so28592945e9.1
        for <linux-amlogic@lists.infradead.org>; Sat, 11 Apr 2026 07:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1775919486; x=1776524286; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TqzpSMm9hvDl83iw/EoIWtzwO8VYSoc9MWM/tx+T2Ys=;
        b=L3qYJBzzoZP4XilJlSXRIkPH3pyTKFaWDJBGcOh3HlrUkg3BVRfaftJbbGh79t+kDG
         JFKJvH/g3E9osrXhoZdfmE7oHEaRpVbjR/WRhXNx6ol16FshWnx/40foPkyr0ia0lzyk
         9Dx6XP7xUDY2oiAtbPTspXWChvah6H7gPFqUN2sOzf54Edl8CuxHWIPfrJABCFdOrOOh
         wYn+nR+MoH9Qe6F8NUG39S88EapxtnrnhYAgQAxjBd4EpO75h/l40ol/+QHpPICNxcXr
         BglM2pD5kieWyejwp0GVeLH3ipsPARSnmbNiKSucMwnQYuaVpQ0ZOEFQVAPllDTXessf
         95OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775919486; x=1776524286;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TqzpSMm9hvDl83iw/EoIWtzwO8VYSoc9MWM/tx+T2Ys=;
        b=MbEofCJhiT1RNCbszCQAXiS+kxHzd57hq/ScDZK9mHDdFTtGNY4XejlN4Uki5FBQT0
         o7hzyiPZ5tHSIKe6nLcTyiK0HcRRDyC1TiVJ0S1aNla+LS59hqPucHJGCaWl2TNJ2aJR
         P0moLjD45NWZh/zkn+x4boffH1nl57awX/zp2yV+r4ACXLSYcXCXzsI7d91v+dYF3z/d
         QLt2LusI5kIkwww1VulvD5fmLxU9kwP/ZCxQBYxF6xNbY0EgtAUiJS/cDiemgSMHsE9Y
         Xkq1dRrb2Ssf2ootOpXnkMEKaLHJpr4l/vNNwORkgSawDwbnj1k1KWjYKs6nuteLqE7l
         x/7w==
X-Forwarded-Encrypted: i=1; AJvYcCXd6QosvvUv14rKD/d/S/ATH1boO+CujA239adTW+eYE5F3ZY1p75JXq5bwFjWocxi0KDHwC8blpcN9Z3Fe@lists.infradead.org
X-Gm-Message-State: AOJu0YxQ72p/HvuIgOJn9fIVpXmfcbdyo7o81x2U7/UyLvR5B0SFkokp
	gMc2ab3wW9kgXZXztJ6rkC1QMnDI7JLaRURB8OMQw/QmXiXCO1TnoL6cO/sGxhUDF0c=
X-Gm-Gg: AeBDiesLfRu/wJ1Zy1aHC5Ysp9uulwe2PuU8JYDa+NvCxfRqkKHzMPWUgXYxYn83Cv1
	8+HrcSmowDqWOGBW8SzY4N4nJ021ecoDXfUOgmgM9mIrnxkXtumWl2gRQtwxNOQ5VE8Vq6kW2c+
	ZiCmc0G3Wg6QqiLKZ9qDhIqDr5Lh1/BV+1XklnCiqBdzrsck/2u7ptNIR+MmPg5altR8Im4ljbl
	mDe0tuCbOzNmlx4+omzgQctWhXPFCXFuayOf47N5QiYnfQA4lT31daREcdkK6yk/AZkdlzgctht
	ONQEKxinnENGTpDE3CN4vzqNo1I/xiMAJujfP4hfU7BVcVrsf/2aIpkZb40WK2bjxVjh47Xc9Hr
	5nusG0SU1sE8DkatDPwysNsx+gE5W/r6o+WMw6wzg+BJOEMaeUuJuXDU2HJ+hLgzRab28bJuWHh
	uHN8BS9aR2EgMy8Kmiux1O
X-Received: by 2002:a05:600d:d:b0:485:ae14:8191 with SMTP id 5b1f17b1804b1-488d67b8da2mr72755715e9.5.1775919485044;
        Sat, 11 Apr 2026 07:58:05 -0700 (PDT)
Received: from [127.0.1.1] ([151.61.248.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5dc7070sm48882375e9.10.2026.04.11.07.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 07:58:04 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Sat, 11 Apr 2026 16:57:30 +0200
Subject: [PATCH RFC v2 05/11] ASoC: dt-bindings: amlogic: add schema for
 audin-formatter and audin-toddr
MIME-Version: 1.0
Message-Id: <20260411-audin-rfc-v2-5-4c8a6ec5fcab@baylibre.com>
References: <20260411-audin-rfc-v2-0-4c8a6ec5fcab@baylibre.com>
In-Reply-To: <20260411-audin-rfc-v2-0-4c8a6ec5fcab@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Valerio Setti <vsetti@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3712; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=PHZLLnMsIE8GpLnJkBykfRLhYRx2iFJYTw8nQWNaVlw=;
 b=owGbwMvMwCF2z3ty7kUrRgbG02pJDJm3EosN3vB9XsUdlXc2ZPYKzqm//naZXdxa+++XzbJXa
 oeU3lqld5SyMIhxMMiKKbKwTL/3u6BU7aFxwskCmDmsTCBDGLg4BWAih/oZGW5XMcRf9OW+cjjh
 9ZHd1bfZlbzfXdE3V9py4Hvh/HgjNQ+Gf8a7rq+y/5TKs7glY+9Okz8lsbHWP8yrlIVy3/OXiE5
 iYAUA
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260411_075807_367546_581B8EA3 
X-CRM114-Status: GOOD (  11.60  )
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

Add schema for "amlogic,meson-gx-audin-decoder-i2s" and
"amlogic,meson-gx-audin-fifo" modules which are used to
provide I2S audio input support to the Meson GX platform.

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 .../sound/amlogic,meson-gx-audin-decoder-i2s.yaml  | 49 +++++++++++++++++
 .../sound/amlogic,meson-gx-audin-fifo.yaml         | 63 ++++++++++++++++++++++
 2 files changed, 112 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/amlogic,meson-gx-audin-decoder-i2s.yaml b/Documentation/devicetree/bindings/sound/amlogic,meson-gx-audin-decoder-i2s.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..eaf57603e1ecf5944ffdcf7a1b6146d1a0295696
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/amlogic,meson-gx-audin-decoder-i2s.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/amlogic,meson-gx-audin-decoder-i2s.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic GX AUDIN I2S Input Decoder
+
+maintainers:
+  - Valerio Setti <vsetti@baylibre.com>
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  $nodename:
+    pattern: "^audio-controller@.*"
+
+  "#sound-dai-cells":
+    const: 0
+
+  compatible:
+    items:
+      - enum:
+          - amlogic,meson-gxbb-audin-decoder-i2s
+      - const: amlogic,meson-gx-audin-decoder-i2s
+
+  reg:
+    maxItems: 1
+
+  sound-name-prefix: true
+
+required:
+  - "#sound-dai-cells"
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    audio-controller@a040 {
+      compatible = "amlogic,meson-gxbb-audin-decoder-i2s",
+                   "amlogic,meson-gx-audin-decoder-i2s";
+      #sound-dai-cells = <0>;
+      sound-name-prefix = "AUDIN I2S Decoder";
+      reg = <0xa040 0x4>;
+      status = "disabled";
+    };
diff --git a/Documentation/devicetree/bindings/sound/amlogic,meson-gx-audin-fifo.yaml b/Documentation/devicetree/bindings/sound/amlogic,meson-gx-audin-fifo.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..4957c8711623ac45d2826ca96e6344d0aeac2735
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/amlogic,meson-gx-audin-fifo.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/amlogic,meson-gx-audin-fifo.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic GX AUDIN FIFO controller
+
+maintainers:
+  - Valerio Setti <vsetti@baylibre.com>
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  $nodename:
+    pattern: "^audio-controller@.*"
+
+  "#sound-dai-cells":
+    const: 0
+
+  compatible:
+    items:
+      - enum:
+          - amlogic,meson-gxbb-audin-fifo
+      - const: amlogic,meson-gx-audin-fifo
+
+  clocks:
+    items:
+      - description: AUDIN peripheral clock
+
+  clock-names:
+    items:
+      - const: i2s_input_clk
+
+  reg:
+    maxItems: 1
+
+  sound-name-prefix: true
+
+required:
+  - "#sound-dai-cells"
+  - compatible
+  - clocks
+  - clock-names
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/gxbb-clkc.h>
+
+    audio-controller@a080 {
+      compatible = "amlogic,meson-gxbb-audin-fifo",
+                   "amlogic,meson-gx-audin-fifo";
+      #sound-dai-cells = <0>;
+      sound-name-prefix = "FIFO0";
+      reg = <0xa080 0x1c>;
+      status = "disabled";
+      clocks = <&clkc CLKID_I2S_SPDIF>;
+      clock-names = "i2s_input_clk";
+    };

-- 
2.39.5


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
