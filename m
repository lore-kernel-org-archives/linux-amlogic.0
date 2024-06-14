Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9589FC27C6E
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Jun 2024 09:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rs9md7xUf8nIyFCZKpNJjPM5BUpbRyXoVyLav5DibQQ=; b=lTetoBT7+Md3Y1
	DUev8YzUzuHGsRB34ZxrmEOv8z8FVv53Bb+UTaOMwdsxliIRml+2ALUPGI8rulP+mm4ZhSzj8WMz3
	d0VEvIZfQHuswvebrF9FzpwgMwlyIb1oAu5gLODU5PmkJ/6aeGa0eJgPM1A4QR9oGQxYVA0gIpWN2
	rjlaMyl5FckIPAVAtXsxf7pR5t5tyBZ4Npq9d1nyMTgemqiUosgpX2Ks6/Jjzr661pdZMU1yJFz0A
	YeDmhovFiiy5phO5Be+ruyybuH/uhOI3dXnQZD/s6ud5xVxQH0bYMlN2WcKkeo4o5jLMYk0O6Jt47
	sOZ/eozkQd+vMZgK33oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI3XC-00000002G4Z-1QW9;
	Fri, 14 Jun 2024 09:47:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI3WJ-00000002FIt-2rqu
	for linux-amlogic@bombadil.infradead.org;
	Fri, 14 Jun 2024 09:46:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=48jRV4Y+U5vH/naB0pf1Q5GHRMn8kZ6Tmm5P5ebQMO0=; b=ac49d8palIOpQxKV7WEajORUnj
	jiT+zu1/2xEib0+epCo49w1SIOaSGuUaOlhf6egr1wfmUOjw16OI32ryqAXs7NSJQdJnFfsvhWxfi
	At2j14wbCIRhVg3TKTLOZ3KL8eK0Ckzc84Z6kEQeEW97aYfZNoLoVhMdXGeYTv+3+g0nyKbunFNWC
	qGD/L4pauveiRgmmBdsllNq4TRBvHNnPVpWZRXb3ywDn1JzqTpjSh1Med7HbXimeIdWiwGYfeKCqx
	YAY2qIx+iU2mPfs9gbTSt00HBuXSTzJer4fKrm1HrUyelSGG7J8zilZcSr6zz/jzPBgCiKK+4hpmi
	+lx1VBNw==;
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI3WD-00000004F4k-1jMK
	for linux-amlogic@lists.infradead.org;
	Fri, 14 Jun 2024 09:46:53 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-a6f1c4800easo253546066b.3
        for <linux-amlogic@lists.infradead.org>; Fri, 14 Jun 2024 02:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718358405; x=1718963205; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=48jRV4Y+U5vH/naB0pf1Q5GHRMn8kZ6Tmm5P5ebQMO0=;
        b=yssuqOU83j9kchR0g3rJvBlPCsSI06ngudTkVJvq+h+flikvfdE2gampqTu8sbq03I
         DmfFAa03UwDKdtg6kqujZuRdsmmVu0LSzrF5sU8Uf7vruvaYM4ATqoQMUMEeiU9RZFqd
         gNQoQwG6nzH2Syd2VU8ZEj96rFlboXQhnSZyMr5Beh8HJASco4YoufLapmSR1lyfAI6c
         0xcfqkz18F/3NyzdAMdtGpRixK/rSRQtQ/sbvMM/LJMTAUiqk8COccEtOy1IZcxFLqIi
         lrYCe+Oyh/7GKTnIcEQZUGQ3JrqrtHVMDX1HI/JXQkiwNjh4wyLvacPWUGAh5WjLlEba
         pbZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718358405; x=1718963205;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=48jRV4Y+U5vH/naB0pf1Q5GHRMn8kZ6Tmm5P5ebQMO0=;
        b=GACGwkwKBnlelLg0LW3E4ml7q9MCIKNZkfNqscTJl7AVLoN7rNPjeOo0BdayjMkoaZ
         BGriwdKxpulMx0pjyirwmghK23LsK8kCkKcEbpGnWVcpTTgR/BXcDeMGCHOo2kacSIWL
         E1RQ8yT42MPXnkZUzrSVIvdWjWeb/TrDGbOjsV1dn1FVESFEraWSNsusa7aRFxyOyR4A
         hx3+4ja1+8kAmKddJ1RDE/7VsHcirKwdthCxpMcCCuwgmKiQ52fIT+72bvk23H6pdbMf
         T5rabMqov40dS5AkSdy6X7XDm2pGQgG5iuHvRlvcbPh0nww8g35CE8lly7l5riR7Lvm+
         By6g==
