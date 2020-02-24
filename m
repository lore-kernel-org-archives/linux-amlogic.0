Return-Path: <SRS0=TU6n=4M=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7183BC11D32
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 Feb 2020 14:58:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A78C2072D
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 Feb 2020 14:58:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fylZefJj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="LpM7mpj7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A78C2072D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z4sQn1LgDZOuhCCqE0Ql9QzamczRISMqrfWiQysKkuM=; b=fylZefJjgVqT1P
	Zj5f3nt7sX5LUWzqf0akQ9iXJLOT71z7Hg7R00wZNUZj7V64R5+JI7aqLKxf0ZeAsjRuIoR0FjtfA
	AXGIrF8l3Gg0YjwNYtSmBUTml0WICHgozDHOKbWcstsU1GwRXW5+2fNEQVZG/FJjb8WcLC+AwUAkd
	9NCqBxQ+yuAq22sLUVhOwmsMP5lb+lKSg3KZyuk1SzfMdQrQtGc8lNQ/Y65zae3sozXmFYM1pCBJr
	1LdmdY4327JJQaFU867x6HPNW/hdI5dpBmANMmbOiFT5s73aRRZJ2qh61FWqSUYZhUzFQGYqvJo6n
	cH6C1IKOypNlHauP526g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6FC4-0004Eg-6g; Mon, 24 Feb 2020 14:58:48 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6FBr-0003y7-12
 for linux-amlogic@lists.infradead.org; Mon, 24 Feb 2020 14:58:36 +0000
Received: by mail-wr1-x443.google.com with SMTP id g4so4387119wro.13
 for <linux-amlogic@lists.infradead.org>; Mon, 24 Feb 2020 06:58:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UdwXQ7pH6rI6ueZApn+K43TDTHvz3mfvfA2n6YIMVTA=;
 b=LpM7mpj7LiZYFY1F/LHsfKrbgKu9KMEEPBIR7iDONOQtj5dzo4PULT5jUyW8VBENL7
 ErVZShkH6j+APMl0j47EspIm4CwGk9WYyH+f6FoSIYTjN4yTAoJh+CJiUTrJ5Gdtwqwq
 b6w2PcF2xLt7hUCknO6OepJMPbtuZhua9fSEKjbXvhGoX/pERSl3Y9o7tppCYNjp8ESs
 O1c993L2XPYgrMdjGFiGfQJAn6Tn75s3iH6AqFliUtHIChwfNQvJrCBf0tIFCjXOqOgl
 S8Ons34q9AFhe8dmhrVCQ6kXq9TCLFxm1YFMA2n0G3vawr70esVlFNS5i9GgW4pgD8X2
 3vRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UdwXQ7pH6rI6ueZApn+K43TDTHvz3mfvfA2n6YIMVTA=;
 b=f5HfDzu6kfqpWrmjWDYYE2/AGFEV50ta4Q+xXE7VZFH/EaHHQM+z236Yd9WGGIL36K
 epV0fK9jqvlObLMtyO03o1WgdC5aho+ERayNgKKFFnByVwCmuRC/jQr621lAHiZGnwLr
 6wE3UgOg3dWqyku+fG+wy0PnyeEkAYng/iS2/Dv1+VsSwnDIiGS89m5opsiprhxjM2xl
 pqeDQ3HM21vSLR1QK8H/QBTOinM8R49+6MvZSw+FNkbJ/YaBfdStvdte+eus9zMjt/oh
 7IyFcR9Ln8lOY04qceg2qXb55k78oJxhgL8aGfl1Ri4lP+57Kx73yCWfDImofP63LXpd
 FBAA==
X-Gm-Message-State: APjAAAWtW5MetwAQ0/RU6U2GZChDT8zPno8T3xIihrXZvikacNGNWUvR
 ctlXs5yaWlvdeJfncVUSJdz49Q==
X-Google-Smtp-Source: APXvYqx6BBo21R5PTgXLbRReQuUMfO7alOUBEJcwx+E701SSNNZySFjVl7yKssosp1Wkvm7UURQw2Q==
X-Received: by 2002:a5d:6b88:: with SMTP id n8mr69304362wrx.288.1582556313782; 
 Mon, 24 Feb 2020 06:58:33 -0800 (PST)
