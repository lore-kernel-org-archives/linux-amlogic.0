Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F79DEB64DC
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Jun 2023 07:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qg21+qXSYt+azmw6zYKcoj7vrK5aXx03UkCKy6D9/Hs=; b=fuC9XAdYtHd33+
	+lAdjvMzYrVl/sy5BD4puyQWyQn2geGFbuSSIhcIaYHU2pQ1XfWynJL0rD/gjGrMRsO3PvHmUnUqJ
	oixbRAvY5yi8jHnTZUcQ5GC8RGBTAniEEvKsdj0Mklm4TOVixcGY72oPOeDglGFkzLJaz/GEKTqtJ
	2VnKnbwims7pIOxeNB/w6vayayxRdROrTN9Y397BbPW44YvQUO+w9dYS5fENMKFKBKTY6zpmkGQL7
	zKykepDlh5L9iTwLcsC1mRSE4iZv9R5LKNmnuqMKNL5HEm+O8sVXd5NpxhpAFChoUcdiCmNYgAS9a
	kVWGkY8FAlieSxXV7Mkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEmAy-000DHj-03;
	Thu, 29 Jun 2023 07:34:48 +0000
Received: from mail-ed1-f44.google.com ([209.85.208.44])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEmAf-000DA4-1M;
	Thu, 29 Jun 2023 07:34:30 +0000
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-51d93425853so395116a12.1;
        Thu, 29 Jun 2023 00:34:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688024063; x=1690616063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nc1BU6BhZ7z4IqTRybSYVNkHF2gq7R9QPn7Ka511/8o=;
        b=lJfb8tp8slfmvKkzFMRxBwmegiqn6COSx2K14Z7AJgbudLhX3vm6Uw1EIp5q5oRjzN
         OyOVP7fFGM6BsBWbtJSDkJCRNS+GXtYhu5bQntq4vkAZfK0KOn9aEVY9VR8Wx3cIT6LC
         TZCIht/c0JTO16eHdYH1mXNQd17mubtwWee2TN6E/vsd+4m6ME3MBjoUKYupB9UVKkeQ
         /+uDm8vgQzTG9KCae2GmHC84JKGgoxyLuQ3cDuoIT2pm0JmPgH4GksFNsAXo6DQLrQFT
         xtIzbsjfkkhewrli9zzTh0/AslDRQd5Gj+i00SwnFmDI15cugkn4EvSg+N1/tN4HwXAK
         SS2g==
X-Gm-Message-State: ABy/qLa/sYKbSnJ/gub4aeElVTmpmPeBJuv+Zl/4MpE85ZgqgUvNa60o
	htixC8SMaCRWd3s5Snismyc=
X-Google-Smtp-Source: APBJJlF7URx8BE0lY+MGEELC1a/SQZVKF9RkK/VhLFS096RToUMgbWS6WUN+sRTll4ZitQolY8aF6Q==
X-Received: by 2002:a50:fc13:0:b0:51d:df35:3818 with SMTP id i19-20020a50fc13000000b0051ddf353818mr733004edr.5.1688024063671;
        Thu, 29 Jun 2023 00:34:23 -0700 (PDT)
Received: from ryzen.lan (cpc87451-finc19-2-0-cust61.4-2.cable.virginm.net. [82.11.51.62])
        by smtp.gmail.com with ESMTPSA id be28-20020a0564021a3c00b0051bfb7de166sm5453716edb.39.2023.06.29.00.34.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 00:34:23 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Nick <nick@khadas.com>,
	Artem <art@khadas.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Lucas Tanure <tanure@linux.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v7 2/4] dt-bindings: serial: amlogic,meson-uart: Add compatible string for T7
Date: Thu, 29 Jun 2023 08:34:17 +0100
Message-ID: <20230629073419.207886-3-tanure@linux.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230629073419.207886-1-tanure@linux.com>
References: <20230629073419.207886-1-tanure@linux.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230629_003429_459848_76DF8039 
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

Amlogic T7 SoCs uses the same UART controller as S4 SoCs and G12A.
There is no need for an extra compatible line in the driver, but
add T7 compatible line for documentation.

Signed-off-by: Lucas Tanure <tanure@linux.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/serial/amlogic,meson-uart.yaml        | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml b/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
index 01ec45b3b406..591d1f8de191 100644
--- a/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
@@ -50,6 +50,10 @@ properties:
         items:
           - const: amlogic,meson-g12a-uart
           - const: amlogic,meson-gx-uart
+      - description: UART controller on S4 compatible SoCs
+        items:
+          - const: amlogic,t7-uart
+          - const: amlogic,meson-s4-uart

   reg:
     maxItems: 1
--
2.41.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
