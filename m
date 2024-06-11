Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BB24C25B76
	for <linux-amlogic@archiver.kernel.org>; Tue, 11 Jun 2024 13:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vPubRTUoWcvBmR2KkTxpbryPdxUsDiNyD4Nbuw8HQL0=; b=FMuhEsapahSfvN
	x3Alsv5FfSTeb3+7mjUiHfuRdYaOMyTToUSHYJUxTSsCUW0Z96JqR6e8b7R+ReNOw1TCmf0ceRJJN
	uyLw1tMNq8yoeaaauZJv7B/QMXLLmN9aaJvr6djxNLPKZkSpUEk20TU04OELqxumA6sOBn9yNTC8a
	e7EMvJcmZ0zoCF6kLGFbHaMiuFCu3qm8r4AdWJqxV3+OmaK0rf2es0bKoXZZiUjNu8qtms3ldUyqk
	QP0kah03qeWg2D8tgQFO4iE6YMMME73/7+2lTENeHyf2yLZLlnEEEom9Rynu10Ry/eGl6F8UrwVvS
	DbOF+LDzMRGkiB+Zqhfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sH1es-0000000913K-1X2D;
	Tue, 11 Jun 2024 13:35:30 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sH1eo-0000000910Y-05VX
	for linux-amlogic@lists.infradead.org;
	Tue, 11 Jun 2024 13:35:28 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2ebe785b234so20411881fa.1
        for <linux-amlogic@lists.infradead.org>; Tue, 11 Jun 2024 06:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718112922; x=1718717722; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=H8QDeS52Z8AMlWRKMLQ8N+MaKcddL0RJGmQ+tlm1Cp0=;
        b=n/UHOeS2KQZxFE7cw1pQril23FfJlJpODCnKpKxB9ezjWZwzmXZZul9HaO7uahNk8V
         8AawP/U7SRAmUbV923HpL6Y951euajbVJ8dZe2WxcmWFHA7FrWw3S1PTERpwyaCZhHhl
         nASGEoe5yujfeybA1m4LOsGftC+dj0DkkxyX7cR2O31UL3/HNGl7l8OHtGPFOcHm553F
         tXMPnr9invBFTZjI9aVr0GFWRV1Dd5aqFTACpSnM5q2g3Py3n5pXSDBTXuQwJhTRmRPe
         2CPnMyQkTwjB22JrlhF2hEztsFTVk7uK2QMhHIkhMueydg4JjPLrrx2UvdnpwpAQyl4w
         /t/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718112922; x=1718717722;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H8QDeS52Z8AMlWRKMLQ8N+MaKcddL0RJGmQ+tlm1Cp0=;
        b=EDKoRbCTYg1F49Y2W6EioSm9JMl7UWG46sp0Da8FmkfS1AF63/eZGCy4TrBbc8CSWf
         2nYfLxyhSUeb3PfgeRdZQZnMUMgqgsgcOOSBCBRni4DJIivmGWBprMgt3KHt6OhFZRuj
         0QClJO4r0OMAuZXhgpK8Y8WDgjxWK6F8wdBiv6RE8/Ccj1GTJcw/6duBRZRCcRpTCx/C
         xqT4aUoCegB9gYHOXMiGCfaVIu+m+zxOv6mcg/ZwH0zRAI9HaKmnH+GXA7V1fW4iNImB
         zl//gsP+b49uFqO/oUIGPeQJ0bYKXxytEu9n7IejGAVWMzIa6XiZRkl3Tq/TZaN3NTuo
         HHsg==
X-Forwarded-Encrypted: i=1; AJvYcCV6dxklhNTq410k/dwYAJyV74FtJrye4JyxpczSckX3aGLFMhLo6RlqCqyfA0zVqesgFzWrapSA53tQ2KdlGHpRKg2NDrBBOkKAtgz5HQ/cXkI=
X-Gm-Message-State: AOJu0YwJOBxIHKOYbbE+vS7zBZJ8YkGzi4FJyFqeQztu8Z6udomMbWya
	xrEk+O85ik7Me8BUbBLDUKCrEOzGKgY0Nr8cAz+fzyBupDQIET97oQvwCLQUhs8=
