Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0BF0C5AD49
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Jun 2025 12:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0OGiSZ5tvkT5LipDcRsisHw96mNErQ4h/AkCnRdUfcc=; b=HndFrNDhTzT1/g
	r/e4VafjH8XICnwwKqOhxKfQE744STK0/UPFtKbO/ejsATDXaAg+dRohI6QQoAV/7wm+BN0i6mXci
	Kn6YKbq2rpArtIgq+DYPqVwXVn5ZgYVGfcvfquBSd2kWN0j1tHG4rwKcMeJnh8h5xQQKz6nV4v3Dz
	u9cbTSwaVuj+ZbyhANNWJid6oLtuIUpQbOQAZUc/Uf277hHabC+H+lvnYWvKEm3F/PX1ZoCKZgX38
	UyCb73V1pe+5GH+PhC54PynGu9G+cgkZzpLuOJS8pKOe78++VD3dhMCnKTn+NwrfwTBmLM5xYqHsf
	xRD36WiVkutLkmN28qzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMQRg-0000000Asvp-2Upa;
	Tue, 03 Jun 2025 12:08:44 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMQGs-0000000ArV9-2Sut
	for linux-amlogic@lists.infradead.org;
	Tue, 03 Jun 2025 11:57:35 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-450d15e2d25so1114515e9.2
        for <linux-amlogic@lists.infradead.org>; Tue, 03 Jun 2025 04:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748951853; x=1749556653; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AkhPqPyokGiCNL8dfKTXdO+jBSmWZLLyi7+WMgDPG7A=;
        b=SRC0Eo4TjjWEJjG1xHX8U7QONYsRov236n1wdYL81gMBSi09nLAhNBA3caNwOl1nIW
         xIqegiWh7jwONZUICHy+s//QbhkUlycFkrFrp4hIVA7/Q9+GFopRGbstqC4mO9vfgBoH
         DbZNOPAy9YLhAwv712FcITlBMgW/o6MpzTWxzR9Txbvo5/GCehkKlRKQranHotFw56dw
         bRvGyghLtNJHB5ttNzQmLK5nfgTF3Cd1uyJG0dXb9hxR1noIB9bKrVBueGyAaRO/K09r
         ducABYLKAyVI1+byets5xCdQVe7DKYjtKMez/AIbJl075kTuLh11xBhftug6oL+pxYmr
         AZDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748951853; x=1749556653;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AkhPqPyokGiCNL8dfKTXdO+jBSmWZLLyi7+WMgDPG7A=;
        b=HkND1muKOBz17KBRur0HgSKIaTtNkygsOb29Q9XLMjIuf91kTLKESmNqHDwqIgogh3
         WzJ5357KrrvQ3TFg9QoLN/PdjGFVmh7UmRFarXJhRrKR5RuVSPvwhbQ18bJU2yWhPGHF
         C+13zHPE8gihbX9UJoF2zwlguqoi3qj+e/dU2IzqGB4ypxEQi6gCwkE5KzJ/ncNSxYuW
         kfEM+r8lxgOqJv/Kl3dQE+/cC6iOpBvlYWSe85TWgBPlPKg7C+EQlePKvlidgowKcz8w
         Tvud8MK2+k07uZkWlsGEjdaMJqDYeaTlQ2eYb3HHk6LplBD6BkPdwCYHEr0odz8tGUme
         OG7g==
X-Forwarded-Encrypted: i=1; AJvYcCUzr7SkBXWGQDEpHB/RzoXd7mDtOYuP610wwtqjjW85XnZtlalOG08kts6rkvewEJsxWP7CRon6BmAiYci8@lists.infradead.org
X-Gm-Message-State: AOJu0YxyS6UF3HiE6C2qwhdEfZ0aTW4Vg3+hvctJbn9szRUmNxq2fQM3
	R+mY3jeDLfour1N6u+YB+AL1gXeAv2uTPYldQiiZDrVX05D3HGI/7c7yXi/ZqXkz/ZU=
X-Gm-Gg: ASbGnct+WQLqFmiVJupHQWxfr9JQZ1UV6B9IK4cYoM21DVZSA5mLNj8Sz9OytRULYk5
	8No0+jNhtb3hiu30iIjnu22s3MGCj5flQCqvzFFb4f83ZmWFfFJQ7uixtGNU657oJVyOFP99bNW
	zWcwm1GMziIdyBKHl+ADHWp8DBX8cmXV9bfznx2NFTeIRU3Y4OMz5njolmF7eHd0bLI22qjkqOA
	OBCggPJkcdhewS+grAV/ZT4G9YgzePGaT9Fp05dENadjdDPptuaVVq5dSdzti572cd0NeyZnHv7
	rBYpDisfuf+XBhneHX1UdBVu+RzLv4YGEN+OXHzM0suzBT/jB/lTkgnX+0IFyy6xRNJvnV6tzm3
	upzcf/p9B/cudQExTmN05Rw==
