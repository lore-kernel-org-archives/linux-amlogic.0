Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFB48C61D97
	for <linux-amlogic@archiver.kernel.org>; Fri, 24 Nov 2023 09:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=H/27B4GPc3XOPYRuQkGcucWTYIZJzEDXVYr/+Rj2X88=; b=4eJKghd/rm7mZ3
	vCy+nwQjy6MQhNB4QXfYgXweAdFz/vCYWskwmPR/8bAYeiDEJCgXhKV5wDOQFx2mf17DkBrFqt4z2
	6DVn9vz2ygXdVsPnsoHxBv1f/y33zuhQq45TBduGKoHjoP4z2lz2JumX6W6en4i0UqCn7sUdZKKLy
	lgbv1AfjzpUKrOvw+FUvzXeImkZ+d5MhGGy1h00C/MfzY0GVtM3VJH2qZS4HFLfxUUHsTnscoha91
	Vq5g7H9IlTSJ+pVXNYH9HcV0ZEuIfdtQVCabLvGyd+HFdfydgJAb6u/JSJTzHD/CxZVygWF3ESwa1
	HLjurd3WO5IQEeJoXzQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6Smr-006ik5-1s;
	Fri, 24 Nov 2023 09:47:49 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6Smo-006ii9-2k
	for linux-amlogic@lists.infradead.org;
	Fri, 24 Nov 2023 09:47:48 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-a06e59384b6so186781066b.1
        for <linux-amlogic@lists.infradead.org>; Fri, 24 Nov 2023 01:47:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700819264; x=1701424064; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9+ThUuyBMc8tE0TTrcKzb0NqRa+0wf0OPRYLrcEY5ZA=;
        b=k6tcWUU+v+wtZvzpcGg+V6vEX4wAR9gTb1wBjLx9jlzGa4SxJ1HFh1WXhcyhmkjwE9
         EXL3ZQpGKS9ETLIBw+M/PrqvATBKHSIpDQ++fZIOojdrQhOdDY5toidQ8H8vkbpNxQHv
         a9BXJKLn5+noBSkcJzI8vBq2UtZjh3IHezBMm1OLZ+4MXZqwXsbi/1J3nzPiM5/1A5Wp
         7eAwLK2F2KrwL4obOAihWWllgid754HWvUyX6P4Prwp5TDzjWL9838REyTXPEQPGzhbN
         v30RcJ9K9cbakXh0YE/8By6zNk7fjW0UAbWfhIubc7QL35zEHc2byn1oBtLLwFZ5SndA
         BPgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700819264; x=1701424064;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9+ThUuyBMc8tE0TTrcKzb0NqRa+0wf0OPRYLrcEY5ZA=;
        b=Axf4Yj3+gDn+cELOFgQqcj+ty8xnDxHJppBThynj/ceNJqf4AkD4qK4x4EuKug37TY
         XpojPLgT+yTefCv0RCcAA1gBvhWPs6R79f5jyCAG0G6IHRb7clgRg67oF3MJLEoq+AlX
         lRG3OXGSPGEeoMi3/8Ix9G6QNFyapGHtrgIVf5SA9sNIXaYAlgqdunfc7ZiQJJUy7mre
         UH2jK6zi8oXn7dmHS+5Yws+xiKHyVR9cwF7m9xPkAf+Pfim1bczuYb7vHfdVS03EeKfH
         1EmYAYyMvvab3A5bPlif3uJrxL60nSq/QtVVuyON4L8p/MqxgpjOg+Dtw/QC6muAyVR1
         NR2Q==
X-Gm-Message-State: AOJu0YxZWxPaVLwPnhsZUiJcZ9z3lsJf3gJ+tXAF/l8Z0cWWU9QG4t8g
	wNXdQTlpQSWd2Vv4Lt++J3o0Bg==
X-Google-Smtp-Source: AGHT+IHiC5jOSc+vYNtalwC9n1F+/QoS4nBpsEIqcldYuy36Nbcsh8V81quxWNDRZ8JD4MVzRbIwMA==
X-Received: by 2002:a17:906:7f96:b0:9c2:a072:78c4 with SMTP id f22-20020a1709067f9600b009c2a07278c4mr1615067ejr.25.1700819264730;
        Fri, 24 Nov 2023 01:47:44 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.100])
        by smtp.gmail.com with ESMTPSA id gr19-20020a170906e2d300b009de11bcbbcasm1859767ejb.175.2023.11.24.01.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 01:47:44 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] arm64: dts: ti: minor whitespace cleanup around '='
Date: Fri, 24 Nov 2023 10:47:38 +0100
Message-Id: <20231124094739.58163-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231124_014746_888769_CD2BB490 
X-CRM114-Status: UNSURE (   9.74  )
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

The DTS code coding style expects exactly one space before and after '='
sign.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/ti/k3-am69-sk.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am69-sk.dts b/arch/arm64/boot/dts/ti/k3-am69-sk.dts
index 9868c7049bfb..d6a7ae086244 100644
--- a/arch/arm64/boot/dts/ti/k3-am69-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am69-sk.dts
@@ -671,7 +671,7 @@ exp1: gpio@21 {
 		reg = <0x21>;
 		gpio-controller;
 		#gpio-cells = <2>;
-		gpio-line-names	= "BOARDID_EEPROM_WP", "CAN_STB", "GPIO_uSD_PWR_EN",
+		gpio-line-names = "BOARDID_EEPROM_WP", "CAN_STB", "GPIO_uSD_PWR_EN",
 				"IO_EXP_MCU_RGMII_RST#", "IO_EXP_PCIe0_4L_PERST#",
 				"IO_EXP_PCIe1_M.2_RTSz", "IO_EXP_PCIe3_M.2_RTSz",
 				"PM_INA_BUS_EN", "ENET1_EXP_PWRDN", "EXP1_ENET_RSTz",
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
