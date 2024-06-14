Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EF6BC2BA12
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Jun 2024 09:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hcfXGbuXa7ziHwVYii86dqZNnpf4tGFHgjpEo8Vsz+c=; b=iqvLYPwDQuMltc
	OabU9xQD4/OwCYfXjv36irG8FVCwe++2xHafcTYos8trDtrNENBuAyIkfaxJPT257RV8rP7jl12jd
	HarBTUrK1J7mCRtXBw0Rc4GXX7vaY+XdQ3VPmpSCHkWQ3pCG62MIpMK8sOIOimCyD+Bhhq34RiFzD
	5z6fCegAz7l9w6Mmc46SzDBXa1P4QHIpgL4Ccj4XG5Yurv3lDrzKQqbVccoybZ8QzhFbvPWbeeX0v
	Z6LTuUDhErw6z25Uv2JBxHdlwFdSP7RPBxpcYC75tviYXkQdHnWzIBGNveyf/5Kwtf8fk3jF43t9A
	XHHmtlr9kHKeiSCe0jlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI3XS-00000002GG7-1COk;
	Fri, 14 Jun 2024 09:48:06 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI3WI-00000002FHK-0i8u
	for linux-amlogic@lists.infradead.org;
	Fri, 14 Jun 2024 09:47:00 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-a6f177b78dcso266179066b.1
        for <linux-amlogic@lists.infradead.org>; Fri, 14 Jun 2024 02:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718358412; x=1718963212; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gVGhPsD6Qfn4mBoK6MEbCiA4reC20IqmZAzrPH10YVc=;
        b=rUL5yVHsXa4eTPE1QVKy5j+ZZJYGmaOpZwzp+X5pBp0nCq5g9GwfMoOJMIdImCjiDN
         5uZdf0j+mq5IkSa1ysIaocpRqSU7qgtaKUyDv1QH2gL5laf9LrDjYiMha49GkvY2TQvl
         mH9Ktgin/dYIR6RKAEsNAaEijZpEXjYq/rcVtSbEieC9g6Bqa78y4tHuwrWr1oqkOPwl
         SR1zwOgBGt5JyOroi7uiKkAYZ9RyMc1wRWDwcJnp8TPwN1utapwnMi5QQy8+CsGA5wCc
         28PSws937jAzF+bK5/pSRJppD6GdvkY4uttYNdG9TeVpgtjM+SI5Gi9RsJwE7EnBorpz
         OXSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718358412; x=1718963212;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gVGhPsD6Qfn4mBoK6MEbCiA4reC20IqmZAzrPH10YVc=;
        b=m8aAbFBKMLIocjfHGZ02qsIyfG7AKlwAI0NyGyzPX9b0CLgxRX8ybrcB1FfZqfab0I
         oe+MluD38kHGbX1kSSJKiBFX3NXZwOnVtqgRzwXt55Qq7VKvkWV9VxG5lTYPie0F5BZH
         vMnYugL9J0n48xLLs1OvUurrJ4tziQ8dF9sHCDfQsCJzw66DZ+LmOX9wd+Ekjz3BJulR
         rMK0HbR37LEEWePdalzJD4lsDX258QahI+CMQ0DoLg6XJX2bVJ+uH/9G3KvsoKwXC02h
         RNX20XFi31rdexxTIBbvkTWBGfmu+eELQggnBCvc7uGXVcxUhvnr3BhxzuaAb+Zt3Pop
         plyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwvcVOIhLnbCZKpNUqFwalmfKka4AJq4G0mQbKftRgwadBvdKmTsM3agdWK6YNj3NxEEMM5WDLMC+W0yjbsEfpryWfqUKUxxWOzsjdJ8Mh1Bs=
X-Gm-Message-State: AOJu0Ywl+TfqAwEnva/a61N/ZatEtAtCx7zghvPmVltvcfh2mdWERU+6
	dBzX719D5ymuArEIKLLV4PaNllXXnWpJqGLcwojLZNwqYQb49HzlH86NloTUDzc=
