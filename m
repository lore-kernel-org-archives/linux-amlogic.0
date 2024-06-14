Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73789C27C6E
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Jun 2024 09:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/RnRrdC3Cj6rjTixmvsGdbysB2dI/tLOE5q3Nzy1/uY=; b=D+WjjVYeUkMUr3
	FxGZAihvRBsDz+aO3WOL5/ES3SsHMQwzz/TlK8EPssN0HhHd/OijsABC/pEvAypq1rxj1eIFnKOV/
	du4ZCEhW4APjy627rNu0EBTpXskCDW73iose8Hfn+/wilNoNOtH3pIfKt2FJvvdvkpEg2yevpgUtP
	b4CNA9HSZU2+E0GWDBqKPVS/q2TZ002/q57r0Nzo7wIfbdAhOpv8hkv3P11+No+AnQyGe3oma62fe
	G/OrIoM5szIJ5uZVAjSTrf+VNh9JijY4uOaUrg4DcoVbDLl5H7F/G9bkx1XcxUVZRjgV2+k+jivFR
	LT+e5faKbyRqDGcv3rTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI3Xp-00000002GXS-2VfB;
	Fri, 14 Jun 2024 09:48:29 +0000
Received: from mail-ej1-f47.google.com ([209.85.218.47])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI3WU-00000002FSe-1p2j
	for linux-amlogic@lists.infradead.org;
	Fri, 14 Jun 2024 09:47:11 +0000
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a6f3efa1cc7so522591466b.0
        for <linux-amlogic@lists.infradead.org>; Fri, 14 Jun 2024 02:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718358424; x=1718963224; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Iwmc7YyUOm4xBDbjnVE/cLl9RXPcTzMFZ8fnvjc/kFM=;
        b=GRtSqkSwLv/SmiYQ44t5F1vCSzdwrI4gIi6Mrv4zAIPGkeXAatmjV8ATuLC7jHtUm6
         dGnSErpVGboHU8jSBMO8ddIu7agX7reaKMhAhoGKckRtuD4YPZiA/+kcLaPuHKQyigCD
         LYAfgPgrfQ2EjYDxnl6xY4+oeDRRkFHnnsCXYX4aQyIgw/1mq64ZHAo11asjPHGvacE3
         HwBayVbUkWdG3jc3MzDVWw9WvdeHZMbh+stq3ei2zYlghseNmrhpUXZzkYm3hDECR6S/
         5KlWUmRQXXYcDOa+keX4+kAqFBhJpF7qUbHmmLwm9LYmN7kr2mh9QoYs85YdNh3M+ZlH
         gTBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718358424; x=1718963224;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Iwmc7YyUOm4xBDbjnVE/cLl9RXPcTzMFZ8fnvjc/kFM=;
        b=r17eah2bVZRgD7zrthDvMm8qDWdqAh/9j2LCNgnsJ/5YMAK6exVSWpDnv1QFxPoAJK
         Q3z8iV/MHzWXO3oGZXv2CcSrClt5x+1U9rB+pCxDtLvy5jPiIIkAMJynMCbjKrCh9G1o
         siwIUj0OyvtTXRAHHbiX8fuVv3tji0itKbso1hjkqUsJuc5kbY/zevCpVgV2cnbS4J4/
         sVWB/jkByxQuR4I9ps2f0C1NMVepjcV1Wx+TAz9emVDLyNlxGlK6DI7rRI1TnITCuS8e
         xNO7yQuMIyWctl4/T8Twz6JUH+xs4JuEk96I3kgFMgqB7BEi8N8m8eRz3PFpmjF5mxAu
         MNqA==
X-Forwarded-Encrypted: i=1; AJvYcCX2/hu5OAWfYrLXrpApA4IiuJeFId30YL0n7fHlncfIIzXhg3ezXG+hPyZXtywa1nhhVHZIksVh+FbcfJWOrSaWvzyIIpL4lUVhhkWqUZqIhfE=
X-Gm-Message-State: AOJu0YxAWDY3DZswVI8XXRBij3JRxGyL6r5qu0Z7ThZ9L67aQzuvLpBE
	aPfMFgofjctRNj6Vk3afZcHIjZBs/ZSvNM3eg1P3xkD3n52c4gTxhZs+bD9cYZA=
