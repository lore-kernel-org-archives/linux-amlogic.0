Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 050F6C4332F
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Nov 2022 08:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tztbwfmxPgPNdVX+gAVouDv73K2+f108Q68ZvB1Gbh4=; b=RCOtj3EoMhXzug
	dEyWU6qkEmZw+3ZJ3xxoDf1sj5kPfMhjJenEfRTI+svBzSwgF6g+bqDPLZsn1moW0Mf/V2AmyLqRZ
	G3RQ++3paUu1Fs/yafy8ubjhOvVj5RkcJIfYG1POcQW9EaUOs15G0Xm3PRtQso+6YioL9p/eg56jP
	fXgtVvFKtVOapMSrhSggp+S56w6tU9zny3ON7vaVYk97+rtDVvjt9PNsyVuAhLWOQV0Iyj0LAIiz+
	GALkcvmGyiVg6U1UkxqyQmHZEQKgTvQmbPp50cxgSXxFSdk9v662BXmFGIl+qW9dAad8jjabsc378
	fwWRSdL6wczmbHcqjLiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovaZZ-00BoZf-GS; Thu, 17 Nov 2022 08:48:37 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovaYw-00BoD4-Jt
	for linux-amlogic@lists.infradead.org; Thu, 17 Nov 2022 08:48:00 +0000
Received: by mail-ed1-x52e.google.com with SMTP id v27so1561617eda.1
        for <linux-amlogic@lists.infradead.org>; Thu, 17 Nov 2022 00:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kplxU2lR5aG0mBiBv43tp2KK14DvgQ3747TCEeV3JMg=;
        b=JJZviyNTe3aoLaHC8gnS2B6ZcTQTNzqCo1CNL5fhLhh/Q21pISItv3OuImIZPearuW
         bcPv8/v3zDuo0hQF1Lxl2dF61VnCzkP4spsZMx9z8F5hpwlR6u9zM/SndG3dLHBBLnY0
         k6htMUas9GgLlqwNVv8haDJ1k1sKtjozX77I+aljOtKJKGPtB+BuHZSWCo+mN29Ll9Qi
         CRzV4Z8IPLuKuq3E4NgPh9PssxWg2C/4fGnvj7vEgj1k5ujzzy4ewWa9SM19CUNImdn/
         LvG4iiIh9BzZTOLPVDG0udI2RexERIauevvSdRle0EGIrUaKj+OeJ5HOXjqL5Qsc/vat
         CR4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kplxU2lR5aG0mBiBv43tp2KK14DvgQ3747TCEeV3JMg=;
        b=O+q9uYi5onfA74C2Qgi+3e0txd+I/JrfxtM5m+x+BzzWQYwYdlkbboLpCg0FEEQ8S9
         TjlwFmlmmzL51q74F76HRtXZtPjfhCWjbXm8/BXoFTmYU5yYn2pkeO/7yvZuBFFeMmMM
         UmFxW2bNp/wVuQRkn1EXfGqCZ8OARfMTlSpshwchOe4NM98bdf6Vn1XQKJ9FMHnftSRM
         cZzkjHIGn5vMehmlDNZgGx4oGS3dCob49OYbR+LFDYHFizA+raPb+ayDHEH/zrH78fbW
         UlOwuVc/EhTYf3cyL/cySoXQb85JhdsAZB9/I5tAbdo16nb9amRhH77ijt/O6yrF4Wr1
         0BYw==
X-Gm-Message-State: ANoB5pnc8ldq2f2PPa28zpZ50S5Zn3YW7FdlqdWJbRtTp8SC9Np9zEyA
	Nw+3TwbVI4iVo+ISKKVHVz6KUw==
X-Google-Smtp-Source: AA0mqf6g15i8zsDuyqA55ZoKaief9KDXNvdMbq3LIDvKdQEDkFEbkFvIVViVnfvYrya19LRO4KeNXQ==
X-Received: by 2002:a05:6402:4d6:b0:458:789b:c1b0 with SMTP id n22-20020a05640204d600b00458789bc1b0mr1277535edw.89.1668674872601;
        Thu, 17 Nov 2022 00:47:52 -0800 (PST)
Received: from [127.0.1.1] ([2a0e:41a:894f:0:7a60:27eb:954c:5ab1])
        by smtp.gmail.com with ESMTPSA id s22-20020a1709067b9600b0077205dd15basm77332ejo.66.2022.11.17.00.47.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 00:47:52 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
Date: Thu, 17 Nov 2022 09:47:39 +0100
Subject: [PATCH 1/3] drm/tiny: rpi-lcd-35: Enable driver module autoloading
MIME-Version: 1.0
Message-Id: <20221116-s905x_spi_ili9486-v1-1-630401cb62d5@baylibre.com>
References: <20221116-s905x_spi_ili9486-v1-0-630401cb62d5@baylibre.com>
In-Reply-To: <20221116-s905x_spi_ili9486-v1-0-630401cb62d5@baylibre.com>
To: Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>, Mark Brown <broonie@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, David Airlie <airlied@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Kevin Hilman <khilman@baylibre.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, dri-devel@lists.freedesktop.org, Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.10.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221117_004758_691290_20B56DCD 
X-CRM114-Status: UNSURE (   8.67  )
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
Display (rpi-lcd-35).

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 drivers/gpu/drm/tiny/ili9486.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/tiny/ili9486.c b/drivers/gpu/drm/tiny/ili9486.c
index 1bb847466b10..bd37dfe8dd05 100644
--- a/drivers/gpu/drm/tiny/ili9486.c
+++ b/drivers/gpu/drm/tiny/ili9486.c
@@ -183,6 +183,7 @@ MODULE_DEVICE_TABLE(of, ili9486_of_match);
 
 static const struct spi_device_id ili9486_id[] = {
 	{ "ili9486", 0 },
+	{ "rpi-lcd-35", 0 },
 	{ }
 };
 MODULE_DEVICE_TABLE(spi, ili9486_id);

-- 
b4 0.10.1

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
