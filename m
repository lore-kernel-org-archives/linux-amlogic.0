Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89AAFC05027
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Jan 2023 08:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nK5L6Y2rW6GnjL/HOT/gQLysEMCqUEXZM6ZrQGs60N0=; b=clw5oesBd8Jbk/
	wJvDcNSzLIUmYb8rst8jW3execH0vmScysh0qpgs2Axd3jhssuoxl1L2GD9naHqBsSopIc9vtg9LS
	PalWhpTzGUBrCs0IlQ+zolCCP9OXwjNC+iTWidNWxBzAKQwM6y9Rz8YrVpDIsJCt4WkAZkRW0O7b4
	v2i7Qm7YjnN7ilKr54X+Y/0WWPDGtpHgtpt1G8BbDndhKp4EyTvjieQoMYxfB88vN7nDliEfdvqMH
	VeMXDmZjA/S4Sv28ulr0jDqBz1mhsjZhRYT+OwhwPjCXlGxHVJT1TY2oMWf+J9L/jzQBfkAyQc8KA
	cIrKEKTrCjVCAUK4rnWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pInDm-0099qK-EM; Fri, 20 Jan 2023 08:58:02 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pInDL-0099cU-5K
	for linux-amlogic@lists.infradead.org; Fri, 20 Jan 2023 08:57:37 +0000
Received: by mail-wm1-x32f.google.com with SMTP id o17-20020a05600c511100b003db021ef437so3110328wms.4
        for <linux-amlogic@lists.infradead.org>; Fri, 20 Jan 2023 00:57:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lLh9gLAmjmKtRy5q73jgqvg8UmN0Ojzfcs9IN4Tn3io=;
        b=HlOp+ZzuuUNGOd5tA2tWo3ZGkj59h25nLkmRpQfVDe/ZosO8xHcnoQ01C9MGhepaP7
         bDAEE7V9bEwWRM+0oWbiCmhFDBGWC+1nI189u+aNX/D2zvjgPY53uxsOpKyL9F2vbFir
         MUH9uJhYEVaUEqQb0cx8MapBMo7SI7xjAlmcs15hZAZIZaC8Mn9tYy1O5BfGHrpOaSAZ
         1zp6nU31KvCYSo+5LW4TkVufRzSyfgkqQ4MwnM3fupwfLfm6hf0DhPMwroyHGlQuwp3V
         9YCJH8sGLi73F8JFOoaNpdWz6qjnolIW9RaSKaonT+Rp7uPzgyw4jTXGDPMHFe7FViYW
         B15g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lLh9gLAmjmKtRy5q73jgqvg8UmN0Ojzfcs9IN4Tn3io=;
        b=FR6EKxEQi0xU9YodE8KqKsa8F3U70roz6Jo994ziBI9jjCevIKNL4w04fO7hAANNNY
         3DhgffF6FXwO4UkuJHNVeyC8nG2ej5AXGs2EZOOlrCpYAWy4ALE4fTy75MLhyqqtfc/8
         0NfTpP2zdltnW6NgN/x0c4C3hwg/OidWgaOvIGSj0AwMe4lhr+tfoIphvFHAZHf9GAmH
         7YHXBxhMn/bV9V3izsUgu0X9Gr9Q3pLUUhvTtjLj44zj4+WbPzUb3A5Ie4Fdav8RV2Pp
         /4D3F0T4a0aS/a+6g5R3/KwdRWCVHKzwy0IOVJDU+SOLu9Yv3GsTdYDuRXdESBis5thM
         wf/Q==
X-Gm-Message-State: AFqh2kr+tlBtTTOm2vgFUwH7KfUpM5zXj9aIIIweTY/iC+5aFPxTjEO1
	H/63uRsnO4oca95XT0YkPv2KEw==
