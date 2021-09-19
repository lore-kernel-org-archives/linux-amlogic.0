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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 431BEC433EF
	for <linux-amlogic@archiver.kernel.org>; Sun, 19 Sep 2021 20:30:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0471360FE6
	for <linux-amlogic@archiver.kernel.org>; Sun, 19 Sep 2021 20:30:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0471360FE6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=euJNn2XAGwij7RTtb0+hgnW78GNLZ9rj4VxV4jHY4fU=; b=S5IMNtims+Lv5Z
	rS+ra7KgZSwbaD6w/t01Rsnz/SjNCKSqDDT1Mhx7svnnAvYRGlxSikrMCelQThn9TqlPnjrX5llcS
	Gi8gATwKX+DCrjrGgrPYKEp4KsOAgTlWUThno0KxJdyQ0HRhKeOedJNTqVLXGmfCMQAEMr0ElDwob
	mVC3+C13H0+AXyfIYRJ9TPfP6EbpGLsGLUHJoTGa0py8Qh7rmVXV0pg+hE0/c32xF/lXW318f5Pzm
	YG13Vigk/sHUYRW55YSmUYF/FI02lwrkBw1JFjwrwzPu9ux6LCTHKWrfe1IWzL5bWWyxjBQmpkil9
	gPPE5HK6nCHzPLsBaBhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mS3Rx-000AQp-BJ; Sun, 19 Sep 2021 20:30:09 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mS3RU-000AIC-ST; Sun, 19 Sep 2021 20:29:42 +0000
Received: by mail-pg1-x534.google.com with SMTP id g184so15281204pgc.6;
 Sun, 19 Sep 2021 13:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ie2JEfOdwkfAgarAQQw6URHCDiUg2nskqRFB/yYax5Y=;
 b=Kcxd+1d3eo4B7+Hsd9BaglHAAxY/zDeo62MrJ9O/0+iJssG0OT2/5HGg6jQ/2l8VPT
 B7OMVfV2v2c3aO/wDvAx6E+kLQgqct0YjDZPQEJceM9dDrFCjL15S1BorrHsm1VOPzfe
 vv5jROAPfu5A87+42D2hdni9iirqNI2g6Su8lOOqM1KrJY4HWtvLTNWI1Tp/za2q6nrA
 tegPwwRDzIjl9Mo5TidS4B7vTfPhuzlXtERsQg4mm9MKn1RCbTmVv2ngrfewlZJU5s4U
 6nE8uhv3G6OJOeCD8mzUxit136QwIaRxoOa8M5QGy0ESUabJENFMSNvkbSzkMQ8z916z
 hOww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ie2JEfOdwkfAgarAQQw6URHCDiUg2nskqRFB/yYax5Y=;
 b=zusuhp99J1pN89MlOEO7P/QMThT9cvU8qK7CIYz5fnm3kY6J1BQ1GXS1yOSrJui/BZ
 QgrZPpnVoTSOlXQGRHzNEWtevjyGZW5A1wgSJJ4t0j31GNDK4ZuI3koDe4LhRwnfQJ5N
 74A6AVuy2K49SnyjGhHte2idOTrI5kYecKxFPlaKNFWWSCCpJYPP3BbUGyaLn0QKtUtS
 tPYZhJehYrRyiNZ8lcm+n5QLf+iQbbAJgKSpRNU+PI/t1jKJPLuBdq/WOJvK9r0tgqUA
 ok3vW583cU/9xJ0TolDcJhGO70czdNlvtEOXLFCmmrfinv3owDeJ68205sy1DhfgGsLY
 0DeA==
X-Gm-Message-State: AOAM532HezaX08RY12lFGS5CSIXM3cIId42jnUYIKZOL52GrFfZd+hjL
 lzQBMqCTMJBk47wbaR377fW9piRZ10BLsA==
X-Google-Smtp-Source: ABdhPJzQUkScYLlLXCUIUaWWlx6Paw9NU0cLiRAziUrhO3V7AQ3MkZJfFaiPLAmVNTw0CfmtxYZF9Q==
X-Received: by 2002:a05:6a00:1147:b029:3e0:8c37:938e with SMTP id
 b7-20020a056a001147b02903e08c37938emr21724307pfm.65.1632083379911; 
 Sun, 19 Sep 2021 13:29:39 -0700 (PDT)
Received: from archl-c2lm.. ([103.51.72.29])
 by smtp.gmail.com with ESMTPSA id z11sm12663684pff.144.2021.09.19.13.29.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Sep 2021 13:29:39 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Anand Moon <linux.amoon@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Christian Hewitt <christianshewitt@gmail.com>, devicetree@vger.kernel.org
Subject: [PATCHv2 1/3] arm64: dts: meson-g12a: Fix the pwm regulator supply
 properties
Date: Sun, 19 Sep 2021 20:29:09 +0000
Message-Id: <20210919202918.3556-2-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210919202918.3556-1-linux.amoon@gmail.com>
References: <20210919202918.3556-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210919_132940_963234_D6DD7F88 
X-CRM114-Status: GOOD (  11.92  )
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

Fixes: e9bc0765cc12 ("arm64: dts: meson-g12a: enable DVFS on G12A boards")

Cc: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts  | 2 +-
 arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts    | 2 +-
 arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
index 81269ccc2496..d8838dde0f0f 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
@@ -139,7 +139,7 @@ vddcpu: regulator-vddcpu {
 		regulator-min-microvolt = <721000>;
 		regulator-max-microvolt = <1022000>;

-		vin-supply = <&dc_in>;
+		pwm-supply = <&dc_in>;

 		pwms = <&pwm_AO_cd 1 1250 0>;
 		pwm-dutycycle-range = <100 0>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
index a26bfe72550f..4b5d11e56364 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
@@ -139,7 +139,7 @@ vddcpu: regulator-vddcpu {
 		regulator-min-microvolt = <721000>;
 		regulator-max-microvolt = <1022000>;

-		vin-supply = <&main_12v>;
+		pwm-supply = <&main_12v>;

 		pwms = <&pwm_AO_cd 1 1250 0>;
 		pwm-dutycycle-range = <100 0>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
index 579f3d02d613..b4e86196e346 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
@@ -139,7 +139,7 @@ vddcpu: regulator-vddcpu {
 		regulator-min-microvolt = <721000>;
 		regulator-max-microvolt = <1022000>;

-		vin-supply = <&dc_in>;
+		pwm-supply = <&dc_in>;

 		pwms = <&pwm_AO_cd 1 1250 0>;
 		pwm-dutycycle-range = <100 0>;
--
2.33.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
