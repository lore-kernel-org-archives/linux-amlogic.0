Return-Path: <SRS0=Tn3k=OJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1B6AC433EF
	for <linux-amlogic@archiver.kernel.org>; Sun, 19 Sep 2021 20:30:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA49B60FE6
	for <linux-amlogic@archiver.kernel.org>; Sun, 19 Sep 2021 20:30:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AA49B60FE6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6qQQjVh3LKNkad9OMd69nRwct0sngP0kizOcwECIfUY=; b=CtGAXQg5pNn2cD
	47ISDECkWCW8OTy0XB1uV1vjqGugYapLgNOl6WpLqc9wo7JuxjRWzxMfQZcK2DKR6tpoH3/l4wf4X
	YhzwcGTgAdHw/SRkFTs5V2M0bpUuTHCLtF7WiCpH6eMLVftsBPdxxlTEWCSRAMBW+og9uIzcC6drK
	82cmR5SZfvU3xe9xnldA1mwQ+gPYlZKNTDsW90UUGdNS6RjK6v3cE8jXnWqJdmAdxs6Zz8kXTuWGR
	UAexZgoOmG9aThbhmwDgIseridwkgqq8wGFwZ2rdqzew47El138TxcpsLgDR8BbXj5z/tG7EMvceC
	nnk8i/A76EhGd8pI1AUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mS3S9-000AVP-I6; Sun, 19 Sep 2021 20:30:21 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mS3Rf-000AKU-Tk; Sun, 19 Sep 2021 20:29:53 +0000
Received: by mail-pf1-x42d.google.com with SMTP id q23so12201365pfs.9;
 Sun, 19 Sep 2021 13:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JzpZaRn8s17gz8hdOcowBcPP+A1zOX5vRaz564FsmJ0=;
 b=nbokdqW2NO/QctBqRLw05eYwij25GHtZvee97asZqoDzFH88t/A85gMntdYxuKfQ25
 3CXV48uzVbhk+MZ0o6vgW9E5sCaMObR0Has+viTu2SPQ2/1dIqpQbgn2FvSWJwO3CvAM
 TxtKa0JSHqosTSWsS4HQem/QM26P5k3mswV6/Czf6ozJUmh2wBzeL6qXnsIGOj/uFgZZ
 MKlLeq0AINf6grFh9vL88YiqxH48tf/XqNktmNNoti1PoKkccdjHTNoJyNAO9aiDD1ok
 Kx+BLtT0SE3/ppUEpOkGR1wXFqJD7rcJyYvNoCBN3YV/hN3Pc6WzIf5MGNO0/a5eF8yC
 17/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JzpZaRn8s17gz8hdOcowBcPP+A1zOX5vRaz564FsmJ0=;
 b=qz7u4vcwUM8QIwBBlLswADU1MfDmMAVb1sJK8fwqxMp+dtci3hYBZ1KapwqnCfbm5p
 kWOBzuNt5Hf34mFgpwY/DqFvAvHD5/uVa1D/tGkUD/10Myh81i03lRJ4hGAmXYn4yTzr
 1I0iNg7h6xWV6sBTIXWs/2g6eJiJJQKRov0iMXbOBrtoWWrE7d02tytlcNJ87Ttdw9IQ
 34PzVKECAp4mTZWQ+YC8ll0OTMnw8DsT3Rtz/C6qiOdE8wEqUIrr464UXbjBOHAGTW07
 DYarLRjg4J8tMiwXQZ+ahRNJxsfwA/yGsJMDkNr550lb8hs44rDemqZEhShS/IHYWAZf
 T9eg==
X-Gm-Message-State: AOAM532RhbtdJOQEK+n6HzVNexIWjPwUb2e3uVI4gYJoCUONNFLTG0jl
 UIuhQ9RPDgLVjexNDPyFECP56Eqot3aW4Q==
X-Google-Smtp-Source: ABdhPJygvideB8trEIk/iGCOisO2WPAxvyxpXD78sPwk/NZhzoNjhU43gXGqfrShtuBWvUpuZuujJw==
X-Received: by 2002:a63:4e65:: with SMTP id o37mr20655712pgl.202.1632083390037; 
 Sun, 19 Sep 2021 13:29:50 -0700 (PDT)
Received: from archl-c2lm.. ([103.51.72.29])
 by smtp.gmail.com with ESMTPSA id z11sm12663684pff.144.2021.09.19.13.29.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Sep 2021 13:29:49 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Anand Moon <linux.amoon@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Christian Hewitt <christianshewitt@gmail.com>, devicetree@vger.kernel.org