X-Forwarded-Encrypted: i=1; AJvYcCXLDYpLKKaqmCE4SvXhPPBZ0XikfgShkpBqgyQUAA/PAejHZvD/3mfSecXCxLOiao4aOnMlvFOZN5qsl4rHQOoGVHmxAFLWzWldBDJjcS4ITiI=
X-Gm-Message-State: AOJu0YwV1Ro2Y/0GMU3hvD+mVb0muyLpXXXOmR+zZjC/+XiNBLSc5gSf
	o8TAoxC6ZT8szKqk0ubVrH0mTUpgV0b+xZfIEAhz76lk/68BjalsxpQIxBAXucc=
X-Google-Smtp-Source: AGHT+IHlYvfZnRQiJVv8ztAIy5FtuFGGY28pk8Ex9meikXiQo2nuK+J7KYvFbJtI8301IPK0vUIPpA==
X-Received: by 2002:a17:906:a09:b0:a6f:5f75:2096 with SMTP id a640c23a62f3a-a6f60d461f6mr140579766b.41.1718358405253;
        Fri, 14 Jun 2024 02:46:45 -0700 (PDT)
Received: from [127.0.1.1] ([78.10.206.163])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56f9c84csm164966366b.222.2024.06.14.02.46.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 02:46:44 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 14 Jun 2024 11:46:05 +0200
Subject: [PATCH 06/22] dt-bindings: thermal: imx8mm: reference
 thermal-sensor schema
MIME-Version: 1.0
Message-Id: <20240614-dt-bindings-thermal-allof-v1-6-30b25a6ae24e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1110;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=1QXEmZd+cFRuZ9pAA4Z0kWtLyHTijEgWCuJOa9SDRmU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmbBFlbbbrZbxDOrrFndHK7KrXUzJDw1D1Nw6AE
 6S3xdbshASJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZmwRZQAKCRDBN2bmhouD
 1+kFD/sGnvHOKrY+EhoCdoHu7iJLZC1M4sL9G6Yao9AC291vehS0a6iUOXKVgc0S7wTHdl2lCaV
 naDrLzfUXUetvHgv8FAhwUuXZX/C6jfC+VQuscZd3QgI9zJEWpPLlQVarLBRtvdZr1RvWKNUroC
 /R7/V3ndnLQS8wB+8XMj9ZGqWhXr5DjruMYMSrId1NeB/H/FHtCvMhUf1E2AceQ26NP/0Q7Nllm
 Q4s7N6oYkjyt+IZD9tkEODXQbliQk88dgc+dABH7rt5skMz186ou1uHERYerQZ7ZtajckM51A5D
 5zHR3EPZ6YBYyVo0md7YUD44+pWha8sx2fehN4w6yuMskcY8IOgkUyRR15h8UwGr5nix/Hmt9hl
 XW0pbFwgHTBppYNLodhiMPqpvvb5VjbIkSooty39pHu95j/vDGJ24JAP2nlwLfGhVXbDt13R24w
 imF2g2583XIAxUy2phI0JjSeYlOpbshrQZ6uQ93uJ9bD2AcJg+p8d6J+adWZV2YZJ8GntdBvAKW
 hd5aJ866j10e91MXXzh7Dcs5InXghT6WDBL5Q/gGDGafMAwRBQl20gIeBfDFzwqIPEk5G4fw3HB
 wvFZizoZTq5aXdChJYJk87xzmMo46BsqQ/9j4F0TNsY5WZg1BONp4xZPzytaP9vvpO/7gOStZBx
 nQSxk/Wn+Tzd5Ng==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240614_104650_260915_FEECFB36 
X-CRM114-Status: GOOD (  10.31  )
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
 Documentation/devicetree/bindings/thermal/imx8mm-thermal.yaml | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/imx8mm-thermal.yaml b/Documentation/devicetree/bindings/thermal/imx8mm-thermal.yaml
index d2c1e4573c32..e7ddaa6c966e 100644
--- a/Documentation/devicetree/bindings/thermal/imx8mm-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/imx8mm-thermal.yaml
@@ -16,6 +16,8 @@ description: |
   for i.MX8MM which has ONLY 1 sensor, v2 is for i.MX8MP which has
   2 sensors.
 
+$ref: thermal-sensor.yaml#
+
 properties:
   compatible:
     oneOf:
@@ -51,9 +53,8 @@ required:
   - compatible
   - reg
   - clocks
-  - '#thermal-sensor-cells'
 
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
