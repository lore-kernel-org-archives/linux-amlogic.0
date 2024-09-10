Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81EFFEDE9A4
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Sep 2024 16:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xDB+mJ8NnJVuw4S/+39ioKqtowivvXEs2McmPDbQ4TQ=; b=t4E4o52XvyJP/6
	dnBLMXtrxUUj7tzvREzP8/VXO17456hlGxJKgNepEVMRfeESce+MdzZJ+RfY9Q3GV4sVaVvqeyder
	wVx+RCIBNOoZE0eUBsFQfSPFIhL42B1kYLPSPSxN2GJwGQtwMrtvV0npNVReyGt0fkn3ESCGri12u
	r6z38WpMAYeUxBlyEmpTshZ9rsKiv3gIK65V9fa9Vj165p+8OrylHSLCIRlF4zPQmOzvSnwYEWn2x
	lxyBfr9tnEfzN9dyg3eY4Brb+W73XiFkPPX73vQMGEONcNQ5aKAuwXlVxJQbxdieKFGT2Pc1JToUL
	Ec8rshZNq8X4mZswHcwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1so3rQ-00000006MEv-0AH5;
	Tue, 10 Sep 2024 16:37:00 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1so3ne-00000006LBj-0T0C
	for linux-amlogic@lists.infradead.org;
	Tue, 10 Sep 2024 16:33:09 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-42cae4eb026so34165015e9.0
        for <linux-amlogic@lists.infradead.org>; Tue, 10 Sep 2024 09:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725985984; x=1726590784; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n0U3ETN12gpBLws4jxOpUFqH+6wugx8Wdm0xkOdNhP8=;
        b=wA5aG6VIiO2QdHvEPr6INd3pql51Pi6CnM92UG5Uf+cySWY6zaFPb3Z071U8gN/Emk
         EIRFPMTijqDEzqiztbeCMg+yxYT+jKEMF/g/d+2YPYg6QO29r8UhiH5wZeAtYy+xpDVY
         Q49IT/+bApxVnT4mhjcsompUsp5S5ZSWBq1BB+C8m5xrwvwi2mnpJzN8ZGkv/N41JnZF
         1N/7Y8QALdLenJtGD4rvDdNy0Ek2QCg5Av1zuAI4AjV93xCa4AJnjTaL5y5JHkqBKXFX
         I0e024B0D7OHNoYqxH9CtpXOV7rsHSAZk2DCEZfJXjTOc9iW1MnxCwzEeRWO5Zdik3Wa
         g+bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725985984; x=1726590784;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n0U3ETN12gpBLws4jxOpUFqH+6wugx8Wdm0xkOdNhP8=;
        b=pikdFwIWDGac8wIJiEGhEpfVNQFuIpAKugacNB3/mATq4S27zc2LkhzJDcJENLq2J0
         N51nKj1Am5AWqMNY1qYEWwKRW7zpm8c7MXGhkMir33y1TtyRotjKSDa8hVs/s1HGJYkP
         4x6zgvLiTvudqIQP1Uo2jm0PhyFm/1mOO1X24Up3BcVcA7keWngnFibY7S6z5Gg0mA0g
         sdtkpskM9mCOx4pG7RpPA17040s/fV0+fbvTzTVJTl9E89xtuSaOmxBww5cTgxfA0bUv
         YkK/qF0v4n9POrHSKmka8GIrxT9xBsnDEaCY77Ro5yQY9wnozZG2z8G38iZco8E0Ty7D
         e92A==
X-Forwarded-Encrypted: i=1; AJvYcCU5nsS/gnjHzNZknTJFaz48193C2VsemW9AcFhX//pP8GV1oL3BEQRVZDRnuECXYyoVF1dlgCmF/kiFRi9A@lists.infradead.org
X-Gm-Message-State: AOJu0Yyf5JcWCVwidRpKhCdd1osu7/sSNLPuE18kdUeLKrs0dXW12J64
	/t1jBonAbAewLUMgQ4ByPGB9Lk9M5FD51Q5HcncLkLFUXYDQbC1BzW00eKlR4UQ=
