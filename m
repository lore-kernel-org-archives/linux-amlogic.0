Return-Path: <SRS0=pha3=LB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EABF0C47082
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Jun 2021 06:57:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B53BC601FC
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Jun 2021 06:57:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B53BC601FC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z3d6IBJSzo/nezdJwCaLkhBwv6aetTQb4mmGdRe6td0=; b=dJ+MjhSKQ0tOvZ
	770xfnfGTgrdlN8DpG45YS2HYiNM7Bal1zaKJGigi0oGQDovzH//+iNxeGoeuLs4shbpJCT9J41Nz
	UDFGZ05M5g3rK0f/uCWqO5pXfoHhuDU5CvVJ5QFFtS/dW8vBtugglonqaMS6Ysqack6Cl/q5UT1l6
	aW/ILYCeSsJiTiBlG04Jj4i38aRA5EQH/ArkGJvrWF3RLRw9DV6tG2SA9nDp+BK4GKJItyrcldVHB
	dOdH55yz0iwnLbYAIlh3FO0uAzM/D2RssREvbbwlN7ghyFucihl4Llq6yOZFGT4WXwbq9hVe/mWkO
	DygsoHfZNF70Uyy17xVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lq9CH-001qPL-AQ; Mon, 07 Jun 2021 06:57:17 +0000
Received: from mail-wm1-f41.google.com ([209.85.128.41])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lq9Ao-001pjr-Iy
 for linux-amlogic@lists.infradead.org; Mon, 07 Jun 2021 06:55:48 +0000
Received: by mail-wm1-f41.google.com with SMTP id
 p13-20020a05600c358db029019f44afc845so9347398wmq.3
 for <linux-amlogic@lists.infradead.org>; Sun, 06 Jun 2021 23:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PRBWRym/hnnglzSwgB/BY82h6cifk9/yMhYsGBnagus=;
 b=hs7bqy59BYacx9nbeHjKBSMvHxv8/SkWzpVZrXwj3QCXqH0PvZ+h8WMZRSKQfXXE6g
 Dy7dyqK/NZMZc7tImJfCoHKDHiyX7tm39M4+FqvQ9xfsS/aZIhkHOsCIIIMT07bRWlIV
 tMPYTXX5PAjQhi/AWmZkvKunGjGoDpSjT6vAtmNSW9r7iBi6lqqTjUS5fD5aTifoyyLn
 KhFPby3Unm5QWDS+t0IWmbd4AMMEPBFEPmdR3uXpvOv95zp+KkyLLUeanmnEmdxidHst
 rpAVNxGontxQCXwiAnPev5d4TueHP11uNMmwfQITORIZz/r8XDQAwImanVtS2FldYhPP
 IbYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PRBWRym/hnnglzSwgB/BY82h6cifk9/yMhYsGBnagus=;
 b=SX3umSDjppSnJ6XUXIJYuHrwlQDVS3UpLiq/Rr0zlLKsSnIs1eo1BQ27Nz5rbe9/Al
 0EPyg2va1tUr9TaDwMvti7z9cOQIsvjXkN1RhpseNVPR4Ib0wEq/P+EkalfFSkG0hrhG
 nIRnAkYhghKgKceTzCVdVIEggxYGvonsOjfxwrRf04x3M831Z3P6P16xJspGKurNtB3s
 wXriTiGDawq1GLGEywD1BI0mUsSw2oi8gz7cN4mu1FEhY1TJ66jnZLivoe0gPDVsoVsC
 zZElJTAH/oLPAOGt1Q+hHb5kNHO7RSmPwwYpnXStfy17DbzVxt3z1loj5sNjOi6jg3Wi
 pF9Q==
X-Gm-Message-State: AOAM532IabuXTivvKgT+Ve8MD5tIzM0c3SsYlC8ZJLGbNG4dKW7d+iIl
 gl8Sfb5G9Y2SHLZzVURkLqk0/A==
X-Google-Smtp-Source: ABdhPJxH6gW7D5mGRHcZh6BVwLXgDOSyEe7VCtVkOl8jjX49ILsWUUjyQX5+rEEVFmMgz4tscVVXzw==
X-Received: by 2002:a05:600c:4fd0:: with SMTP id
 o16mr2121303wmq.50.1623048884506; 
 Sun, 06 Jun 2021 23:54:44 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:90c:e290:7c1f:1c9f:555e:7398])
 by smtp.gmail.com with ESMTPSA id
 l5sm16145742wmi.46.2021.06.06.23.54.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Jun 2021 23:54:44 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, tobetter@gmail.com,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 1/7] arm64: dts: meson-sm1-odroid: add missing enable gpio
 and supply for tf_io regulator
Date: Mon,  7 Jun 2021 08:54:29 +0200
Message-Id: <20210607065435.577334-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210607065435.577334-1-narmstrong@baylibre.com>
References: <20210607065435.577334-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1032; h=from:subject;
 bh=HiHya1PPCqlF98u6DQ39DcCvPVr0hE5hqFtXe3ngrAo=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBgvcJADW2KZD2C0vOutSfwcLNkDcCPiu3DweerRVTC
 YLhrV7KJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCYL3CQAAKCRB33NvayMhJ0ZKVEA
 CMpY5iWv4CxZ1dxMX5O8/iqjJCb1dAY1pbcFvWsasIZAedO5esJs2o7rk423+axPRzqAvwR/CmBiqW
 UiQMkkVodypV9fQtLtF078w2LkEj8XZgHl5UY5lnPEeNwU64CliI7Umdt68LmnvmLzz52aM0spIE5o
 +IJEFtA8MY4zFr869qL09a6kLVZxwyxd56JHk5lDknBq8dXnzAi70tK0UjYzXCxeGVIHrJmx04c04q
 +IqMpY70+jaaV6op5SQbP5xWA6s7L9p3Me5rAbLfMNRCX5uw0douYISgT/xR4l0IrA8zEbCvdmnS0z
 C6bEI/9XYcwhF7dkSaEa61m+Cd3Hw9MzbEOelSeUJMeRtzIEy/6VLdu6IAqMbkXvfx8K+xi5YhRIWc
 texbeYQgPv3omrLnTnsRRzGTKOma7f7R0hyJnv/83HvJEEgOWa1sBU8kGk4fvJGQJmMPkNohvNpXsP
 p+hfTUmN1BEvWaC3wgUurUJlM7gHtHxubpD5wU2+MvxFp+e8wwuwdVWW0bGW3G56jCoiH9xdi5/tdO
 qqiTL4Ki1Y8yoasIphY7BXuAJCBhYPUjhjCANrDvc2WNDM37PTGiIBywbz4V+mo+OhdubjLa613vPk
 WNCYaH23w4MCV70JPYDkT6mVZMH2B6SJJp3WY/FA2vdgfLWM11pbaIdUKHmg==
X-Developer-Key: i=narmstrong@baylibre.com; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210606_235546_646895_E939C54F 
X-CRM114-Status: UNSURE (   9.70  )
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

As described in the schematics of Odroid-C4 and Odroid-HC4, the TF_IO regulator
is enabled by the GPIOE_2 GPIO and gets it's supply from VCC_5V.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
index d14716b3d0f1..af40ba461074 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
@@ -46,6 +46,11 @@ tf_io: gpio-regulator-tf_io {
 		regulator-name = "TF_IO";
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vcc_5v>;
+
+		enable-gpio = <&gpio GPIOE_2 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-always-on;
 
 		gpios = <&gpio_ao GPIOAO_6 GPIO_ACTIVE_HIGH>;
 		gpios-states = <0>;
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
