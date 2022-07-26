Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6144C43334
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 Jul 2022 11:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7vpfR0qyVU22Ji0eVeatpfkoqoGClQtJ1Cs3aTlQg3A=; b=en4KZUAeHIrYSD
	MvvJVvPnbEwRjICRo1TYcFqi3sYp5OaRXGbBu00MECDc1LhT5hhOtBy9jewezQDAR4MBY5wkkNRYh
	RB/Kb/p237gYCuPZHUuJI8rBs36tCndG4Knb6jPWMIuBy5I3cb7Umdf7LmXCgvoz6bPuFEGLSlI79
	YBPeM7ZUPc/oniYgNfZ1tHUFr3BQwQTjL6wKmokH9NzZCVXWK4mfu7Iw61ZfEY1ZdXJQgO1OXSCSr
	hYiGmO8bVa5sB7eHWcc9sbodM5CXF5tiJl55Qgw//Uzchh45LzTZ+rPIeVg2hseEuOoJ4F5KQVS0k
	CTYdJbX5y6qMMAyI8HwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGJCo-00GXiH-KB; Tue, 26 Jul 2022 11:58:30 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGJCM-00GXDc-F6
	for linux-amlogic@lists.infradead.org; Tue, 26 Jul 2022 11:58:06 +0000
Received: by mail-lj1-x234.google.com with SMTP id p21so8583041ljh.12
        for <linux-amlogic@lists.infradead.org>; Tue, 26 Jul 2022 04:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZwkQZasg6IBuIX69FQ87eiIi43RzDJyxPSLaxovlxC4=;
        b=kYqEifC17FN7TtUjiBjuAmb1wrChjCst87iBC8TDZ7+xc8vNgwBl2B/DHmo4mtsUTk
         ukHgvpU7hg4sndI3GIByDjcaQPJeBlvQr8pYw+n9B7CX8aDi+7QwW8qL+4zmVIHZe9rD
         zDqLjIx9UR84zUhofG2J+SbCH9xpzcmW6j2abK87ChShLIwY+IkusBLVayEyUfEVUuZH
         as5eQOemkZMLR1sbfhY1Sd4wMqv4fw+pvLTxsnhqbpBea6C5A8Qb0jVVqeqLgaqQa/56
         RbYJvEoLI5xxRb9DURsh2h4t39Cy/0nkA3xIDdOUEltZFfLFnouXJb0kFRvTngXQ9Wvf
         BgGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZwkQZasg6IBuIX69FQ87eiIi43RzDJyxPSLaxovlxC4=;
        b=iynLkjadMnstv5OecC8+IhTpu8B86n+X/nS1Sb6L5IMeujC0n8E6gM+R0gDJ84Nqp4
         YTLsoDG0N62NFLbFfMpepasWMLnw47qlyNAWwVbKE9sKWHdoxzk2ySvlzowaagK3P70P
         laVwEPALQHKT2eUomlaQqjmv2cO8mnZCCnnalYUK4zZ+HwDx6aPNh/d3lq/hQVYq3hUK
         +LR99IT+ppocrRFnJ17ZzDBhsx9/NsyRNIOLVDL9eSAcNJOpnRrjZJ7LKeTvJfRLsJpl
         66WrlgCVIg7oJH+msHmlvX2u3xjkIlNliCkGv/SIXp2V+aE9VRe6o4dQK9cGNGy9E2s8
         doDg==
X-Gm-Message-State: AJIora8YWfQENwGPtLLzQ/ABeT+NDXuZmRuziKs4kQpIXm6giAJiZjYe
	+qsZHsa2Za2ZnRoxAEKTIh1qlQ==
X-Google-Smtp-Source: AGRyM1sbTSItTpSSwTcmlDwnnQpx/0JkNaISSUBsOMOvGMIufatVh9gvLfu9MyNfud5Jhd7RQsdUlg==
X-Received: by 2002:a05:651c:1208:b0:25e:141e:63a7 with SMTP id i8-20020a05651c120800b0025e141e63a7mr1085274lja.513.1658836675690;
        Tue, 26 Jul 2022 04:57:55 -0700 (PDT)
Received: from krzk-bin.lan (78-26-46-173.network.trollfjord.no. [78.26.46.173])
        by smtp.gmail.com with ESMTPSA id g24-20020a19e058000000b0048a7d05739asm222219lfj.4.2022.07.26.04.57.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 04:57:55 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Neil Armstrong <narmstrong@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Sebastian Reichel <sre@kernel.org>,
	Michal Simek <michal.simek@xilinx.com>,
	David Lechner <david@lechnology.com>,
	Iskren Chernev <iskren.chernev@gmail.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Matheus Castello <matheus@castello.eng.br>,
	Hans de Goede <hdegoede@redhat.com>,
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>,
	Purism Kernel Team <kernel@puri.sm>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jianxin Pan <jianxin.pan@amlogic.com>,
	=?UTF-8?q?Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Michael Klein <michael@fossekall.de>,
	Dan Murphy <dmurphy@ti.com>,
	Ricardo Rivera-Matos <r-rivera-matos@ti.com>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	"Andrew F. Davis" <afd@ti.com>,
	Tony Lindgren <tony@atomide.com>,
	Artur Rojek <contact@artur-rojek.eu>,
	Mike Looijmans <mike.looijmans@topic.nl>,
	Stephan Gerhold <stephan@gerhold.net>,
	David Heidelberg <david@ixit.cz>,
	Dmitry Osipenko <digetx@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/3] dt-bindings: power: drop quotes when not needed
