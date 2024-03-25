Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 552A7C54E64
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2024 11:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y5tnrppXGUDSAyUoEMNeDMUkRwmq+froUlEMwOSoenA=; b=vZbaRtxO6HZ6gZ
	sPcsP56eU7r5m/GMu5CmsN6lypDaHvTuHA0yd1L5FJmOPgTMNjBsaa9h1rQpLMUlVWyWHphXYWvOt
	fMumeWZAj/UAdfAwQ7gH4qtOcZv7Bd2VrFw7091fpMJOm7v4qKFln+041kee89AJj9D3dY/RPFRDJ
	qFkkezlAgE7NROqdg2NkicZA5NNgGrdLbXjGeYHarbYAEtcWEWZzk/pQ1cpHMQ+nS+3QTamKQkNkv
	iU8b8KhoZS4epWZ/czNyemGF2E0Er+2g0WKCHlhjVfKVc61Knb/DkgxBIdNavq/ETEs49u8JOWE6S
	+gD3Zx+p6Xm+Hv//V4Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roiDI-0000000Gx4r-17cm;
	Mon, 25 Mar 2024 11:10:00 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roiDD-0000000Gx2H-3ewV
	for linux-amlogic@lists.infradead.org;
	Mon, 25 Mar 2024 11:09:57 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-a44f2d894b7so508140266b.1
        for <linux-amlogic@lists.infradead.org>; Mon, 25 Mar 2024 04:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711364994; x=1711969794; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ALpBomvj7h++qduRiPAlY6JUwZx9tyV38eEVHtgwhRk=;
        b=B38yFm+OojF893C4VWbdXRxBBAeedLlJ9tzu4tRQ23QoTwMpGqaCXfRl5siQeLrC7Y
         4JVjgB7IR+sKMCgvk4fnb9QdtaF7iVKYQMDOGjn9otIRUUm7g0Gz4BZMUtaLJ58ztJlh
         b3OT+e/SwgEkvSQO8EkP80Udg8++PVaPPRWtsGi3fUzRliPHRCm/176Xy5j5OfTIT/fO
         I3rRWzY/442OsDGIHrMdncfpcOoZs/hVpmcylsHFO8o85EHFSekVnuI6Iz0miKAvZKI4
         glWAupBcf1RmZSLmA7A5o/a+ywB2iDPofe6lMLcWb6a3pHLJb8MuZBoN5jvWaiEnq8FB
         UjEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711364994; x=1711969794;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ALpBomvj7h++qduRiPAlY6JUwZx9tyV38eEVHtgwhRk=;
        b=WLW3hJ8cXH+ONiaB5bxHY0LgJ30ExN+Z0GSPMTZgloHTzPuCsE8Dknw7Q7/81hpuk1
         3kv3tuALM/lLBjybZwuUk6qR2xIquUHEAB0F3EgylSCz8Z79HE10g41o8WmBFZfV+5Jk
         Mi/VuLhK9503KYm1VslWXiGQOa+359xOyVfJy5XCfrf+lJ/lg/K5mhtBfBVLW/cR0SV3
         99lv/5nswKt7G41QPSStuZ+NnwragwJZyHcPDCtDQ5D83GAAZzn09YuJayT8nO/QmNVE
         jmOJQTEoD74xEHuNW4Eaz4W9RhuLOlRuaFYx/snhNfCYWndUOU8NacYeF+dGg0+Kw/B9
         yDvA==
X-Forwarded-Encrypted: i=1; AJvYcCW2JOOm9cJ7/XF0GYcf0+RIOniCnNp30/pn8Ktz9dJQi9TIwC0QC4oHNz2xqkO3oR1XWa2Voolh9Vdsk+2gFF1SmYVpslDROKunyInVoIZiucE=
X-Gm-Message-State: AOJu0Yxcfq8NBJpbRfHwWnYhH/+9ft7YDdfW3pyMmZQeODXMfXpFV91j
	YbtV08BbZ1pu4Ac9NHClmSA3ji7X39gjOMYRVANuFDvDwQ9+7gLzugg9uznLEpU=
