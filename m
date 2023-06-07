Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDFDBC7EE23
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Jun 2023 11:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3EU5tUM7/humzNP5wjpgFX2yYjBeggEFaniwPV0abMw=; b=OJU9TpnSEskk+I
	YD4j28n2Dn8tn2cGNVsaT3Ph5D0sxcNQBQyOlnmrzkplL4cnKS44jk2If68lcauIQYSO2lz1ww7G4
	vk4IvvKouak+bykKet2FZ0h102MK4wMKhMrPLBhUqKlLIYTQZExX/lQSs3JEB24sBUsHlvHofRefp
	cUS/WA/ZwfPJAcAyWFopMyc//eA4PbfjB73++MrDXwYjAdpaVoojjQ1MWik1IinaNI+0EHvCPJSLr
	fD9iSawpJ/iPKpc5wDbDVyapV6pt+5PerTfEYy8Fwqd7Rt3Bl/vNUWjCxvzjheTBdWMX18cEvF8NW
	ZhZCI0lXohNFpoC85jzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6rgR-005gxW-2R;
	Wed, 07 Jun 2023 11:50:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6rgQ-005gx3-1I
	for linux-amlogic@bombadil.infradead.org;
	Wed, 07 Jun 2023 11:50:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=+Lndesv8TY3zpBho5S2AngSkgWp3EvCO8f19S2YQJhs=; b=dlcJrN9o9udAH/WricxpQsv9Dd
	u9BunFk942deFKZmv+ywKd5aoZHl4fZDfGw8CAB7WJnmIZgXljc32vR0KN09fLaZEXFCWb0HP3/fj
	0wXlNsS7Xh8MAmdxGfA+QizhLA3m/LTacrTFb4g9UBqf7HdNv/gQoU4ioqSWW2HdVLBAb6n2qmVvX
	svzR0rR8/EZYLptcgB55pvlzZNFSRLAm8LfSrW/mODHJ/ynJuCvy7Ku6UP+q253Nj+Vfh2IbhP6up
	LR/xziASubL6tRMjjeXaXU1yuPf/d2HeFRpka0gGPC6mjN/iz81OLleZ+L4/egicq9Mf55QP/ZCZn
	xbT/4Azg==;
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6qqG-0057zI-2N
	for linux-amlogic@lists.infradead.org;
	Wed, 07 Jun 2023 10:56:45 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-3f6d7abe934so60388675e9.2
        for <linux-amlogic@lists.infradead.org>; Wed, 07 Jun 2023 03:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686135397; x=1688727397;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Lndesv8TY3zpBho5S2AngSkgWp3EvCO8f19S2YQJhs=;
        b=DxaMTiMgIx5dN3zV+ZMqE8LLzYkYT1VN+1ne0nkw0Yl27ZmYWq9ZAKjwza+cBlfJIf
         q0yWYSLNWVjc2GG9a0hyuwtziz7iioXGY5TCR6DJslIYSTw42Pu1UplRJermhQW1WZdj
         3DQ1+St5ZWtbtBBmWNPDkgga9lS7ckl8ZCTzfo1z/stTpVRgxEbs8ziowpgFrAMjdWmx
         aQOid92d/Ci+469aT0PPQY2KNgHtK5q0ZgLsNvxkj1UfOfiSEMuckjyn4XhvAIg0Z7PA
         bxoPa6nXM960/5xkGurlFAUy8jZmN34VP299rLrmhXd8bnJl1AL67K1qqtRyR31vJt4m
         gEUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686135397; x=1688727397;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Lndesv8TY3zpBho5S2AngSkgWp3EvCO8f19S2YQJhs=;
        b=PO8XOrRH8A5iSM3okmlV2UeT1j1R3txJlre2ThA+EtwfM7RhWXApglnOFbkuCJqQkm
         uo7oc+L65hKYFN+VjOkd+O8ndTkeZewXm5VmqWKZBbLMeYezxZkrcEUbmA8NviX42keP
         8j9nP+m1f11T5H8iJLWTFAfclj65LMwg1eJ5XpjEzg02dQ70zsFqjdg2UplozS5xNvVC
         dglh2+k6IIdc7tTZChEbCFHhVagi6XzK0a0JJwOJ9P3NkVDY3YkI9hEnCXrM3zwiJQex
         JEtKjjk+CUDRDS3Te/YSuFq1JamJtCNmRE7wAE2xUJLdpF6UD1aDjG3SQpRGq3qtf2I4
         CvCQ==
