Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC2B3C636D4
	for <linux-amlogic@archiver.kernel.org>; Wed,  1 Feb 2023 20:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4pqrf22EOlLvcwqswR4YRD15SRL7YvxHI5BciQn8ojg=; b=XHZcZza+/DZJxO
	opy2xKmHbbUkGo1B5VTKC6J3NQxuL1Ut0eb+blSaqlYtUQ9G0Uus94w2KDFpxZoO0pBWekkvczcyp
	wA1DnVpRC444w4VP1epVuUZNlrX0t+nGRzzQcq3UAI0w01sUilz4GQIO19jiIMyflBdXOcwY0JNP2
	SXnkx++Nyt9uIrP2nwBOE/aZvc9UCMKsdYxIaXwARlS+Ezoba5zmpWsvIVOQK3VcfnxQCBspz6dxe
	rppsP8UgabFHnvRRrypMcXNPp8Mcj9UIotXR8+ze4m0Mw7qLNToj4U6UcJS4/WqheHKbZUbHHm7nK
	tnvChcImxOS2DZ4xLoVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNJJI-00DT0i-2F; Wed, 01 Feb 2023 20:02:24 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNJJ9-00DSvd-O2; Wed, 01 Feb 2023 20:02:19 +0000
Received: by mail-ej1-x62d.google.com with SMTP id qw12so38839988ejc.2;
        Wed, 01 Feb 2023 12:02:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qSroPy2WHgGfW4fqnkho5f90ztpMpK7y6tuzoTj/kVc=;
        b=D8BtHxYRruMEAMT6AyhMVE0cV2GFDa2AjI0UQXoZmCEw5ipyVKHWcEH5fZxqOOexUW
         vcWG5KdD71WyezR2Mse/Ezb2aYo+HV9x4VnG5uFkKh6vsh6lhIVy0Bt8QptGnqgPuKaQ
         fnZJhJvEwy2f2LaAs2p46SACCdt/6aow4kEIhN6/jpgJGlRCxDSxR2x0IWauFsBF9j31
         wYmEx9pcAvblNsWa0NRRV6Rzfcc0RmaeQ6mV56uhUrJNOM1kNRyBsnaZ7vBYHLQLZO6G
         EdEO6OIuvfxXftC5kRrLJC+Dl48aUQbFK87zNwB0gIs5VRc7yzUTOEgRr261EnJr3was
         jMRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qSroPy2WHgGfW4fqnkho5f90ztpMpK7y6tuzoTj/kVc=;
        b=KjqyNDAoiRL7uXsQ7UeXaa7gJKeF76+b6KYXQlieMUQlgKHSCRX3nvwEWle0A+QKcj
         kcgDAHhFJlpekAlDlNE3BQtN1omcYMtfuUi6U233ZYqa4okEsbJr+qebyswJnV+Pgh/m
         rzuK5W+ZVMHx9AlBOdkCmwRaVMmNWkmByMaWcOGk8aLsOSbbwoFEaRshY4KxUIOpjnM8
         i+3Heo51P7CideT27Z+mcE+3gCC533Vz2kyeCXxl1vwc4mm5vmcVi4r382/RZ0KwWT+G
         hLtUXfBRrBvcvaxwvyn1rSasmP2C9yOt8qcGsF+O60OHou2x5AGVyzouCiCgjYPVkaE4
         /6TQ==
X-Gm-Message-State: AO0yUKUivlIerDbm0hUeNgkSN+I1rZC7jNssOByuFF8/udmsxomD2YAn
	wroCu64O6NINwiuAQUYBBXM=
X-Google-Smtp-Source: AK7set83/MjcdNvgrsa/LwVxwaTVpq4xOQwjEfak/z3lA6Jw+klDakt5Xb2m+6JuYulQhsFfPPrrNA==
X-Received: by 2002:a17:907:8745:b0:882:82b3:58bc with SMTP id qo5-20020a170907874500b0088282b358bcmr4233828ejc.65.1675281731737;
        Wed, 01 Feb 2023 12:02:11 -0800 (PST)
Received: from ?IPV6:2a01:c23:b912:d400:3963:7bc4:12b:ddb3? (dynamic-2a01-0c23-b912-d400-3963-7bc4-012b-ddb3.c23.pool.telefonica.de. [2a01:c23:b912:d400:3963:7bc4:12b:ddb3])
        by smtp.googlemail.com with ESMTPSA id d27-20020a170906041b00b00887f6c39ac0sm5660738eja.98.2023.02.01.12.02.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Feb 2023 12:02:11 -0800 (PST)
Message-ID: <1ce888df-6096-73de-a98a-354d086428d4@gmail.com>
Date: Wed, 1 Feb 2023 20:59:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: [PATCH 2/4] arm64: dts: meson: adjust order of some compatibles
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Thierry Reding <thierry.reding@gmail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, linux-pwm@vger.kernel.org
References: <8df4ceec-663c-dc68-d775-5caeb02c0cca@gmail.com>
In-Reply-To: <8df4ceec-663c-dc68-d775-5caeb02c0cca@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_120215_825498_CD0A4657 
X-CRM114-Status: GOOD (  12.08  )
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
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi | 4 ++--
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

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
