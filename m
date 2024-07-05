Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6786CC30658
	for <linux-amlogic@archiver.kernel.org>; Fri,  5 Jul 2024 09:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XO/mqR2Dhm48eSssDYh8dvzhjHEJWo8N6ip9Ft47LD4=; b=DnTgElhX4tfDMG
	J/whgfpggONWq2W68E3C+GyDGxN7EQK8xI/5q9pG09GtyLcPYPF8pE3PKMQ4J/qj8f7P+u0HNjAdr
	BQroIalEkjgE04Psf3lKWu7F5sQwJHmt8+XCerPOIna9+WCkTfmTxTWKwk5LKiKcMQTJ+tFdm2lV1
	dBoh2lGcPzi7cGV+yUMAF1HiahYzGXooVgMSUPM477fpeVcXG+qA7uNmAz25w0cW3UQRA6E4zyfC7
	9c6NJ05Klw0W7B1CDqGL0lQOKTqtv+vsZPYsS1LRTNTIdFIPZUElXN2W+mBRVI5y07RumT8rLA2MJ
	WPW5izpobKVDz5EQwKXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPfhC-0000000FZO8-3Kpz;
	Fri, 05 Jul 2024 09:57:38 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPfcE-0000000FWPI-0k1O
	for linux-amlogic@lists.infradead.org;
	Fri, 05 Jul 2024 09:52:38 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-42565670e20so15712935e9.0
        for <linux-amlogic@lists.infradead.org>; Fri, 05 Jul 2024 02:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720173149; x=1720777949; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MIlgI7ATvfa56t24WLZv2N3r+FaRSfcqNDIIELB3K9k=;
        b=kur0LzSvUr8HD2Rfogub2k6TX6/OMSuZZXvdLfqGt4ePTMMb2O3W+2899yLfIbqmlt
         qYPQ8wfBMYJLmFT3iVEUmpk6QV79ObeIOlnKxUqa0Q6Pxsc9ugVMSFgXA7SpEpq0e0Od
         0jkd4EdNaTOtNKOcVPACyO1SQfn88HtKZHK3w0mmGNpOhp9v2K6wMyACeWKkZBbmc6QG
         JAWORxKPgAI0kEbDm8K/uGV7pthgGOnBJldNSN9yd20fuSwApZYH02sYHujV5563T0TA
         e9zMjpVvahjfvb6rg5eboU4S9Hiu1bJTrUCckAyj0mflm0aEQKOToXGBVvq4oI0KmR3B
         0eRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720173149; x=1720777949;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MIlgI7ATvfa56t24WLZv2N3r+FaRSfcqNDIIELB3K9k=;
        b=ZW9aMPhGcMSm3DxKbY6mh7AMM67+fxGzJf4es/Ilmk8LKVcqpkwGtaD7HLYodyPKH4
         879+vSaB9++aHGtzo0vebPvAD3rhNFOZ13RYKa67jRMZBqs8mJgyMwgPZY7yqky+c2w4
         OEDeXRn/3/E5SBsdZO8gmA5RS8C8DF/La13v6/kmO/0cNdNvLopfVqTzE+TujfHZEeDZ
         ZEZxAU1tN0d/jAhOAgxXYzVrta1rtIBXov23n1nj5HhaL01BrcmHix91OtOgwd6PucCX
         EPDLlwg97VisQ2B5vB8D8w4Xq+hhhrNNOEvsy8Xpzb38P1XYOy8LWWWa7p0YPtFB0/BU
         0sgA==
X-Forwarded-Encrypted: i=1; AJvYcCXrn/8kpfJI/o6a0qanYWkpD1wgqNlSHuL7QAsuvJZnUs8r93n8K9ZCxylf9b00gHTwLCNfguziREqlIe1YDmSkWH1yxBi2WnzwJzPatVAxX7k=
X-Gm-Message-State: AOJu0YxwuqJsC890iZSa5PLZk8AKvnetlbqXwp5L5qxeoYaU8DpLIB7C
	RKheI3T0er+qXQdwATLfh5Mu/xL85OuSOqovqYK1Zd++xRmr3lgMjRBpTKVdYTA=