X-Google-Smtp-Source: AGHT+IEIdRGgKrmg9eIPwusMN4coMc3y/Fl5QTtPAy4hr0BEuWlRYIqpATHkHHaKQ/oVeyqsm4Wl5g==
X-Received: by 2002:a5d:5f52:0:b0:3a4:dcfb:6f98 with SMTP id ffacd0b85a97d-3a4f8984976mr4415811f8f.14.1748951852870;
        Tue, 03 Jun 2025 04:57:32 -0700 (PDT)
Received: from [172.16.23.13] (adsl-84-227-104-5.adslplus.ch. [84.227.104.5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe6c7adsm17671666f8f.26.2025.06.03.04.57.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 04:57:32 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 03 Jun 2025 13:57:11 +0200
Subject: [PATCH 4/5] dt-bindings: mailbox: nvidia,tegra186-hsp: Use generic
 node name
MIME-Version: 1.0
Message-Id: <20250603-dt-bindings-mailbox-cleanup-v1-4-724407563997@linaro.org>
References: <20250603-dt-bindings-mailbox-cleanup-v1-0-724407563997@linaro.org>
In-Reply-To: <20250603-dt-bindings-mailbox-cleanup-v1-0-724407563997@linaro.org>
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Nishanth Menon <nm@ti.com>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Sven Peter <sven@svenpeter.dev>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Suman Anna <s-anna@ti.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, asahi@lists.linux.dev, 
 linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1323;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=H+6vQ8kkEeYZu8N/t6R0JhPBnLddxAjO0+PqCquNCao=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoPuMeEkx3emRaicraRsdlG7Qk+79kckwyGvqvt
 XqsNEE9H/CJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaD7jHgAKCRDBN2bmhouD
 18v0D/9K1Jmn28bJcnZym4p7/2l524kGy0WHkj1kJ7p663rVCLXVsBqAtmClz1Ha+PdTJMfdeEd
 MfIY8cyQL0enStoD7Qwhc0OKP+kdk2x81uco+5g8XkwZw00MqrEV6xeQ/a+584D4uM9Y4mUuzpY
 xb0R6Rzh06VO7eZWvGttFDTtgMPQEezaSJ0rXDyUbkjQLVY2BZ3oi73oZ0KuqA76/boFe5Iu68G
 HpxQAeT1mUZWCaf5+8v9+H3A1ad4qKHAQXylPTO29W0kWmEIGfWKmMnhZ97iks1gzkZVeaEz9sK
 Kicl/QruPMpE1oCHrMwmoQXNl4Wrx1YJmyxGKFhg97uOzpZTnEP2P54wvwE2FD2Tpt2T4dpItgS
 La4JmIJO1MTb2CWQBy42+ymq/Rus7qrUH8VsbNUZIhYtz5z8snJFzzzfD9LQFhcs31ufhfATuPB
 aakw+bOPf9khBRBGBkqPpfKoHTg/T+5wJPmNdT3BSHz+3o+Zx7x0PPO5fCa/G62Cvf2rQKGipUq
 Ow7hIntbw4FA8pe79J8wK3mK0JY0aCydyWV76u9g7W4CbBKeiq5l1gOJDPqncQ8Hv/HLQrAt0ny
 L+cdfkucZCFNmHgazW46Bdxf4u6CuN8JHeIIXwPBYPqmm7clEHdJ2OsrfYhvp2P3Xt+bBdTJLjo
 6Cv9kBlwsqkJehQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_045734_660531_BCD8E633 
X-CRM114-Status: UNSURE (   9.17  )
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

According to Devicetree specifications, device node names should be
generic, thus Mailbox provider should be called "mailbox", not "hsp".

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.yaml | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.yaml b/Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.yaml
index 2d14fc9489998a8dbe5356e2422748a228693d7a..e1a44e4ae6f91eaa1cd81b357e9e5caeaaf0f5bb 100644
--- a/Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.yaml
+++ b/Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.yaml
@@ -59,9 +59,6 @@ description: |
         <dt-bindings/mailbox/tegra186-hsp.h>
 
 properties:
-  $nodename:
-    pattern: "^hsp@[0-9a-f]+$"
-
   compatible:
     oneOf:
       - const: nvidia,tegra186-hsp
@@ -111,7 +108,7 @@ examples:
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/mailbox/tegra186-hsp.h>
 
-    hsp_top0: hsp@3c00000 {
+    hsp_top0: mailbox@3c00000 {
         compatible = "nvidia,tegra186-hsp";
         reg = <0x03c00000 0xa0000>;
         interrupts = <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>;

-- 
2.45.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
