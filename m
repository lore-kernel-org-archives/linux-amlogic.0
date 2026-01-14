Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00662D38FF1
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 Jan 2026 17:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aBK3KYmKbzWmmoqjViN37NhU8OVocrd47R/S1bHpxHA=; b=EK8qlVog59Bz17
	YsZThmA7+OU05QnZs59JqguZ53vv9HsAZuNREX3jqKBdAMREOdwWZmkUxSgJ4IMAmuf99xDpHL/z6
	EG1pjLLG+6KNJivnoEfZjhlD9YRrUqob3Jb39f7rLl2TmFQdwW4CoHZeYgrlcX1eEvcLr7DlBulwu
	IqKki0dLFf+/f9J1c3ZyI7eYz5cysHnL9vFGoMiE+rZYnJoXC9alT8nMEWo0egiQJstgu3eWeb5AI
	z1STNTPZ9JFIlI0VnICz6fM0s8+a85fH4RDOL95+nq4CG2biiT4aV19Zs54dOxc9D6b1dVZ/YB8Ba
	AZYztUTr78ee4/Qr+NjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg4N9-0000000A3VK-2tP6;
	Wed, 14 Jan 2026 17:09:31 +0000
Received: from mail-wm1-f45.google.com ([209.85.128.45])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg4N2-0000000A3N8-0qKt
	for linux-amlogic@lists.infradead.org;
	Wed, 14 Jan 2026 17:09:25 +0000
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-47a95efd2ceso468995e9.2
        for <linux-amlogic@lists.infradead.org>; Wed, 14 Jan 2026 09:09:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1768410562; x=1769015362; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IWPhJNVbobU6XSfH2Kesr7hZ+g/ZJF12G4xvyrhHF3c=;
        b=wDj0NBgEfsK63jWEdUov1YrKFRVQUuFWEVsRcH/RrqPX8l4pOGgGs6wVecwoy6pGYq
         NmR5KEEXd+WFCji3yvQ9tm8oR2oiaIkl6f2sf5iXzKssmP99JPumYcqt1JdWLjUnBrBZ
         Dg2qF8aOjnKvMvgZVrU+g6U45UwMcpRSo5VA/JQfx3IiFc1WfyLs8jIKBhLgWdrSbMMc
         hqzkw2Zlcx107dW1T4sBh3UH8xHPgWij93X8it6Wu4UOynSutK59VkqnetD0H9vFwrHB
         IQYqPY6IiqItY1yHfPHK1H8n/91fSH+nVOse9fbCjogK/gzz/gWtsbwgcHnwh9jqB0Iq
         gO1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768410562; x=1769015362;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IWPhJNVbobU6XSfH2Kesr7hZ+g/ZJF12G4xvyrhHF3c=;
        b=YZn6oqgpeFqEk5TF0xYKdyR/dOHET1x+4JfKVSq4n6t6R+1Wnckaeb9ir8o0yCLI3T
         /Gw+Zy4MccNAqIUPhFXmCmZL4PIfM6U0vNy4ZLRm+rrArxuDznQBtB3OS4/j8UHWEkSu
         ZkTqaEwhGhT9FwVMeWjf35XqXSck47qVYhGMCT0hEBKorQs5AFf8kfBpkUPRqAGT/X6q
         eRWgSr9zQsSwXjwrljYdUXvgErVHydgK81SYuhKNAjfVbEMixxDTv0CZCW1OPDlAfMLT
         UL7DqMoQaAj5GXc8sWoyHNKwcbQPzcZwCxLYKZj6F7+SPBNGg1vG4QMbsv2BVXhmZ61d
         Pxvg==
X-Forwarded-Encrypted: i=1; AJvYcCUo7X3vzfmWl4j+M/AOuVadzcZ4GBVKiz6xA8vmh7uZjc1Qv8+D/r9R8i1cdFgWB3iXDsfs0ffL1h/YBHgZ@lists.infradead.org
X-Gm-Message-State: AOJu0YxP7SSdzfq8vH4m59fDBOd9jW77ELXVvJ1kjj0Sm7t6nM0MNpGB
	081zkzexL8unCQGkiBOg1dZOdxAFOnNs52ngAXC3BqhZjKaof8BSUW5M3sim2E06y5M=