X-Google-Smtp-Source: AGHT+IHShZC5ser6whptXqE3MziINpbjBLNBW3nIUDCuOdeUJAsHeKnZjihpf41vXmHzwdkenZA7/Q==
X-Received: by 2002:a05:600c:1ca0:b0:42c:b995:2100 with SMTP id 5b1f17b1804b1-42cb99524bcmr46920325e9.6.1725985983707;
        Tue, 10 Sep 2024 09:33:03 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:8ba7:bfe4:fea9:65b])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-42cc1375189sm25076025e9.1.2024.09.10.09.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 09:33:03 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Tue, 10 Sep 2024 18:32:44 +0200
Subject: [PATCH v5 2/9] reset: amlogic: use generic data matching function
MIME-Version: 1.0
Message-Id: <20240910-meson-rst-aux-v5-2-60be62635d3e@baylibre.com>
References: <20240910-meson-rst-aux-v5-0-60be62635d3e@baylibre.com>
In-Reply-To: <20240910-meson-rst-aux-v5-0-60be62635d3e@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Stephen Boyd <sboyd@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jiucheng Xu <jiucheng.xu@amlogic.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=817; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=TBFxeGrFtyl6fNkBC1RzGGAepksDKxjvf8LT6xC71TA=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBm4HS1Tkc+OOhDTyGuf4iOz47SD4YGoUz7E+CiS
 j9zs6E46TSJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZuB0tQAKCRDm/A8cN/La
 heo4EACaHd8VKcIzQJwErNdFqhTeL2cOA+CG3ICx/ce5La3RkdLGPTaHDUhm3zbPRsiJD9yjhDq
 h/cSnJ9bJlHcZq1G8m7oLngE5vcTT+m1hRv2I4qoFPXJBdv5/UceUHfpAXOhEURdAVbGLBNm27V
 N4l0Sy71IZ6tzRTbH+upcUJ6Kx9CzgKthfROp1YZ7zD48S5ISB20/G6n8pPfmXETtlzRNqgisOm
 B1fYBxPUAlBBnEtiXYzcNJmfaCo5jPHevgij4uwrsie185bk1AFr3KaDGGPw/LNEOs/RY5XhzUD
 YOUBpGTjZChUJtfyOr3z1WdR5+yqgonHq5ZLr7PvZrDjbJ1mY26anrHktPP0tAlSmle69BZbNID
 wE2ahBPtUKhUSBkpbDpG8FqzLe7rU+frCKzvt5XMYfoknEwpFIoHVYamq1u3p5MkThrMe4P52Ug
 z65bOHFHwfvFMcKNhxzOoKPA/LjGlaccL3z2/p8iN1CNzAztFKOYijwJ7eAD73YYNe4SKj3CcZ3
 /MnmvxyB/4wg1gQcPyZCQVzdEtozcDAp1V77yOuDntw53GaXCaMGrViwCt3xxsiUL4+S8TkCyuN
 p5X7wasd/QoChIDLr/pf4jHpOzFtzOiiBO4MqvFz1cN8fH/QmIf7F0WsK8muH1OOvO21Vo8QYll
 3Xl8IjLdwY50hfQ==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240910_093306_292092_01A6EFA0 
X-CRM114-Status: GOOD (  11.75  )
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

There is no need to use the DT specific function to get
matching data, use the generic one instead

Suggested-by: Stephen Boyd <sboyd@kernel.org>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/reset/reset-meson.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/reset/reset-meson.c b/drivers/reset/reset-meson.c
index 9dd38cc209e2..848c2d88503e 100644
--- a/drivers/reset/reset-meson.c
+++ b/drivers/reset/reset-meson.c
@@ -134,7 +134,7 @@ static int meson_reset_probe(struct platform_device *pdev)
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
-	data->param = of_device_get_match_data(dev);
+	data->param = device_get_match_data(dev);
 	if (!data->param)
 		return -ENODEV;
 

-- 
2.45.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