X-Google-Smtp-Source: AGHT+IFYdBqLIR/9JTaFBXxYKpGPilE8OqK2LNR3FAi3qauVlnALpvoJQYHb02bjbWHRYQZYEu9JFQ==
X-Received: by 2002:a05:600c:4f92:b0:421:811b:b83e with SMTP id 5b1f17b1804b1-4264b190342mr38378725e9.13.1720173148796;
        Fri, 05 Jul 2024 02:52:28 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d1650sm55528995e9.2.2024.07.05.02.52.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 02:52:28 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 05 Jul 2024 11:51:38 +0200
Subject: [PATCH RESEND 19/22] dt-bindings: thermal: ti,am654: reference
 thermal-sensor schema
MIME-Version: 1.0
Message-Id: <20240705-dt-bindings-thermal-allof-v1-19-554061b52fbc@linaro.org>
References: <20240705-dt-bindings-thermal-allof-v1-0-554061b52fbc@linaro.org>
In-Reply-To: <20240705-dt-bindings-thermal-allof-v1-0-554061b52fbc@linaro.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Zhang Rui <rui.zhang@intel.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Guillaume La Roque <glaroque@baylibre.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, imx@lists.linux.dev, 
 linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Florian Fainelli <f.fainelli@gmail.com>, 
 linux-rpi-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1181;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=IKWqNRSn2TqsTvhE9YUkxh3RffPeZr4kiizlC1WJ2gI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmh8I0O7SO6MI6c2V1rHwrBXfHjz7fayuCjb2vT
 5QKRdVQc2eJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZofCNAAKCRDBN2bmhouD
 129dEACM/HkC9ezNBuq2ZBGjirp82olHBKI4OVbJ44FpK6kq/5oyavQNNv67gqtmbfwg/+1ZfgT
 YmnKcEbPaJkGgTo4k3KgS0Xj0DMaW1N4/8uQs5Z5hf/Zw+00jqua2RzRe3K73g2qnBUklPFndd8
 LKWGCYDmTGc9Ff9Wu3djwXmslxZAwKUoZyjcePf96FAznTNekClRSLFF/hB1SwuEzRpVohjfC/b
 ROAqWk1gz3g4Z6GdGlwLdXvMv+l9/YveTMv9K5XlznFWOH7f2vqVGgS2YOV5GE2y04Qq0d/EanC
 4bYllTtcVtNocx4BTsncBd5bd+xL1U1Z065kx80B6hwx/+GkQ6bEB2yS7/5Rm5f73hIMVwuYOVg
 ws9M+6hb2Y3igrkvicIEKMzUfnSp0HKbLKhP1eNdQa8qL6GN5O9bvc8vaLzLvdQ6LVhNz2rIv4H
 PQOYt9hmIB3IuYBLwVl1SMNoj2srEJEZfGUuNI1+8K7cv0v4AXTPJtsfn1KbecOc3l3VIME3HNr
 +Kh53D6zCQYbFJy1RR0wAbp4f1RUGnv7uYaves2Cs3h1pu+8KdRct/Gq0+qEYKi9IPvetsAcOR/
 hgkko8KvukQb96Jaq51+8fMGnAYvOnMi5HfJTPBO+fnb1JpRVHwZhJmg2DOW618OIAd6wLAFdm3
 NRAZlVl0Ki08abQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240705_025230_682886_952D04E2 
X-CRM114-Status: UNSURE (   8.74  )
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

Device is a thermal sensor and it requires '#thermal-sensor-cells', so
reference the thermal-sensor.yaml to simplify it and bring the
common definition of '#thermal-sensor-cells' property.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/thermal/ti,am654-thermal.yaml | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/ti,am654-thermal.yaml b/Documentation/devicetree/bindings/thermal/ti,am654-thermal.yaml
index 7ed0abe9290f..16801aa78bc2 100644
--- a/Documentation/devicetree/bindings/thermal/ti,am654-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/ti,am654-thermal.yaml
@@ -9,6 +9,8 @@ title: Texas Instruments AM654 VTM (DTS)
 maintainers:
   - Keerthy <j-keerthy@ti.com>
 
+$ref: thermal-sensor.yaml#
+
 properties:
   compatible:
     const: ti,am654-vtm
@@ -26,9 +28,8 @@ required:
   - compatible
   - reg
   - power-domains
-  - "#thermal-sensor-cells"
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
