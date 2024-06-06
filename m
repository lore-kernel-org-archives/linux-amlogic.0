Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5759C25B75
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Jun 2024 08:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZXKprpnpBmbEnNUPeYdJfQpOV00MX/wUrSRGJY1Tgys=; b=IELvzjwYri8tf8
	GB94tuiduRbMLo7cdKm+eVDyA6vAbk71qeHJUwfqaK5iIZg7vJi4MrxwpiEcEhjq9zqdUnJPafTnj
	Y2BYFKcquCg8h5bxVHikJkvU4EskWdeIVPZmaOuzmRBmi5TaDhus2TFdtZaaetZi9gGunX1FLmKaC
	QKH+A3Z3gUx41YJDJ7zTEtzaAvowRT6+Q2DCPUxe8TZuMILGPSd0MffZD/DqIhL49CSK2nS4KBzcX
	sdJtwxdng1ESLf3QtvxqV80Ay67eYrY4WSoimX8raX9WtTkbyUflx73Thx+6t4KOxKweG+Ywh81CP
	8DeGg2NoFIf46F/E1bIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF8nh-00000008udt-2cka;
	Thu, 06 Jun 2024 08:48:49 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF8nG-00000008uIM-2hop
	for linux-amlogic@lists.infradead.org;
	Thu, 06 Jun 2024 08:48:24 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-421572bb0f0so8624985e9.0
        for <linux-amlogic@lists.infradead.org>; Thu, 06 Jun 2024 01:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717663701; x=1718268501; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+IWuxffXrg4LQwBLFnoOeZEokseDHoUki1HFBLSFSBM=;
        b=ajgooW76Ol5/axkNHwktvpeziiJGLe/eyuh10YQpG1Sgkjgc9iWv4DSdiuPzIUwlqU
         4pTtivgd9JimJQPh7LYbsMZdte0cEBhazTf5mbO7rpnVE8IfLdQ7P9tb9OBQibqth3Bu
         8aKQuoXU5HOj2bSn66rC3dR/M0lOquRInuhqsr+xyq1bxOMPgQ8kRxuRdO4scXXRZNZB
         UGIny4gsIPRv4qShhZxeU4af+6lpaAhARKxTK7QUlPlgSTz8J/MTLBLTfDiXH+6k8Yar
         ofVuHgS8mjQyGMno0AbTaxZtrgnlHaAE24o/taBkRQwbpd/JZMhM4nBPm2ceaw1uY/uy
         EH9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717663701; x=1718268501;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+IWuxffXrg4LQwBLFnoOeZEokseDHoUki1HFBLSFSBM=;
        b=n1gm0FPgjTm7eG+bvXXc+KvvKaXMK6fgNpDZWE41SOjk6JgagxoZILQr4PzFu+CBgf
         DC9xBIV0fUUwEdl2LBXlPp05HbH0kdlxtVVcZC55yuVE99C08DZ5rqTmtUrNp+32LTQR
         lEuMa+fy2nnAaowb+wdieh0Or8KW8jbn2d46bcLw+RBXslhKLacq2PzdKh4s4JCUF2Hh
         Hu2XWGLWYrsQos0F2WnzS+3sF7cEcK2BP1tjxYjWbbtr0YBJtxHPVxpmkqT1lDXvFtjy
         dy4B2pRIdjrVWPBNiTmVgESJ4K0ypw31v70Ncsr0HP/V5IfIFu3IseMJCeUri+3Fu7w2
         OCtw==
X-Forwarded-Encrypted: i=1; AJvYcCUeTJH7vU+vlypFcq+z/h6JUjH5wYCG+SYlxaX3uI2eCUvk25Z56tGz8WH8UrEXtDEDoDQoj/IK6lkpKcB77rTpjcduvIKOrXFg91Dhq2Ey4nc=
X-Gm-Message-State: AOJu0YyIJLQvkWovR6WXi8SEjjGDSv1E+TSv1s6biex1B/DNtNCOzpD0
	tpW2mcUC5QXyz0Z1UJZI8RIuP8zPzrwHaHRw71hFdmfOfx69HddoFvTarKP3fCA=
