Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77A07C38159
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Jan 2023 07:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yi7Fb9frMvstCiFjVY0KiIOoX/MaXffS8NwNnJcF4Ic=; b=x2+8tZQ38eUJlx
	YzeQe2D9C8oXo1KsfS/wWmv/st6TBRlKDaPF4MUgSCDMNM7HMQZJVOH7zeluZ9AZraMV8RKdivZOm
	Y3LPik2joKcoV89glJ3DXGzNQ/ExNLv66n947ECdEQq3K2cHtwdLbIh4c/oORzgEiyfOM1EsQDeks
	fDVcaRjQHeDeXb2cLxgUOdUwTgwom3yle6noLtvSGBddSn5pK5e3r76nXQ3eLMKRIzuTsu5mN6Sup
	tncV6ZIqMZRhVkDdklzi/IwadWA2XFxlIdaI+0vfg/eoUFxaazviIQDCAI9j+JPAl4cWqTwA/eXbG
	aThcqtsR7NoDnc2vk1BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIli9-008m7n-Kf; Fri, 20 Jan 2023 07:21:17 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIli6-008m5X-C0
	for linux-amlogic@lists.infradead.org; Fri, 20 Jan 2023 07:21:15 +0000
Received: by mail-wm1-x330.google.com with SMTP id f12-20020a7bc8cc000000b003daf6b2f9b9so5181327wml.3
        for <linux-amlogic@lists.infradead.org>; Thu, 19 Jan 2023 23:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hVHXPzXDL0ZUaDjICr6uj4+3YokmdQhzS8TpEvET9ys=;
        b=Wbwo6hfOo+QtTvcqKg66lwaGee3aBFBkGhsPdRVEP/8ZbhN4rKJIUBIe9GJNEQRXA9
         F1xqtyPLBaWcoA/RHQfCRRn2lIqExe/GXZus7DZMmHckphsYuYVPXZujdQ6uKVqnDEZL
         kyKUepdJACoESV0Abc0th+KgD++j8xGnNqaKeYAQbPKK2g8IP6NWakk+qgvbBnCMmtz+
         +tLeYQLHrkgWsm2a3A0nnnNC4zAsXmG3PuBEyhqCyAm8R5Zo8iqM4GVihs0fEp6wmCFe
         N02GM8dy/ikFBvIDp3/64Q52BTzp9SzSf/QU8LCHIixSaGzyFJ+7C257Eh6RSblu1kHP
         f0/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hVHXPzXDL0ZUaDjICr6uj4+3YokmdQhzS8TpEvET9ys=;
        b=duY763g2a4tJpsluS1uKl0JEn2eda95keM5se8tCaE77jGqCOJ7f3oMxJAPZ4WG/kI
         8Tj/0wE5yNnXnTZuaDXDzH1ruXjYLhcr2/a8WswPSA+bH28HA20WT33RLEnfDh3QoflL
         2eSQoJErJ7V93h4HZro3Yo/pvlFF9/9x/LS46bk/6M9+hiPKnwWHmaQ4FMcjAvhI3Czh
         DfCOBx8ViHV/tSatMjv2Sfg6CxYgNGg0M/d+9Nd8VosuWLdjBZC2qhFIr6Aib9PlySCF
         nzs29t/c4V10/FISfN9GBeBFq75bG6tpL/ulfO7ZCsPIa/8lkmUpRsfAiWIiaUUkf0EY
         V9zw==
X-Gm-Message-State: AFqh2kqK6cdZXU/7gcOAy2EdoLTbaUtcUmmS90UeC66eGJ6ZPepYLcRi
	XxDXo/yTFboQTcA5L9YY+HycDQ==
X-Google-Smtp-Source: AMrXdXtLoNnrgvTr3aqNRCV/l9H5kHoEJbwmmrCL3/rmSQDAc9qj22wHQjPz2sWFlIhVdV4MZ3gYhQ==
X-Received: by 2002:a05:600c:687:b0:3d9:73fb:8aaa with SMTP id a7-20020a05600c068700b003d973fb8aaamr13116878wmn.8.1674199270385;
        Thu, 19 Jan 2023 23:21:10 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id o21-20020a05600c4fd500b003c6f8d30e40sm1470246wmq.31.2023.01.19.23.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 23:21:10 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] ARM: dts: meson8: align OPP table names with DT schema
Date: Fri, 20 Jan 2023 08:21:08 +0100
Message-Id: <20230120072108.138598-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_232114_447719_E6103289 
X-CRM114-Status: UNSURE (   9.88  )
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

DT schema expects names of operating points tables to match certain
pattern:

  meson8-minix-neo-x8.dtb: gpu-opp-table: $nodename:0: 'gpu-opp-table' does not match '^opp-table(-[a-z0-9]+)?$'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/meson8.dtsi  | 2 +-
 arch/arm/boot/dts/meson8b.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/meson8.dtsi b/arch/arm/boot/dts/meson8.dtsi
index 0f8bac8bac8b..974ef041ff02 100644
--- a/arch/arm/boot/dts/meson8.dtsi
+++ b/arch/arm/boot/dts/meson8.dtsi
@@ -133,7 +133,7 @@ opp-1992000000 {
 		};
 	};
 
-	gpu_opp_table: gpu-opp-table {
+	gpu_opp_table: opp-table-gpu {
 		compatible = "operating-points-v2";
 
 		opp-182142857 {
diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
index cf9c04a61ba3..d7c0491383be 100644
--- a/arch/arm/boot/dts/meson8b.dtsi
+++ b/arch/arm/boot/dts/meson8b.dtsi
@@ -125,7 +125,7 @@ opp-1536000000 {
 		};
 	};
 
-	gpu_opp_table: gpu-opp-table {
+	gpu_opp_table: opp-table-gpu {
 		compatible = "operating-points-v2";
 
 		opp-255000000 {
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
