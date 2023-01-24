Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 164D3C25B4E
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Jan 2023 13:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nBNTdflGSfuF10GFwcxuI+znJIN6uDnOjvv3cSn6XUo=; b=LKn0Ct9crp0Utw
	uClS/iWelhfw8Ffj4kzdiz9phC6k+MBGFmaGK7O+paK1Er2fPfoCQAtvjcan/BRCLysTymxMnp8zR
	2ZkZD1LZZPdcDbqTO8Av3Wnmw7/Ze8DbtIn/5MDNz4i6g93NzOAbWZ+S+NKgA41TdKnBhA6SufbDQ
	brNEcnPKavWYp/pWaKHCTpQL7++yq0SiDar9O7hors5k+xZe7byoOq/ORqd94aUzo+EibOUf1zMUs
	BeiFo7cG9LCWguZZXc7utGQf9x1dZkLMTFAPPNz7KPBaL79O7c7PxXFvrEOnQaec0wndYd+0wc1Ie
	xvgg+Xkb1kXR5LqYzUxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKIyI-003q2T-Rx; Tue, 24 Jan 2023 13:04:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKIwq-003pOu-5O
	for linux-amlogic@bombadil.infradead.org; Tue, 24 Jan 2023 13:02:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=8tznsJFtlfJ79s/lJUdTAi2Xm2SaIWvhahisW5yxhsM=; b=FI9WA8zM8PKtoinN7uOlWALLkA
	qdO3zb/7AzRziFlplVG45ZHeJ+XUY/PzxqyCYsMvPLGvyYBpx3Zwj4aoUYuDqR3UEiAb/GmeU8NfM
	zekSB7cAFuFbQhakeYUGzvS/D7H/cRP3L4SU3p4kK9VKt/pBaqbNSgsQwFb5qDrDJBmJum/yhwBsl
	7PJk+gRk3QoLVov9ZuivADm3FfqyMrSLz62HyAZk6cT2kAu7DmlhrM5df/kCVZE3koR6i4bVKJuvh
	rBgZpUaC/+Zlj0xnmO6YrX+CmHuMgbkLI5E/QvVR092Aco4d3mKH3pO/r84h2XoHK4NgYiCaJtWKo
	RPRvOPWA==;
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pKGcx-001mt3-16
	for linux-amlogic@lists.infradead.org;
	Tue, 24 Jan 2023 10:34:10 +0000
Received: by mail-wr1-x42c.google.com with SMTP id e3so13380209wru.13
        for <linux-amlogic@lists.infradead.org>; Tue, 24 Jan 2023 02:34:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8tznsJFtlfJ79s/lJUdTAi2Xm2SaIWvhahisW5yxhsM=;
        b=zw1HzocInxkImdRCPnwIbeBO9bBEXqsAiJGcZt2+RhsuAiD6jusrdPj2ZDK/kKWuuJ
         nzEuWvbz/gnlkS3re3nlOYhle6ABLTaSpsk33dkRbyDs5tg9RkOYhs8HCn+nynyTnvTU
         7s+WGLIg5ggvOXua9p3kLha4PCv58TGgOFpIEdZr9qBLYmZ4hS90YyehA3r0pUprC2c+
         O1zU80yO53YUhVAV+quuT386YML2ti/syFz2sibQstfGH/I1lXYwP/tCuyuYw0vx1kGQ
         ayUsRNAwHpORvdrShw+gX5K2L2Q94urDLEWa0MKQO5jZVBCmJatLIoH5uV8sk7SuoxR3
         FmdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8tznsJFtlfJ79s/lJUdTAi2Xm2SaIWvhahisW5yxhsM=;
        b=LI8sy2iVbkg3qFqirOA9feO+fgLcCdkHwHLxi3VhsM0tUOsqBDD0zzkPQsk3pLAFZO
         Z6VV5QPEcMjDpwckl7uJzaCnY2HG9fk4LN45xkofMy34ShB3o6DO+R8ez5YHqYUjrDzt
         8oV8gBVnKhEb/MneVxEVVqzgUaTDCeoMsILE/v19nn/3SY26Zxh5hVGWuQycH8Cy8bjO
         sirqL8poAP3vVA9kg08drDn/fAuDDujtskoHlQutLK3wuw/pSqO1Qqp6qMZkWm/ZYcNA
         tkHLTFVa9KdzsDrzpcnklOQZ80yTYFMaI/GXJxJ1DTf8V5rKxbhJKGpDw53YoH5UczXU
         5WYw==
X-Gm-Message-State: AO0yUKWMEkblO5R3FDmMALt1eM+1xi9O04U1g3TVj1FQQPytM7GiZecC
	yYd8l7RZLbjzQRAa9B2o8QcDRw==
X-Google-Smtp-Source: AK7set/EL4McQuD6+JHRhTNkBEKuYH8qZi7JbPE5x7dncc2cmWzP2OSE/DKwdwtwb2RVI6/+2fjxUQ==
X-Received: by 2002:adf:fa4b:0:b0:2bf:adb9:faa5 with SMTP id y11-20020adffa4b000000b002bfadb9faa5mr2390522wrr.30.1674556474994;
        Tue, 24 Jan 2023 02:34:34 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id q6-20020adfcd86000000b002bded7da2b8sm1551889wrj.102.2023.01.24.02.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 02:34:34 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 24 Jan 2023 11:34:33 +0100
Subject: [PATCH 12/14] arm64: dts: amlogic: meson-gxl-s905d-phicomm-n1: fix
 led node name
MIME-Version: 1.0
Message-Id: <20230124-b4-amlogic-bindings-fixups-v1-12-44351528957e@linaro.org>
References: <20230124-b4-amlogic-bindings-fixups-v1-0-44351528957e@linaro.org>
In-Reply-To: <20230124-b4-amlogic-bindings-fixups-v1-0-44351528957e@linaro.org>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_103408_051364_82815718 
X-CRM114-Status: GOOD (  10.21  )
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

Fixes:
leds: status: {...} is not of type 'array'

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/amlogic/meson-gxl-s905d-phicomm-n1.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-phicomm-n1.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-phicomm-n1.dts
index 9ef210f17b4a..393d3cb33b9e 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-phicomm-n1.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-phicomm-n1.dts
@@ -18,7 +18,7 @@ cvbs-connector {
 	leds {
 		compatible = "gpio-leds";
 
-		status {
+		led {
 			label = "n1:white:status";
 			gpios = <&gpio_ao GPIOAO_9 GPIO_ACTIVE_HIGH>;
 			default-state = "on";

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