X-Gm-Gg: AY/fxX4oxHlQHe1nOYcyZEE9gdF9t0XkE52qjUDddLluoSXXl9bGoXljk7KXgMK/U59
	fSVXAsHeIyTCfAeLTGj5sKyMk7uq+NZlwjSaI3cvkc569Iy/zIB6zTXGCrJjn8jE2ls0SOyMyFQ
	lsJ5h2gQdkE/JnLN2xDWk4CPwfu+Ipa/9y5rDHbxIeIfQ7Cdp292KBMv05UoXCmyKs6E8gWc/re
	SoFZywMWeLc77JxxQMF9prQk0/WIimuDq7oZT2dbT9fN+ydJRE41iVkxGmW9i2I/503KLmcg95k
	Rrp843h7SEuBMPLYNEe9DFmOAIz6/kXqpeKCHLdt1khSY4RlrHuxxo/MUKowuw5E5onv5W7T6pi
	asp9jLW7CJurrV7Hz47dvyZSKOYuvY5KJRzOF9Tb4bQNKwUoxbCueP3d+H2D3o+oGXRGEADwhvz
	XZR2H0rpWZAw==
X-Received: by 2002:a05:600c:6612:b0:477:af07:dd1c with SMTP id 5b1f17b1804b1-47ee484e6d3mr37626455e9.35.1768410561853;
        Wed, 14 Jan 2026 09:09:21 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:d3d1:7ba4:2f56:d18a])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-47ee11c64b6sm24952125e9.7.2026.01.14.09.09.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 09:09:21 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 14 Jan 2026 18:08:49 +0100
Subject: [PATCH 2/6] arm64: dts: amlogic: a1: align the mmc clock setup
MIME-Version: 1.0
Message-Id: <20260114-amlogic-mmc-clocks-followup-v1-2-a999fafbe0aa@baylibre.com>
References: <20260114-amlogic-mmc-clocks-followup-v1-0-a999fafbe0aa@baylibre.com>
In-Reply-To: <20260114-amlogic-mmc-clocks-followup-v1-0-a999fafbe0aa@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Yixun Lan <yixun.lan@amlogic.com>, Nan Li <nan.li@amlogic.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1263; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=/OqmpzZXJV31wCuaWL4zZxA1iGG4vjBprzgfZD+QnSs=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBpZ823laBGoAyYB45m7xphCzW8RDiFqXRoJedCi
 vZezmsjY1aJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaWfNtwAKCRDm/A8cN/La
 ha6GEACW+UFslpIgSl2ZSJ0YTSFO3huyz+l+EbM/Mo66HPWaFC7/W6xzW5b/FkXTfmkhlHad7M2
 4mrukXJLVO29UzZLx7T5/Ugu5P6xHrNaV11EiH1d0j0NQ61PPg6/WhKaG7fTsviZHdraVoonfxs
 XWorhdNO/0mrctyN/4yegZEqCf2eyMjV7cU6duesOHSUE2k7nfCeN7vuwk2C9qYp3xL8y30Yezn
 YXU91zYrAC2+n4hSKE70fZsINRwzXTjI8+NYVa/uMiRilQuxNbDnlOfbwME0q+4qqXmZWvwZASB
 CnHpT2DI6NI3z2ZgNUBP0N9eFCi9a+RdDhfG2TqzMTfLERKDOOcIzAYzTKKLAVCoJUgxeOjtDIa
 4G0oar/1XlO8nB2iH/sTY5KEuLKRpsRLwAHqreSTJGZP91ed42skyoweRdNvNAZ6kIrx4rLX9Xx
 yUfgUoVlbToTCqgb/VHcHpbcUpPBO27hFMHo7XmVCZK7uaLde7GQzrakdFsYxqVO8o5yjexFX1d
 D6H4y69AYFRpcA7niabcJnQ4NseN4hEaTLbGniKR3jxzr2zCaYRHFhFzEYPXVTaw7hNq1bCAnCt
 jsxfQaeKbOf4bFUO2mz/CjJUaZwxmmjj5sHAfadg+jCxjCFn3+kqBtmfO6YnRzSiJrtZ8/UVIaJ
 Cf4muIfR/grqQ4A==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_090924_255973_E4D396CE 
X-CRM114-Status: GOOD (  10.89  )
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

The amlogic MMC driver operate with the assumption that MMC clock
is configured to provide 24MHz. It uses this path for low
rates such as 400kHz.

A1 is particular in the way that is already has the mmc clock set
to 24MHz by forcing the mux to select the board crystal. It works
too, it is just slightly less readable.

Align with what is being done with the other Amlogic platforms.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
index 27b68ed85c4c..348411411f3d 100644
--- a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
@@ -674,11 +674,12 @@ sd_emmc: mmc@10000 {
 				clock-names = "core",
 					      "clkin0",
 					      "clkin1";
-				assigned-clocks = <&clkc_periphs CLKID_SD_EMMC_SEL2>;
-				assigned-clock-parents = <&xtal>;
 				resets = <&reset RESET_SD_EMMC_A>;
 				power-domains = <&pwrc PWRC_SD_EMMC_ID>;
 				status = "disabled";
+
+				assigned-clocks = <&clkc_periphs CLKID_SD_EMMC>;
+				assigned-clock-rates = <24000000>;
 			};
 		};
 

-- 
2.47.3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
