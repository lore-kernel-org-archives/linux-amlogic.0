Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9910C982D2
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Sep 2026 21:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5AvPHbZegqIFPMGJcbs0OeOCTad9KEbQH1RoT4PVkVI=; b=VCXygRjrQ8RbBc
	f9f0PHfxbC2Zs+8RGmrczMJchAIqtrPZKFGgD139JeRbaRXpfc/MTxkfAtpXmcAzOseUXdJxV+BBv
	G79XhKf/5JHS7wvk3WmONjYMG8ojlpkBtaDj2HUTW5eG3p6RfXZpd0xQx7szg6JbNfYXwD6mDPeic
	n1XaepaNonT5f3FT9OgDp553pf9aNi4176Hx0uGtHX2B7dmpchMPUif1B7szdZb5E2XGmZbxwAqJr
	vSPi+c/AgxoLoGTI7q/YXR93eqXYT+MwKG/wTkoQGHx8F8kBwrgH7j4m7sdJnBkYIqzsJQ+G86TDX
	MRyLnDS2gEc5E1o94A3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7JGb-0000000CWSk-1jLV;
	Thu, 17 Sep 2026 21:03:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7JGZ-0000000CWQE-35Aa
	for linux-amlogic@bombadil.infradead.org;
	Thu, 17 Sep 2026 21:03:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=9AZ0+eI++/PlX83+JWP2Cs841uENpnsQxPBRefFFlIk=; b=pqeAHgGWCvMbsSG8L6XS9Zb1vS
	cYLCgE679HphMKRvBT/eUQ1yUg/1sp1cdXrmQJrjx883cdxeSGn01Rm54Zm8sByyr+e7kE7QjTVVB
	g4pEA5l3FOG+jcRQ2kgI0E6EwZtxm2nKvqQgIkeWotcnsr/YeK/9OuAE62zk5xrxCEwFlD+1y4r7o
	VkxE89YIQzSy23KM8GahiI87b4TmmBgaKE/f1mlJgSiymsssUuOAVgmRcmJ64ArIYNvbq2yLwC+L7
	Zqy0kxlYYpt2ZCtqIJ6b0uKU5eP8n2PFbC92Cmq2zab3u+u/0rRuNT4BtpCL0tKXxbVAOarkMD2qT
	jmcKrwuQ==;
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x7JFs-00000009Gd3-0k0h
	for linux-amlogic@lists.infradead.org;
	Thu, 17 Sep 2026 21:03:34 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49b912df756so503705e9.3
        for <linux-amlogic@lists.infradead.org>; Thu, 17 Sep 2026 14:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789678960; x=1790283760; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9AZ0+eI++/PlX83+JWP2Cs841uENpnsQxPBRefFFlIk=;
        b=EPk8Uw6ueJJcxL5T+/0tyYY3mONvkvGm+LtgEwLi+X+MUlujpyoYij8TwTaUe8TlhP
         9zUYc/Nk6pZd4eEtThSZn3/i+ON5y50JmXMHDLQE4KIPaR/axChThs+we8V1XEIryU7N
         OCz7aFtBVaBu0U52ATakrhOotwfj2pWlmlWMtPEC/3cdxyx/uD/rQxlZ4uSafVp6il6s
         a8Q7jgGeL97K2jYGM7Kz+cVQ1Di3Jc1KqK6h5dLwBZw5tAIilN6jal1Ar8T2rt84b3pT
         ly72hn397nNmHOvNXh6G/6y1frkb41vxZh+C6tC0u1XTnrlme2oVAWun2Z6Y3cfEJX0j
         36Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789678960; x=1790283760;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9AZ0+eI++/PlX83+JWP2Cs841uENpnsQxPBRefFFlIk=;
        b=PoZRHX9ORmQ9AfATnpYDz+cdbiuSQ+/Skdn61BBn61hKgsgwEBcu9AO8HI4CG4VZ8B
         Juc4RG2HUwiLwo05bm6AQewCDwZyTyO136oojyGpMNf/6C8iaP0pDAAI2Vble/5JPyK+
         +9BW6YOaJJ41u9t2t9Xmj24+HBfefkxeWlR8YuXVa2q/MmVw0LR3I3GecZqHuPH/ckTE
         r1y+X0AblAwtc/0nFGyJSJzWuKo9iwlZQQam2QfVroq5E0lhVIlL0ICwhdRfsZ2qeLyv
         bfGSFg14dhcGls30qJde+beOJa58Wor3G/jEspbYiG4U5gSCTKa+tm6/xaADGoVU7R+Z
         pb7Q==
X-Forwarded-Encrypted: i=1; AKwUvByGOI1z4s0jLiyORvWbPaXOxl32JZm/AWo/9JYUUap6N55r2Mac77XkNfT7EK35/SjYaoPwiwovPs5okbki@lists.infradead.org
X-Gm-Message-State: AFuF++m0LIKLf/5wTKZGvk+y2SZurY7pxfsodFbFHK+BxDwbCionITUI
	ZVewMuBXY1l7pbpoq78RINmMQbUzLNFGCrPOJjPFvjXzyNyJtLG2SDzfoaAqXU5lWNw=