X-Google-Smtp-Source: AGHT+IFYXJL8gSHUGZhhV7TvyGBajrxwHaxnUpJkWCNrjteJ0gG8Kk8wjsEIGqil2U66IxgDoS/SNA==
X-Received: by 2002:a2e:7a06:0:b0:2eb:dba0:6772 with SMTP id 38308e7fff4ca-2ebdba071a5mr53285941fa.37.1718112922031;
        Tue, 11 Jun 2024 06:35:22 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:6945:4110:d128:827])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4215c1aa1desm179497315e9.11.2024.06.11.06.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 06:35:21 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org,
	Jeff Johnson <quic_jjohnson@quicinc.com>
Subject: [PATCH] clk: meson: add missing MODULE_DESCRIPTION() macros
Date: Tue, 11 Jun 2024 15:35:08 +0200
Message-ID: <20240611133512.341817-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240611_063526_188590_25601643 
X-CRM114-Status: UNSURE (   9.37  )
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

Add the missing MODULE_DESCRIPTION() in the Amlogic clock modules missing
it.

Reported-by: Jeff Johnson <quic_jjohnson@quicinc.com>
Closes: https://lore.kernel.org/linux-clk/964210f1-671f-4ecc-bdb7-3cf53089c327@quicinc.com
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/a1-peripherals.c   | 3 ++-
 drivers/clk/meson/a1-pll.c           | 3 ++-
 drivers/clk/meson/axg-aoclk.c        | 3 ++-
 drivers/clk/meson/axg.c              | 3 ++-
 drivers/clk/meson/c3-peripherals.c   | 3 ++-
 drivers/clk/meson/c3-pll.c           | 3 ++-
 drivers/clk/meson/g12a-aoclk.c       | 3 ++-
 drivers/clk/meson/g12a.c             | 3 ++-
 drivers/clk/meson/gxbb-aoclk.c       | 2 ++
 drivers/clk/meson/gxbb.c             | 3 ++-
 drivers/clk/meson/meson-aoclk.c      | 2 ++
 drivers/clk/meson/meson-clkc-utils.c | 1 +
 drivers/clk/meson/meson-eeclk.c      | 2 ++
 drivers/clk/meson/s4-peripherals.c   | 3 ++-
 drivers/clk/meson/s4-pll.c           | 3 ++-
 15 files changed, 29 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/meson/a1-peripherals.c b/drivers/clk/meson/a1-peripherals.c
index 621af1e6e4b2..99b5bc450446 100644
--- a/drivers/clk/meson/a1-peripherals.c
+++ b/drivers/clk/meson/a1-peripherals.c
@@ -2240,8 +2240,9 @@ static struct platform_driver a1_periphs_clkc_driver = {
 		.of_match_table = a1_periphs_clkc_match_table,
 	},
 };
-
 module_platform_driver(a1_periphs_clkc_driver);
+
+MODULE_DESCRIPTION("Amlogic A1 Peripherals Clock Controller driver");
 MODULE_AUTHOR("Jian Hu <jian.hu@amlogic.com>");
 MODULE_AUTHOR("Dmitry Rokosov <ddrokosov@sberdevices.ru>");
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/meson/a1-pll.c b/drivers/clk/meson/a1-pll.c
index 90b0aeeb049c..a16e537d139a 100644
--- a/drivers/clk/meson/a1-pll.c
+++ b/drivers/clk/meson/a1-pll.c
@@ -354,8 +354,9 @@ static struct platform_driver a1_pll_clkc_driver = {
 		.of_match_table = a1_pll_clkc_match_table,
 	},
 };
-
 module_platform_driver(a1_pll_clkc_driver);
