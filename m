Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98F4EC48298
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Feb 2024 17:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zrf0GpkmoyYe39jf0KAV0/2NKlpdYlarsLu6q69BkzY=; b=H/adh9170YOGHa
	gdlJl+FxNdsT5jLqn4LSiNAMRhlXSNk09HLLzQaNSVifxDPLYD2r6sQbr9FYedFvXtHWRrC6ThgU5
	egm9Ybm6IVNEzriLjEqwM+SXz0pMxqdX5Gq+TpveVKzz8BxYxyKwPb5oYq49hqo23ZhR2G/NM+p6N
	4RqkjdbfPLBPUiOSrxWEdgimiquKHSCXrQLupZwlxYPDNTz3QgKsO5BKQHnjJorGYuhfUdIFQyUVf
	X/RC73OsUQHZaPmX3e9tcUiRG9iRnJ16oHmkAJ8naRZ+ivrIM/1pMD5vJXlPAhD9n4ToQ1gmh5k46
	H+JMQI4+3NbMBLuCDV1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX3C3-00000004GEA-2y74;
	Mon, 05 Feb 2024 17:55:43 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX3Bz-00000004GAW-4AV3
	for linux-amlogic@lists.infradead.org;
	Mon, 05 Feb 2024 17:55:41 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-337d05b8942so3582348f8f.3
        for <linux-amlogic@lists.infradead.org>; Mon, 05 Feb 2024 09:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707155737; x=1707760537; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=szbyE8B5HmerWTS9QCGM8GNA9TtBAZ10zn0t2kxJOBs=;
        b=lVUOjQyqJlYCv/X/RCYp1mrVdHVo7rkf3qGe1IG6Z3hWvvqXcbHrTLM5epoCcCxqUl
         Q8JgDHh49Pg45QFb9WF2nZcLAbbKAXunffVCsT5DR9g2FwxebHSFxDyPyKN0ymkwacFP
         ChGEO34CdaphRDLPYCE12PU4ksBEHaypkqZwEiusmybsCCCjMkHF4ktwNZ1RhoRvBW8/
         i8W8Gt6jLXa+NYq10IJeuToWzpb0XYrzf6ucg6Ry4ZFapU6E4thAon+qVVimqCzICa92
         QbVAITx1bCJaONlN/PUzBWp21mHKWnF9AqQY30dSNJ167m1klkLQuZ4gygsQ2wakdQ98
         Xo8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707155737; x=1707760537;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=szbyE8B5HmerWTS9QCGM8GNA9TtBAZ10zn0t2kxJOBs=;
        b=RmMY7/axj68W2d6NDj8wbAds4h5/22qZv6RTdzm//hXtFzAeHxzx3ITehpdHnd61HK
         P7U/PJABbXYjoEtVP1vovc4QvvAuH7yKTPnZkMKRYIBrKh0EHw1UkAPyInO4Xv3zEhIH
         /z7LCmre2fyBklFdoc1dn1xXEQprqGJOyuUurulL7hhdhZdS+b4YUM5N7Gjex1vIZRzg
         XSuOGCTo9SGOz0NGnjKl9vqaWggSQr+zVtWbfv7n2XqPIEERlNG0IV/IJK93nb4AzPsN
         GFzZ/hrIbUnjbi2OauthuEj2BaL7LcXJjS9FWtlrJXkEj3/oIPuL8jHZNB3A7ZbIgn0j
         FGCw==
X-Gm-Message-State: AOJu0YychIibi0c4Srg7X7yJGX28dKmLbgOIr7BdP3xCneHzg5Q6MNW4
	4LTLKFcfiqJ7+DpxGMxu4Jh0MohZw84H6PBsFKzEFPf6X7X8zBvyYSHo3ydG8/Q=