Received: from starbuck.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id j12sm8035127wrt.35.2020.02.24.06.58.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2020 06:58:33 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 8/9] ASoC: meson: convert g12a tohdmitx control to schema
Date: Mon, 24 Feb 2020 15:58:20 +0100
Message-Id: <20200224145821.262873-9-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200224145821.262873-1-jbrunet@baylibre.com>
References: <20200224145821.262873-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200224_065835_086525_E1CF6CF5 
X-CRM114-Status: GOOD (  10.69  )
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Convert the DT binding documentation for the Amlogic g12a tohdmitx codec
glue to schema.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../bindings/sound/amlogic,g12a-tohdmitx.txt  | 58 -------------------
 .../bindings/sound/amlogic,g12a-tohdmitx.yaml | 53 +++++++++++++++++
 2 files changed, 53 insertions(+), 58 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/amlogic,g12a-tohdmitx.txt
 create mode 100644 Documentation/devicetree/bindings/sound/amlogic,g12a-tohdmitx.yaml

diff --git a/Documentation/devicetree/bindings/sound/amlogic,g12a-tohdmitx.txt b/Documentation/devicetree/bindings/sound/amlogic,g12a-tohdmitx.txt
deleted file mode 100644
index 4e8cd7eb7cec..000000000000
--- a/Documentation/devicetree/bindings/sound/amlogic,g12a-tohdmitx.txt
+++ /dev/null
@@ -1,58 +0,0 @@
-* Amlogic HDMI Tx control glue
-
-Required properties:
-- compatible: "amlogic,g12a-tohdmitx" or
-	      "amlogic,sm1-tohdmitx"
-- reg: physical base address of the controller and length of memory
-       mapped region.
-- #sound-dai-cells: should be 1.
-- resets: phandle to the dedicated reset line of the hdmitx glue.
-
-Example on the S905X2 SoC:
-
-tohdmitx: audio-controller@744 {
-	compatible = "amlogic,g12a-tohdmitx";
-	reg = <0x0 0x744 0x0 0x4>;
-	#sound-dai-cells = <1>;
-	resets = <&clkc_audio AUD_RESET_TOHDMITX>;
-};
-
-Example of an 'amlogic,axg-sound-card':
-
-sound {
-	compatible = "amlogic,axg-sound-card";
-
-[...]
-
-	dai-link-x {
-		sound-dai = <&tdmif_a>;
-		dai-format = "i2s";
-		dai-tdm-slot-tx-mask-0 = <1 1>;
-
-		codec-0 {
-			sound-dai = <&tohdmitx TOHDMITX_I2S_IN_A>;
-		};
-
-		codec-1 {
-			sound-dai = <&external_dac>;
-		};
-	};
-
-	dai-link-y {
-		sound-dai = <&tdmif_c>;
-		dai-format = "i2s";
-		dai-tdm-slot-tx-mask-0 = <1 1>;
-
-		codec {
-			sound-dai = <&tohdmitx TOHDMITX_I2S_IN_C>;
-		};
-	};
-
-	dai-link-z {
-		sound-dai = <&tohdmitx TOHDMITX_I2S_OUT>;
-
-		codec {
-			sound-dai = <&hdmi_tx>;
-		};
-	};
-};
diff --git a/Documentation/devicetree/bindings/sound/amlogic,g12a-tohdmitx.yaml b/Documentation/devicetree/bindings/sound/amlogic,g12a-tohdmitx.yaml
new file mode 100644
index 000000000000..fdd64d103f33
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/amlogic,g12a-tohdmitx.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/amlogic,g12a-tohdmitx.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic G12a HDMI Tx Control Glue
+
+maintainers:
+  - Jerome Brunet <jbrunet@baylibre.com>
+
+properties:
+  $nodename:
+    pattern: "^audio-controller@.*"
+
+  "#sound-dai-cells":
+    const: 1
+
+  compatible:
+    oneOf:
+      - items:
+        - const:
+            amlogic,g12a-tohdmitx
+      - items:
+        - enum:
+          - amlogic,sm1-tohdmitx
+        - const:
+            amlogic,g12a-tohdmitx
+
+  reg:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+required:
+  - "#sound-dai-cells"
+  - compatible
+  - reg
+  - resets
+
+examples:
+  - |
+    #include <dt-bindings/reset/amlogic,meson-g12a-audio-reset.h>
+
+    tohdmitx: audio-controller@744 {
+    	compatible = "amlogic,g12a-tohdmitx";
+        reg = <0x0 0x744 0x0 0x4>;
+        #sound-dai-cells = <1>;
+        resets = <&clkc_audio AUD_RESET_TOHDMITX>;
+    };
+
+
-- 
2.24.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