+
+MODULE_DESCRIPTION("Amlogic S4 PLL Clock Controller driver");
 MODULE_AUTHOR("Jian Hu <jian.hu@amlogic.com>");
 MODULE_AUTHOR("Dmitry Rokosov <ddrokosov@sberdevices.ru>");
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/meson/axg-aoclk.c b/drivers/clk/meson/axg-aoclk.c
index e4d0f46f47f5..fa1dcb7f91e4 100644
--- a/drivers/clk/meson/axg-aoclk.c
+++ b/drivers/clk/meson/axg-aoclk.c
@@ -338,6 +338,7 @@ static struct platform_driver axg_aoclkc_driver = {
 		.of_match_table = axg_aoclkc_match_table,
 	},
 };
-
 module_platform_driver(axg_aoclkc_driver);
+
+MODULE_DESCRIPTION("Amlogic AXG Always-ON Clock Controller driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/meson/axg.c b/drivers/clk/meson/axg.c
index 52d610110e44..065b5f198297 100644
--- a/drivers/clk/meson/axg.c
+++ b/drivers/clk/meson/axg.c
@@ -2183,6 +2183,7 @@ static struct platform_driver axg_driver = {
 		.of_match_table = clkc_match_table,
 	},
 };
-
 module_platform_driver(axg_driver);
+
+MODULE_DESCRIPTION("Amlogic AXG Main Clock Controller driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/meson/c3-peripherals.c b/drivers/clk/meson/c3-peripherals.c
index ff17abe6a999..56b33d23c317 100644
--- a/drivers/clk/meson/c3-peripherals.c
+++ b/drivers/clk/meson/c3-peripherals.c
@@ -2359,7 +2359,8 @@ static struct platform_driver c3_peripherals_driver = {
 		.of_match_table = c3_peripherals_clkc_match_table,
 	},
 };
-
 module_platform_driver(c3_peripherals_driver);
+
+MODULE_DESCRIPTION("Amlogic C3 Peripherals Clock Controller driver");
 MODULE_AUTHOR("Chuan Liu <chuan.liu@amlogic.com>");
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/meson/c3-pll.c b/drivers/clk/meson/c3-pll.c
index 44b20bf4deac..6d5271c61d14 100644
--- a/drivers/clk/meson/c3-pll.c
+++ b/drivers/clk/meson/c3-pll.c
@@ -740,7 +740,8 @@ static struct platform_driver c3_pll_driver = {
 		.of_match_table = c3_pll_clkc_match_table,
 	},
 };
-
 module_platform_driver(c3_pll_driver);
+
+MODULE_DESCRIPTION("Amlogic C3 PLL Clock Controller driver");
 MODULE_AUTHOR("Chuan Liu <chuan.liu@amlogic.com>");
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/meson/g12a-aoclk.c b/drivers/clk/meson/g12a-aoclk.c
index 58976ed8b92a..a5f4d15d8396 100644
--- a/drivers/clk/meson/g12a-aoclk.c
+++ b/drivers/clk/meson/g12a-aoclk.c
@@ -473,6 +473,7 @@ static struct platform_driver g12a_aoclkc_driver = {
 		.of_match_table = g12a_aoclkc_match_table,
 	},
 };
-
 module_platform_driver(g12a_aoclkc_driver);
+
+MODULE_DESCRIPTION("Amlogic G12A Always-ON Clock Controller driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index 56e66ecc306e..4647e84d2502 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -5612,6 +5612,7 @@ static struct platform_driver g12a_driver = {
 		.of_match_table = clkc_match_table,
 	},
 };
-
 module_platform_driver(g12a_driver);
+
+MODULE_DESCRIPTION("Amlogic G12/SM1 Main Clock Controller driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/meson/gxbb-aoclk.c b/drivers/clk/meson/gxbb-aoclk.c
index dbda563729db..33fafbdf65c4 100644
--- a/drivers/clk/meson/gxbb-aoclk.c
+++ b/drivers/clk/meson/gxbb-aoclk.c
@@ -300,4 +300,6 @@ static struct platform_driver gxbb_aoclkc_driver = {
 	},
 };
 module_platform_driver(gxbb_aoclkc_driver);
