Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85E47C4321E
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Dec 2022 15:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OuwY7D/sbSDbZTWivYMDWzWzW+ud4HCmhqmqo81KKOs=; b=bqzLvIDdfJTNbU
	r6CLoI7G1aCxIpJdTqI0TSJMkqgG0Rr+vH6ktQ5sW3viqTtbXUwzAg7OCa+pbZOY6QO4/RJBYhjLc
	g14MfNsugPIVKgS01D3cqFz4RfnlhIYftcMdYPGmK3FyyPbWHyzbRp/8xEjzlPeaJ+3vS+dEtWnta
	plBfCu9JHt9zuHcBoWuzdtGoJLmwx4XqtiZAGE2tfm3PrK5udZ2ehHkm5AYH1HQxf22V9nx8I96/6
	KYK1T1bh+vh7baPG5Wrpp+9C4DOvF7bL6Ctdkg9AZCDiSn8oh+UJxMLq/JX+5sNMxYw5fUGVkJihL
	FaTbpcfXUHW5YR9M5iDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2DFi-004geW-HZ; Mon, 05 Dec 2022 15:19:30 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2DF9-004ftp-L5
	for linux-amlogic@lists.infradead.org; Mon, 05 Dec 2022 15:18:58 +0000
Received: by mail-lf1-x12d.google.com with SMTP id d6so19060362lfs.10
        for <linux-amlogic@lists.infradead.org>; Mon, 05 Dec 2022 07:18:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0y6Fl5nmmyzxTIPnsN7I5cMbpP4z41yN4XYoyu6c3jc=;
        b=mO+7zarx+DxucFPY10l+B3VsMhLELHKJH6rHq4ek7bqaXb+qR1hTZOtn3rws92g0jO
         FTlJrua1bI1nc/P9HWytW0LW4bezurnVHeUxbEtka5AXvLRiiVSh2YMleTy8jTQpSZS5
         Q/3sswD1Ld3MisWiPYe3Vx86xcEj6U7csGU4z86svc66gc1F5vobXfwfg+o3FZwwbh6e
         6bB11NBSw8EZ2SZzDLJKRZHR7rIc9XSxc6i4VpfOM09o3s0ncDtFaIguC228+yyrH3t+
         4KipmNfx8fZl4jQyLu9Nq385iR6uS6ccqfOxiOAfMfo2HijzNapnX/yKZqMcfE0yNprc
         JhPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0y6Fl5nmmyzxTIPnsN7I5cMbpP4z41yN4XYoyu6c3jc=;
        b=P33pos66u0VcrpBF432qSnuyVesIsDEn5KM0CtCL7I7M6qJAzMZDB8AJEIIgQ614XV
         MLxy4GDTYLag2CG90v928eGMDrlRkbV4QzIZCv39rGlpj8QbOiAZv3rJUfqfhM4SJt8r
         QPAZGj3U+rRtPRtoPTmJfx5YEziC5dUq3cuVBMjPc8Oa0rM9R7wDwIPRiRu06itxD9Ki
         LnwhM8P+DkGkTThmX8RdzQLfaU/s9CMXU0eoyEtAs3OWPiJxt+Dac4usUD7Hw/Q7eyiL
         /QRLQUQ33OHOYlx9Ptco4R2kNpOVvI3l79yJFHe6zQ3W2d2iJaxARBT/pEMLJjFC/pYW
         kGiA==
X-Gm-Message-State: ANoB5pkCCzyhmWhEWjwZmsK6YbHMM36jYT6IW4Qplk1Q0DbpTduzmW/R
	t95bDC5KCmcUkE2lcWKbJ3odGQ==
X-Google-Smtp-Source: AA0mqf4eQ3eDlVcaTMJOzJGRvcxfn6xFqaVgJoOB7uHiBOYlxYooiHYb5ToMFm5HnBlbDhFaIemAfA==
X-Received: by 2002:ac2:4159:0:b0:4b1:5a96:983f with SMTP id c25-20020ac24159000000b004b15a96983fmr31113889lfi.535.1670253534125;
        Mon, 05 Dec 2022 07:18:54 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id w26-20020a05651204da00b004b55f60c65asm1012470lfq.284.2022.12.05.07.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 07:18:53 -0800 (PST)
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 4/9] media: dt-bindings: amlogic,meson-gx-ao-cec: reference common CEC properties
Date: Mon,  5 Dec 2022 16:18:40 +0100
Message-Id: <20221205151845.21618-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221205151845.21618-1-krzysztof.kozlowski@linaro.org>
References: <20221205151845.21618-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_071855_727868_4FD0235F 
X-CRM114-Status: UNSURE (   9.29  )
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
