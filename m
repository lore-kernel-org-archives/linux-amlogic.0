Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C9D5C433FE
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Jan 2022 12:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KodC82h9EKZWzs6ideOA1rQgC+hQ2rNyJSdD72QpIKw=; b=eeZFVGUGINyVAy
	AS1qMKCUKSWUHFk9dQJ23oRGrtgk7JPHU2hz7wk6hazi4gQoDg+fDr7TcxGf2bSY1JSBHYYgHXhtY
	kMsssWujWNzXBnW3yFdW0JJO68pphc2UqSiRWTAO065fcoEkxwfD6QcWo3m1dgTsqLGyyfaoPIlLN
	OlfEXYvLDaVWhQaXbqQo/RvdhE8ZT4fFysVFR/v+OP2D5m/WGRMsVKsUfF35ZvoFy7yp9kBLjE+1S
	nrZy/lrOvf6ciQu2+Nd8KQxQH8rWz5x7acjkD/ObKADQuEEQYXLCw2IilmuxrLiYVaQCsiIfnsGBn
	qWl7AJDOEAtXRWHk5A5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nD3rG-00FgY8-OZ; Thu, 27 Jan 2022 12:26:34 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nD3qZ-00FgBw-Mi; Thu, 27 Jan 2022 12:25:53 +0000
Received: by mail-pg1-x52d.google.com with SMTP id h23so2117568pgk.11;
 Thu, 27 Jan 2022 04:25:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:subject:message-id:mime-version:content-disposition;
 bh=O1I23lbQxRbS0gOwtFANQA3pcrPYjeU63cIBD11oRIk=;
 b=i5ImrwVteI+wtF1s3wLY+xLdAxQ38qOy7dC1ucPNotdJHpWcWmIJKhvKzQSnZuTR1/
 Dw1zZ8usOXrsrNA+CDbLVUpXvLGRmn5l5vb+tQljSE6n6m4I7cTXUTwyaO6ruPkCvxY2
 EAJFGB25BSI70xceO2/nP6jcRZvF9HzI1dmaS1LtMT++n+B9S2f5A4lBwJ3hmW2gbvwL
 ch+xJ1011efQFjEqkmVY401bN+u9K6q8RZFFlmRf5fu05++zkKB21X72AkVRJnQMxtQr
 X2oIfzDlYH/81wRYAzfgI9bSichNt89UlSRfhvQ1x+AyZh5Kxc2YfmRliZ8N30oe1fKD
 d6ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:subject:message-id:mime-version
 :content-disposition;
 bh=O1I23lbQxRbS0gOwtFANQA3pcrPYjeU63cIBD11oRIk=;
 b=E9rg3HurNH6oy6NWsO4Prb1iBM6a9DUriGRqr61IJUMOw/MVidRZIw6QQRjldh/JvJ
 0wUZgA/gLE5ytXLhn+1VKTiYeqI4/5HII8in+j6QRRUoM61m5AsRAXWLa7JH26ds0AO6
 lOW8+akDzhJv9onRxiZi1uPuPAUxogI/UmeTou0mk+cx8iFlfxFLPiwfjPZDXLuryfUB
 UGDhMiL0Zx6gYeUhq+2GQrFgXTwhQYz1jjY0jBRklFa1X6ykmOs31OmFibac+ycMG3i5
 BX87+UT+PDcVMd/axUisr3YXpdDLNWVY/T++sbtYPGdhVndIdd4K/Wgh93bIr6UQpIIz
 cllA==
X-Gm-Message-State: AOAM5320Ws5pIohFBF1ENCfO+VSimusg5W/ApPkJ47RcysVoWyeTNRBN
 cXPtvAV0yvxftBqkHXZPFmk=
X-Google-Smtp-Source: ABdhPJzljtiZkNavuj8PTXtMzuBTWC8mRa/5vu2o9iXZNTBRbSiKzqtfcQ5nn54sDBZ07MZBgxSIcg==
X-Received: by 2002:aa7:8582:: with SMTP id w2mr3185167pfn.3.1643286350264;
 Thu, 27 Jan 2022 04:25:50 -0800 (PST)
Received: from anyang ([106.250.177.234])
 by smtp.gmail.com with ESMTPSA id y41sm5843977pfa.213.2022.01.27.04.25.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 04:25:49 -0800 (PST)
Date: Thu, 27 Jan 2022 21:25:46 +0900
From: Dongjin Kim <tobetter@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: meson-sm1: fix wrong GPIO domain for GPIOE_2
Message-ID: <YfKPSvnFKOaLr74+@anyang>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220127_042551_806457_08A95902 
X-CRM114-Status: GOOD (  10.68  )
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

GPIOE_2 is in AO domain and "<&gpio GPIOE_2 ...>" changes the state of
GPIOZ_14 connected to INTR of 'RTL8211F' on ODROID-HC and TF_PWR_EN of
'FC8731' on BPI-M5

Fixes: 1f80a5cf74a6 ("arm64: dts: meson-sm1-odroid: add missing enable gpio and supply for tf_io regulator")
Fixes: 976e920183e4 ("arm64: dts: meson-sm1: add Banana PI BPI-M5 board dts")

Signed-off-by: Dongjin Kim <tobetter@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts | 2 +-
 arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts
index 212c6aa5a3b8..5751c48620ed 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts
@@ -123,7 +123,7 @@ vddio_c: regulator-vddio_c {
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <3300000>;
 
-		enable-gpio = <&gpio GPIOE_2 GPIO_ACTIVE_HIGH>;
+		enable-gpio = <&gpio_ao GPIOE_2 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		regulator-always-on;
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
index bf29afac645f..d4349b355e4a 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
@@ -52,7 +52,7 @@ tf_io: gpio-regulator-tf_io {
 		regulator-max-microvolt = <3300000>;
 		vin-supply = <&vcc_5v>;
 
-		enable-gpio = <&gpio GPIOE_2 GPIO_ACTIVE_HIGH>;
+		enable-gpio = <&gpio_ao GPIOE_2 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		regulator-always-on;
 
-- 
2.32.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
