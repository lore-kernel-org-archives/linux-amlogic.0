Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFDC1C61D97
	for <linux-amlogic@archiver.kernel.org>; Fri, 24 Nov 2023 08:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+EDxNkgShGyNCifUm0NVLcmCujLV4QMiwwPt3JF3crQ=; b=YYltFF9Yajfe5r
	Nj2lu7VVm/7tbG6hpRd4yOsIOdi8tLBFPvmwyEvOQEfSrN7ZQObxizj/SKsj/DgH2j7xU9tprrg8A
	RiORXCYJaBQ1fTT07WR0vtQvPQK5L0geFneVjIVwmBNBubOw4DZpViRRvSkdushO6LqMCeBf9r08G
	09dZeWM9jo/3q4q2DISVIgKNyDlWQfl2qhPtTRshVOC24SGwP9x1R128Xgh0HYKTtSIR7zCROboof
	LV18ZmXGMORDLOWmxjHjQSDBDypx/qwPybi7YAznAYpnuh9N2QuilXeLH0sLUxbqlPyNdcUiaHgWs
	vVUiRuJjw9a9+8sbhH8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6Rkn-006Xtb-3D;
	Fri, 24 Nov 2023 08:41:38 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6Rkg-006XlG-2f
	for linux-amlogic@lists.infradead.org;
	Fri, 24 Nov 2023 08:41:32 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4083dbc43cfso11234895e9.3
        for <linux-amlogic@lists.infradead.org>; Fri, 24 Nov 2023 00:41:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700815289; x=1701420089; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1vhZkFxLvuCZe0A7RVw31v//xJIvUsZb7i8/r2Jbnxg=;
        b=hkQ5yDKmHvyBvBRW+23t2OzV+zdkcpjqKJCWXPcmC1fGS4HlsDLhJX1rqFUmvK+Hvb
         bAh5hQtLu0F+VoomoOEF1wBWvqpOG1mSZ+55DAi5kxvWy2ljEp1pfuEiKOlR1j6t3lDq
         3GixSijUB7H52hCqGGxyUwHBqZc1REeEhkgafhuFJNn4MQi47nvWQ5JowKaJdz5rGpzz
         vzZte+ovWPLJJZ102kyGrf/F+JCd/p2fV8qAmzsF9WkNJmiOJJDylDlhTiehfzOuASdb
         Crx2gI2YsNMS4UUe3eQtkwkuNV/u/+JqVZRcumLyxpQByyRTvw97iekFMLNd2bhrwhHy
         ncAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700815289; x=1701420089;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1vhZkFxLvuCZe0A7RVw31v//xJIvUsZb7i8/r2Jbnxg=;
        b=xVAwBxbEnVQMqRzi+I6YKb4jedmVsTECGwYxvvxcbIHTR0n9IsGJIFS4k9Vdid5K+S
         8cZpbl4v1lgfpLe2mSfPjIZy5YBjaSYK7ygDKUKJKWWkHZe3qCweSLyX9NyblzBAYcgK
         0QqIfPePUwD2hwxV6eIEfOrVSeMM0Hg1HenMZ9vmAM7ubp0VNp1s8lf+/WJGairwa8rC
         Jod5ubZ7cjeRNTy437APsW58mNGa/0Q0tWtTCiHxivw4e8EfxvL/LOFdeYk7dZwX+DU6
         Ah1yrMqk1PqG8ilDzLUX9uOyevFt9vOEWT6ThsQdXIuT7SB3BzJFtT+Xyh12+49GqY9N
         M7fA==
X-Gm-Message-State: AOJu0Yx1oI9P1eH8mweRZXTeWSazzdbJs6yOPXnml/Y1TuN7T/RGrswr
	Ed5kCRUizomvObf+7erJrAd6Kw==
X-Google-Smtp-Source: AGHT+IGommKInNd3FR31Z3mvyaSG7pswa9iifJaF+pYGzjLLSWEIzKdNop4bPbWiyyiCahf+KYNE1A==
X-Received: by 2002:a05:6000:253:b0:332:d84e:7fc5 with SMTP id m19-20020a056000025300b00332d84e7fc5mr1129911wrz.53.1700815289535;
        Fri, 24 Nov 2023 00:41:29 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id c11-20020a5d4f0b000000b00332e67d6564sm2534562wru.67.2023.11.24.00.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 00:41:29 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 24 Nov 2023 09:41:15 +0100
Subject: [PATCH v9 04/12] dt-bindings: phy: amlogic,g12a-mipi-dphy-analog:
 drop unneeded reg property and example
