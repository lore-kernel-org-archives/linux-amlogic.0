Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86470C27C75
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Jun 2024 09:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VT8HrDNfbtmzAsdT70MdBYRO8WCZ3wl8Q+LOQ7eIf5g=; b=uIgn4wYJ7QbAzn
	grgfvcoiFeYn7X9eum+Q+iGnb1t3DkjTmFyoyUuMgFxEslKd+Ufd/QXvPzoxlnrGX7PioDGVtQpaH
	ZtDln3UZldM5IwIfzRB9nUZN25XLkkPz0f54sewZ5OTEEHLl7S/2EMd7BFApPjMkaqt+E68Xv366e
	3CXy+mLe+fZtDEH6Dd4LnynI6uVRdOvIW/O0YS2OIj9hOv525lfQ+ozTWdZjZ4bIzglefPbPRXleL
	lRGgmFFtIg+oBBGCsYOUTifxQIu6nOjzmm8v6ji8NhxS5WQYlxoTChO3UD5eER+/ly8ysqj/cX8Au
	C5C9HIKbLMI8TuF6tLTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI3Yj-00000002HCn-0Ww6;
	Fri, 14 Jun 2024 09:49:25 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI3Wk-00000002FiG-3q2j
	for linux-amlogic@lists.infradead.org;
	Fri, 14 Jun 2024 09:47:27 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-57cc1c00ba6so527668a12.1
        for <linux-amlogic@lists.infradead.org>; Fri, 14 Jun 2024 02:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718358441; x=1718963241; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uodfs//bjqrAe2qZ9kd84WsjVyMmGfcvrKfsL+16kuU=;
        b=Vkkoooc+8XwWLvqnM8XfVPczD6vT8pMFYYUyCE/AWYAyArwCOXKjgcOXkc4fWB0GT4
         /vADmEQV6rPcbW50tEyA/8/Ymf0TSfFwPP6tOhM9Cg4VRqrJPdsK/AMErU+UgFd0Dqp6
         Ud2882E/W7gCvIW+KSCtMsLobf3QfpG0hGH/s30IeXsBJjMNLtWOEUw/8widvxiH/76I
         2BLckogInLU6DaUugAsfht0QKwlcsHvWFC6VjO2c1JNScV5pGWIzIUKtERuNg7c3lNsU
         8WmDbSzXNLWR7baW/DC/43GVyjLZyt5/T4Ot5CkrBYKPz75CQMCVpHt47q++liA95tpx
         yxWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718358441; x=1718963241;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uodfs//bjqrAe2qZ9kd84WsjVyMmGfcvrKfsL+16kuU=;
        b=wEIf4K0wYuqGakffyBxnBq/fv7H6bOyFTAPC19neE+mu+wZMcwhDTROtHIf+wNhHGe
         lvjm+iykUa/AX39Inc1cBTWRmdkeN1kcQnGZlawI5TvPI0lBlfC7tOKUAh2n+xKziqv/
         Bb181WGD7HcUleHtS/dp+gtklpZpOHPxNbEgiksYsTJeziT4+cp0FIQTAYky8hdilxi6
         u6hGN+eTnRGNuBd9lmeJLLwHe+OiOAYAfQqwUHTWP8sTGwUdjCz70ZCT6+y8egNrzELB
         kfnKDoO73oe+m6atgv6psPF2QCN0WfV02E/q1/jY0ykzFzP7VxEe5rGETE78cuY4CmrH
         jWPQ==
X-Forwarded-Encrypted: i=1; AJvYcCULeLHVI/x1cNbskdPxk8OKz3UMgNI43rSYVD74JWC8LyTo7Z8rBy/VUHE9Zlwwk/bhLEg8jsk/kyG81frzySVnu+jqmK1BZS3THDVwJ6AhXxk=
X-Gm-Message-State: AOJu0YzpP6rLaMH8IjCeLR3Kun89OOLeQgdz6A7ieGxo1Vg++JKoO0M8
	hi3d8oTDN8twK/XtHXUg/U/vZhzI9sEomil/A/uB5fsHUUdbHVrkFGXlr+kWmcM=
