Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 644BEC4332F
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Nov 2022 11:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mH6wet+47MEkggW3djrCvzTEB/ryXmtyLfeJpAeg5x0=; b=3IxfizwllPCs8r
	pjvY8t3jQyTMtjkmfoleM8Ro+6ep+gBg9RtOjyz9lT7AJeXiujgcpWP+vBvz6v8uY948iit3zGRAe
	jEeErWrFKXE/koUPxtPaTw7zs1X+7Pe3+UlT9cgtF6a1Hzv2qan1gCG32QPKHYG0cXPmuwaCnx37x
	5z+Hply3CCiSwBysHCrTy+sccDHkwEZeb/gbG+baVoliXEBqdCSLAFz8FIJm8CilU9QZiSPgWYaDo
	ynZpnxrRLHxxcAZxA0ZciaQn82KFCxDzpuiboWw7Zf4Mr5/YJR1s6eAFfiYDTHRtuIaxijVj1J8oL
	ppoipNJmFpo1ZEK19d3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyWlf-00G2Hq-In; Fri, 25 Nov 2022 11:21:15 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyWkF-00G1Yp-N0; Fri, 25 Nov 2022 11:19:49 +0000
Received: by mail-wr1-x42f.google.com with SMTP id v1so6251942wrt.11;
        Fri, 25 Nov 2022 03:19:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H4DbuMCnCKfZ/X33NVzzgb/ifknYJFeQAyg/fDbKILM=;
        b=MJTopbFMxXVgGa3ngdb1kcHRAh4vMZ7fbyu1UeoKxPOAleRmO4pX76dgm81YUUB17L
         F8E/IUYa937tek8muSzdgfgLC+gchdb/UUJ1fizl22ErU4DeH9Qomk838IG7xCMgCTXn
         noBYTatzIC89Wa0fx7WmDnBuvOVY2w01/ynG1veOgO2OsK/JRwkBhq57e4umTHkyEXQ+
         QHdpiG60Cl11EtDF5+aqQPkZavx1VKTJqzKjWsOmnVKUoPlOtrmmE6M/yMtl06qb3mpL
         I3UJeAxD5tVLP7ktD1CevI9ga+4W640YEFsV3HXPg3XPbez2c1fp7B6jH6+USJQp9S0+
         ZW5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=H4DbuMCnCKfZ/X33NVzzgb/ifknYJFeQAyg/fDbKILM=;
        b=2wsHttf9VlOjQJtMklm30D393Z89orjjvtn0ET34cg5fd0qsZW5aII9SL6Aj6zuiiM
         gJxsb+NbhQ19No0VlXrH/C6dV69CbHjfYhZLWFewNeERfdO84dekLvKCuwH1skPwJ0tR
         w+hFjdrjhyVKJUmpSfdYPkZ8SKGa7ld0RR6sE10sSltaJ0/Yhz7KEOIcH2eAMOWEJwAl
         9OZz9SZraOxaxb85ovfomlECq+Ttmr9E8R1du0ZlZNkVzYhfJnXx78oBw5C7QGGC5a0E
         cw8ZMVKNHfiYjoz0oErOjYiraq+cBZm/8kG0+qfGhjW/4RUM94fOpTft2L/2fykBgn6m
         sTtg==
X-Gm-Message-State: ANoB5pmGfOwEBU+zzsJ94ghIvzhymKTmA8QP8BLggwR6ipuXIR0BJt71
	pJM2d9ZUZsSl7L1MIDiDzaOn8oU1wyc=
X-Google-Smtp-Source: AA0mqf7R0O/iMKw+/pY3QRSPGLMqpoZMk6Y+6iqjJv+P2qnYsq8Eff8A9TxL5wfpOu5YfjJ8gs1hYw==
X-Received: by 2002:a5d:6dcf:0:b0:236:78b7:87c9 with SMTP id d15-20020a5d6dcf000000b0023678b787c9mr22664039wrz.556.1669375184088;
        Fri, 25 Nov 2022 03:19:44 -0800 (PST)
Received: from cizrna.home (cst-prg-44-69.cust.vodafone.cz. [46.135.44.69])
        by smtp.gmail.com with ESMTPSA id v11-20020a5d4b0b000000b002368f6b56desm4207406wrq.18.2022.11.25.03.19.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Nov 2022 03:19:43 -0800 (PST)
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
To: 
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-amlogic@lists.infradead.org (open list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 4/6] arm64: dts: meson-g12-common: Add reference to NNA reset to pwrc
Date: Fri, 25 Nov 2022 12:19:17 +0100
Message-Id: <20221125111921.37261-5-tomeu.vizoso@collabora.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221125111921.37261-1-tomeu.vizoso@collabora.com>
References: <20221125111921.37261-1-tomeu.vizoso@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221125_031947_814304_987FB444 
X-CRM114-Status: UNSURE (   9.75  )
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

Based on the power sequence in the downstream driver.

Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index 45947c1031c4..fa96fddf4633 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -1625,10 +1625,11 @@ pwrc: power-controller {
 							 <&reset RESET_VDAC>,
 							 <&reset RESET_VDI6>,
 							 <&reset RESET_VENCL>,
-							 <&reset RESET_VID_LOCK>;
+							 <&reset RESET_VID_LOCK>,
+							 <&reset RESET_NNA>;
 						reset-names = "viu", "venc", "vcbus", "bt656",
 							      "rdma", "venci", "vencp", "vdac",
-							      "vdi6", "vencl", "vid_lock";
+							      "vdi6", "vencl", "vid_lock", "nna";
 						clocks = <&clkc CLKID_VPU>,
 							 <&clkc CLKID_VAPB>;
 						clock-names = "vpu", "vapb";
-- 
2.38.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
