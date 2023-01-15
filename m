Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34BDAC46467
	for <linux-amlogic@archiver.kernel.org>; Sun, 15 Jan 2023 14:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=E4qJytwijjSa+mJrFI1IyPCMQpq3Rp4oBp5hOA3Z9P4=; b=Jdl+zwvguRJBrx
	h39467J7Ra8SQ2hgAD+1Sj9RrJMWyYRruqN/WjHo2ctlbcGivjNBJqrgmZR/eVSm1R0Kct9F0bRT+
	vmRQKygDkcWH9o0qjz5oMUB1wMa7jEBj0b9ThUEapqDoyGM/EURvzlX5cDwhu0LMTve2dXHzLMnZo
	8rGhc0GIjYUdw0lmMzrxMNaY7d4ymSzZVyl3gbE3SYEcfx0SAFdi8upT5Tp/YHYzyC5DEKn3SrvUJ
	y8E/jwhmcVDm5KZqRTFvRkDTSysUqVKbb6zbh4dsRKEWwGT1rvbEBupJzr1MlmFlMuHpkfWbH3aBI
	X1PvWIHJ5H2E2XqGi6iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pH3w2-007RSi-7u; Sun, 15 Jan 2023 14:24:34 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pH3vq-007RQu-PX; Sun, 15 Jan 2023 14:24:24 +0000
Received: by mail-wm1-x32f.google.com with SMTP id z8-20020a05600c220800b003d33b0bda11so2820720wml.0;
        Sun, 15 Jan 2023 06:24:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zPB9krp6eiC7JbYL+IhgTGE/R+STIoi/Z4Ow6TqzdnE=;
        b=p16Cx1eLPV5Q9j8Bf/WMOcz2U66PM1w/fra68F60TnFnXzJ4vZQJgZYY3RSU/fCM7A
         CQKRFtbL0/F1WRCL2h035+w8yYHtHLTcFAvYoTLgqyKZykntxaAl/uB/O63id+MOFQ5D
         W6jQNnMjIAwDyj5b4ntxWIE7FeniUlyW2a6JiRiKSXRg5Y0T9n+H6GbyZ9/SoluX+Mib
         vSJRGESJt4fpkew78EQnBUb4CQhSFri5JAwj5LBxxNBrz18xCt3oy7h/+iduNoU+4OyO
         JmFvlCeLe1w3r8auSl/+rV/SjSXUZ9VyiDjZhtjRp0XgK5lbc2Khhfk0+D1C3rB1aa8N
         ouKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zPB9krp6eiC7JbYL+IhgTGE/R+STIoi/Z4Ow6TqzdnE=;
        b=DO7c1c7VQPDymlY909aklbrOKqUHc1nVpmAmQAs1OzjOelSqUaXjzMYWK9oWtnwwk8
         tXgqLJa/vJyzHCiUC9iLCDasgEwMBaXOZ8sSOErbld38V1bnFDXnxAadxSUXyBSZum6G
         xIoWtfrnOzdc1aEpWZ1LoFVZaMM7r2OYtGkwwzaeVkm68jxTaxEp2z4P4GiVA+79n1LS
         Hb3eTnZqhLJALHjAOyw4JofiBzeORMep3e7yrDyXFxmiGTo59+oLp8/6a62wOXEj5X1l
         uobVvXZZqCYUo4WgEBiHunZSROLqTPtmHOXv39DsS5aU7RYnpmRGO6B+U1W3dfLISXFe
         nbgw==
X-Gm-Message-State: AFqh2kpEFRmOTbpUmbupTSOvvE32j12O7AyT8LGZP8XNHX4yuW+Xn1lt
	BbrxAmLCt736u4Sre34cUAWVRX2wuC0=
X-Google-Smtp-Source: AMrXdXsmQNYKO1JhaPJuv6ZlUsDcHrE/7WIDXiMd0eEr5+aDL7G2VdCUVsIMrhS22a+F0WvvkF4wHg==
X-Received: by 2002:a05:600c:a4f:b0:3d2:196c:270c with SMTP id c15-20020a05600c0a4f00b003d2196c270cmr67053230wmq.31.1673792661012;
        Sun, 15 Jan 2023 06:24:21 -0800 (PST)
Received: from ?IPV6:2a01:c22:6e61:8c00:154f:326e:8d45:8ce7? (dynamic-2a01-0c22-6e61-8c00-154f-326e-8d45-8ce7.c22.pool.telefonica.de. [2a01:c22:6e61:8c00:154f:326e:8d45:8ce7])
        by smtp.googlemail.com with ESMTPSA id o14-20020a5d58ce000000b002879c013b8asm23699826wrf.42.2023.01.15.06.24.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Jan 2023 06:24:20 -0800 (PST)
Message-ID: <fae86fd4-40f0-ce6f-f3ab-d5e0cff019c4@gmail.com>
Date: Sun, 15 Jan 2023 15:19:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH] dt-bindings: phy: g12a-usb2-phy: fix compatible string
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
X-CRM114-CacheID: sfid-20230115_062422_882750_CDF864DD 
X-CRM114-Status: UNSURE (   7.07  )
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
 ...,meson-g12a-usb2-phy.yaml => amlogic,g12a-usb2-phy.yaml} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename Documentation/devicetree/bindings/phy/{amlogic,meson-g12a-usb2-phy.yaml => amlogic,g12a-usb2-phy.yaml} (91%)

diff --git a/Documentation/devicetree/bindings/phy/amlogic,meson-g12a-usb2-phy.yaml b/Documentation/devicetree/bindings/phy/amlogic,g12a-usb2-phy.yaml
similarity index 91%
rename from Documentation/devicetree/bindings/phy/amlogic,meson-g12a-usb2-phy.yaml
rename to Documentation/devicetree/bindings/phy/amlogic,g12a-usb2-phy.yaml
index f3a5fbabb..19a0ddab0 100644
--- a/Documentation/devicetree/bindings/phy/amlogic,meson-g12a-usb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/amlogic,g12a-usb2-phy.yaml
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