X-Google-Smtp-Source: AGHT+IGalqseq3iSUyoZ1rDpRKcx8jiSTVA95CddC3u6Wzo2fIiN7QpZR/sxDIygQnEaSIhb84DOGA==
X-Received: by 2002:a05:600c:4254:b0:421:55e6:d4fe with SMTP id 5b1f17b1804b1-421562e7748mr38548195e9.19.1717663701048;
        Thu, 06 Jun 2024 01:48:21 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4215c2c690dsm14227445e9.34.2024.06.06.01.48.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 01:48:20 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 06 Jun 2024 10:48:13 +0200
Subject: [PATCH 06/12] arm64: dts: amlogic: g12a-u200: drop invalid
 sound-dai-cells
MIME-Version: 1.0
Message-Id: <20240606-topic-amlogic-upstream-bindings-fixes-dts-v1-6-62e812729541@linaro.org>
References: <20240606-topic-amlogic-upstream-bindings-fixes-dts-v1-0-62e812729541@linaro.org>
In-Reply-To: <20240606-topic-amlogic-upstream-bindings-fixes-dts-v1-0-62e812729541@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=798;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=EXGEWAhKpF7QnohcFYB5Y1PiMZfbRrYfXGdvRy+dRzk=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBmYXfMxNcVWAzCvmfhczk/oa52KNH8pz/V974sJxZP
 zqYfDwqJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZmF3zAAKCRB33NvayMhJ0Rq8EA
 Cu8y+nE/eTc41AHaN4QELvpQlLweEg095Ph0hOo2cdNBpmZ4KJTAF9JavC985V9svwTtKY9mB3wxPN
 tZo8p+6s0z7IVzxtlnxGw4wY1bVudbvxU8Xgp4Pfn+IvV+d8UKOKNNrGLZ3Db3pUaOFRis+1qR2tI0
 p+sqNS/LwW5kbXzwgStosHdh4cR6s98BD7RNb65dMCkGr5fQwpaPs7vzNpNz2smvoiJtAAqWC2v62G
 w/8hTjqDyD+gh2dl4abMQtAM+lOLNtnezkoOBJ9HCIP7Ewd/Jq4m26wPo6t7a2M6NGOF+euSzOxCqV
 xDRzPWIoXrL46RUhF3fN8244TrlDww9mwFYVTf9NMlwsrUrZKaj17RA65sbe8RGbKykL4Jtqif9CNW
 DIiqaYqxdnBnVcXoyZS7MEm8hoCEcUZHM4pdXdq49POIYJBK+L3fekQMK07OToNPvC9u+Kx2DJjKRF
 ddIO1yHtCEDZAgi5YF7bxGn+sHXVyxs8niOg7upYzS0gs57AIAlOfSaUipkG5nRoiT5rRYqIu/jW+m
 HjH0QTjM4CRcsDnuV2aIVN7/bzjU2NGr5RlJ1j5wQx2uEfXy9rm0zGiaFHpKkj9m+p7ESvldLwiKRQ
 qqYeFOpOJ/bqRBTnbygUt6h1MtE/8/jlmOxo/RWHfrakoyfp+gtvOTxS0SkA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_014822_893491_3DC15C6D 
X-CRM114-Status: UNSURE (   8.87  )
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

This fixes the following:
audio-amplifier-0: '#sound-dai-cells' does not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
index 17c38bb3368c..e0f15d824249 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
@@ -24,7 +24,6 @@ dioo2133: audio-amplifier-0 {
 		compatible = "simple-audio-amplifier";
 		enable-gpios = <&gpio_ao GPIOAO_2 GPIO_ACTIVE_HIGH>;
 		VCC-supply = <&vcc_5v>;
-		#sound-dai-cells = <0>;
 		sound-name-prefix = "10U2";
 	};
 

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
