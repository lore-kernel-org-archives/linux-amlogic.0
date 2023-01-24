Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AF9AC25B4E
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Jan 2023 09:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y0YSE1JPystFX8T+bwHWBI04QDUWb4e1TJIMaAjIPHc=; b=mO1ovpFqUfGuvV
	8JFXqorheNZa15qkPizOxPr6NJJ8Zuaiwl4MgbdR8f6eRjN5NV6r7AvZmnxPkPNtzbP0FV+i82+J6
	cfLwbW2cT4J26q3TiCmZeUapcHjqefa3f7v4M0UESrc2KkLACVAAof5D6vhAPabaC25syPCULjGFt
	PYSZ+0XSCSDhpnuCGHZF5Qx4U3oBvnEiVcKFCoQdEgwN090be25ScW+DUZtzQuPIlN5b6tJEAh8O6
	WEU+ldveqKxUIYUp5TGHUAQaSsMWouVIJP5DeS7I/PbN8VAw3hFsWhfNdELyu1qxTMXCPVqUTbVcZ
	2GboM0d9nE9+ChiG2AHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKFXD-002tSS-Ng; Tue, 24 Jan 2023 09:24:07 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKFTN-002rUC-0w
	for linux-amlogic@lists.infradead.org; Tue, 24 Jan 2023 09:20:10 +0000
Received: by mail-wm1-x332.google.com with SMTP id fl11-20020a05600c0b8b00b003daf72fc844so12366900wmb.0
        for <linux-amlogic@lists.infradead.org>; Tue, 24 Jan 2023 01:20:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t3ne6RtXQyQ2xZokD/urqvcvyti0fGO7udq2uYUhjl4=;
        b=iF/SVufCGutRcvsU52HZA2iBFjZzxQZO4nhJCwGWZmUjf5gH3yh4xXtKUZAp84g6l0
         W3kqM3ALCgpVEjYQ4HYkJY/Yq5urA7lwLgbYyqCwOnA3TV+8xAqsFiA8IASXn5B8FgEL
         plvdf8WLwo2bthlymR45KrY25uuMPQBOuxEMh5sepkeewYiFXwsEriSt/m2zEP7Cf5Sb
         WQvVnoVBef1B+fW0QZ8rzKqhmRuFfMAybd70PTLdYH9242C2sI35wrccvVx4S78Em+fd
         xIUJVMv8RnGNzJRTWD9tI6EE/NBFcgPTaJu/ehnlGx+R4RnacDCONVq9UY/Qwq44Cl5B
         5YHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t3ne6RtXQyQ2xZokD/urqvcvyti0fGO7udq2uYUhjl4=;
        b=gbAxcxrri+7gCAJlSCW88qqlZXcpK0DKOdVNCmrB9vRuQg/tW5TRW1O1h2/bzM/5Ek
         4Y7qrE56M5Wh9+vHVSEpS2h1vqzeilQuATgzHGAq6eD5uKatNupsFWgqxWSAF1PCUALU
         Gt0wuF6g3YTje46x5SL3omAD76Pbmyv9/ZTP/1AlsTeKq+u/EYQBdQs8wT70aneT4Wuf
         EdBJOFmmoBId5JuMrFr0cg6kgT/wNZPruYWbwt7RTrwhU/NMZBEDhgY7cJBsFuk/zmsU
         zCrFrX8dJgA/HTlMqTYWuHePCUpvTtqOpoyeGg5D/F1qqomHDEaQdxqauqC32GW9K8P1
         oOMg==
X-Gm-Message-State: AFqh2kpy5buTmwLDj0cr97jCwiun9r4YZ/cAkYfNy1ayvFBVA+LqffZX
	RmDsVFV38FZJV6rWZETzbJb7vg==
X-Google-Smtp-Source: AMrXdXtZql21ZBrKkdmMysJwTEVcbN5GKUTYDDo2IexCQ0hGTMdVG5t3LB4Onaamm/PtjPXUrsWjbw==
X-Received: by 2002:a05:600c:47cf:b0:3da:fa3d:cf5e with SMTP id l15-20020a05600c47cf00b003dafa3dcf5emr26558124wmo.28.1674552008559;
        Tue, 24 Jan 2023 01:20:08 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id i22-20020a05600c355600b003a84375d0d1sm13672242wmq.44.2023.01.24.01.20.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 01:20:08 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Lubomir Rintel <lkundrak@v3.sk>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Michal Simek <michal.simek@xilinx.com>,
	Chester Lin <clin@suse.com>,
	Fugang Duan <fugang.duan@nxp.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Pragnesh Patel <pragnesh.patel@sifive.com>,
	Le Ray <erwan.leray@foss.st.com>,
	Peter Korsgaard <jacmet@sunsite.dk>,
	Tomer Maimon <tmaimon77@gmail.com>,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 11/12] dt-bindings: serial: drop unneeded quotes
