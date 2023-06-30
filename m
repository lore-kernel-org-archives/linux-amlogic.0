Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1411AEB64D7
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Jun 2023 16:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5tlfdqy1I9aOzvLCOTD41Wf0Dvk8cBjKQE7LA7H9BJk=; b=HXz7UYdUzrUOmi
	UIBIPnD7yW9wRL18bdADcpUmGNnHU81kUT5laPIEP8KzMFS85gRvMzwU3kE3t0xtKuEPbjnmRE3NV
	hZQ1Nr4yAirFCm6YotZ+PZqugmEmMCJ3iIElyyxvz86VZWvbGShlJl/O8dihy5hS92HbiGPAajZ7w
	Fza6S6DqzpX+VQPpgcs3IVJ5Ju1Lmxr8MWZUk5yiBEbPh/W9IzgP3qjWu7mqbKtCKvwd1j2cJs0YO
	+9A5FoL3C81h/wkoovR2BtGzmX2kQbEIe/hiVecdmQr6Vdu9xS8yACu0gtH78boTElByZwwAeVdKI
	3yPhCTU1zCus1xIBkWcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qFGzx-0043DH-2H;
	Fri, 30 Jun 2023 16:29:29 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qFGzs-00437g-07
	for linux-amlogic@lists.infradead.org;
	Fri, 30 Jun 2023 16:29:26 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-3fbc6ab5ff5so10142795e9.1
        for <linux-amlogic@lists.infradead.org>; Fri, 30 Jun 2023 09:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688142560; x=1690734560;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2+ge4K54TEOm7/rx5aIH7nXv5noKUxUQbqIp51XysbU=;
        b=J1Ks+nmhLmK/yIjXRjKXrVSyZu+qt4jmmi/bLA1IYs3KR9uimZVAJ1HEuSo5W+Z7H/
         JWKyfCb9ctBjOMB7uqlKuOuSFpl77/Sj1jZTRxnB0Z7fKUvUd+UIgFfZYd3u5PjzcASw
         3lzTO9XjR3dnOSfpDYavATmJoFCSNDJ1aHk0V3O6xZNd99biNOtWn+KKUbIzVVMo77Do
         pK7e81U7FFfrCLzISieqln+zleDgQu3BfE4lVa4lvvxq3jPdBomQ/lr6N9gBwVz7rgYg
         WjnrgtZxK2xvjdgnmGVdJG3WEOMLzyqP/sp3R41U0gOKS3UFUM+9YRsjUQpUJpQXpeQV
         42WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688142560; x=1690734560;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2+ge4K54TEOm7/rx5aIH7nXv5noKUxUQbqIp51XysbU=;
        b=OUqkafEOSrFojLAp+HgeIgg2ApFUs4GGUvfd2yhsEnC8CO9QjKZ62lKxOMeG4ubwoX
         gt3eCb1mfDjUDaK6y40lX0Rd7cehOnVH5cUsZX7MYZ2Re1e0g+Yer8HsrUIQEkTnNGTM
         koFXnbuDmGJZFCeX1VLCQC2Du4pi9ptvVBeibMM/eAbHhrsSXJWrG1Z/JWf1M3UrYVSo
         pAhnBAENEACnKcqVH9Bb9X/yp5t/lSfkF7RPV3xpJCYzP09pTodA2ih2xKCW5CRCtf3N
         Mj0po3g/p3sX/QiosUUE1QHTd/U0OPZSaGBfIqCsk0acZvaNPnNfHSKhbtYsUKdcCMa4
         ei9A==
X-Gm-Message-State: AC+VfDzZyHbbj3oAtTn1jybihR2oBBBOiPzzO4SCYKvTWy+K6vU1A5c/
	pJ40DHesdOhdyqbNEZ9f2kAyYA==
