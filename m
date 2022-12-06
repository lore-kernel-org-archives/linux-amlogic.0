Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52418C352A1
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Dec 2022 08:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4prvvD4a6OjXalGlX/kHbeqSvo9y8EQgoL7eZMQWTYg=; b=xj0P24z4iBJs9y
	BWSqXg3ApHBhDbS+7ejCi73flCnkjOTXwzXLN/ePQnluO6D7LjmV6c5Fb9zzi7Q2oL9X8r5Rk+PZC
	nlawUsHkhHMdE8aI6mDF3f+L9miUIothhKKxPJfwbyDPErpqIi0I6j16y5QhxImw1sTUg9XdLn4Bj
	UPckDlFLVfyUAbxbfJjFug8dAe2DSQEdfyxJosXY6+mBGJaBDlwWjgSMFCiqAPZpHeO2o6QUMov4B
	8+BIUIog23NSTi/tAbo/rssQ7pfGxb1XaC4ZQEeMOdszCVcQEoW2Kmh65X4jYJgDOHKeGFdhP1ZZu
	FWhc9TbXfufYkKMcBgaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2TPO-004vPU-B3; Tue, 06 Dec 2022 08:34:34 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2TP3-004uvm-NU
	for linux-amlogic@lists.infradead.org; Tue, 06 Dec 2022 08:34:17 +0000
Received: by mail-ej1-x62d.google.com with SMTP id kw15so958354ejc.10
        for <linux-amlogic@lists.infradead.org>; Tue, 06 Dec 2022 00:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3BPaUYtbAIV1BLKNgYdAozqHw0R4+q9lV2NZg2CpgKo=;
        b=H2H7JKYXXvAfClM3nA4go1vg+3MHl1e/2zDDCysrg3tEabCsIvKnRzv0Wvtb2s10VN
         304O8iUaaCjy+dnUF4jp5tvxQ7MKMC2YGkV23TPpDOStSB2Upw0HDsdfWJMs2ioAEOrO
         fhKRJupDAIl1fLdC4rmrOPBhagh95bOmoINpnJ0Zam1PJQYxiVWiFMx4uAO8/VhJige/
         q5RIt7kTTdZLXfDSogK4wYnAWCRuJIegjkPjFnq6DxnHXIQKAcCVC2EWQgKtVEUTgRU7
         MuUyGBNerPFdl7BnbM83N10a7qTIxPVwG7X9BJpk4AcHrfhY18IPOxuXDtofPfhLSKvV
         XlpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3BPaUYtbAIV1BLKNgYdAozqHw0R4+q9lV2NZg2CpgKo=;
        b=1N7ComipkuF9sbJmwLsTZHqoj9UEItykPfsXNIuS0yS7K3Rs5DIOMWFsWvWMpCEeNw
         8g03E8YnOg2C+oRfCbU8OwXj51PmB1G5cPGCT4vmIrosTcgTcFp0VDbJp2bpjfxMc4QL
         HYQPno9SxCrJfy7QnT5NetdCwHfZnB6GYCuZRvyZzZC1ET40ohT0Ch8TI081DN6OwFZp
         t2CwLbMPO3ehoJjuO8P6jLKPtbhVUGIbKzxcAQQAIhJuEknO3qvdivG7jeF5oC7y2ZqY
         kI3myk6L6eHlOaW+fuvPgx9CcSiguuI3/0CSLvVlDYFnse5XVioaxk3wZy5ghbz+IsB2
         nC/A==
X-Gm-Message-State: ANoB5pnVSQj6C9bx7DPaCmCjzkC7OR6j/DJ7+8Zt6A39UE7CZKY2biQt
	vynwZ0MxfL3Zo565DPvzlUEcvw==
X-Google-Smtp-Source: AA0mqf5Pz039HsSECacZv7n6SegwyteVoV+SG8Cjh+HO/AU52+pi8GERHDDdw5tp9McDI8DIbvAY2w==
X-Received: by 2002:a17:907:2c75:b0:7c0:bbab:a550 with SMTP id ib21-20020a1709072c7500b007c0bbaba550mr14397235ejc.168.1670315649259;
        Tue, 06 Dec 2022 00:34:09 -0800 (PST)
Received: from [127.0.1.1] ([2a0e:41a:894f:0:2017:359e:18ef:1c49])
        by smtp.gmail.com with ESMTPSA id g18-20020a17090604d200b0078d9b967962sm7019390eja.65.2022.12.06.00.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Dec 2022 00:34:08 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
Date: Tue, 06 Dec 2022 09:34:01 +0100
Subject: [PATCH v3 1/3] drm/tiny: ili9486: Enable driver module autoloading
MIME-Version: 1.0
Message-Id: <20221116-s905x_spi_ili9486-v3-1-59c6b58cbfe3@baylibre.com>
References: <20221116-s905x_spi_ili9486-v3-0-59c6b58cbfe3@baylibre.com>
In-Reply-To: <20221116-s905x_spi_ili9486-v3-0-59c6b58cbfe3@baylibre.com>
To: Daniel Vetter <daniel@ffwll.ch>, Jerome Brunet <jbrunet@baylibre.com>, David Airlie <airlied@gmail.com>,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>, Mark Brown <broonie@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 Carlo Caione <ccaione@baylibre.com>, linux-kernel@vger.kernel.org
X-Mailer: b4 0.10.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221206_003413_834655_8B35FCDE 
X-CRM114-Status: UNSURE (   8.26  )
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

SPI devices use the spi_device_id for module autoloading even on
systems using device tree.

Add the spi_device_id entry to enable autoloading for the 3.5inch RPi
Display (rpi-lcd-35 and piscreen).

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 drivers/gpu/drm/tiny/ili9486.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/tiny/ili9486.c b/drivers/gpu/drm/tiny/ili9486.c
index c80028bb1d11..2ca7c59771f3 100644
--- a/drivers/gpu/drm/tiny/ili9486.c
+++ b/drivers/gpu/drm/tiny/ili9486.c
@@ -183,6 +183,8 @@ MODULE_DEVICE_TABLE(of, ili9486_of_match);
 
 static const struct spi_device_id ili9486_id[] = {
 	{ "ili9486", 0 },
+	{ "rpi-lcd-35", 0 },
+	{ "piscreen", 0 },
 	{ }
 };
 MODULE_DEVICE_TABLE(spi, ili9486_id);

-- 
b4 0.10.1

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