Date: Tue, 24 Jan 2023 10:19:15 +0100
Message-Id: <20230124091916.45054-9-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124091602.44027-1-krzysztof.kozlowski@linaro.org>
References: <20230124091602.44027-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_012009_126798_C8F5AB03 
X-CRM114-Status: GOOD (  11.42  )
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

Cleanup by removing unneeded quotes from refs.  No functional impact
except adjusting to preferred coding style.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/serial/8250.yaml            | 4 ++--
 .../devicetree/bindings/serial/fsl,s32-linflexuart.yaml       | 2 +-
 Documentation/devicetree/bindings/serial/fsl-imx-uart.yaml    | 4 ++--
 Documentation/devicetree/bindings/serial/fsl-lpuart.yaml      | 2 +-
 Documentation/devicetree/bindings/serial/fsl-mxs-auart.yaml   | 2 +-
 5 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/serial/8250.yaml b/Documentation/devicetree/bindings/serial/8250.yaml
index badaf6d5b6fe..2d0cac642427 100644
--- a/Documentation/devicetree/bindings/serial/8250.yaml
+++ b/Documentation/devicetree/bindings/serial/8250.yaml
@@ -203,12 +203,12 @@ properties:
     deprecated: true
 
   aspeed,lpc-io-reg:
-    $ref: '/schemas/types.yaml#/definitions/uint32'
+    $ref: /schemas/types.yaml#/definitions/uint32
     description: |
       The VUART LPC address.  Only applicable to aspeed,ast2500-vuart.
 
   aspeed,lpc-interrupts:
-    $ref: "/schemas/types.yaml#/definitions/uint32-array"
+    $ref: /schemas/types.yaml#/definitions/uint32-array
     minItems: 2
     maxItems: 2
     description: |
diff --git a/Documentation/devicetree/bindings/serial/fsl,s32-linflexuart.yaml b/Documentation/devicetree/bindings/serial/fsl,s32-linflexuart.yaml
index 8b643bae3c7b..920539926d7e 100644
--- a/Documentation/devicetree/bindings/serial/fsl,s32-linflexuart.yaml
+++ b/Documentation/devicetree/bindings/serial/fsl,s32-linflexuart.yaml
@@ -16,7 +16,7 @@ maintainers:
   - Chester Lin <clin@suse.com>
 
 allOf:
-  - $ref: "serial.yaml"
+  - $ref: serial.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/serial/fsl-imx-uart.yaml b/Documentation/devicetree/bindings/serial/fsl-imx-uart.yaml
index b431a0d1cd6b..4cbe76e1715b 100644
--- a/Documentation/devicetree/bindings/serial/fsl-imx-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/fsl-imx-uart.yaml
@@ -10,8 +10,8 @@ maintainers:
   - Fabio Estevam <festevam@gmail.com>
 
 allOf:
-  - $ref: "serial.yaml"
-  - $ref: "rs485.yaml"
+  - $ref: serial.yaml#
+  - $ref: rs485.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml b/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
index 26c3593fa98b..ab81722293d3 100644
--- a/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
+++ b/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
@@ -10,7 +10,7 @@ maintainers:
   - Fugang Duan <fugang.duan@nxp.com>
 
 allOf:
-  - $ref: "rs485.yaml"
+  - $ref: rs485.yaml#
   - $ref: serial.yaml#
 
 properties:
diff --git a/Documentation/devicetree/bindings/serial/fsl-mxs-auart.yaml b/Documentation/devicetree/bindings/serial/fsl-mxs-auart.yaml
index 14c7594c88c6..6a400a5e6fc7 100644
--- a/Documentation/devicetree/bindings/serial/fsl-mxs-auart.yaml
+++ b/Documentation/devicetree/bindings/serial/fsl-mxs-auart.yaml
@@ -10,7 +10,7 @@ maintainers:
   - Fabio Estevam <festevam@gmail.com>
 
 allOf:
-  - $ref: "serial.yaml"
+  - $ref: serial.yaml#
 
 properties:
   compatible:
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
