Return-Path: <SRS0=nSb1=BA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47EADC433E6
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Jul 2020 02:00:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 150F3206E9
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Jul 2020 02:00:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EtQV9fet";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pB5hBti5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 150F3206E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1chzYSlwX3JQr8Ye570qJZmpC39gi1viUPQssgq5cDc=; b=EtQV9fetZzZh6wATpVn01BMazV
	QCzXqUmKtwGssm3/w2hpNQEOJjQFgsMjsednhV34VXiasX3BgoImMahknyDKAeHygK/aDGLUTGGZl
	DJ4PqtT7NGYlT4nyLDYN74u4QkoL5ZXq/Cf+ys1K0qCW3V0RUHiMd+dS7ZUsj0mqQuc1q6gaE/lGa
	igJkYRMujCs1g7LKCANbULr7/Bo9u34qHGLjoJy5A5oSEdIDyXiQNWwKOWqJhZf7kcGtvbKVcJxI2
	XMrNhpyb+UKh9B97iOPLrRWle5AxRS0UmTrOpR7pu2R/5xYHuvNzH3evHvNT4gXB6VQjBoB29SrRk
	E60Emnyg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxhZX-0006i2-RD; Tue, 21 Jul 2020 01:59:59 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxhZT-0006gE-KX; Tue, 21 Jul 2020 01:59:56 +0000
Received: by mail-wr1-x444.google.com with SMTP id b6so19575109wrs.11;
 Mon, 20 Jul 2020 18:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=Re6La/qV3n1ukkxNTX/ju/OZLeqen/7aiCy5YNlMaBo=;
 b=pB5hBti5DRoBjJS0TkkYddmaRA6YmLjbKVqgTjUx/cBp91jDcw7cN9/TagT1y9htZF
 GVMeF5bbvlYerM1+LYKkstpzgn4gJq2EEveijDRFQ96zOyUh1PauLe9Oo2yIOxG3/dQB
 UJNJ12yeYzV4dUIZTXYR47hR4xn6VNoHsRK5caBa+HrFxZwtyBOcz9voMxZ/beH0fb2f
 TBDxkX7Dc1owqPdjtZfaowXJFZRP+SK5Uu9dTJ/HeMW4mSv5PffWY4HSQS9fnBaOyTw7
 P9O5d2Ns7oGIqwoUQhEzqFG3Oj97Jmw+heq6u0rZHZhQ9zpHnqpi49MceoWTP+mfjTOD
 PvMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Re6La/qV3n1ukkxNTX/ju/OZLeqen/7aiCy5YNlMaBo=;
 b=EyJBsv3ba95ji/oWwrr14OzrJbkDT49LDq4aTPs4H6SJUCC6JVtHwZZ+JclecLddFY
 8DNbayIzn48F/ntt3BJN8tgEmukoD2Y5ylnJxpb0nn+pO27Dg4XnfNCoT/y1YCCrVwmr
 W7a1V4LP4W/KBopHH4Syoqhenmu6Y+wdqLpxmw8Nklc1y/cD38fJFRnyaDfHaUVSqKTT
 fx6K2pOGcdJeGuhMx7Or5rpShVNXsQsa23T78+mwuMp3cJitDbl2zPUr5lr6gTClzVqV
 CwvjhgIRKTW9cTmpnBctttvUro5vxldURVdLn9qdD7s/gUnxp6Y/TY2wft/eutI5yNRo
 bbIQ==
X-Gm-Message-State: AOAM530UoiLLg9Zm2vltcIVV3bIOtoXaGBhcfZsegcfqGD+KMc6D++NI
 DNgwshbIpFL1mGYGCUaUPaQ=
X-Google-Smtp-Source: ABdhPJwdcC9jByWPNIZBOEA9DB5O7rqqiVArp+ZASBJj+ETWteWd4vVfPTsYntco232mpddtdCTd4g==
X-Received: by 2002:a5d:550e:: with SMTP id b14mr16832282wrv.392.1595296794662; 
 Mon, 20 Jul 2020 18:59:54 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id e8sm34479069wrp.26.2020.07.20.18.59.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2020 18:59:54 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2] arm64: dts: meson: fix mmc0 tuning error on Khadas VIM3
Date: Tue, 21 Jul 2020 01:59:50 +0000
Message-Id: <20200721015950.11816-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200720_215955_685096_9F284E91 
X-CRM114-Status: GOOD (  13.12  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Christian Hewitt <christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Similar to other G12B devices using the W400 dtsi, I see reports of mmc0
tuning errors on VIM3 after a few hours uptime:

[12483.917391] mmc0: tuning execution failed: -5
[30535.551221] mmc0: tuning execution failed: -5
[35359.953671] mmc0: tuning execution failed: -5
[35561.875332] mmc0: tuning execution failed: -5
[61733.348709] mmc0: tuning execution failed: -5

I do not see the same on VIM3L, so remove sd-uhs-sdr50 from the common dtsi
to silence the error, then (re)add it to the VIM3L dts.

Fixes: 4f26cc1c96c9 ("arm64: dts: khadas-vim3: move common nodes into meson-khadas-vim3.dtsi")
Fixes: 700ab8d83927 ("arm64: dts: khadas-vim3: add support for the SM1 based VIM3L")
Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi     | 1 -
 arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts | 4 ++++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
index 27408c10a811..ddfd52b88002 100644
--- a/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
@@ -293,7 +293,6 @@
 
 	bus-width = <4>;
 	cap-sd-highspeed;
-	sd-uhs-sdr50;
 	max-frequency = <100000000>;
 
 	non-removable;
diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts
index dbbf29a0dbf6..026b21708b07 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts
@@ -88,6 +88,10 @@
 	status = "okay";
 };
 
+&sd_emmc_a {
+	sd-uhs-sdr50;
+};
+
 &usb {
 	phys = <&usb2_phy0>, <&usb2_phy1>;
 	phy-names = "usb2-phy0", "usb2-phy1";
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