X-Google-Smtp-Source: AGHT+IFLXVZv5XBW+iKZMorDGOlMRZlD+plTHxN5ZcGaV4oaBUeSx4OwwCAW6apvsQZglLUiZLZZUA==
X-Received: by 2002:a17:906:4c58:b0:a68:b49e:4745 with SMTP id a640c23a62f3a-a6f60de6279mr130459866b.70.1718358440945;
        Fri, 14 Jun 2024 02:47:20 -0700 (PDT)
Received: from [127.0.1.1] ([78.10.206.163])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56f9c84csm164966366b.222.2024.06.14.02.47.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 02:47:20 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 14 Jun 2024 11:46:20 +0200
Subject: [PATCH 21/22] dt-bindings: thermal: simplify few bindings
MIME-Version: 1.0
Message-Id: <20240614-dt-bindings-thermal-allof-v1-21-30b25a6ae24e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4876;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=cnRkmLQXvImOJ6clYhAxknZOfk4WOGw9WYVxljgJNd0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmbBFyeLfiWLO3TcJQWHtxyb2jlsrVArsQc5HSM
 Zl8d/bpA9uJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZmwRcgAKCRDBN2bmhouD
 14q/D/wPchU0i1VJXyIyken/BpDy3CFIoxfe1Lx6ww08lDDBl6vxpB0QaflHSCvUb6oJhYLx5XC
 KQWlbHOynfTXswZGltb7vmbxKtQZKkAuceB/+6DHHkHVvJSfygqXTpFwbERstRbVdvrkm0AAxn6
 c6feUiuenfE5zkU/hdbvkKiJcodB6VehCGu6gcWyxCi66DbLYb2tZeACluumArIm7xZqfogg9CZ
 NAg8xL6WQwY+D0V4zDLageaphLcGdZNLe6M704GpS8vvp3MATTujqASLJDPu3+g5syhZR9Th/+4
 ioQj88CRX4dOOOTFbMLjaHgPb9zbFwilrfsCSQFnjKZk3PoB1IPqoIiPE2hYrbONHxgOIRJfnY0
 oYZ3dksGJEjv6eGF5a3+bWnW9RuFzW3l8M7VY6ZDfUQ1eRLSu8ZR2fCN455j6SSC3M/VioNDPi1
 /NqNoR6pA2KvS5eSU5z/weJ1XMQk7n2xgL2nsrA38ni1ljmOC5Q2oS/jZIzbpHE3Tv6Ud1/DMHv
 XEJ4O/YuwHiNNigQ8l5CgZCER+b0tvL4jTWX2XrLXP7uN4zbEBz+fBrrtWY/5sCM++WwlYKpz09
 VUQcTb1inEie1Ek8CxxovMd9HIe2vrwVJr8D4KDpvt2NCCwln+qHv5tRXUiDeHOwyyVMEf/34tB
 BEM3vs6dT6iX0RQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240614_024723_465950_E57B16E9 
X-CRM114-Status: UNSURE (   9.51  )
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

Simplify few bindings which already reference thermal-sensor.yaml schema
by dropping unneeded requiring of '#thermal-sensor-cells' and dropping
assigned-clocks properties (core schema allows it if 'clocks' are
there).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/thermal/brcm,avs-tmon.yaml          | 1 -
 Documentation/devicetree/bindings/thermal/brcm,bcm2835-thermal.yaml   | 1 -
 Documentation/devicetree/bindings/thermal/fsl,scu-thermal.yaml        | 1 -
 Documentation/devicetree/bindings/thermal/loongson,ls2k-thermal.yaml  | 1 -
 Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml  | 1 -
 .../devicetree/bindings/thermal/nvidia,tegra124-soctherm.yaml         | 1 -
 Documentation/devicetree/bindings/thermal/nvidia,tegra30-tsensor.yaml | 4 ----
 Documentation/devicetree/bindings/thermal/qcom,spmi-temp-alarm.yaml   | 1 -
 8 files changed, 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/brcm,avs-tmon.yaml b/Documentation/devicetree/bindings/thermal/brcm,avs-tmon.yaml
