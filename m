Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B7D1C05027
	for <linux-amlogic@archiver.kernel.org>; Wed,  1 Feb 2023 17:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9Q7NPvN7tepPWHNZyJRjrem502k/CpIMI+v0qfkITZQ=; b=EJ7RVUSxYDHXrA
	OOT3RDxR1JvXcLZKpwA3lXoWLunNtjtD4uo9AlyK9DafTruaYyMvxHmqCjmgmOKcSR4tbjwyMEr5+
	+a+Zi5cocpLyc3xYALSJr+gS30u+h4D0J8Xtx/pYiQPp6I1iz2XGFqxl8TW6SinOglgEpVCpwTI+J
	tk1LAVs4OUbyP8tZj7X4HfPDg1qFM2ZefZ9CFDdTWh05sdp5L6aXw/9XlAicP7tNGnYVWDdMIlbU7
	Z25AwmzNxSNYijydE7vP7wbu2JRcpS+52+qVYtPSntp8sTw8eXDK+Jh3VAI/xK2o2HJNIg6MpvFZY
	mBRRVmbyxsrTarID7C1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNGwL-00D1UG-Kq; Wed, 01 Feb 2023 17:30:33 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNGw8-00D1OZ-RN; Wed, 01 Feb 2023 17:30:22 +0000
Received: by mail-ej1-x62b.google.com with SMTP id p26so42371029ejx.13;
        Wed, 01 Feb 2023 09:30:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KD5M9gxdESVXZNHygJsIRCRG6O5U78kyIhxKOX+bsgs=;
        b=XDKmpzK3vIb15pZuQ3BFMFlnBksAmdYKSlo7+m/ocAUhGEPTFJXTo4ER12jpVQj5u0
         FC8hBV+CbBpFEBVnxrBPwZA3I2ujM7pNw3CuYcmYNt/YclFXdII72s/WlirfN1f58/2a
         WrG87KqF+ZPsWnc30pjA/Lbjow4GM1nx6GUld0c+1n/yb7l1oEJWtesHY1L0wY5en8Zv
         Ttsubi3MWMtqRzeheywwFDYFIG43AUTD/0A/ezN+tU643eB5VKaIBGZu9Ng4Eq+TFF10
         Cq4I1OOkYyvY68VlfEGU/KMWYCkUxjRE8DJH/lHN6mEiDCh/45nWNJVYddtk852Az1wv
         vM2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KD5M9gxdESVXZNHygJsIRCRG6O5U78kyIhxKOX+bsgs=;
        b=fkVRNwuHduKrlGFpDSXT4pDmsSx6DwLOJr8LFIxOvU4+RT1zi1QLA+hSvHPWYKzPJZ
         ZR61/uwhif7PoWcsWcjNUJM93uev265qvToiGYav/n6ptmogbHEu5pha4D4DAeR3nIuP
         YzoRX3e43Y5TKATrN9DNhmL1/4my1xIVyq3X/t6NPDZ8xyz6rwDIT5HqkeXc0x7AMNkJ
         y3KoOxhHL+GsIiWrXBTR+ss5z2Oz/pqSdn0qWJx2+oDG9JmTwNvS9VbswN4qq1VZevZq
         1zQd/4pgaPjp00bkjvxAlef+OYKuucQVALl0g7X7nc70IXtedp4+w9eblE7s2cSgPK+I
         LbfQ==
X-Gm-Message-State: AO0yUKUxD8AzQdZmAHXsK0Lsr82m43NSi4btyctjMF6fVEH2BuePnfTs
	DMShumvkm9PgNIYq1FAX99s=
X-Google-Smtp-Source: AK7set9mvzLzTGxj9MJf4SML7Kc8isI2LQrbbB779YEZqBnwmMUw731G5f3NDBxtmfBILXq47PAcBQ==
X-Received: by 2002:a17:906:a009:b0:879:9c06:c8bc with SMTP id p9-20020a170906a00900b008799c06c8bcmr6654115ejy.15.1675272618599;
        Wed, 01 Feb 2023 09:30:18 -0800 (PST)
Received: from ?IPV6:2a01:c23:b912:d400:3963:7bc4:12b:ddb3? (dynamic-2a01-0c23-b912-d400-3963-7bc4-012b-ddb3.c23.pool.telefonica.de. [2a01:c23:b912:d400:3963:7bc4:12b:ddb3])
        by smtp.googlemail.com with ESMTPSA id z16-20020a170906435000b007b935641971sm10245083ejm.5.2023.02.01.09.30.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Feb 2023 09:30:18 -0800 (PST)
Message-ID: <e7b3fd1e-69eb-e66e-8abc-72b7c5fa975d@gmail.com>
Date: Wed, 1 Feb 2023 18:30:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH] arm(64): dts: meson: adjust order of some compatibles
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_093020_931186_D2FA0C77 
X-CRM114-Status: GOOD (  10.34  )
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

During review of a new yaml binding, affecting these dts, it turned out
that some compatibles aren't ordered as they should be. Order should be
most specific to least specific.

Suggested-by: Rob Herring <robh+dt@kernel.org>
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 arch/arm/boot/dts/meson8b.dtsi              | 4 ++--
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi | 4 ++--
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi  | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
index d5a3fe21e..5979209fe 100644
--- a/arch/arm/boot/dts/meson8b.dtsi
+++ b/arch/arm/boot/dts/meson8b.dtsi
@@ -580,8 +580,8 @@ &ethmac {
 };
 
 &gpio_intc {
-	compatible = "amlogic,meson-gpio-intc",
-		     "amlogic,meson8b-gpio-intc";
+	compatible = "amlogic,meson8b-gpio-intc",
+		     "amlogic,meson-gpio-intc";
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
index 923d2d8bb..12ef6e81c 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
@@ -300,8 +300,8 @@ &ethmac {
 };
 
 &gpio_intc {
-	compatible = "amlogic,meson-gpio-intc",
-		     "amlogic,meson-gxbb-gpio-intc";
+	compatible = "amlogic,meson-gxbb-gpio-intc",
+		     "amlogic,meson-gpio-intc";
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
index 04e9d0f1b..af912f698 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
@@ -312,8 +312,8 @@ &clkc_AO {
 };
 
 &gpio_intc {
-	compatible = "amlogic,meson-gpio-intc",
-		     "amlogic,meson-gxl-gpio-intc";
+	compatible = "amlogic,meson-gxl-gpio-intc",
+		     "amlogic,meson-gpio-intc";
 	status = "okay";
 };
 
-- 
2.39.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