MIME-Version: 1.0
Message-Id: <20231124-amlogic-v6-4-upstream-dsi-ccf-vim3-v9-4-95256ed139e6@linaro.org>
References: <20231124-amlogic-v6-4-upstream-dsi-ccf-vim3-v9-0-95256ed139e6@linaro.org>
In-Reply-To: <20231124-amlogic-v6-4-upstream-dsi-ccf-vim3-v9-0-95256ed139e6@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Nicolas Belin <nbelin@baylibre.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Remi Pommarel <repk@triplefau.lt>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 linux-phy@lists.infradead.org, Rob Herring <robh@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1642;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=oOPbXDBk3aIjcohZAd4QtWQn75Ng6fL6sZ33nsFIHDg=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlYGGvi+SK2D6szCKmhAOwxD/2QkmEkYDKCfLNt3LA
 z+A/wj2JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZWBhrwAKCRB33NvayMhJ0ePwEA
 CZkwqf2CNqmVAwhMX0mZ6T3o+S0SegeVMlwXXCEGDJEr4YPs+En7dabAcfzM+Cz06Vx9Zc/iok3MkR
 3l/Etm2uXi7mRQMPmkwioAgKInUhxH3cZikmdPzcDPpmofgII8wuYs7a6cYf5yTXw6pjEApR0HtiUK
 YdDcEJUhCQVntgWFS7k4cYOHvojsRtTeBtAkFN5Juedqh+/k0QT00muBYoiaDzpv0I9zKIFwAkQBaw
 +vjAo6H7OB7DxHTFN/rzL07P6VP0hKpn0A4wBml3xMm8pyzBrLTIeZrC/XNzMPnZMuEXc4xcLqcD0+
 yYfCnlrWlC5RdOY9r3O739eRSaT1sFV+CdPSYlZfmNytYz3scHVC7lvOFy2amjLYR8cIj44XpVl/gq
 nvCrQ0L+Np3xv3IAVNB+rgNWwA0Y6X+AdDc9WeR/N+tkIgVkRdOJbKwa+Tz5TQnyIlIn7H9+9kcxjr
 x9kHQzecSDOjxwkeDxnQoFYjq2zLIAtazMFXw18qKpIHytQKCVIwesOCK0vmh8UhcLPht/tvo5jygg
 6GmyPFvso6780JXtf4XZgJtV4iJD0kRG9ADaiFmlhjAj2c8tE9QBNiE5JBHZ9HwatytJficQUuOMYC
 fJV2oR4Qa4KbVzoK8OChR68Wmrx5JW1EE0Ye5nsmZzGraDCeBQaMd1wYGBkA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231124_004130_882213_00870D8F 
X-CRM114-Status: UNSURE (   7.61  )
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

The amlogic,g12a-mipi-dphy-analog is a feature of the simple-mfd
amlogic,meson-axg-hhi-sysctrl system control register zone which is an
intermixed registers zone, thus it's very hard to define clear ranges for
each SoC controlled features even if possible.

The amlogic,g12a-mipi-dphy-analog was wrongly documented as an independent
register range, which is not the reality, thus fix the bindings by dropping
the reg property now it's referred from amlogic,meson-gx-hhi-sysctrl.yaml
and documented as a subnode of amlogic,meson-axg-hhi-sysctrl.

Also drop the unnecessary example, the top level bindings example should
be enough.

Fixes: 76ab79f9726c ("dt-bindings: phy: add Amlogic G12A Analog MIPI D-PHY bindings")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../bindings/phy/amlogic,g12a-mipi-dphy-analog.yaml          | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/amlogic,g12a-mipi-dphy-analog.yaml b/Documentation/devicetree/bindings/phy/amlogic,g12a-mipi-dphy-analog.yaml
index c8c83acfb871..81c2654b7e57 100644
--- a/Documentation/devicetree/bindings/phy/amlogic,g12a-mipi-dphy-analog.yaml
+++ b/Documentation/devicetree/bindings/phy/amlogic,g12a-mipi-dphy-analog.yaml
@@ -16,20 +16,8 @@ properties:
   "#phy-cells":
     const: 0
 
-  reg:
-    maxItems: 1
-
 required:
   - compatible
-  - reg
   - "#phy-cells"
 
 additionalProperties: false
-
-examples:
-  - |
-    phy@0 {
-          compatible = "amlogic,g12a-mipi-dphy-analog";
-          reg = <0x0 0xc>;
-          #phy-cells = <0>;
-    };

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