Subject: [PATCHv2 2/3] arm64: dts: meson-g12b: Fix the pwm regulator supply
 properties
Date: Sun, 19 Sep 2021 20:29:10 +0000
Message-Id: <20210919202918.3556-3-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210919202918.3556-1-linux.amoon@gmail.com>
References: <20210919202918.3556-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210919_132952_002902_D1AB4844 
X-CRM114-Status: GOOD (  12.00  )
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

After enabling CONFIG_REGULATOR_DEBUG=y we observer below debug logs.
Changes help link VDDCP_A and VDDCPU_B pwm regulator to 12V regulator
supply instead of dummy regulator.

[    4.147196] VDDCPU_A: will resolve supply early: pwm
[    4.147216] pwm-regulator regulator-vddcpu-a: Looking up pwm-supply from device tree
[    4.147227] pwm-regulator regulator-vddcpu-a: Looking up pwm-supply property in node /regulator-vddcpu-a failed
[    4.147258] VDDCPU_A: supplied by regulator-dummy
[    4.147288] regulator-dummy: could not add device link regulator.12: -ENOENT
[    4.147353] VDDCPU_A: 721 <--> 1022 mV at 871 mV, enabled
[    4.152014] VDDCPU_B: will resolve supply early: pwm
[    4.152035] pwm-regulator regulator-vddcpu-b: Looking up pwm-supply from device tree
[    4.152047] pwm-regulator regulator-vddcpu-b: Looking up pwm-supply property in node /regulator-vddcpu-b failed
[    4.152079] VDDCPU_B: supplied by regulator-dummy
[    4.152108] regulator-dummy: could not add device link regulator.13: -ENOENT

Fixes: c6d29c66e582 ("arm64: dts: meson-g12b-khadas-vim3: add initial device-tree")
Fixes: d14734a04a8a ("arm64: dts: meson-g12b-odroid-n2: enable DVFS")
Fixes: 3cb74db9b256 ("arm64: dts: meson: convert ugoos-am6 to common w400 dtsi")

Cc: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi | 4 ++--
 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi   | 4 ++--
 arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi        | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi
index f42cf4b8af2d..16dd409051b4 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi
@@ -18,7 +18,7 @@ vddcpu_a: regulator-vddcpu-a {
 		regulator-min-microvolt = <690000>;
 		regulator-max-microvolt = <1050000>;

-		vin-supply = <&dc_in>;
+		pwm-supply = <&dc_in>;

 		pwms = <&pwm_ab 0 1250 0>;
 		pwm-dutycycle-range = <100 0>;
@@ -37,7 +37,7 @@ vddcpu_b: regulator-vddcpu-b {
 		regulator-min-microvolt = <690000>;
 		regulator-max-microvolt = <1050000>;

-		vin-supply = <&vsys_3v3>;
+		pwm-supply = <&vsys_3v3>;

 		pwms = <&pwm_AO_cd 1 1250 0>;
 		pwm-dutycycle-range = <100 0>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
index 344573e157a7..4f33820aba1f 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
@@ -130,7 +130,7 @@ vddcpu_a: regulator-vddcpu-a {
 		regulator-min-microvolt = <721000>;
 		regulator-max-microvolt = <1022000>;

-		vin-supply = <&main_12v>;
+		pwm-supply = <&main_12v>;

 		pwms = <&pwm_ab 0 1250 0>;
 		pwm-dutycycle-range = <100 0>;
@@ -149,7 +149,7 @@ vddcpu_b: regulator-vddcpu-b {
 		regulator-min-microvolt = <721000>;
 		regulator-max-microvolt = <1022000>;

-		vin-supply = <&main_12v>;
+		pwm-supply = <&main_12v>;

 		pwms = <&pwm_AO_cd 1 1250 0>;
 		pwm-dutycycle-range = <100 0>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi
index feb088504740..b40d2c1002c9 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi
@@ -96,7 +96,7 @@ vddcpu_a: regulator-vddcpu-a {
 		regulator-min-microvolt = <721000>;
 		regulator-max-microvolt = <1022000>;

-		vin-supply = <&main_12v>;
+		pwm-supply = <&main_12v>;

 		pwms = <&pwm_ab 0 1250 0>;
 		pwm-dutycycle-range = <100 0>;
@@ -115,7 +115,7 @@ vddcpu_b: regulator-vddcpu-b {
 		regulator-min-microvolt = <721000>;
 		regulator-max-microvolt = <1022000>;

-		vin-supply = <&main_12v>;
+		pwm-supply = <&main_12v>;

 		pwms = <&pwm_AO_cd 1 1250 0>;
 		pwm-dutycycle-range = <100 0>;
--
2.33.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
