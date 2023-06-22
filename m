Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C205EEB64DC
	for <linux-amlogic@archiver.kernel.org>; Thu, 22 Jun 2023 08:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yaXHKgS9jXvXi1ywkRwaYdfm8Ds08ig8M33z1zkc0LQ=; b=4H+5kjuqgEMF+M
	L0NfOsWHh5v0wEfmOGcqUSoviMgj+GFMcNINdA7+dZvIlxp6aqfRarN4E2N+0xoLmHBBt3bCUeCDy
	chcGkHbAz6SNq3cKomspf21/fKFO6q5tadhhXoT9WGJsSoMpT1N9Zfnv/hTriwtEeFuThN093N7A4
	6xvndiydxZAWD6NOr02LTwoTOcAgZsEdXVu6pGRjKyyhin31xnTlYX8UWheQdHe4okzIxhhNvWlyw
	c2b/76BQlnH7edJMcYFPFXIW4rJUCieyNQBHn416kOw+XDtmYft19arAcekU7cIIMDKQsEBNpJnnm
	6dQno0OW/ziQUrNxNFZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCFs5-00HSoI-2Q;
	Thu, 22 Jun 2023 08:40:53 +0000
Received: from mail-wm1-f41.google.com ([209.85.128.41])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCFs3-00HSmD-0l;
	Thu, 22 Jun 2023 08:40:52 +0000
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-3fa0253b9e7so3701455e9.1;
        Thu, 22 Jun 2023 01:40:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687423249; x=1690015249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x/BXWd+aXbwkUNKUI7mfSjhHzxj8tSAcMR0CS9iLOvM=;
        b=E0fLJUBnsSGuuFb3jlXrp36bdu4M22ixlcM4gc9u36w9/IyV5G333uNJlApcvmFjtQ
         KfEbhhQ18Y3I9bHnyIOZr6xzxCXOlQQkn//mfshFJXrExDTFya9c1KZT5U+XQ3g49hDh
         2BDCE7Ax+rAU+F/xjZYuc5XUc/J85bE2wvaQ9FGAhoNvvEVJ4Gt6ukUOrUofB2RCBhOW
         ZIqCBax9U3Fkx6UXlsdbsx9591BUCuFjkwZCAM/TqT4UkHx9aIrqjbjco7ZJIQ7jF9Ut
         V+N7lnhBgStd1guhJkRdYVCtdzxY6UxE+40C1fFR+hP1xKmbX4Mvgunmf1LeiBzX+rGk
         Z9Ew==
X-Gm-Message-State: AC+VfDyuuaCaqoYB0m11r33jQRQPj1hE91536F1+smLnsuThqFYEiNHs
	B9eFVgj1FxrkzDqW7kxM+G8=
X-Google-Smtp-Source: ACHHUZ4Ca7iBZ3ZCuOXAnDKqAifQ64bKpCk3sOUgGBoiSfKcvNVDLsJWLheN8E6T+jv0GFN4aJdQfw==
X-Received: by 2002:a05:600c:808a:b0:3f9:b93:ed5 with SMTP id ew10-20020a05600c808a00b003f90b930ed5mr11376889wmb.12.1687423248844;
        Thu, 22 Jun 2023 01:40:48 -0700 (PDT)
Received: from ryzen.lan (cpc87451-finc19-2-0-cust61.4-2.cable.virginm.net. [82.11.51.62])
        by smtp.gmail.com with ESMTPSA id v5-20020a05600c214500b003f7f87ba116sm15441277wml.19.2023.06.22.01.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 01:40:48 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>
Cc: Nick <nick@khadas.com>,
	Artem <art@khadas.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Lucas Tanure <tanure@linux.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 1/3] dt-bindings: arm: amlogic: add Amlogic A311D2 bindings
Date: Thu, 22 Jun 2023 09:40:43 +0100
Message-ID: <20230622084045.519203-2-tanure@linux.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230622084045.519203-1-tanure@linux.com>
References: <20230622084045.519203-1-tanure@linux.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230622_014051_272137_2563D85C 
X-CRM114-Status: UNSURE (   7.36  )
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

Add bindings for the Khadas Vim4 board, using A311D2 soc, a Meson T7
family chip.

Signed-off-by: Lucas Tanure <tanure@linux.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 274ee0890312..8dbd65170c50 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -211,6 +211,13 @@ properties:
               - amlogic,aq222
           - const: amlogic,s4
 
+      - description: Boards with the Amlogic Meson t7 A311D2 SoC
+        items:
+          - enum:
+              - khadas,vim4
+          - const: amlogic,a311d2
+          - const: amlogic,t7
+
 additionalProperties: true
 
 ...
-- 
2.41.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