X-Google-Smtp-Source: AGHT+IFGHX4cF4M1r2y8AHK5kgGVnBSOah5PGU+We1I9mKi7qiDqk6ZzvLWJM+Qwin1N8Vfc/vcJnQ==
X-Received: by 2002:a17:906:c0c5:b0:a6e:f53c:8da0 with SMTP id a640c23a62f3a-a6f6080c781mr154203666b.8.1718358424287;
        Fri, 14 Jun 2024 02:47:04 -0700 (PDT)
Received: from [127.0.1.1] ([78.10.206.163])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56f9c84csm164966366b.222.2024.06.14.02.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 02:47:03 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 14 Jun 2024 11:46:13 +0200
Subject: [PATCH 14/22] dt-bindings: thermal: rockchip: reference
 thermal-sensor schema
MIME-Version: 1.0
Message-Id: <20240614-dt-bindings-thermal-allof-v1-14-30b25a6ae24e@linaro.org>
References: <20240614-dt-bindings-thermal-allof-v1-0-30b25a6ae24e@linaro.org>
In-Reply-To: <20240614-dt-bindings-thermal-allof-v1-0-30b25a6ae24e@linaro.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Guillaume La Roque <glaroque@baylibre.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Vasily Khoruzhick <anarsoul@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Anson Huang <Anson.Huang@nxp.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Amit Kucheria <amitk@kernel.org>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Heiko Stuebner <heiko@sntech.de>, Biju Das <biju.das.jz@bp.renesas.com>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Pascal Paillet <p.paillet@foss.st.com>, Keerthy <j-keerthy@ti.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, 
 zhanghongchen <zhanghongchen@loongson.cn>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, imx@lists.linux.dev, 
 linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Florian Fainelli <f.fainelli@gmail.com>, 
 linux-rpi-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1131;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=6a1ezUMQBbtM3uBevrHObXqlW1KAkGO0em2HgJT7Ukk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmbBFsTvtf1ULZrtH6GWJrZWn/jbBu50Y0K1VTc
 0Wt6oeUybGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZmwRbAAKCRDBN2bmhouD
 1/NwD/9O4ot8cobnhA94V3eGyRXw9zI5iESIUEkI1Mbbo7u21Zss4doBkhIDxJVQPLibQlpPDKs
 vl14uXutFJcltQlm/A30q7/jGYqin8KK+/fxS+lF14J7Fm+3oR2w5nhGXJq/9eptPEvk3xiH1p0
 6sQMjw0nuX+vqvIdVI0HSIGysiYW9eHWrwjfT2H0x2AI4eSjoOjqRw8BCVG1NOXkiOcWojysyie
 6Pe/a65m99arhY72cNG5XsPMldFzUjctBN5RFrE6OKZdohirpSSKFR4ui2PdxAp5GhEkcvlApXu
 JTKC1SMMHbFFDPVGHC4z0FdwyT7hbxBnR4zeVza8HeF7gY1NwvdMte/ICkBOm4nLC9XiXxBh8Ox
 gRb5WbhTZMcA2D/BRpTHEH8cJRx9l++VITdFXDh2DKM1zJBSyTXZLBp2T/nznU4UCoZvGVo8L/6
 SL6E6301KeFidlqEV72QLyq6H/+0idmujB7H/OwDlIz3rWlt8WAbKmtD8gwZWJAconS5R/wzo0q
 qwhIyGQup+u9pvI87775gFYyWIrMSKJUCjFFjCt+azCgzvgFIR1RFwzl+4Um4RPBXjtpfLa8Sv+
 qUC1e3KXvqeGpd2hDPVFEIJxO/3TRP8QqO5N7KwNG1PZSSDA/LKALNPT6of5MqC/u13zepj07zJ
 tHBm3LjcR8x8A1Q==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240614_024706_889633_C9A5D8FF 
X-CRM114-Status: GOOD (  10.29  )
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

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/thermal/rockchip-thermal.yaml | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/rockchip-thermal.yaml b/Documentation/devicetree/bindings/thermal/rockchip-thermal.yaml
index 55f8ec0bec01..b717ea8261ca 100644
--- a/Documentation/devicetree/bindings/thermal/rockchip-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/rockchip-thermal.yaml
@@ -9,6 +9,8 @@ title: Temperature Sensor ADC (TSADC) on Rockchip SoCs
 maintainers:
   - Heiko Stuebner <heiko@sntech.de>
 
+$ref: thermal-sensor.yaml#
+
 properties:
   compatible:
     enum:
@@ -76,9 +78,8 @@ required:
   - clocks
   - clock-names
   - resets
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
