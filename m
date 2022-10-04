Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75024C433FE
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Oct 2022 11:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PK2r8At+hr2mJcHsaywV5q3UHW6XvVMvswojszSh8wM=; b=V4oBQX5AHXn1tW
	WRFbIzEti58oNqgiGvj0m68UOzrF2L0Ox7XfJ+GW/lRcd48cVwykRsh0G+4WEadX7ybxVbjI76NSJ
	nRTl/A+wOxV/Y2QVjINz5FfzHjJseBF6P9S7mGFE6LnAOBDxOr6Gx5DPkNRg0C8o5RZa+jRMNMO99
	kVwHuHxUP5lkJjj/Pm+TluHySuoc26CHP81dRE037OaaIJ12j4wx08EUGX87+jkrBHtU+yuCfziV3
	TFy35cYTM/pVuXquQQ3jvil4HMxVnIOPwIYYlggYuLymitxmuyY7OFTV64Olby20KlAOwI9iQBurt
	W4kWFMcknljeVaVM9IMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1offq7-009TAh-CF; Tue, 04 Oct 2022 11:11:55 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1offpm-009Szd-Hd
	for linux-amlogic@lists.infradead.org; Tue, 04 Oct 2022 11:11:35 +0000
Received: by mail-wm1-x32f.google.com with SMTP id o5so8672348wms.1
        for <linux-amlogic@lists.infradead.org>; Tue, 04 Oct 2022 04:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date;
        bh=waeAw6nVidn2Z1MNuWBA98zRNurIETpUSmW37z7qEow=;
        b=yIX+mYN38FWzX6famWPBlf9ZjebH6HRHJsjfU85oeBOf+W/rt1cZsAqZlWRjgypd6l
         AaCt3PCxYFdJwoi5u2DQh2CcYX8WdA6w6PPv0o1QnoSJlXvLGiwdIpqjsTZK+ZIi0moz
         AGF6ykziPJ4uatv1slw4SzvYmC6wgnjnluQhPn1s6y8YK6gYctzZCLAJcakluygUwuYl
         AJZaIwiYGft9j5IGHKAuvCqIwOks8AMgqO67tmEtb83aNyWc6S6WEkiWbKfcjur693zm
         LUEHfK0x75f8BvId59bargoIRG0qeNQiH9sUWsA9Oq5JyYG6i84IMM/Af7cdW5kiQKBN
         BnMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=waeAw6nVidn2Z1MNuWBA98zRNurIETpUSmW37z7qEow=;
        b=1miredoEP35zhYKBYi1UlKDnaLLG7LHGbIjbkzNimLmG1DEmez2W0/njbeOEOD3rfs
         guEIf4xQF4ARob+nJQ0uG0xQ33G3/iHjvhkHD0IAxMlaV5juRctF4OyYhlb+sVpqRprb
         MhHmfzlvU1d5uaijmggZ+tLSjWvxhaAJoUuJgPDK986eyyYpnnrS6n0MznHoZEZjEkXC
         ZQELRimVbBJGgTu5vTJXCwu82b3mDWkdgTK+xuZx9QR5TQjbEKHAJjS439bvLuTDMd0I
         IrnuNeZPNVfIhoodiSsnuzBQzI6jYXEpZESGiTHh/E0AbjXvpEkyRkQ3fuMIj+Q0g8Og
         d9nA==
X-Gm-Message-State: ACrzQf3tIq046dpr7Q9vkz6++BoC0LypHgkbvBI1Lry4QwQlbuwi4e7B
	iU3h4vsJNAKvakXKXnSTGn3rVw==
X-Google-Smtp-Source: AMsMyM4GDoHyu4UZ7io9nYEgf80EAUwwovWZCk9y/nryGemAgMOivGSbU4BH/Vm3d7iP3eMOKadaCA==
X-Received: by 2002:a05:600c:2d05:b0:3b4:7788:9944 with SMTP id x5-20020a05600c2d0500b003b477889944mr10038438wmf.57.1664881889852;
        Tue, 04 Oct 2022 04:11:29 -0700 (PDT)
Received: from [127.0.1.1] (210.145.15.109.rev.sfr.net. [109.15.145.210])
        by smtp.googlemail.com with ESMTPSA id j2-20020adfd202000000b002285f73f11dsm15361698wrh.81.2022.10.04.04.11.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Oct 2022 04:11:29 -0700 (PDT)
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Date: Tue, 04 Oct 2022 13:10:36 +0200
Subject: [PATCH v2 1/2] spi: dt-bindings: amlogic, meson-gx-spicc: Add pinctrl names
 for SPI signal states
MIME-Version: 1.0
Message-Id: <20221004-up-aml-fix-spi-v2-1-3e8ae91a1925@baylibre.com>
References: <20221004-up-aml-fix-spi-v2-0-3e8ae91a1925@baylibre.com>
In-Reply-To: <20221004-up-aml-fix-spi-v2-0-3e8ae91a1925@baylibre.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Mark Brown <broonie@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Da Xue <da@libre.computer>, linux-kernel@vger.kernel.org,
 Amjad Ouled-Ameur <aouledameur@baylibre.com>, linux-spi@vger.kernel.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1664881888; l=1463;
 i=aouledameur@baylibre.com; s=20220920; h=from:subject:message-id;
 bh=Ke2EUTvINs95mUpMERJPIoATA/4M6T38d1rluEloC5g=;
 b=2poaN2OdU4FG83mvQ9Vu23Qhg4fzsx1Ttji06klA6qEItdVkv4ij/xC7b5ya7IZxQTnI4p/+8wxU
 rRm7TLkJCRCqkcQq92Xu2BH2C28nvEhr4dc8JPV03tM9CKmSaODS
X-Developer-Key: i=aouledameur@baylibre.com; a=ed25519;
 pk=HgYWawSL4qLGPx+RzJ+Cuu+V8Pi/KQnDDm1wjWPMOFE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221004_041134_609120_27A422C3 
X-CRM114-Status: UNSURE (   7.92  )
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

SPI pins of the SPICC Controller in Meson-GX needs to be controlled by
pin biais when idle. Therefore define three pinctrl names:
- default: SPI pins are controlled by spi function.
- idle-high: SCLK pin is pulled-up, but MOSI/MISO are still controlled
by spi function.
- idle-low: SCLK pin is pulled-down, but MOSI/MISO are still controlled
by spi function.

Reported-by: Da Xue <da@libre.computer>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
---
 .../devicetree/bindings/spi/amlogic,meson-gx-spicc.yaml   | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/amlogic,meson-gx-spicc.yaml b/Documentation/devicetree/bindings/spi/amlogic,meson-gx-spicc.yaml
index 0c10f7678178..53013e27f507 100644
--- a/Documentation/devicetree/bindings/spi/amlogic,meson-gx-spicc.yaml
+++ b/Documentation/devicetree/bindings/spi/amlogic,meson-gx-spicc.yaml
@@ -43,6 +43,14 @@ properties:
     minItems: 1
     maxItems: 2
 
+  pinctrl-0:
+    minItems: 1
+
+  pinctrl-1:
+    maxItems: 1
+
+  pinctrl-names: true
+
 if:
   properties:
     compatible:
@@ -69,6 +77,13 @@ else:
       items:
         - const: core
 
+    pinctrl-names:
+      minItems: 1
+      items:
+        - const: default
+        - const: idle-high
+        - const: idle-low
+
 required:
   - compatible
   - reg

-- 
b4 0.10.1

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