X-Gm-Message-State: AC+VfDzez2FNP3OiXgSlZq8ojODdGpTgR0GStrqGVd2z8MrchtzXB58B
	Drg0ZFCwAtlygALidQpj43iXMQ==
X-Google-Smtp-Source: ACHHUZ6qSi78NbG1hu2vzKtTf12eb69NQQtGbYW7nE0tFNONCsXLL3uknwiFhY9dZBDSdt34V45Iug==
X-Received: by 2002:a1c:6a12:0:b0:3f0:b1c9:25d4 with SMTP id f18-20020a1c6a12000000b003f0b1c925d4mr4424961wmc.21.1686135397444;
        Wed, 07 Jun 2023 03:56:37 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id i10-20020a05600c290a00b003f60faa4612sm1761879wmd.22.2023.06.07.03.56.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 03:56:37 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 07 Jun 2023 12:56:26 +0200
Subject: [PATCH 15/18] clk: meson: eeclk: move bindings include to main
 driver
MIME-Version: 1.0
Message-Id: <20230607-topic-amlogic-upstream-clkid-public-migration-v1-15-9676afa6b22c@linaro.org>
References: <20230607-topic-amlogic-upstream-clkid-public-migration-v1-0-9676afa6b22c@linaro.org>
In-Reply-To: <20230607-topic-amlogic-upstream-clkid-public-migration-v1-0-9676afa6b22c@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2909;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=Foo+HUE/eeDMaQAqSm4Rc+RrlD9xCOzKuPcU4sFaqN8=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkgGJUPXYHLirTnD19GQyIsNf/oWC2voT8fLRY8cnN
 urdOb+yJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZIBiVAAKCRB33NvayMhJ0aGaEA
 CRfY8iUu4QckYLYREX9gjzW9IR1xEz7rQPyJNCSx63yWFhSTFUdg17+oH2gdZysKSO0RZuNj81yM/o
 BO5/x3L506v1TtCXcK5suxuRRJC+BnQ/A8EqXxZXCOCEMgUDqEx0PQbywoPyH4muEsRRlVHi0uMkEo
 pzIaD0cj8pyBM5obSanPuoqBXcy00gnzHF2Gx71EFaV2iUIdYrMEJW9dyfiIn1fG1nUgWVrLvPS0Sh
 /ntViKcnd6lcWmsQFp7njQerYjBt//hNkjQ5Qemz2jbj0qYkxqqzxVJm3xxfx/a/5IMI4Cxh/vAGAT
 QxN3/dJMetpkwTK1r69+TsQie3xj7ug7mKBOKOqMX4Y8xrCkrD4Ek7qF7M5jlKtTvFTYxeW1Sz2OdZ
 9gZtoBZYQk5RNgKAxNQ+9Jtk9Z00rdOrrKzFk6v9rUvr0jqNUFPltYJlftW4a3C52sOeXmxaROYZnn
 ZPysxzcGy4a4uy/VCvzq1/NFgVT/sUiqzkaGfPk71+s/a1FrcTTQ3zAuyt5txvYYkzn9AhFe0HsQhM
 Rheykp0rgEjj0kgn9pgyjKe6nlYuXMsB72lW56Jh5bp74/APuT4pgoXOgv/VlXLJGrCE4O2UstNe6H
 r7o1oMHLDG5t/JaYDVPYyStW4FiLXvkNR2c5oeAYKV74BoxdIqG2lWgo8OLA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_115641_492907_04A81FA4 