+
+MODULE_DESCRIPTION("Amlogic GXBB Always-ON Clock Controller driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
index 29507b8c4304..d3175e4335bb 100644
--- a/drivers/clk/meson/gxbb.c
+++ b/drivers/clk/meson/gxbb.c
@@ -3567,6 +3567,7 @@ static struct platform_driver gxbb_driver = {
 		.of_match_table = clkc_match_table,
 	},
 };
-
 module_platform_driver(gxbb_driver);
+
+MODULE_DESCRIPTION("Amlogic GXBB Main Clock Controller driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/meson/meson-aoclk.c b/drivers/clk/meson/meson-aoclk.c
index b8a9d59e6726..2dd064201fae 100644
--- a/drivers/clk/meson/meson-aoclk.c
+++ b/drivers/clk/meson/meson-aoclk.c
@@ -89,4 +89,6 @@ int meson_aoclkc_probe(struct platform_device *pdev)
 	return devm_of_clk_add_hw_provider(dev, meson_clk_hw_get, (void *)&data->hw_clks);
 }
 EXPORT_SYMBOL_GPL(meson_aoclkc_probe);
+
+MODULE_DESCRIPTION("Amlogic Always-ON Clock Controller helpers");
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/meson/meson-clkc-utils.c b/drivers/clk/meson/meson-clkc-utils.c
index 7370644e8092..4dd5948b7ae4 100644
--- a/drivers/clk/meson/meson-clkc-utils.c
+++ b/drivers/clk/meson/meson-clkc-utils.c
@@ -22,4 +22,5 @@ struct clk_hw *meson_clk_hw_get(struct of_phandle_args *clkspec, void *clk_hw_da
 }
 EXPORT_SYMBOL_GPL(meson_clk_hw_get);
 
+MODULE_DESCRIPTION("Amlogic Clock Controller Utilities");
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/meson/meson-eeclk.c b/drivers/clk/meson/meson-eeclk.c
index 3cbc7f233bba..570992eece86 100644
--- a/drivers/clk/meson/meson-eeclk.c
+++ b/drivers/clk/meson/meson-eeclk.c
@@ -58,4 +58,6 @@ int meson_eeclkc_probe(struct platform_device *pdev)
 	return devm_of_clk_add_hw_provider(dev, meson_clk_hw_get, (void *)&data->hw_clks);
 }
 EXPORT_SYMBOL_GPL(meson_eeclkc_probe);
+
+MODULE_DESCRIPTION("Amlogic Main Clock Controller Helpers");
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/meson/s4-peripherals.c b/drivers/clk/meson/s4-peripherals.c
index 73340c7e815e..130c50554290 100644
--- a/drivers/clk/meson/s4-peripherals.c
+++ b/drivers/clk/meson/s4-peripherals.c
@@ -3809,7 +3809,8 @@ static struct platform_driver s4_driver = {
 		.of_match_table = clkc_match_table,
 	},
 };
-
 module_platform_driver(s4_driver);
+
+MODULE_DESCRIPTION("Amlogic S4 Peripherals Clock Controller driver");
 MODULE_AUTHOR("Yu Tu <yu.tu@amlogic.com>");
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/meson/s4-pll.c b/drivers/clk/meson/s4-pll.c
index 707c107a5291..c2afade24f9f 100644
--- a/drivers/clk/meson/s4-pll.c
+++ b/drivers/clk/meson/s4-pll.c
@@ -868,7 +868,8 @@ static struct platform_driver s4_driver = {
 		.of_match_table = clkc_match_table,
 	},
 };
-
 module_platform_driver(s4_driver);
+
+MODULE_DESCRIPTION("Amlogic S4 PLL Clock Controller driver");
 MODULE_AUTHOR("Yu Tu <yu.tu@amlogic.com>");
 MODULE_LICENSE("GPL");
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