Date: Tue, 26 Jul 2022 13:57:46 +0200
Message-Id: <20220726115748.101015-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220726_045802_593844_2A004821 
X-CRM114-Status: UNSURE (   9.94  )
X-CRM114-Notice: Please train this message.
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

Id and schema fields do not need quotes.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/power/amlogic,meson-ee-pwrc.yaml      | 4 ++--
 .../devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml     | 4 ++--
 .../devicetree/bindings/power/apple,pmgr-pwrstate.yaml        | 2 +-
 .../devicetree/bindings/power/brcm,bcm63xx-power.yaml         | 4 ++--
 Documentation/devicetree/bindings/power/renesas,apmu.yaml     | 4 ++--
 .../devicetree/bindings/power/renesas,rcar-sysc.yaml          | 4 ++--
 6 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/power/amlogic,meson-ee-pwrc.yaml b/Documentation/devicetree/bindings/power/amlogic,meson-ee-pwrc.yaml
index 4e52ef33a986..5390e988a934 100644
--- a/Documentation/devicetree/bindings/power/amlogic,meson-ee-pwrc.yaml
+++ b/Documentation/devicetree/bindings/power/amlogic,meson-ee-pwrc.yaml
@@ -2,8 +2,8 @@
 # Copyright 2019 BayLibre, SAS
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/power/amlogic,meson-ee-pwrc.yaml#"
-$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+$id: http://devicetree.org/schemas/power/amlogic,meson-ee-pwrc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Amlogic Meson Everything-Else Power Domains
 
diff --git a/Documentation/devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml b/Documentation/devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml
index 86e5f6513bb3..eab21bb2050a 100644
--- a/Documentation/devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml
+++ b/Documentation/devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml
@@ -3,8 +3,8 @@
 # Author: Jianxin Pan <jianxin.pan@amlogic.com>
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/power/amlogic,meson-sec-pwrc.yaml#"
-$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+$id: http://devicetree.org/schemas/power/amlogic,meson-sec-pwrc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Amlogic Meson Secure Power Domains
 
diff --git a/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml b/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml
index 19a194980142..94d369eb85de 100644
--- a/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml
+++ b/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml
@@ -10,7 +10,7 @@ maintainers:
   - Hector Martin <marcan@marcan.st>
 
 allOf:
-  - $ref: "power-domain.yaml#"
+  - $ref: power-domain.yaml#
 
 description: |
   Apple SoCs include PMGR blocks responsible for power management,
diff --git a/Documentation/devicetree/bindings/power/brcm,bcm63xx-power.yaml b/Documentation/devicetree/bindings/power/brcm,bcm63xx-power.yaml
index 63b15ac6dde4..d867bd6976d8 100644
--- a/Documentation/devicetree/bindings/power/brcm,bcm63xx-power.yaml
+++ b/Documentation/devicetree/bindings/power/brcm,bcm63xx-power.yaml
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/power/brcm,bcm63xx-power.yaml#"
-$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+$id: http://devicetree.org/schemas/power/brcm,bcm63xx-power.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: BCM63xx power domain driver
 
diff --git a/Documentation/devicetree/bindings/power/renesas,apmu.yaml b/Documentation/devicetree/bindings/power/renesas,apmu.yaml
index d77fc88050c8..f2cc89e7f4e4 100644
--- a/Documentation/devicetree/bindings/power/renesas,apmu.yaml
+++ b/Documentation/devicetree/bindings/power/renesas,apmu.yaml
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/power/renesas,apmu.yaml#"
-$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+$id: http://devicetree.org/schemas/power/renesas,apmu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Renesas Advanced Power Management Unit
 
diff --git a/Documentation/devicetree/bindings/power/renesas,rcar-sysc.yaml b/Documentation/devicetree/bindings/power/renesas,rcar-sysc.yaml
index 8d56bedd3390..0720b54881c2 100644
--- a/Documentation/devicetree/bindings/power/renesas,rcar-sysc.yaml
+++ b/Documentation/devicetree/bindings/power/renesas,rcar-sysc.yaml
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/power/renesas,rcar-sysc.yaml#"
-$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+$id: http://devicetree.org/schemas/power/renesas,rcar-sysc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Renesas R-Car and RZ/G System Controller
 
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
