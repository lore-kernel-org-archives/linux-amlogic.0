Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6939BC46467
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Jan 2023 20:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1bTGPm1dH66X39a8HyNoC9vUhhUUNvv4n/mgUgnqDqg=; b=Z9SKkaAcXOaNcG
	2/JYpXZVfhdXXfdKwgntmoVxCfyY8Z1ZcdlUMvQIR0P6nMM6oh0xq80sNN56/W/jK9ClKhSiAw0dt
	ee8pVa8T2HWjifyofDILSFxHZW+7XyZq765/Q256kxLMXOPYWxCp831ciAbcvAP6V6sxKE4dfB6Bh
	Oe/gDdIHs5AeBTVGzUDgDOdCxfVq4HicQleBhd0/KvEdaZkfS0P47bjW3aWLqj3oEWoIk9OQXCPlP
	cEiU7xyEU/Us0MvHPJaQ2ftqbl8ZUa21fzC1t6FZsM209P9+K2G5Qci4vmH9S+L3UudRxL4ysKGSH
	jn0k2wWZ/j1t+j4ukYFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHVzC-00BxoP-M3; Mon, 16 Jan 2023 20:21:42 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHVz1-00Bxkr-Lv; Mon, 16 Jan 2023 20:21:33 +0000
Received: by mail-wm1-x334.google.com with SMTP id o17-20020a05600c511100b003db021ef437so1627141wms.4;
        Mon, 16 Jan 2023 12:21:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xH7zwAfFsU4hSOt8Nu/uXInG1jqijJGp3H2KKy8TUCA=;
        b=AhW5C8erIYLnVM/z5phd56SYA3W4rHNlLxv2AW2UT7iFSnlvz1a88TvTOVx4NdYfG/
         30IqlEYD57aiwtNPanCJlD5VMeQ8sdLBGexl4dpFHpNlNuE+BedfmoJ0S6/PsaKj91Gm
         jwG4+rQ5ye1IO0LoqX+yopQG9YXHzWDDaue8e6G6lJRwTBVOe7G1f3UzgLKzShVhEui5
         cCDpLU5iPDDdvnVmVYxWGuBFTT6w0FQ10tr8Rit0ImGFT/uWgmZTE3ZrGhn5WUghcR+n
         xUl+oWfKFFVu0j5hV9UlGlW5CEQZS8LgB3gSxAxv6KFmPYVXsbrtYwriWeG8FcOfoS7L
         FimQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xH7zwAfFsU4hSOt8Nu/uXInG1jqijJGp3H2KKy8TUCA=;
        b=vrK3ISfOdJ3Igqp93XxrtHdGO7gL7PvoEN/oMW7ZjYpI54tQ7LBpPE/9BYxp4YM4UR
         sE72f7WM+wvCI9zJ+CPj7z/AD8IWJtOFRQJ5xd7AO+EY8dWY2Wd9v1x1Dv/7Ie7Bvrbp
         Q5Rj+IGJhwRbhiHQzY5QK0oEkHp+mbeZ/jH0tYtvRK6UYNdRs88fNy8p6l47DNxHVKUx
         6yUo98W2ttVExNdNFYk3/NkepOhL0LtKCQMvtcJJkDQdxzFTGaQP0Ejr+C5dY5PGZ3zz
         Oge3PhIDkVXB3bAaYi13QUjQXVr2jHpnEOD35ezWlWrumEnm1F9TM6ewIEFrdxH04TCl
         /LOA==
X-Gm-Message-State: AFqh2kqVTDvnHywIiSlBNvbrx1JTHnx6Si9Tc9KgflwKKVm6FXtZx9YU
	POMkJ3x3AyTU04zNaw2+suM=
X-Google-Smtp-Source: AMrXdXu0FqeVt0rkHCQ33xM0TzpeYE00MhqFIfpgSguQRDu5mEab3TosOT8ycH0pOOMnXOZ6H8zIdQ==
X-Received: by 2002:a05:600c:34ce:b0:3db:25f:be9e with SMTP id d14-20020a05600c34ce00b003db025fbe9emr638147wmq.33.1673900487005;
        Mon, 16 Jan 2023 12:21:27 -0800 (PST)
Received: from ?IPV6:2a01:c23:c4bc:ff00:1041:a2b8:3c58:ba6d? (dynamic-2a01-0c23-c4bc-ff00-1041-a2b8-3c58-ba6d.c23.pool.telefonica.de. [2a01:c23:c4bc:ff00:1041:a2b8:3c58:ba6d])
        by smtp.googlemail.com with ESMTPSA id j18-20020a05600c191200b003d9dee823a3sm38095616wmq.5.2023.01.16.12.21.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jan 2023 12:21:26 -0800 (PST)
Message-ID: <8d960029-e94d-224b-911f-03e5deb47ebc@gmail.com>
Date: Mon, 16 Jan 2023 21:17:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v2] dt-bindings: phy: g12a-usb2-phy: fix compatible string
 documentation
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-phy@lists.infradead.org,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230116_122131_749090_8D6ED134 
X-CRM114-Status: UNSURE (   7.26  )
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

The compatible strings in the driver don't have the meson prefix.
Fix this in the documentation and rename the file accordingly.

Fixes: da86d286cce8 ("dt-bindings: phy: meson-g12a-usb2-phy: convert to yaml")
Cc: stable@vger.kernel.org
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
v2:
- align $id with new file name
---
 ...eson-g12a-usb2-phy.yaml => amlogic,g12a-usb2-phy.yaml} | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename Documentation/devicetree/bindings/phy/{amlogic,meson-g12a-usb2-phy.yaml => amlogic,g12a-usb2-phy.yaml} (85%)

diff --git a/Documentation/devicetree/bindings/phy/amlogic,meson-g12a-usb2-phy.yaml b/Documentation/devicetree/bindings/phy/amlogic,g12a-usb2-phy.yaml
similarity index 85%
rename from Documentation/devicetree/bindings/phy/amlogic,meson-g12a-usb2-phy.yaml
rename to Documentation/devicetree/bindings/phy/amlogic,g12a-usb2-phy.yaml
index f3a5fbabb..bb01c6b34 100644
--- a/Documentation/devicetree/bindings/phy/amlogic,meson-g12a-usb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/amlogic,g12a-usb2-phy.yaml
@@ -2,7 +2,7 @@
 # Copyright 2019 BayLibre, SAS
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/phy/amlogic,meson-g12a-usb2-phy.yaml#"
+$id: "http://devicetree.org/schemas/phy/amlogic,g12a-usb2-phy.yaml#"
 $schema: "http://devicetree.org/meta-schemas/core.yaml#"
 
 title: Amlogic G12A USB2 PHY
@@ -13,8 +13,8 @@ maintainers:
 properties:
   compatible:
     enum:
-      - amlogic,meson-g12a-usb2-phy
-      - amlogic,meson-a1-usb2-phy
+      - amlogic,g12a-usb2-phy
+      - amlogic,a1-usb2-phy
 
   reg:
     maxItems: 1
@@ -68,7 +68,7 @@ additionalProperties: false
 examples:
   - |
     phy@36000 {
-          compatible = "amlogic,meson-g12a-usb2-phy";
+          compatible = "amlogic,g12a-usb2-phy";
           reg = <0x36000 0x2000>;
           clocks = <&xtal>;
           clock-names = "xtal";
-- 
2.39.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