X-Google-Smtp-Source: ACHHUZ7+BKIoV4xg598c9FcGgrVTApX6k0SblZg1KAXK2Su2xV1DQfef4QNQLs2dAHCtVhgm3/ucSA==
X-Received: by 2002:a7b:ca48:0:b0:3f7:948f:5f17 with SMTP id m8-20020a7bca48000000b003f7948f5f17mr2495585wml.7.1688142560218;
        Fri, 30 Jun 2023 09:29:20 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id cx16-20020a056000093000b00301a351a8d6sm18835836wrb.84.2023.06.30.09.29.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 09:29:19 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 30 Jun 2023 18:29:08 +0200
Subject: [PATCH v6 1/9] dt-bindings: clk: g12a-clkc: add CTS_ENCL clock ids
MIME-Version: 1.0
Message-Id: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v6-1-fd2ac9845472@linaro.org>
References: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v6-0-fd2ac9845472@linaro.org>
In-Reply-To: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v6-0-fd2ac9845472@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Nicolas Belin <nbelin@baylibre.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=708;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=2BBkVc8TRDNmHWa33LPRxnRmu9hb0Ks3oe1kaJIh+rY=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBknwLau1zel3znaoFXRHvm8v9nGwRc+jS3jn2r5/YP
 4uXeT2yJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZJ8C2gAKCRB33NvayMhJ0T5bD/
 4imT9yiAOF5zIvuIj9aCuaNMuqR8MW8jMUm6XGMwTiP0uoljcoGWPDwMKyIG1/+/xY42La8gfRHk4/
 3ZtfR0P6o1PAT7b23wDPosJG5xJbLO+RPDSv/z6QLiA9S46BDbYCT4tEcc5OkmC2phi2XJTZN5VgJ/
 +YD6VFQwnwcXNvK5niHTfFY1sOSYJ2kTdVkk128ETB1ihBwTS5k2RpsdpuX08RNUysHizODZk3PeiJ
 GLnKpaVWCVbKJiHsj+09dRgZy5Jk5YzuCQYL5r1lZHpx8fZA7BiLo5UqePwpM1Jjp9B8Y8AhkAxBIO
 7d68VX7wNOJSt0AlbwrelecftuqGoTIUPafuMUAZs5of4hABKdkWm0A1vqx4MuUpR0Rung0dr+ITEb
 Bqbcb0MX6p4G0orZYph0YqliRgFacr9YRSSkmNqpcd2QUBD0dyI2RJAw333tFlcZ5iNDjzuzkyk98d
 cSjJM80zQz74HUL3XyPCuLyAx9SaEL/8G+FGoA9Dx50rPFTA5zcUnBDZQJ86PkfSFBi17y+Js8jUQo
 /qr4cfRdi6sLtneh1CVkNPv1K4fcWOOj+TcTsSNGYwm+PWmrB44ajPm4vuSrZl2Ci6uU5/8PRYjP/L
 hQZYKF+r3whHKpljUXJERnJm9oQTuD9JMJQ/lKKvBR9rJp7ez+rxiwS2om9Q==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230630_092924_083377_92568D14 
X-CRM114-Status: UNSURE (   8.15  )
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

Add new CLK ids for the CTS_ENCL and CTS_ENCL_SEL clocks
on G12A compatible SoCs.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 include/dt-bindings/clock/g12a-clkc.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/g12a-clkc.h b/include/dt-bindings/clock/g12a-clkc.h
index 387767f4e298..636d713f95ff 100644
--- a/include/dt-bindings/clock/g12a-clkc.h
+++ b/include/dt-bindings/clock/g12a-clkc.h
@@ -279,5 +279,7 @@
 #define CLKID_MIPI_DSI_PXCLK_DIV		268
 #define CLKID_MIPI_DSI_PXCLK_SEL		269
 #define CLKID_MIPI_DSI_PXCLK			270
+#define CLKID_CTS_ENCL				271
+#define CLKID_CTS_ENCL_SEL			272
 
 #endif /* __G12A_CLKC_H */

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
