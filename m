Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA906C0018C
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Nov 2023 09:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nafrmv4Nj4Zv7jKZFlNoLk5GsfYYLGS1r86J+yThce4=; b=bzzpexxDLNx/r6
	T87kpFfLyTOgch4ANbqHJmfEJztq9BvaC65smU0Izc2iPz1OVCok14gUAZo+c9Erl4cd9tYyc9InH
	PMuQOoktm/y15tQJ9O976vEN4L4Kf4dfwOQp46zi4xULBDkojr80PoOxFTpbWx/ShuJQQ4uOtba3M
	yb+VajpTUkYBJRiPGhmcR+JXXfIi/zwqofVS0n/GfkFqOig0OE+tnVKRGddux7iDrNamnvuQiNfUE
	2Mj27PhOqc1kczGKuEdNMdf3nH20srLoD+gjvKnY7uZ7jwJH3JnqpQ1uU+UZGTHLb6hS3cJkzQtUk
	gwOxNcnOVGM5RBw16DTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r10tt-005gso-2f;
	Thu, 09 Nov 2023 09:00:33 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r10th-005ge7-1G
	for linux-amlogic@lists.infradead.org;
	Thu, 09 Nov 2023 09:00:25 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-40842752c6eso4095485e9.1
        for <linux-amlogic@lists.infradead.org>; Thu, 09 Nov 2023 01:00:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699520418; x=1700125218; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JrO2KXQhu+sFkGuvNniLZEdI1TmrpVNM0kvtI/PbIVE=;
        b=UbbkggZmDcsXb6qgOYvM+JK5UE4cKCONIVof6qneoPq9ttB6/atpklsVvogTe9l2Da
         tytEWvcBluqJOcd+dzTqp2nAohGSeqiuD/UVtdmpHVBCTS0SIUwbikzBS1aN7+WB/iTX
         Cg290U8a7Ah7TR0Re32/HinTHzNLDzWPlLZVfcKX3cPW40E3RK4JfJ6FUFNPRsW03fWt
         TvNWlsuQV0qnKFL8CWWVTkv0UFwCmzuo8VFaivMVgLQXt0lRQW19eqSvp+GxnpHJnAjv
         hVjmAGL9rKZ83fN+l0vVb0RgLvUjruQsnbUMmvlEPrNw/MPlLjESy/kHkMzzQD/te/vj
         XXcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699520418; x=1700125218;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JrO2KXQhu+sFkGuvNniLZEdI1TmrpVNM0kvtI/PbIVE=;
        b=sZvfNm+oCwpg5l0sgwsE/goMM5rEX6I1Tre4yo/hD4SKhxbexfz+mhh9ij32CAIe1h
         b3tPjoozrd+aBJsfQC+Fq0Xy2dJo3Ioi4Di7gnpQ+SYS53SnyFgBZDdXYHtsqYb3CZ5P
         7ZFRYyzjuZCPcoGFsNV0oRBzbOu8HVPaMbGD/8A/v6eSJNLegY1LjqWFjy7WPy985D40
         v0h7/IpoXEf7Ubda0UIBU/Vw0NyVOJhmGPYoy889DaXffwnW45snudGs7wlnAc97Qhlh
         6sYmfTbzm31HBXyXm3bXBQXkn8e0BjFsWx4ebz9sJD2s1bkl4CH7OsDh8fG9dpKdhm1n
         +EZQ==
X-Gm-Message-State: AOJu0YyMMRhBnU38qYm0zBbXK7aqv41wNSqwEx44YZhCoYbVEkxX9Zcc
	EvhjuEHbeI0u+cIxHXPrS+pTWA==
X-Google-Smtp-Source: AGHT+IExaL1sx8nDn+rJD854g00atvCrBi89tjscYYozw6EEibCZul8Cp/47U7ttMGU8Qu5+Bh9FLQ==
X-Received: by 2002:a05:600c:4753:b0:409:7d0:d20b with SMTP id w19-20020a05600c475300b0040907d0d20bmr3758579wmo.24.1699520417969;
        Thu, 09 Nov 2023 01:00:17 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ay36-20020a05600c1e2400b0040472ad9a3dsm1428484wmb.14.2023.11.09.01.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 01:00:17 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 09 Nov 2023 10:00:05 +0100
Subject: [PATCH v8 04/12] dt-bindings: phy: amlogic,g12a-mipi-dphy-analog:
 drop unneeded reg property and example
MIME-Version: 1.0
Message-Id: <20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-4-81e4aeeda193@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1151;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=CRQwljGCl55mlBg//zbF+X1DQ9wf5iznuCDzWEp0CuQ=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlTJ+XLEMPnR15x7zvUzrwjt+1YsganDZBalmGC+RA
 Tf2EoGGJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZUyflwAKCRB33NvayMhJ0UnsEA
 C3ptUF1pzarK27aLq3ZZOcI7vsOeQNmB2GL83mvBZGwxGnMdToCwxC2k/nnjtzd7yBcEdsLBvp/iHP
 f83oTz7PiPxdPKaVjuMFnThXlUjx/hYnp0ZhSXKveK4kYH7bYh/6380ZVHgn2JluJHnj0tgnQyaWyI
 PvL1KM75WnOWcOJuqhbT+HuMkrFo8e5WIavxSUI8hA/QFRf8S6FsfF59OdUmjgtMPaGkyPdWKBeLKi
 TXrScBS0e67A54pXlGh+LKFGgExlH96OyDpz7ObKrkEoEgCtA9ppZ8GGhLfbPmL+i0W0hgKuwJVB9r
 wCabgDTqfkkdOYY9Sgga4keMXAlfnqZcAohZ8JfVnBvF1GVG9phzg82WZlXAbPB0ksXDl4q4vopKO7
 kBZRhAjbL+Rr4a73Ys1b9t8/O6rpuqRf/r6q4m2fXHUvnE2fZnfyxOgNg0OUHaY4T1mjyipGR3v76s
 6fomEBEZz/gxC3+KVN0LnzaMfB/zWaxEqmNJx6JjUmf387UFUFYO41i4iJy9Us1dj5p4vF0m/CmSpL
 tXrYMtAEd4C5w7PTsXBIezuSTipdZJvew2jYQUP6ylkVQtwgwRyHF3J4X5CuimCRQhf4JqVwXG2ve+
 CWmv0WlfK/uc3UYlVV1+Z4cT52PPrDmjgofyS+UPpJDYJUNYIZedj5m/lK1A==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_010021_458618_DA433E87 
X-CRM114-Status: UNSURE (   7.50  )
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

Now this bindings is referred from amlogic,meson-gx-hhi-sysctrl.yaml and is
documented as a subnode of a simple-mfd, drop the invalid reg property.

Also drop the unnecessary example, the top level bindings example should
be enough.

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