X-Google-Smtp-Source: AGHT+IHzPv5LMbjyU60gsDCwrFazyTvvle25BDscy8+ByFFpC7e2TQ4l8+2KODtVkD57MCSsp9Hdug==
X-Received: by 2002:a05:6000:d8a:b0:33b:3fe8:640e with SMTP id dv10-20020a0560000d8a00b0033b3fe8640emr155686wrb.16.1707155737401;
        Mon, 05 Feb 2024 09:55:37 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVM50fTjxTu0/xwr/5kMMi/SDP0CggyLV2aA//oJFKPwxW7n64dPykTFS0U9qE8rqv5Sc/wDNjmK5Dq9fhxmoYnuFCF+VNi7IcUqwGxpB/1zS7cXPmMA15BKXOJVHCm7iPpCaiCFeORxD9HGhs5r3BVQ9MhzlY8ON6S0mE8bX9WlRzQjbTkCChDcXOeBYMT8rxOHkKSHgxVeYqrri9eeZnV2vbdtGFeIZOTrA3g386MnQLa74//9u3PcDlop3CFKicmbz4dFvVhr4o3OdheJkOj47cv1KhZfLNbfX19XTqvbAQcSvBOL88AtC+hod0RPb9fd3NblrYr3gYEqFecREA+N9EvwrJezbA+7o8fojrD3FIOMfQA0JHcPBF7orMpL1Y3cZ5BR9rrrb89Hxp1N2BJavlEbeuECXI+KyY2jRIe7ImTf0M9xK5wXezlFUWfva3mbhYeSKV140KgIuR6ecCBmN5Vg47pE5mplktNY3zkWTXKu6FDYQTLxNTpDfcUzcgLbiaCJYD/S7F+sFuZauZYMpCb4uUutOpkAhiQcEf59b8M6G5ynRfib0V3u58hDb8EVMXFWN/jp0h9oul/N+m22WV4SJa5/fi27fJAncxu8cf6RZmuzknLNRdwiKjCn0zQO2QMO4Bg/DPq5SVlrIQc/FFpcLaGvwXJJQ3x4ckF69ArauH5I7OwGmsY/Dm+J/nwfslGfDcjnICd7be+YGN5W+BMGd0zcO0o57F/ngCUjVbSpPXJMomej1CG/T+TLYfeWH5WxcwVEJc8r7IDlBMYgjNIebA9GwGhQcrO
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id je16-20020a05600c1f9000b0040ee8765901sm517556wmb.43.2024.02.05.09.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Feb 2024 09:55:37 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 05 Feb 2024 18:55:28 +0100
Subject: [PATCH v10 1/7] dt-bindings: arm: amlogic: Document the MNT Reform
 2 CM4 adapter with a BPI-CM4 Module
MIME-Version: 1.0
Message-Id: <20240205-amlogic-v6-4-upstream-dsi-ccf-vim3-v10-1-dc06073d5330@linaro.org>
References: <20240205-amlogic-v6-4-upstream-dsi-ccf-vim3-v10-0-dc06073d5330@linaro.org>
In-Reply-To: <20240205-amlogic-v6-4-upstream-dsi-ccf-vim3-v10-0-dc06073d5330@linaro.org>
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
 bh=dsHeljQP++qeke1zASpQ3YPnuH6eGTAu4r6z8mvmrbM=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlwSETaOGV/LfGvPj9RkwIO8SpqVlmJ5bu/JPHvBxw
 MhoMyGSJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZcEhEwAKCRB33NvayMhJ0UlYD/
 9D5EgwF9dY0ePJOrDxc0L/pBLl3YvRvByoSAHYyvlLebG1LealyXE13WkrJPxKU2gxouPPprPZoSg7
 xV2Cmd5Ci3GvXtq/VBV5zMQOXmvtORdpoKgYhFB0+P8L+ttJHXyH+X8QhaDyfefFOr2zexMrmoEDf2
 EtjTA/3rGN9AOpi7bOr9FxtyR3/kgAN6unsXB0W622z0QDAK110rj4ITdGXemGRgomf11zjk4fyvpf
 IKkCct4yYWkopzIKn8HXVU1ETWmrB8ovYPIGENVEn2b2o2fj0VLXai9mUhU88O/PIlUVaoQ+V7jY9a
 MNV+Md/lM9z4lQlHEjABIHPMtMipSJqkxFUN5SdKnTP/ovZpZu68S3XKCf/8f42zLwbiXtVz3qyeCw
 BX95wWutuiELlGhLkxYoB87jlFl0VzRce1lASTpG0BtlTWUInPiMHVgW6Ws4DbkrYD4WL/VhdieM+T
 Yykb94ImYEKlvsVGMpkyojwJ7H1gyeZrXRpTafAc16tdBH77g2D1Ev8X11FrgQaI89mmL4zEENO+pM
 GqfEggf444uxQs3HuyFDX9fdCepIaIKOSCXhkHh+S4niRQPbtev0i3ZGw9yh+BM4Yae+erHyobbvbA
 08bciuZ5EXewIPkwV7zyBR28akMd5/uA8UA0WFFxskAkp+NjyF3maME9d2IQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240205_095540_074690_CCD14C09 
X-CRM114-Status: UNSURE (   8.03  )
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
index caab7ceeda45..2154a4614fda 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -164,6 +164,7 @@ properties:
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