index 267a0f423504..32730211e15b 100644
--- a/Documentation/devicetree/bindings/thermal/brcm,avs-tmon.yaml
+++ b/Documentation/devicetree/bindings/thermal/brcm,avs-tmon.yaml
@@ -42,7 +42,6 @@ additionalProperties: false
 required:
   - compatible
   - reg
-  - "#thermal-sensor-cells"
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/thermal/brcm,bcm2835-thermal.yaml b/Documentation/devicetree/bindings/thermal/brcm,bcm2835-thermal.yaml
index 2b6026d9fbcf..ddf0f20e5285 100644
--- a/Documentation/devicetree/bindings/thermal/brcm,bcm2835-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/brcm,bcm2835-thermal.yaml
@@ -34,7 +34,6 @@ required:
   - compatible
   - reg
   - clocks
-  - '#thermal-sensor-cells'
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/thermal/fsl,scu-thermal.yaml b/Documentation/devicetree/bindings/thermal/fsl,scu-thermal.yaml
index e02d04d4f71e..ceef318668bf 100644
--- a/Documentation/devicetree/bindings/thermal/fsl,scu-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/fsl,scu-thermal.yaml
@@ -28,7 +28,6 @@ properties:
 
 required:
   - compatible
-  - '#thermal-sensor-cells'
 
 additionalProperties: false
 
diff --git a/Documentation/devicetree/bindings/thermal/loongson,ls2k-thermal.yaml b/Documentation/devicetree/bindings/thermal/loongson,ls2k-thermal.yaml
index ca81c8afba79..79e691b08341 100644
--- a/Documentation/devicetree/bindings/thermal/loongson,ls2k-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/loongson,ls2k-thermal.yaml
@@ -38,7 +38,6 @@ required:
   - compatible
   - reg
   - interrupts
-  - '#thermal-sensor-cells'
 
 if:
   properties:
diff --git a/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml b/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
index 331cf4e662e3..0259cd3ce9c5 100644
--- a/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
@@ -99,7 +99,6 @@ required:
   - resets
   - nvmem-cells
   - nvmem-cell-names
-  - "#thermal-sensor-cells"
 
 additionalProperties: false
 
diff --git a/Documentation/devicetree/bindings/thermal/nvidia,tegra124-soctherm.yaml b/Documentation/devicetree/bindings/thermal/nvidia,tegra124-soctherm.yaml
index b0237d236021..19bb1f324183 100644
--- a/Documentation/devicetree/bindings/thermal/nvidia,tegra124-soctherm.yaml
+++ b/Documentation/devicetree/bindings/thermal/nvidia,tegra124-soctherm.yaml
@@ -197,7 +197,6 @@ required:
   - clock-names
   - resets
   - reset-names
-  - "#thermal-sensor-cells"
 
 allOf:
   - $ref: thermal-sensor.yaml
diff --git a/Documentation/devicetree/bindings/thermal/nvidia,tegra30-tsensor.yaml b/Documentation/devicetree/bindings/thermal/nvidia,tegra30-tsensor.yaml
index 972d608ddf95..63a29a1f7fe6 100644
--- a/Documentation/devicetree/bindings/thermal/nvidia,tegra30-tsensor.yaml
+++ b/Documentation/devicetree/bindings/thermal/nvidia,tegra30-tsensor.yaml
@@ -48,10 +48,6 @@ properties:
   "#thermal-sensor-cells":
     const: 1
 
-  assigned-clock-parents: true
-  assigned-clock-rates: true
-  assigned-clocks: true
-
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/thermal/qcom,spmi-temp-alarm.yaml b/Documentation/devicetree/bindings/thermal/qcom,spmi-temp-alarm.yaml
index 5f08b6e59b8a..30b22151aa82 100644
--- a/Documentation/devicetree/bindings/thermal/qcom,spmi-temp-alarm.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom,spmi-temp-alarm.yaml
@@ -42,7 +42,6 @@ required:
   - compatible
   - reg
   - interrupts
-  - '#thermal-sensor-cells'
 
 additionalProperties: false
 

-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