X-Gm-Gg: AYBFou0WgjNgKldDFowLjQPSzF8xhCqZl0a3Q0PLvtw09e4f71NvqIeeESSD0JYhgzy
	VdyTZoMQatOEpHoF3gM0b8rDio5p8Ar7kxCjc9WoZFK1PF1rMARUi33S1KtHtq//i6EE+8x2MWJ
	ZIfOOXaA9G+ZU1OKnczjTcE+2phpl3GOtnksTDReVv9wSrxs+a5JLZLBlVzpJcPaIt6sXJ8/1d8
	xCWgWIgdfEPlb8XYMT7W3jYuK9XtbRJp+BH0f+NwAsyBeeinXOFg7JR7Xy6T5kTHiXOLskPbFXF
	SeAo4VU1TziXRlprysqMeZKdgxkjFQ9NJOky5Z9fa7I9pChjCnW7uAJlhMvN6OLIIpgwq+FG3dt
	tqJ0MUiTlSkPadmiH214ntDDSR9ARaVyGe70sQWIDK81S8KUTawKTTyiXVNZqbieB4/dmebZWSp
	zoe9QW1Z3L2wzKXW2uyik0uxdlmmqDK1HY2evf35awlOLiLGhENqGG8jjgFE6zxVAFhA==
X-Received: by 2002:a05:600c:354e:b0:49e:6bc7:4e1b with SMTP id 5b1f17b1804b1-49fc56ef4fcmr2059135e9.15.1789678960500;
        Thu, 17 Sep 2026 14:02:40 -0700 (PDT)
Received: from [127.0.1.1] ([151.42.87.32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc5755c40sm3106095e9.3.2026.09.17.14.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 14:02:40 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Thu, 17 Sep 2026 23:02:31 +0200
Subject: [PATCH v2 1/6] ASoC: dt-bindings: amlogic,gx-audin: add schema
MIME-Version: 1.0
Message-Id: <20260917-audin-v2-1-38de4bc1de34@baylibre.com>
References: <20260917-audin-v2-0-38de4bc1de34@baylibre.com>
In-Reply-To: <20260917-audin-v2-0-38de4bc1de34@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Valerio Setti <vsetti@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2321; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=8xj7kUdGgsVPCmxBLgs3dFbkoQPLuPzp6csuOKCL82I=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFlrQnP/iLUayjLtvv3w1WaL+o6/q3gtS730b2x5bv4nd
 NEio0nXOkpZGMS4GGTFFFlYpt/7XVCq9tA44WQBzBxWJpAhDFycAjCR1lBGhhv/lF3Dql31FD5P
 951y7UhLXb9bXqdBKoNG8RaevrMxhQx/5e75/EuWX26jUxHwt4L/5y1eLaYPe2wDn4ooN2QzxW/
 hAgA=
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_220312_671543_9E76D7CF 
X-CRM114-Status: GOOD (  11.87  )
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

AUDIN provides I2S audio input support to the Meson GX platforms
(GXBB/GXL).

Note: GXBB and GXL are not known to differ so the driver binds on the
'amlogic,gx-audin' fallback.

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 .../bindings/sound/amlogic,gx-audin.yaml           | 66 ++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/amlogic,gx-audin.yaml b/Documentation/devicetree/bindings/sound/amlogic,gx-audin.yaml
new file mode 100644
index 000000000000..76e6a6ddef36
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/amlogic,gx-audin.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/amlogic,gx-audin.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic GX AUDIN
+
+maintainers:
+  - Valerio Setti <vsetti@baylibre.com>
+
+description:
+  AUDIN is the audio input block of the Amlogic GXBB/GXL SoCs. It supports
+  various input formatters (I2S, SPDIF, PCM, HDMI) feeding three FIFOs that
+  transfer captured samples to memory. The sound-dai cell selects the FIFO.
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - amlogic,gxbb-audin
+          - amlogic,gxl-audin
+      - const: amlogic,gx-audin
+
+  reg:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: AUDIN peripheral clock
+
+required:
+  - compatible
+  - reg
+  - resets
+  - interrupts
+  - clocks
+  - "#sound-dai-cells"
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/gxbb-clkc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/reset/amlogic,meson-gxbb-reset.h>
+
+    audio-controller@a000 {
+      compatible = "amlogic,gxbb-audin", "amlogic,gx-audin";
+      reg = <0xa000 0x148>;
+      resets = <&reset RESET_AUDIN>;
+      interrupts = <GIC_SPI 7 IRQ_TYPE_EDGE_RISING>;
+      sound-name-prefix = "AUDIN";
+      #sound-dai-cells = <1>;
+      clocks = <&clkc CLKID_I2S_SPDIF>;
+    };

-- 
2.47.3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
