Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5660AC4708E
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Dec 2022 10:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VzIYQZpolCuIuJC/kPBlTVx27iF3N2jjN+rSh/hOflg=; b=JhnQ28zGHhHyJN
	WZE1ZcQYJlzIzksQhpTiys96gEGhPPqaA8tWFsTe0CN9e4hBftk7gY2G4jhBeMAfyLdNkvvVU7XeJ
	pYNSQ908dsh62tgO8WOxCQhEJWiMHUL/XiC2N6UCZMCqWYaL1RiBgO/3Imx08GlN+WgxCjyObwSkj
	4TAONXYYZZRF3KzMdOiGvAfFTF5yVdlNAR3cMgfvSIftL5mRTbz4icRXgjmBFIJ9dxYqtzzFmWsUH
	HuJ2IuRi2/n6jruWmFzqFrvWEE+0gmTMUBL502bld2VlCqOPUy/X1togPoF+/K6Cx75gADsvMpqQs
	vNezzg4q9hObs25iAF9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2rbB-00HC0y-CN; Wed, 07 Dec 2022 10:24:21 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2rZy-00HAed-0m
	for linux-amlogic@lists.infradead.org; Wed, 07 Dec 2022 10:23:13 +0000
Received: by mail-lj1-x22b.google.com with SMTP id n1so20367782ljg.3
        for <linux-amlogic@lists.infradead.org>; Wed, 07 Dec 2022 02:23:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NxOwaXNbTiEohgYyBqos3ms0rULNHpJBLRwyMfOuuH0=;
        b=NtKUk2m1h3tLka81IoJVoYRO3XnaUNp+OqGVpu2UIcDW9+4BaG8iIZFmn/vtIjuTqi
         V4+WX4tk+TwKIvxxQWDijQxly9/gd6KSixNCxktzJkBLGftbVPRtuGBJBJZKOT2BRvpq
         WQyIFgXaeLdSnCBUAFJB6fdBC44QK0SZOP6rCHfdL5PRyW0mNbIWRuF3goCn15W+GkaY
         oKboGUhxZwqjHwmQDc5U7yUDwNaEM9y3el52V+V604DZkpjjsyukn1yOulYSUhnatiD+
         ki4VLvjYWaIqEqHMYS9EwMBeukSVaaP/ZPe0tkSMGvnLG9AADxtjgyREr08Di6iZ1cJv
         jXqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NxOwaXNbTiEohgYyBqos3ms0rULNHpJBLRwyMfOuuH0=;
        b=49hiSi73Y1B9jdapdpxwZDhcJe3Okj/nKqJQox9WucH1EZSW6au+gKL37QsmmloTgF
         Pyjhd0yxp5K2VjHwGqVziQPnTO4fIcevT1E6S5VGyHUHWQEe/zEG6WYdQjKsn7NujgoV
         6G7FdOvIOpFaGhfKttPBRExcEKiul8q0Dn4NL2R2YrsIsPtEO7oqk9wW+N2VX1++HWzB
         d82TWMj72TYZG1ajlmJ4UZjZ2hmgRjW7r9dzm2GrXr1TEJQT2RQy6pC8e4leLwz1zpZW
         Jz7kZh2C5fUJMu1OxSBV66J3cY0nbT6WsmS+wysFo/fusoIKUaMrk9EOZuFZtsPVV7jw
         yqKg==
X-Gm-Message-State: ANoB5pl4gAVozT258PWg7N622++WXSaojWJzldoP03BRf5oTXymATcLC
	9FtMG2VM0SBNVKuITC3QPps+Ww==
X-Google-Smtp-Source: AA0mqf6kl71n3zxYJOrPVwuyZZp4Mf3tgmyBuSLPs/1nIQLPZ1sv2HBeaCPNbpwVi7Vl5Oxm8OdFqQ==
X-Received: by 2002:a2e:b88f:0:b0:277:f46:617b with SMTP id r15-20020a2eb88f000000b002770f46617bmr26983808ljp.221.1670408583209;
        Wed, 07 Dec 2022 02:23:03 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id bu31-20020a056512169f00b00499b27a329esm1953183lfb.300.2022.12.07.02.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Dec 2022 02:23:02 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Joe Tessler <jrt@google.com>,
	Yannick Fertre <yannick.fertre@foss.st.com>,
	Jeff Chase <jnchase@google.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v3 4/9] media: dt-bindings: amlogic,meson-gx-ao-cec: reference common CEC properties
Date: Wed,  7 Dec 2022 11:22:48 +0100
Message-Id: <20221207102253.26663-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221207102253.26663-1-krzysztof.kozlowski@linaro.org>
References: <20221207102253.26663-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_022306_091068_102D98B0 
X-CRM114-Status: UNSURE (   9.66  )
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

Reference common HDMI CEC adapter properties to simplify the binding and
have only one place of definition for common properties.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/media/cec/amlogic,meson-gx-ao-cec.yaml        | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/cec/amlogic,meson-gx-ao-cec.yaml b/Documentation/devicetree/bindings/media/cec/amlogic,meson-gx-ao-cec.yaml
index f65c9681a9f7..b1fab53418f9 100644
--- a/Documentation/devicetree/bindings/media/cec/amlogic,meson-gx-ao-cec.yaml
+++ b/Documentation/devicetree/bindings/media/cec/amlogic,meson-gx-ao-cec.yaml
@@ -33,11 +33,8 @@ properties:
   interrupts:
     maxItems: 1
 
-  hdmi-phandle:
-    description: phandle to the HDMI controller
-    $ref: /schemas/types.yaml#/definitions/phandle
-
 allOf:
+  - $ref: cec-common.yaml#
   - if:
       properties:
         compatible:
@@ -81,7 +78,7 @@ required:
   - clocks
   - clock-names
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