X-CRM114-Status: GOOD (  11.61  )
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

Now the clock ids are no more defined in private headers,
cleanup and include the dt-bindings headers from the main
driver file.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/clk/meson/axg.c  | 2 ++
 drivers/clk/meson/axg.h  | 3 ---
 drivers/clk/meson/g12a.c | 2 ++
 drivers/clk/meson/g12a.h | 3 ---
 drivers/clk/meson/gxbb.c | 2 ++
 drivers/clk/meson/gxbb.h | 3 ---
 6 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/meson/axg.c b/drivers/clk/meson/axg.c
index d159b47c7579..ddac23a5d535 100644
--- a/drivers/clk/meson/axg.c
+++ b/drivers/clk/meson/axg.c
@@ -21,6 +21,8 @@
 #include "axg.h"
 #include "meson-eeclk.h"
 
+#include <dt-bindings/clock/axg-clkc.h>
+
 static DEFINE_SPINLOCK(meson_clk_lock);
 
 static struct clk_regmap axg_fixed_pll_dco = {
diff --git a/drivers/clk/meson/axg.h b/drivers/clk/meson/axg.h
index ed157532b4d7..624d8d3ce7c4 100644
--- a/drivers/clk/meson/axg.h
+++ b/drivers/clk/meson/axg.h
@@ -102,7 +102,4 @@
 #define HHI_DPLL_TOP_I			0x318
 #define HHI_DPLL_TOP2_I			0x31C
 
-/* include the CLKIDs that have been made part of the DT binding */
-#include <dt-bindings/clock/axg-clkc.h>
-
 #endif /* __AXG_H */
diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index ee1ac3542ff4..4e218cbc457f 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -25,6 +25,8 @@
 #include "meson-eeclk.h"
 #include "g12a.h"
 
+#include <dt-bindings/clock/g12a-clkc.h>
+
 static DEFINE_SPINLOCK(meson_clk_lock);
 
 static struct clk_regmap g12a_fixed_pll_dco = {
diff --git a/drivers/clk/meson/g12a.h b/drivers/clk/meson/g12a.h
index 8e08af3c1476..f11ee3c59849 100644
--- a/drivers/clk/meson/g12a.h
+++ b/drivers/clk/meson/g12a.h
@@ -126,7 +126,4 @@
 #define HHI_SYS1_PLL_CNTL5		0x394
 #define HHI_SYS1_PLL_CNTL6		0x398
 
-/* include the CLKIDs that have been made part of the DT binding */
-#include <dt-bindings/clock/g12a-clkc.h>
-
 #endif /* __G12A_H */
diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
index 4849189cefbc..15b6c6c3114e 100644
--- a/drivers/clk/meson/gxbb.c
+++ b/drivers/clk/meson/gxbb.c
@@ -17,6 +17,8 @@
 #include "meson-eeclk.h"
 #include "vid-pll-div.h"
 
+#include <dt-bindings/clock/gxbb-clkc.h>
+
 static DEFINE_SPINLOCK(meson_clk_lock);
 
 static const struct pll_params_table gxbb_gp0_pll_params_table[] = {
diff --git a/drivers/clk/meson/gxbb.h b/drivers/clk/meson/gxbb.h
index 798ffb911103..ba5f39a8d746 100644
--- a/drivers/clk/meson/gxbb.h
+++ b/drivers/clk/meson/gxbb.h
@@ -112,7 +112,4 @@
 #define HHI_BT656_CLK_CNTL		0x3D4 /* 0xf5 offset in data sheet */
 #define HHI_SAR_CLK_CNTL		0x3D8 /* 0xf6 offset in data sheet */
 
-/* include the CLKIDs that have been made part of the DT binding */
-#include <dt-bindings/clock/gxbb-clkc.h>
-
 #endif /* __GXBB_H */

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
