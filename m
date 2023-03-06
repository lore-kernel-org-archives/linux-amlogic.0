Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14987C6FD19
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Mar 2023 08:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Knzh4wbvBIEhcDLm48sm0j9bw0TEqs0WGBM39IxyCy0=; b=sKkwNwXfMh05yk
	EKlBK9Wjas+jQZh4cfuUHMa9Wloxi0hvlfo5x/Ncu7mQClVrIJUik00rEHJ6pkbtOKgbTusCCFCuz
	BcoOUJFzRNqDBQhuGFCiMMjjSZZYrybNDMp64tzxD6vvDrNWtjouOlc9BUbJlEMSlgfnz9CtNRKoC
	iyC61f8yPUu+53BWhMFfKfOmfMCEfktW7SECVBamUIU0d8m7xLIgQH6YUXiSnzhtLPZQYPSY5xHJn
	/84pvTD8peM64Qwn6dY5+WDSkIaAKAAWQJmzPlTWwEWk1uisS71jhhKD5I/TGpqTq2xVL5GYCv0DW
	+75ZU9gPNIUY0UCw/1/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ6HN-00Btic-Hy; Mon, 06 Mar 2023 08:33:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ6HK-00Btgw-Et
	for linux-amlogic@bombadil.infradead.org; Mon, 06 Mar 2023 08:33:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=3MygDlz1DFXRl4wEV4mR7HeCJcg4hVIJJT1T9suDxRE=; b=qijMfCIq9MOXqkQdkUeKAelFQ2
	L3XkYygeJvzCm386g6LgT/6ku12iIUUBbm9or7W+QpgSfZMBN2yODMtmMpkhsnu8xDuhPPE2tl+6O
	jkX7H09GtM3n4hrRbHdh9J4A6GWnN4J/7URtDqn4eYvn9n7b0jkBefO45Z2FnN40C0jNQaUuTqKyD
	FsYH4G2DuDJqZqrAkSzU/zjde/iH9ZO/zF/XxeidPMv4nSXR9cwSQQ342GoAaNl8MnT+cv9HMXUw0
	l4xeVN1YSCuhrUqSeroRTwY1zutHr5lPmRbBWMIz5CNsabxxEbnUiST88+2CtwOed8QpEpVXAgZEf
	Px9elXgA==;
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pZ6G4-00GcGB-2Q
	for linux-amlogic@lists.infradead.org;
	Mon, 06 Mar 2023 08:33:03 +0000
Received: by mail-wm1-x32e.google.com with SMTP id bg16-20020a05600c3c9000b003eb34e21bdfso7616994wmb.0
        for <linux-amlogic@lists.infradead.org>; Mon, 06 Mar 2023 00:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678091500;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3MygDlz1DFXRl4wEV4mR7HeCJcg4hVIJJT1T9suDxRE=;
        b=G9A1SYreNYy4eiByiWuuX5CPdrrN/7Ood1RVhy9g0/BEdPc7Q9IwV18IddlGqylLFN
         NCRtsTF0OMHf4vZR5HnXCK2ssL5Eus2YeYuZyX0beUoGxBXFhkFzl7Z6En+jVXVTTpwB
         xeo1YE/vnB3U83T2ZcdPQrMRdqpgW53DWeA8VdgFj8xeiMeEjTH+oNPUgwilOidR0zGm
         rAmoL2AlXJslBYCND8xjsKuFkuaK1VIeIB2L3JQdtaJxzRIiD2/3YV08I8K+BtTTWgtn
         r/Nxbfx8yEF9+fkvmT6x63d4I76ffKt0vjbIOav9OkhBWA0dqEhBJ5XLvFcJIkYUrTzq
         D0Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678091500;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3MygDlz1DFXRl4wEV4mR7HeCJcg4hVIJJT1T9suDxRE=;
        b=PR6uxso7nsSWkMNoyys4lJAAMdag2+hawbuE8jWqdtFZIq/GoOqMbNjcG2+0ff+waa
         B1Y4nunI+rXjHhHvM3Iu8MZ7X9ixPM2fQKQCL7EoKEkgitX+sQj4f+AUGsHkqD+NtUf3
         ewNQupVIJEbWt6OOybkNi9W1RKmvoA5Ae2RNbGl6hE5Ss9wnRCHk4xx2oTdYsPTVc7hz
         9yU+QTAh31rCcj2KJlC4iJQrP4g68eIJBuaK3cCpVj5QLwOV3arLVnFemj2D7gd8rPV4
         toSJyH+rIs2RwPK4WVp/xq+UjaZ6Jtm2dT1PZpcpJE1xCF+JX+BOH77XdSN6UbnBxM8B
         nxfg==
X-Gm-Message-State: AO0yUKVjh03N0CctdbjvdOopEJU4sky+jtuqzsMrcLWvwu0z21xTl/CX
	WmNgfuQYjZcftgdNBYyNjLMGqQ==
X-Google-Smtp-Source: AK7set9b27ClSjWfMWvCjFqKOd+RFDZvLySSEwdzTBOZar24zuh/03jmPSbSEIfnwYBs8nuR8qnSGw==
X-Received: by 2002:a05:600c:5127:b0:3ea:f01d:2346 with SMTP id o39-20020a05600c512700b003eaf01d2346mr8717456wms.15.1678091500348;
        Mon, 06 Mar 2023 00:31:40 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id he11-20020a05600c540b00b003daf7721bb3sm13529724wmb.12.2023.03.06.00.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 00:31:40 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 06 Mar 2023 09:31:38 +0100
Subject: [PATCH v2 1/2] dt-bindings: arm: amlogic: Document the boards with
 the BPI-CM4 connected
MIME-Version: 1.0
Message-Id: <20230303-topic-amlogic-upstream-bpi-cm4-v2-1-2ecfde76fc4d@linaro.org>
References: <20230303-topic-amlogic-upstream-bpi-cm4-v2-0-2ecfde76fc4d@linaro.org>
In-Reply-To: <20230303-topic-amlogic-upstream-bpi-cm4-v2-0-2ecfde76fc4d@linaro.org>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_083150_461277_0580C95F 
X-CRM114-Status: UNSURE (   8.44  )
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

The BPI-CM4 module with an Amlogic A311D SoC is a module compatible
with the Raspberry Pi CM4 specifications.

Document the boards using this module, by specifying the BananaPi CM4
compatible in addition to the baseboard compatible.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index b634d5b04e15..4e5ae70db4cb 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -158,6 +158,14 @@ properties:
           - const: amlogic,a311d
           - const: amlogic,g12b
 
+      - description: Boards using the BPI-CM4 module with Amlogic Meson G12B A311D SoC
+        items:
+          - enum:
+              - bananapi,bpi-cm4io
+          - const: bananapi,bpi-cm4
+          - const: amlogic,a311d
+          - const: amlogic,g12b
+
       - description: Boards with the Amlogic Meson G12B S922X SoC
         items:
           - enum:

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