X-Google-Smtp-Source: AGHT+IH/LDguxtaznqvBqHTXoDXKR1YtqV8s6Uw3ZXJ5iaYlCO/PXU8Q0KzXgYZ1uinkHqB6v8mPPA==
X-Received: by 2002:a17:906:d296:b0:a6f:5c1a:c9a6 with SMTP id a640c23a62f3a-a6f60dc1fb3mr131861666b.62.1718358412444;
        Fri, 14 Jun 2024 02:46:52 -0700 (PDT)
Received: from [127.0.1.1] ([78.10.206.163])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56f9c84csm164966366b.222.2024.06.14.02.46.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 02:46:51 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 14 Jun 2024 11:46:08 +0200
Subject: [PATCH 09/22] dt-bindings: thermal: qcom-spmi-adc-tm-hc: reference
 thermal-sensor schema
MIME-Version: 1.0
Message-Id: <20240614-dt-bindings-thermal-allof-v1-9-30b25a6ae24e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1468;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=nByrzHQVmba7wlYPh/i+rKZ2wbIt+maV5ijzXe+5jvY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmbBFnx2UWSDHo+/XWma/SEORKk1DYqhfHrmfFB
 s92YeqphpmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZmwRZwAKCRDBN2bmhouD
 13HND/9ckrgPCXja3KiiMLzGorRecAp62uvkPQ6LsfsLVuRIxVjiHoY1BBKonPU6hWZAEq+Tt+X
 4jtQa/8unqFtVgfvCYPZaHXEGXZ6DLLuDD2uIuyvOuY7lH3Hw8UEq7f2ZSlkwvB/lQ6d0bPO6np
 RpXfva25J2qsdGmYRZAkcTYKzoDH1Xck9wgAC4vJjjsJodAfNuvSUhi+exREatcraSypvxBRRnM
 FDSlZQlQD+DHl39m+hwOw9I4KMUBErZu+LPP23ycIiZKZVIk4MUwW76pHHW1OyrPcgWWQsGKpDV
 7fAk76yOzQzGcT+87ZIEwo91EqkfmHob1lIFftcZXg4MbGupo+WohmuGnEmBF8zM7XFBR6CzfrE
 kHhxFb1fjy3y91+BRv61A7RIeUUSEIxGqoKHwZsgd3/nuaNszYOuEkLaCZqz38Gq9Ze2Tk03Fxg
 c/6myrMsDjdieOWmmWuAa4uE0kPzlp2s1Io22FVNjayBkBtFXx6LBSbavJAKQe8Cwn8bUzp++xM
 r5s66EvGxCCmACdoC0MnSf8ZSnXZ5N4QNP9AHBCpDEWs8ZyanwkYGJdbzcZ7T8hv39/azotgYH0
 gHWysyp8Iyi/dtlOwbsGyUtktWZHejwFVbnMm4lATDSFN/g6C7e+YKS//Rk3UWh6QHjk9w1Jlqo
 zXfuMK1rXijC2oQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240614_024654_772503_53DB9FED 
X-CRM114-Status: GOOD (  10.48  )
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
 .../devicetree/bindings/thermal/qcom-spmi-adc-tm-hc.yaml          | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-spmi-adc-tm-hc.yaml b/Documentation/devicetree/bindings/thermal/qcom-spmi-adc-tm-hc.yaml
index 7541e27704ca..bfad8130a042 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-spmi-adc-tm-hc.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-spmi-adc-tm-hc.yaml
@@ -8,6 +8,8 @@ title: Qualcomm's SPMI PMIC ADC HC Thermal Monitoring
 maintainers:
   - Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
 
+$ref: thermal-sensor.yaml#
+
 properties:
   compatible:
     const: qcom,spmi-adc-tm-hc
@@ -20,9 +22,6 @@ properties:
 
   "#thermal-sensor-cells":
     const: 1
-    description:
-      Number of cells required to uniquely identify the thermal sensors. Since
-      we have multiple sensors this is set to 1
 
   "#address-cells":
     const: 1
@@ -106,9 +105,8 @@ required:
   - interrupts
   - "#address-cells"
   - "#size-cells"
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
