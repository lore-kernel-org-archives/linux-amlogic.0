Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56BB3C04E83
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Nov 2023 09:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=seFXsLCdABqtHHXT0OZyUXPQjjvYHv0wixS7TsLRRPQ=; b=LQE5ySaHnnO54w
	aaUSVDX9imTlhvl7feqwHhPpxWcofmg4j8qeZ9Eo0g+qqemIi2ykrGDLtwwrcoGZ//i+rRUdlz6MU
	Ghnob9f11Q9TxbryDyj0od94q1UK8N/BzHM/7n5mLTbBb8idCpXc4sPGkBrF4udc1M6PxtqZ/ia87
	t53bNB9CxJGmdqM1hbT4hg+guYza6XhXtJdP8LQb9qIogJU8IiYYWXUq28lwcTBBDRvE3pYijBxBI
	8GBrKKJb5rjwRTtqalk3S/NUeS1+sprgrcixxl0DH3l3fU1WNsVFYcnmOQWc7IVnVNP1uoc6m/ep6
	l60hhfe80LRWRMOsh2yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r10ts-005grd-0p;
	Thu, 09 Nov 2023 09:00:32 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r10tg-005gdp-1J
	for linux-amlogic@lists.infradead.org;
	Thu, 09 Nov 2023 09:00:24 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-40907b82ab9so10231145e9.1
        for <linux-amlogic@lists.infradead.org>; Thu, 09 Nov 2023 01:00:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699520416; x=1700125216; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ITFrBsMzRnXjAnS6fzAeCUU7VFisCXzwG4lcariYq7Y=;
        b=XmqCEKmX7bnIOYhAsqPI0drpw913aU7cUggyr3iTH78p3vAwRtnGR2x6kKRBngMjWq
         UUXLRG+NfTgBIqi7PEq8xlAfRJ1WFSxifbSCciDbEtTMKTyhaMp/u4aXB9Rd7aB/WgLo
         QDz5Pw8s/pFm5HiMKfPyeJyrU2kEMT4eSFpc8Ro4t6KVFy7jmhOMykzUwLDxLSDfxb6L
         MCLc0qRleXDEa13e/DQTwr5kOtWNfEfuQKOXOxhTHpUaq6g7lWtLgxWwzawhxnF/SnaD
         jok10uWzIdyXBJuxRgj4JRRzuDl5W+STRgHTC9I7MLsShRZ6bjGlcIk3/wyNMj/J0kQn
         WM6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699520416; x=1700125216;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ITFrBsMzRnXjAnS6fzAeCUU7VFisCXzwG4lcariYq7Y=;
        b=CzKLsUJsrXrhwmw6St4bMNMXtSPVw/8/NrEyCbM/Cdq3xhHRHg4xzHnVyttrbwVoJ3
         q4Vw4831jgl/qQKxGkBaQpzSCBsoNfqgAqsE9krEze5Rpdz7HmO6tSPcUUEq/p7ruXRZ
         bVcgHUsox8+mRIGtsoxyvkQIuBHPcRS9xfGhXI4euGpCCBlL0K/ld4DojX2gEUuOg9Z2
         C5OfEnd7MrFeup92H6t5w5sR52cr02Om8/5j3fIoGYbqnMi79MZpZEiaMCTvmq1SJdpP
         848sSKF8tauexTd8KuABVLna9Ckj5Hr4Z5if2uupm0iGTojywhQX8Qi0CoZTunBLe6vZ
         n9XA==
X-Gm-Message-State: AOJu0YzSPVEP7en2upk6L9+zIqYkqMSepppEkjB5T40DJUG9JdsekPSA
	jaIaxcQaIOQqXH2Knj1zWH1PTQ==
X-Google-Smtp-Source: AGHT+IHjO+bTUUKrJCY9qJI6PbshUNq9k86eOeJoeaw8Z2cXsPrb59IOUhiYM5nWZGSaAIA4THxi5Q==
X-Received: by 2002:a05:600c:3548:b0:402:ea8c:ea57 with SMTP id i8-20020a05600c354800b00402ea8cea57mr5581601wmq.7.1699520416613;
        Thu, 09 Nov 2023 01:00:16 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ay36-20020a05600c1e2400b0040472ad9a3dsm1428484wmb.14.2023.11.09.01.00.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 01:00:16 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 09 Nov 2023 10:00:04 +0100
