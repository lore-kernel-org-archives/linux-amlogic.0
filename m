Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53476C7619A
	for <linux-amlogic@archiver.kernel.org>; Sat, 15 Apr 2023 09:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4HeKZXi+NUs98n9pqIv+i9WrsLGet/7i5WYXE4qOAaQ=; b=cPZGfCjOMWaUQ3
	AHnF7u72ohLSuX/HYz2OF+GM86Chtnmk1um+ZOTH11jgHF7BxHf5Afu8oDsidSPaV9YwdBtCj6mk6
	7vOHN0kexTMYLZm2fWSjVrKP2+nNFPIMfzkhx5GmilRjeYmZA19GHeOGgORnmJTk5XVq0WlQhTXJF
	P3EtUhmr1wm8eOVhi3UftzkIKij0Uq9k0uaoMb2HKVb4DQdfDLELDXxVDltbio9zgm4taWsWISGNx
	WnfC/iHH6apQSjSuhaIKzefnUcXfb1lG0rt8Kdxb8T76bC9VWogX6A9ps5xEl9NX/AeJucoRV3AJ7
	lRXsmn8JCz2kqDcKpdZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pncft-00Bm9L-0W;
	Sat, 15 Apr 2023 09:58:29 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pncfm-00Bm2S-0R
	for linux-amlogic@lists.infradead.org;
	Sat, 15 Apr 2023 09:58:23 +0000
Received: by mail-ej1-x631.google.com with SMTP id xd13so17785305ejb.4
        for <linux-amlogic@lists.infradead.org>; Sat, 15 Apr 2023 02:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681552701; x=1684144701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X++FhK1t/fMQBncyu3FeTc1IPRncKd5sGne3lbXD1HA=;
        b=ElHS0DixfV4Wx0/NRCOiZ3tsYfPcSyO/g1j7g/FJw5/YfXipUfJBvmFPzXl13E2Tvf
         SlSdK+EcP2/VLC4TtP1izTSZh2TYXhQwqrEHTP4zmLknPDHuF6W0Ez3oOwri2AO4Ln8J
         DKM/IsZIxge+Q36axXN56jyjNpGR6y1DekpVmrGRzkbCcPf8lzZTffR5fyyV3yf3kqgU
         XY3Jr5gNhHwtScMoax+woXvPJV+LbcS1d3mQ8aHbvrtS9cqK7eNuaskGH+C3p4x28hPk
         gE0r2qXpKKwQao2swDA6m552WDpf1EkvhZhgjtn7/+5P2CZIcSXmPfyymhrvI2osVwKR
         mSyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681552701; x=1684144701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X++FhK1t/fMQBncyu3FeTc1IPRncKd5sGne3lbXD1HA=;
        b=j5ZepJAe/PsqVQebQS+Y9AYN701V2q04abrwBDZD3RxFDu6WAKei8Lgwkw58rRIIjC
         xKjZ0Q8dcHwyhADhEzIsbvIwwG8XLHjFyvg2CYIyclLRCwqvMVfry2hAHkA2A1U3Jcju
         ca/eLdNvMksQk5+shW6P8YnVHmbD5/dRhzFF9aZ7DwenWQB8AneXQEvhXrhFRbp5raPv
         ZGcaWS6Fp4TONYYU1gmBi+tY+PHCRW3ONRGeULK7uiCH85DiegOXLJtlT96x0fQwuHqq
         G6/+6kSwdQ24st3wiWjKwjYJd3aKt+8mL6uNbbPhWaGFHQJ2l3OoYviw1Be2rjKpQJGP
         COKw==
X-Gm-Message-State: AAQBX9c5Gjl62yL6kNS2GB4St5GZH9pSTjYwvbjIVsYLDf7d2xpAHoKQ
	+DSXBBKEBt19B0rlQ+In1oDy9g==
X-Google-Smtp-Source: AKy350Yav0SQe0tEvR6ZtIMRzAj9K6H8406yqb7Hzclv9sLARZM1w9Vr1g/iMuC5RnPGGtv3bjO69Q==
X-Received: by 2002:a17:906:149b:b0:948:b9ea:3302 with SMTP id x27-20020a170906149b00b00948b9ea3302mr1901974ejc.1.1681552700850;
        Sat, 15 Apr 2023 02:58:20 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:a3bf:4ed:6c53:2a36])
        by smtp.gmail.com with ESMTPSA id gn23-20020a1709070d1700b009373f1b5c4esm3594248ejc.161.2023.04.15.02.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Apr 2023 02:58:20 -0700 (PDT)
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
Subject: [PATCH 4/6] dt-bindings: watchdog: fsl-imx7ulp-wdt: simplify with unevaluatedProperties
Date: Sat, 15 Apr 2023 11:51:10 +0200
Message-Id: <20230415095112.51257-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230415095112.51257-1-krzysztof.kozlowski@linaro.org>
References: <20230415095112.51257-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230415_025822_263381_2D8D2BBB 
X-CRM114-Status: UNSURE (   9.25  )
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

Allow generic watchdog properties by using unevaluatedProperties: false.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/watchdog/fsl-imx7ulp-wdt.yaml         | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/fsl-imx7ulp-wdt.yaml b/Documentation/devicetree/bindings/watchdog/fsl-imx7ulp-wdt.yaml
index d3790f1a96a2..4b7ed1355701 100644
--- a/Documentation/devicetree/bindings/watchdog/fsl-imx7ulp-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/fsl-imx7ulp-wdt.yaml
@@ -30,15 +30,13 @@ properties:
   clocks:
     maxItems: 1
 
-  timeout-sec: true
-
 required:
   - compatible
   - interrupts
   - reg
   - clocks
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
