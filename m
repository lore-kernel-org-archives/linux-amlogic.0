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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FB6BC433F5
	for <linux-amlogic@archiver.kernel.org>; Sun, 19 Sep 2021 20:30:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DFDF860F8F
	for <linux-amlogic@archiver.kernel.org>; Sun, 19 Sep 2021 20:30:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DFDF860F8F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K/QB7b7/4uPV2kl4qHytWSYPKwnPUFjV/MAo5jliVg4=; b=t4GdKKMS+Ho+Bf
	EWi/s5lJcS8LWNa3hQzfTCgjCxigR/v6P5YkzhDdoPJtuF3BjGZvl4lx+G5bjfdnMxIP5+hQfeEFK
	Ny5l5VOMmREsl63q1qb68yGp/DcgaRGHQvClfrXqr6rYq6LTpHMiyBSwtKQIgDgfG8zWZf5DZUOnk
	LMKoNJ94G44O2xD/yWbVymy/HhJWS+TTWMwoPnmAs0DxRWmtdYxgsB8bvEIx3cOHHXBjC1QFh0TyV
	P95p+ATxW2k6Gx3+UYzPXGxTtmdW1GQNCGZaM/vLsiF6kVfIog3IRky01fNjCb9SM2wdl5Nm/z59f
	iYeCgOqD1ym/jc/+BlGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mS3SV-000AhJ-7a; Sun, 19 Sep 2021 20:30:43 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mS3Rp-000ANc-Iv; Sun, 19 Sep 2021 20:30:03 +0000
Received: by mail-pg1-x52b.google.com with SMTP id f129so15313230pgc.1;
 Sun, 19 Sep 2021 13:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hfIkUcLEpAlJWRlXvHOKy1ap9NrTUyjC7y9+3wsR1OA=;
 b=qTKnNrQcc1V082Uk593E1H8b2cbkKLLFeIqE1SAKBmZL1FearWgZKd5TlAy8wQiO7J
 a1qvKkQRDd0JBXotGo1yv+CgH4NNQx/92bIlS57U8jJtExjmq6EhHqKqi3wkpEQ7xob0
 qoW6KJeqtAP5LX2qph52tFIb0JAqtmbU3VuDJGu4ClZvrqe3F1YVSNvHrdfiVMZtaHHm
 HA5Ii8rXfQnvfF9roSsXLYPSoXkiIllnkeaeCHno6guVQ6RpK6oPU+Czs0aIxTBLr4Vu
 hAI07QOOvzouPMy5nIjs6y3GNG4n69CPuYvR8YYSiCeOhd1Tlc/B02eFoueZV/CeOtsx
 61ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hfIkUcLEpAlJWRlXvHOKy1ap9NrTUyjC7y9+3wsR1OA=;
 b=OpzARZ4pBlPWbPFAPG8qJYQhYmFjLnlHGkQSY7n2e13KE8XD2pFCHn/TZ4pMBFQN36
 SR5epxpBYQBK+gNjQGXHx4R9Ot5VgTUz5tTf1f+o29aXio2mxOHa25yMyLSJrbogy5mw
 lZ+mz0d0QsXkynb8IPbb7QJnSG0QEjOdhmYbicNcL3zABEVgFU3CT7xnqRwc/mOMu4Ff
 QiqOkKqMtmWbaM6VOTUG7NAIqrQfgbBnlhfpYVTF6bQra4NafvdamJ5mY5/KcmMz8PVf
 d5o8jJY5EEyoo0ssgH0250M77E3++7c8121x7lEkbnFkbgKulJxbNgRrvDCpY8OP8LvS
 mlzw==
X-Gm-Message-State: AOAM533weuimldBtwlxsEkbmTayNf7xBKhcy0skpehISNq1YfHPigCMC
 al/gbPULszaBz7zwRY/XZB0+IReWk/S1Aw==