Subject: [PATCH v8 03/12] dt-bindings: phy:
 amlogic,meson-axg-mipi-pcie-analog: drop text about parent syscon and drop
 example
MIME-Version: 1.0
Message-Id: <20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-3-81e4aeeda193@linaro.org>
References: <20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-0-81e4aeeda193@linaro.org>
In-Reply-To: <20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-0-81e4aeeda193@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Nicolas Belin <nbelin@baylibre.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1520;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=uz/zvzsSZxXVZUEtWgeIKFxNonTPWkXwn8B0J99UAIs=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlTJ+WXcjvLMOnn8fmBl3USzfGqu93t/BCoKbOlBPn
 Hv552+qJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZUyflgAKCRB33NvayMhJ0ee7EA
 DB8SNulWBCaChemsw6runu8nf4gmvFIJZoGuRwt/vHyNwD1V0VTJBsWBMA5V5Gh/nfb+7oaE30EMuI
 3q1gYVfp9ISlsFbqq3OWfgvUlITVjBC8kqfrJ0+ZWN7Rhyptjba41o7IckERz1gzsgU/cB2ASy4fuq
 +ysDaWLeNJR2G+ZwZOeetPzp6tnRDdSdMbSyOtKS0mMl93VLzFb226XvQ14IK/zcGuPVb1YY6sJqi5
 Gilhooh1Q4Epynfu7v3gJ7YfgQt3SCfaoHllwFtsfP2Owe6A6Iasj+l7cB/CMIACS4jSZacvc1aJsK
 4EGeLSO6ZnZ9mpbw5FCwspuBh4Mug/Wtu5oxqbTB4BqA6jwfrQzrLc/70MauDw0sSVa0EMnv/UmlGl
 SdHPs88PTWV4GBtPdRKUSDJNQkqDc/EyGJ1xhK9DF1bnDnaQeAqHkLuUCVo80qwp5Cx7GZ00w62j51
 UwAOncWLeCYvpkOKKeoGj17j9/hLce6m9f6l6RRM6FIb9GC7c5Sg8/xpLY3UBafFD6djO8MXccAUCT
 rqpF5Rj2zS7K6acr7tA/a8CXlSfD/Md+tw6hO5qEG1vbArWfnUgv8NdVyMghEcXawh80TH4+gSCPmC
 QAr0ywKT2RjfuzCynjsFZutbI2JAVasPMsnmHJoNl+baRtCw7d9dbdGz70iA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_010020_444459_B443BC91 
X-CRM114-Status: UNSURE (   8.97  )
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

Since this bindings is referred from amlogic,meson-gx-hhi-sysctrl.yaml, drop the now
useless description about the parent node and also drop the unnecessary example.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../phy/amlogic,meson-axg-mipi-pcie-analog.yaml         | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/amlogic,meson-axg-mipi-pcie-analog.yaml b/Documentation/devicetree/bindings/phy/amlogic,meson-axg-mipi-pcie-analog.yaml
index 009a39808318..70def36e5688 100644
--- a/Documentation/devicetree/bindings/phy/amlogic,meson-axg-mipi-pcie-analog.yaml
+++ b/Documentation/devicetree/bindings/phy/amlogic,meson-axg-mipi-pcie-analog.yaml
@@ -9,16 +9,6 @@ title: Amlogic AXG shared MIPI/PCIE analog PHY
 maintainers:
   - Remi Pommarel <repk@triplefau.lt>
 
-description: |+
-  The Everything-Else Power Domains node should be the child of a syscon
-  node with the required property:
-
-  - compatible: Should be the following:
-                "amlogic,meson-gx-hhi-sysctrl", "simple-mfd", "syscon"
-
-  Refer to the bindings described in
-  Documentation/devicetree/bindings/mfd/syscon.yaml
-
 properties:
   compatible:
     const: amlogic,axg-mipi-pcie-analog-phy
@@ -31,10 +21,3 @@ required:
   - "#phy-cells"
 
 additionalProperties: false
-
-examples:
-  - |
-    mpphy: phy {
-          compatible = "amlogic,axg-mipi-pcie-analog-phy";
-          #phy-cells = <0>;
-    };

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