X-Google-Smtp-Source: AGHT+IHTN6DQHKMcMFkMHcH41yhpPoygiYbtAqR88ncB2YWUNCJzDz7yqSQ1t/HPH6gmW2ko0LDR/w==
X-Received: by 2002:a17:907:a088:b0:a4a:3403:343c with SMTP id hu8-20020a170907a08800b00a4a3403343cmr1950743ejc.31.1711364994351;
        Mon, 25 Mar 2024 04:09:54 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id bw26-20020a170906c1da00b00a4650ec48d0sm2972367ejb.140.2024.03.25.04.09.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 04:09:53 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 25 Mar 2024 12:09:47 +0100
Subject: [PATCH v11 1/7] dt-bindings: arm: amlogic: Document the MNT Reform
 2 CM4 adapter with a BPI-CM4 Module
MIME-Version: 1.0
Message-Id: <20240325-amlogic-v6-4-upstream-dsi-ccf-vim3-v11-1-04f55de44604@linaro.org>
References: <20240325-amlogic-v6-4-upstream-dsi-ccf-vim3-v11-0-04f55de44604@linaro.org>
In-Reply-To: <20240325-amlogic-v6-4-upstream-dsi-ccf-vim3-v11-0-04f55de44604@linaro.org>
To: Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Nicolas Belin <nbelin@baylibre.com>, 
 Jagan Teki <jagan@amarulasolutions.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=886;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=N3wP+RQ7VRT4++7kCDqamWluNf4gtoR05YTHGQbChM4=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBmAVt86XeBshGAsC/W5VtvCbe/DoZodm4H3bJEm+JB
 zIV1/QuJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZgFbfAAKCRB33NvayMhJ0WewD/
 0WgBP29RRzC8rjfiULD0LJYiLhZkvw77UYyaHeYHtPBrXItWG3Qk810jaJOq4MZUVGkZyWlhZp0We2
 SJs5rZxZNqNF0JwHDuDfrWgiyn6uWFimoLJli2jnyPadMwHFIqgEHSzf3wVU9igmUC08vVrUwDHPa2
 YM/elkPKAYphEAIz4gNl6OskajHTgRTh24p3dP93sVkKN8LGoeC5+/GpE0ycNHxkD4mo9mGynz92K5
 +p0xwSRUK3WSmNDXQ/AxnZ7/uc/HRNk7PAiR8+Nafic0rf9yElFYpYhmk/Wk2yfJapkPGqH3+friKt
 W3QilPmyYO3nhV6djOApbC/K5i9lBfjxnEPeLw4y1ULfRBsLygDNi79zb1jCTdeAtz6bp4vGVf8WIz
 FPcB7dSdVBqrYMwH+wjZZgZSNoa/JxbyLtboRh8B7K/RgsgtaKxZbnra+cRR479hCii8TOH8qHfR38
 GSJVzS9NPRb5b2fEBZ9+bVUOrRegB6pR6mLue0TjFBAp/cPBBNZmPEvKs/nzURJnoDcoYMJubp4S6J
 J37idTx1I8WMSvIV0fdzbwjskU18g2se3voQgPXhOL6OZxrTEKX+Xzijrsv+Xf0olQ4uPxJibydWF6
 Ui2F7n+val4hewIvamm2jh14mmUTqZfydQ2TbtAooj7fmKrro/ssTPPxzyPg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_040955_949435_53977C10 
X-CRM114-Status: UNSURE (   8.42  )
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

The MNT Reform 2 CM4 adapter can be populated with any Raspberry Pi CM4
compatible module such as a BPI-CM4 Module, document that.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 949537cea6be..b66b93b8bfd3 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -157,6 +157,7 @@ properties:
         items:
           - enum:
               - bananapi,bpi-cm4io
+              - mntre,reform2-cm4
           - const: bananapi,bpi-cm4
           - const: amlogic,a311d
           - const: amlogic,g12b

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