X-Google-Smtp-Source: ABdhPJz8GXPpRzOLEMzTHk8o9/QQIi5Ny/ABtxTMydIBJnTsucvYJiEEVzHX6rZM7gWppnYbbQUN5Q==
X-Received: by 2002:aa7:9d84:0:b0:447:c2f4:4a39 with SMTP id
 f4-20020aa79d84000000b00447c2f44a39mr397085pfq.86.1632083400348; 
 Sun, 19 Sep 2021 13:30:00 -0700 (PDT)
Received: from archl-c2lm.. ([103.51.72.29])
 by smtp.gmail.com with ESMTPSA id z11sm12663684pff.144.2021.09.19.13.29.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Sep 2021 13:29:59 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Anand Moon <linux.amoon@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Christian Hewitt <christianshewitt@gmail.com>, devicetree@vger.kernel.org
Subject: [PATCHv2 3/3] arm64: dts: meson-sm1: Fix the pwm regulator supply
 properties
Date: Sun, 19 Sep 2021 20:29:11 +0000
Message-Id: <20210919202918.3556-4-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210919202918.3556-1-linux.amoon@gmail.com>
References: <20210919202918.3556-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210919_133001_675420_E460480D 
X-CRM114-Status: GOOD (  12.38  )
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

After enabling CONFIG_REGULATOR_DEBUG=y we observe below debug logs.
Changes help link VDDCPU pwm regulator to 12V regulator supply
instead of dummy regulator.

[   11.602281] pwm-regulator regulator-vddcpu: Looking up pwm-supply property
               in node /regulator-vddcpu failed
[   11.602344] VDDCPU: supplied by regulator-dummy
[   11.602365] regulator-dummy: could not add device link regulator.11: -ENOENT
[   11.602548] VDDCPU: 721 <--> 1022 mV at 1022 mV, enabled

Fixes: 88d537bc92ca ("arm64: dts: meson: convert meson-sm1-odroid-c4 to dtsi")
Fixes: 700ab8d83927 ("arm64: dts: khadas-vim3: add support for the SM1 based VIM3L")
Fixes: 3d9e76483049 ("arm64: dts: meson-sm1-sei610: enable DVFS")
Fixes: 976e920183e4 ("arm64: dts: meson-sm1: add Banana PI BPI-M5 board dts")

Cc: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts  | 2 +-
 arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts | 2 +-
 arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi      | 2 +-
 arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts       | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts
index effaa138b5f9..212c6aa5a3b8 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts
@@ -173,7 +173,7 @@ vddcpu: regulator-vddcpu {
 		regulator-min-microvolt = <690000>;
 		regulator-max-microvolt = <1050000>;

-		vin-supply = <&dc_in>;
+		pwm-supply = <&dc_in>;

 		pwms = <&pwm_AO_cd 1 1250 0>;
 		pwm-dutycycle-range = <100 0>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts
index f2c098143594..9c0b544e2209 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts
@@ -24,7 +24,7 @@ vddcpu: regulator-vddcpu {
 		regulator-min-microvolt = <690000>;
 		regulator-max-microvolt = <1050000>;

-		vin-supply = <&vsys_3v3>;
+		pwm-supply = <&vsys_3v3>;

 		pwms = <&pwm_AO_cd 1 1250 0>;
 		pwm-dutycycle-range = <100 0>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
index fd0ad85c165b..f05bc9756393 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
@@ -116,7 +116,7 @@ vddcpu: regulator-vddcpu {
 		regulator-min-microvolt = <721000>;
 		regulator-max-microvolt = <1022000>;

-		vin-supply = <&main_12v>;
+		pwm-supply = <&main_12v>;

 		pwms = <&pwm_AO_cd 1 1250 0>;
 		pwm-dutycycle-range = <100 0>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
index 2194a778973f..427475846fc7 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
@@ -185,7 +185,7 @@ vddcpu: regulator-vddcpu {
 		regulator-min-microvolt = <690000>;
 		regulator-max-microvolt = <1050000>;

-		vin-supply = <&dc_in>;
+		pwm-supply = <&dc_in>;

 		pwms = <&pwm_AO_cd 1 1500 0>;
 		pwm-dutycycle-range = <100 0>;
--
2.33.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
