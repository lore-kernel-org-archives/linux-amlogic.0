Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E2C4C77B71
	for <linux-amlogic@archiver.kernel.org>; Sat, 15 Apr 2023 09:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OwuFxZKOjNs7u5T1w7kP2BCCd85ShOgzKHMtbFZ8NOw=; b=xAl0l/hk6E/nJp
	n1djyyIieHx0ZDME77OAxKid8mV9zoY9EOX4WcM3+hze5F6DeUysQfgeupvZr3/vIVUsu56PjJhcZ
	vamUF73n/ASDppVLWqRJMIweEDay7DgwAM54Hy1GCG/dzFBwxU8KLKNFQCZDxUUTnse9IKqeqtIIr
	yI43dxPOu2f/4OBWMf1aFXHtcqmQWdHxgDsBy0zNiOwf4l7M/Ab5MrBcw+AgmLWH+vnDIFgcDP4I5
	+LfcJkxJVxuPqu2jIK2Fn68QQzErG6fYMF/ed+GT/ivh2T2b80mcV517vHouO/oo3c7dTSwjw5MEx
	a1RFH2LlT6642rPYBgiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pncfx-00BmDI-32;
	Sat, 15 Apr 2023 09:58:33 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pncfq-00BlzX-1u
	for linux-amlogic@lists.infradead.org;
	Sat, 15 Apr 2023 09:58:28 +0000
Received: by mail-ej1-x62a.google.com with SMTP id xd13so17785604ejb.4
        for <linux-amlogic@lists.infradead.org>; Sat, 15 Apr 2023 02:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681552706; x=1684144706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fr2pBCD6umNhczQxq97ewzN+14iVAoxszUR3df4m1JI=;
        b=KBrssLMtLKmsLeebg43o7A5lMW1PVjr0FL9EGnzfptlfeJU2+O2WNhBQ0HFo977Iua
         rcld+cXUs9Y3HxWGpMiWcxuAfuHnC6x2cl+2qmiauB6x3msu3sypy5NK/yx27mTj9y9H
         Ewx0zS9sHKphX1IM5mkG+xkB6sHk7sfp4o4noyPWiYZEJSHxddoi/P8z/eEN6vWGUkfS
         YvSlcUyBbUSaYJGQsDy8QWLzuLGdkAmSAIUuNvqPRl4XN5crob1qw9uZzXUe5YMUnJhX
         g80zIJJQURIGeGysIlmkHk5jlgHtryhPW/OjPjPmOckvxXqsnLQS//OqqROjirbCPdRq
         tmLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681552706; x=1684144706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fr2pBCD6umNhczQxq97ewzN+14iVAoxszUR3df4m1JI=;
        b=YH8Wh7Bi/z/YOsPyCtWCu9S6JeClXbUnhBoPiPT+wTDdthRrSJf8iMvnNrFAbPMY2c
         VHU21Hv5NFQBCF+OyUV6FrA37cz3ihPdInvxSdRb1m7tG7Sxj60HGqakAvAkjAuNQBQG
         RJsfPOAIYbIhRMKG4xl3KuKzwNBppm90cMQIZsaXMfAsffMBTJcx2HFvOY0ul0mKfqPg
         msjX6zQ/IGGZYblY5GNY84bytbNaqS2YiOLav9Olcw6LaSdWTcCgf8GcmA9feJupTX2W
         UrClVuGwZYJ1y9AOy0cxp1g9oPE9/gU0TWN2Xi6cebzP2Spp/cSCCoYxz5et57/32H/r
         e3+w==
X-Gm-Message-State: AAQBX9fvYglFSVItRGMiCxztNgh0yEVW9fZh3m+YeHFeysYouZVpyYBl
	zVgqmRun3me0tDGuOPZk3wjJLw==
X-Google-Smtp-Source: AKy350bZWvNaGJptFPLSmIHH7cRbLl7V6f22Bt1WbL4mPTQOR4EbC2AYcFac6G7sc67vcTz0OtrFlQ==
X-Received: by 2002:a17:906:b788:b0:94c:548f:f81d with SMTP id dt8-20020a170906b78800b0094c548ff81dmr1404066ejb.71.1681552705946;
        Sat, 15 Apr 2023 02:58:25 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:a3bf:4ed:6c53:2a36])
        by smtp.gmail.com with ESMTPSA id gn23-20020a1709070d1700b009373f1b5c4esm3594248ejc.161.2023.04.15.02.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Apr 2023 02:58:25 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Julius Werner <jwerner@chromium.org>,
	Evan Benn <evanbenn@chromium.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Sander Vanheule <sander@svanheule.net>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Fu Wei <fu.wei@linaro.org>,
	Viresh Kumar <vireshk@kernel.org>,
	Eugen Hristev <eugen.hristev@collabora.com>,
	Justin Chen <justinpopo6@gmail.com>,
	=?UTF-8?q?=82ecki?= <rafal@milecki.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	Corentin Labbe <clabbe@baylibre.com>,
	Anson Huang <Anson.Huang@nxp.com>,
	Robert Marko <robert.marko@sartura.hr>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jamie Iles <jamie@jamieiles.com>,
	Yannick Fertre <yannick.fertre@foss.st.com>,
	Christophe Roullier <christophe.roullier@foss.st.com>,
	Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
	Srinivas Neeli <srinivas.neeli@xilinx.com>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-renesas-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 6/6] dt-bindings: watchdog: realtek,otto-wdt: simplify requiring interrupt-names
Date: Sat, 15 Apr 2023 11:51:12 +0200
Message-Id: <20230415095112.51257-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230415095112.51257-1-krzysztof.kozlowski@linaro.org>
References: <20230415095112.51257-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230415_025826_673341_B7B26A15 
X-CRM114-Status: GOOD (  10.00  )
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

Required properties should be listed in "required:" block.  Since
interrupts are already there, the dependency of interrupt-names on the
interrupts can be simplified.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/watchdog/realtek,otto-wdt.yaml        | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/realtek,otto-wdt.yaml b/Documentation/devicetree/bindings/watchdog/realtek,otto-wdt.yaml
index 099245fe7b10..1f5390a67cdb 100644
--- a/Documentation/devicetree/bindings/watchdog/realtek,otto-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/realtek,otto-wdt.yaml
@@ -67,12 +67,10 @@ required:
   - reg
   - clocks
   - interrupts
+  - interrupt-names
 
 unevaluatedProperties: false
 
-dependencies:
-  interrupts: [ interrupt-names ]
-
 examples:
   - |
     watchdog: watchdog@3150 {
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
