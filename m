Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2203C4332F
	for <linux-amlogic@archiver.kernel.org>; Mon, 19 Dec 2022 09:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SQFiXXEZqPfBsH2wmKeZSOFOEMAhdAgl6oo+Y0IMDIk=; b=1j3zRFWnIS6zOh
	zHOiBM+U/ndw/FHiWCfKd/SnBDQJBHt9wMvO8GQo/pEmTUM745EuViY0z4dVJYQByv7rAyDWrMIyo
	WOyFq8j87g5XID0inyIko5Q4SfSnA39kYKdwxiqBP2vMb1HHxnWy1PEiZ/4iy/tfz9i/UVaicySyX
	kscBS4R0IrrNNtt3dtjmZzjcDKZu65gv/HZR9VBH8IIepeorGbkZ+yok/zQ3FAZ+lUhy17HUYD0/Z
	HxXxRyulXP6JG5BoSBvDsMx0EZaSQ9P0qu14j5plA+qj7ZKKOXBpEnlCgiu2qwnb7HNEYtyS4d0vM
	C4teJaYBuq5lzY+BBWcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7C49-00Aypc-It; Mon, 19 Dec 2022 09:04:10 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7C2y-00AxyK-4P
	for linux-amlogic@lists.infradead.org; Mon, 19 Dec 2022 09:02:58 +0000
Received: by mail-ed1-x52f.google.com with SMTP id a16so11879897edb.9
        for <linux-amlogic@lists.infradead.org>; Mon, 19 Dec 2022 01:02:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iaVNFQLQjvu/mR/33Qvn+CT5WA+rfSMQXLgBgZ4bdDM=;
        b=A1Zy6qoRVzqAGOFB96J1pF4ERIgoQXgHOFDmK4xgQnMA9IByu4kjh3dXqg9SDx0768
         9eOIKZvrDVcu1Lr5SDz6I4UX/uAxyFhNWxM+FHxQkA2sCr6dltN3cwp60irQx8HJtWm7
         1sGD1oV7eWyavHo4ijHytLcjchBuWv7EQj5AOSl3BmXFm10kcICy27AaZ+GL395V1wcD
         tRfxLexYrV9XfMDzIUGo6adh4OzxfZ9/V/EQJ+0QUZCnJ3A8IMvwPfAjiNdEh4Q7t6NK
         YxVD+9+UElauhoHi6RnNG91uqksaE0D+JEe1kGZBHjAFGJE/N3MFoTWOig+xWpIqZiXl
         c1SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iaVNFQLQjvu/mR/33Qvn+CT5WA+rfSMQXLgBgZ4bdDM=;
        b=EpaueTXIy5vIr4pthdi70JRrACP3v3c6sAhL02cTUtS2qcxNVj773fjcYj5b6wzlmS
         oEz2ntAf1csisj/wNTy6nGQp2XD7b+NLfYVUcUsESuaS1BBb59UCEQC6XAWR0HIt6XCM
         6E5JyYe/Ds4T4mPUBaAwKoguGLrvYKNNTYz5dTeMZtDPOe5nTsjPkUdTcVOvyAmzRMcs
         iMggt0vALV5cdjFn8DhzZPoxjNBsG+qWdUZPoQQ8LthpewcvC7vdyS3CcLb7I39jpX16
         Zmq2LzkOFbIgaA+fN634/ZrZYVaYsrpdXRKDOi+lP4rwpmJRUsmuieLvw9eIQZRn7feU
         jqEw==
X-Gm-Message-State: AFqh2kqkzZqDfF3PExrlHuW2S2etWU7iGC46jSx/bqT/PYqVgY/AI1N8
	nt4Icko/aEwahNKBT/9XSW4WSA==
X-Google-Smtp-Source: AMrXdXvmKZdR1xqWjHm/Mr9GhLjb73U4gYdCZ+DsGSdF0LkhCf8Hqf8o1AVqcBklR1QtE2zrDB9YuA==
X-Received: by 2002:a50:ed81:0:b0:477:ff25:867a with SMTP id h1-20020a50ed81000000b00477ff25867amr8453170edr.12.1671440569906;
        Mon, 19 Dec 2022 01:02:49 -0800 (PST)
Received: from [127.0.1.1] ([2001:b07:5d39:f336:a0ba:cfa5:2107:c2c4])
        by smtp.gmail.com with ESMTPSA id u11-20020a170906b10b00b00781dbdb292asm4082721ejy.155.2022.12.19.01.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Dec 2022 01:02:49 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
Date: Mon, 19 Dec 2022 10:02:37 +0100
Subject: [PATCH v4 1/2] drm/tiny: ili9486: Enable driver module autoloading
MIME-Version: 1.0
Message-Id: <20221116-s905x_spi_ili9486-v4-1-f86b4463b9e4@baylibre.com>
References: <20221116-s905x_spi_ili9486-v4-0-f86b4463b9e4@baylibre.com>
In-Reply-To: <20221116-s905x_spi_ili9486-v4-0-f86b4463b9e4@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Mark Brown <broonie@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, Carlo Caione <ccaione@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org
X-Mailer: b4 0.10.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221219_010256_238262_CC0CBC89 
X-CRM114-Status: UNSURE (   8.70  )
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
index 1bb847466b10..8bf0dca0b05d 100644
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
