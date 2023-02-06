Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D623AC63797
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Feb 2023 16:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HHyUDRNL6b1eebkZgI36x3rfA23dcqI3rAKpwpIRXT4=; b=Og3eDMSnZbkvOx
	V1MF8VzcFnh8FfGbFDY57IWJVZRNleZZSkhsUMujCxsBL6TZEJxKSvOJhbql66rk+heWVPCB0uVUZ
	w4tO3RA94No+b2ANbBp2MlgpOmCzqrtX7TrGWS8spTdsni+mP1O4MS1GfUcvpGyx2826o80y7ht2M
	xEqmAW9VHl7oT11eQ0SGIudERNyDnSVb2E8giOKFYZKHUX59Y584BT2CWnCpLZ/teaGV2fF7fFl1u
	HSlIg9hqk7tAerMZaN2ucwUrWV1IH2IKnKG6cKuKZoOYcDrvMB7U43FQDptwZUzunvlFIS76EehSH
	3oTiDBbqpZLnXs3631GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP420-009C8L-Dc; Mon, 06 Feb 2023 16:07:48 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP3WH-008wYq-H8
	for linux-amlogic@lists.infradead.org; Mon, 06 Feb 2023 15:35:05 +0000
Received: by mail-wr1-x430.google.com with SMTP id r2so10755718wrv.7
        for <linux-amlogic@lists.infradead.org>; Mon, 06 Feb 2023 07:34:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DSZ+ZWDmXDYcYtmIhvFtKPtRA07CwGN6CEZ0BnS9Htc=;
        b=1ymZ4wa9X9VmsnI7dKrwIS7KOHJdftr5rwTlNYrUztYky9zyZPKXb4Q874IsFemt8j
         J30/3nK1SZU0AoHog8FMSurppxgjLSdfkDupT8lTCW6661B5X5lXhRUwfjsKduM64PnD
         NXNTlFyDvsgpaTRqZX126jetYhntw5pEwi25tqexCd4oAyDa3u7dACkn+K1z8zVGZffr
         k0raxVkCqzwmmjZQrnz6ELj8YpQ7A1BtMCKqruw6NL9CsTs4yAcH987G3T7lOk9jndLm
         2vJWg5M1GB1f0U3a08ljzOMaPeWqXaqOEtfrmIu1ItrbgbTpO4OIIx93Oyzg9eOaeJzO
         PTew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DSZ+ZWDmXDYcYtmIhvFtKPtRA07CwGN6CEZ0BnS9Htc=;
        b=WEt96tKaU24APXt9I7g21Bstoo0KXB7O7fAX322Rie4CAiQ0Y26ou/dfcThfKzpfYc
         7P4J3TUle/dOauyBjubKJSw5Yfclxh1B5mMCdUbLxCjAayzj1pMDCL9CDd0OzMThpAhC
         rhvj3996omhMsycJH+sKgoH0YZ6j1fYjaKC/By32aMu89Dhrj+rDGu+9a6LWiXCS63Sp
         UJTcasd4QUQ5coXiH99k0UkSnTayuQ8wox/mML4spzgP88YfjyL/FXm0fSASusIGqpBY
         i0x7t6xH9tpedssmcZVav5hXDbeBbQ4bj3t7e9XgkrqaZMxmai0BNwpCYNO/f/7r0Uw3
         9/Ig==
X-Gm-Message-State: AO0yUKXqVncdFpD1GNutwz7HrAHtR5cS154bTpD86X31MJfBPnLEhBVu
	cpYgZ7CP4TpfAmhEEV7lrioO6A==
X-Google-Smtp-Source: AK7set8l0Vem0AHgJtK8mN9RFYv4+5qphxkNS6/M3ZOmuwRAk/w0Zfj9ZrM9d7lz3uie93iC15wpVw==
X-Received: by 2002:adf:f992:0:b0:242:5563:c3b with SMTP id f18-20020adff992000000b0024255630c3bmr16518118wrr.59.1675697698201;
        Mon, 06 Feb 2023 07:34:58 -0800 (PST)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id e12-20020a5d500c000000b002c3ea9655easm2197317wrt.108.2023.02.06.07.34.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Feb 2023 07:34:57 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-amlogic@lists.infradead.org,
	Kevin Hilman <khilman@baylibre.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/7] ASoC: dt-bindings: meson: convert axg tdm interface to schema
Date: Mon,  6 Feb 2023 16:34:43 +0100
Message-Id: <20230206153449.596326-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230206153449.596326-1-jbrunet@baylibre.com>
References: <20230206153449.596326-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_073501_649533_AF1119CF 
X-CRM114-Status: GOOD (  14.84  )
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

Convert the DT binding documentation for the Amlogic tdm interface to
schema.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../bindings/sound/amlogic,axg-tdm-iface.txt  | 22 --------
 .../bindings/sound/amlogic,axg-tdm-iface.yaml | 55 +++++++++++++++++++
 2 files changed, 55 insertions(+), 22 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-tdm-iface.txt
 create mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-tdm-iface.yaml

diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-iface.txt b/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-iface.txt
deleted file mode 100644
index cabfb26a5f22..000000000000
--- a/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-iface.txt
+++ /dev/null
@@ -1,22 +0,0 @@
-* Amlogic Audio TDM Interfaces
-
-Required properties:
-- compatible: 'amlogic,axg-tdm-iface'
-- clocks: list of clock phandle, one for each entry clock-names.
-- clock-names: should contain the following:
-  * "sclk" : bit clock.
-  * "lrclk": sample clock
-  * "mclk" : master clock
-	     -> optional if the interface is in clock slave mode.
-- #sound-dai-cells: must be 0.
-
-Example of TDM_A on the A113 SoC:
-
-tdmif_a: audio-controller@0 {
-	compatible = "amlogic,axg-tdm-iface";
-	#sound-dai-cells = <0>;
-	clocks = <&clkc_audio AUD_CLKID_MST_A_MCLK>,
-		 <&clkc_audio AUD_CLKID_MST_A_SCLK>,
-		 <&clkc_audio AUD_CLKID_MST_A_LRCLK>;
-	clock-names = "mclk", "sclk", "lrclk";
-};
diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-iface.yaml b/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-iface.yaml
new file mode 100644
index 000000000000..320f0002649d
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-iface.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic Audio TDM Interfaces
+
+maintainers:
+  - Jerome Brunet <jbrunet@baylibre.com>
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    const: amlogic,axg-tdm-iface
+
+  "#sound-dai-cells":
+    const: 0
+
+  clocks:
+    minItems: 2
+    items:
+      - description: Bit clock
+      - description: Sample clock
+      - description: Master clock #optional
+
+  clock-names:
+    minItems: 2
+    items:
+      - const: sclk
+      - const: lrclk
+      - const: mclk
+
+required:
+  - compatible
+  - "#sound-dai-cells"
+  - clocks
+  - clock-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/axg-audio-clkc.h>
+
+    audio-controller {
+        compatible = "amlogic,axg-tdm-iface";
+        #sound-dai-cells = <0>;
+        clocks = <&clkc_audio AUD_CLKID_MST_A_SCLK>,
+                 <&clkc_audio AUD_CLKID_MST_A_LRCLK>,
+                 <&clkc_audio AUD_CLKID_MST_A_MCLK>;
+        clock-names = "sclk", "lrclk", "mclk";
+    };
-- 
2.39.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