X-Google-Smtp-Source: AMrXdXtPATBJIPGHO0muRWjbnexaaMeh6KMlt8hH9FxqJjkYVKtHLyQf4msXY2Ls0rl7zsDWKo4Zcw==
X-Received: by 2002:a05:600c:3b17:b0:3cf:7397:c768 with SMTP id m23-20020a05600c3b1700b003cf7397c768mr13153310wms.30.1674205051416;
        Fri, 20 Jan 2023 00:57:31 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id l18-20020a1c7912000000b003db00747fdesm1612040wme.15.2023.01.20.00.57.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 00:57:30 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Lars Povlsen <lars.povlsen@microchip.com>,
	Steen Hegelund <Steen.Hegelund@microchip.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	UNGLinuxDriver@microchip.com,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Tony Huang <tonyhuang.sunplus@gmail.com>,
	Li-hao Kuo <lhjeff911@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Masahiro Yamada <yamada.masahiro@socionext.com>,
	Markus Pargmann <mpa@pengutronix.de>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jaehoon Chung <jh80.chung@samsung.com>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	linux-actions@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] dt-bindings: mmc: correct pwrseq node names
Date: Fri, 20 Jan 2023 09:57:22 +0100
Message-Id: <20230120085722.171965-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230120085722.171965-1-krzysztof.kozlowski@linaro.org>
References: <20230120085722.171965-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230120_005735_384015_003B5623 
X-CRM114-Status: GOOD (  11.97  )
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

Node names should be generic and should not contain underscores.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/mmc/mmc-pwrseq-emmc.yaml   | 2 +-
 Documentation/devicetree/bindings/mmc/mmc-pwrseq-sd8787.yaml | 2 +-
 Documentation/devicetree/bindings/mmc/mmc-pwrseq-simple.yaml | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/mmc/mmc-pwrseq-emmc.yaml b/Documentation/devicetree/bindings/mmc/mmc-pwrseq-emmc.yaml
index 911a5996e099..588be73168fa 100644
--- a/Documentation/devicetree/bindings/mmc/mmc-pwrseq-emmc.yaml
+++ b/Documentation/devicetree/bindings/mmc/mmc-pwrseq-emmc.yaml
@@ -41,7 +41,7 @@ additionalProperties: false
 examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
-    sdhci0_pwrseq {
+    pwrseq {
       compatible = "mmc-pwrseq-emmc";
       reset-gpios = <&gpio1 12 GPIO_ACTIVE_LOW>;
     };
diff --git a/Documentation/devicetree/bindings/mmc/mmc-pwrseq-sd8787.yaml b/Documentation/devicetree/bindings/mmc/mmc-pwrseq-sd8787.yaml
index 3397dbff88c2..b35e00e8c65e 100644
--- a/Documentation/devicetree/bindings/mmc/mmc-pwrseq-sd8787.yaml
+++ b/Documentation/devicetree/bindings/mmc/mmc-pwrseq-sd8787.yaml
@@ -35,7 +35,7 @@ additionalProperties: false
 examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
-    wifi_pwrseq: wifi_pwrseq {
+    pwrseq {
       compatible = "mmc-pwrseq-sd8787";
       powerdown-gpios = <&twl_gpio 0 GPIO_ACTIVE_LOW>;
       reset-gpios = <&twl_gpio 1 GPIO_ACTIVE_LOW>;
diff --git a/Documentation/devicetree/bindings/mmc/mmc-pwrseq-simple.yaml b/Documentation/devicetree/bindings/mmc/mmc-pwrseq-simple.yaml
index 64e3644eefeb..00feaafc1063 100644
--- a/Documentation/devicetree/bindings/mmc/mmc-pwrseq-simple.yaml
+++ b/Documentation/devicetree/bindings/mmc/mmc-pwrseq-simple.yaml
@@ -55,7 +55,7 @@ additionalProperties: false
 examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
-    sdhci0_pwrseq {
+    pwrseq {
       compatible = "mmc-pwrseq-simple";
       reset-gpios = <&gpio1 12 GPIO_ACTIVE_LOW>;
       clocks = <&clk_32768_ck>;
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
