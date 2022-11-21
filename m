Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4106C433FE
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Nov 2022 09:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:Date:From:MIME-Version
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uwFJPWXPVy7ZfVHLOVGdvmyCQi70Q0fxdXfn9qxM3xI=; b=rbYEHp2+a0oHOW
	C476H41AEO9tN+an5zD0TMTR016N7CcUlMgEuzSi6Dqi977qn6ka4NuN5PImXSp/oFaFHXHNEbYGo
	ZGSY5GAoJ8cCD37NsDBmXTR03ttZpFTvgqsI0nmY2M9OfR9RWi5x7jZe4GYbjfCZeq+XCpuZkA2D4
	VZ/GWDNBGWFgVj60ng6pQcQseaZD/iMf9AsptHjD10zUbR4yXMSzgePJQ1+uQVVXmHC4S47THHnGe
	sl+y8F5TQ5s/yjcZkWdX5Vxl8YTdrW9p1NIzTlN/JOxt9FcdyeS+5HzHrKQhZv7xCfoGPOPYcC+5g
	WtLM83i4Q6VRud/pisYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox3KH-00Buf1-7p; Mon, 21 Nov 2022 09:42:53 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox3K5-00BuSK-GR
	for linux-amlogic@lists.infradead.org; Mon, 21 Nov 2022 09:42:43 +0000
Received: by mail-ej1-x62c.google.com with SMTP id n12so27080496eja.11
        for <linux-amlogic@lists.infradead.org>; Mon, 21 Nov 2022 01:42:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=vamem0qPPK/+qqHyZ7VitfMXhg5vodX1x04ClBWqxyY=;
        b=OUeHTSRpqIyD4R+SqDqs5uhVa9x+OQ2cMnKfV2ZkV4P/IkGNIwZYRZ2VFJBzKqUPbl
         uymtKtNXLwDKBD+QV6MeP4nAhtRwDcMxEkVsDLXgcckmBx2vm7UeLrAtz4aL/pppDhYQ
         a7LBijeewz1qULGcsRntcMNYNtsfxAreJRugrhzxKIOkjgDuaj7eoKwpk3X2u/pELVnA
         ebm4zcczKzNhluBk4StHyjIF3A8MALqdji0MmPPSfR8UVHDyY5idpHdodx1qprpkxTC6
         CNrJsiXqL/tSCWVLPw6GtSUiB4bscMPRbcsLzd2aU3pzsRxRC6OoZm+9OJIu2XJzdktQ
         SpCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vamem0qPPK/+qqHyZ7VitfMXhg5vodX1x04ClBWqxyY=;
        b=mtI5wLDAwwk+6oikKoEpepsBrZJSfdzXkzru/2xqtEhEmbZIfiQJam+dXt8aFpFOTY
         O3LBNeRgoS4QPOUuc2EVbQ9b9D4uU3nivw8WSiSEudeoGnjJnKlvFi0h9C8JKFoaUhGc
         NzTTHAP5ETdS7xMwTKia1rQer/86RxQGhSniFtTfKKdKeOaESdVtheE2fxERizgzd3zy
         OEVeG0imIWWbrQ08NYScUiB6PZTX07Y1F1SieyKcx1V3r6wrUPY/mzI/5VhXqfn26Fcj
         helv404zu/e+AiKgGJ02XDpf9g9S3DVNfdOfSSBEqs8VFY5RZ9bfRxzuABvBuvbE20ga
         3lQQ==
X-Gm-Message-State: ANoB5pmYVnQh3x3O98XykKx1sPECAsCZWuT6xKBoAlGS06gryUBozF1s
	H8Ao4a+Ag++QISwAL42k9jZvWGvuTVCc4EPN
X-Google-Smtp-Source: AA0mqf4Y/qO5IHzq7wyR8BmivhktsDan+5uOus9RTtHptmY2liXFr5diD78YovU3f96o/KrsaB8d2Q==
X-Received: by 2002:a17:906:cedc:b0:7ad:e8dd:837c with SMTP id si28-20020a170906cedc00b007ade8dd837cmr15613331ejb.264.1669023758927;
        Mon, 21 Nov 2022 01:42:38 -0800 (PST)
Received: from [127.0.1.1] ([2a0e:41a:894f:0:c97f:bc5d:82d3:1a3b])
        by smtp.gmail.com with ESMTPSA id k11-20020a17090632cb00b0078d3f96d293sm4822240ejk.30.2022.11.21.01.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Nov 2022 01:42:38 -0800 (PST)
Subject: [PATCH v2 0/2] Make ILI9486 driver working with 16-bits SPI controllers
MIME-Version: 1.0
X-b4-tracking: H4sIAAVIe2MC/32NUQrCMBBEr1L220g2bYP1y3uIlCTd2oWYSlaLpfTuBg/g1/AG3swGQplJ4FxtkG
 lh4TkVMIcKwuTSnRQPhcFoYxDRKul0++nlyT1H7pqTVY6GthnHOniDUDzvhJTPLoWpmOkdYyknltec
 19/PgiWu/yYXVFrZWjcag7dmaC/erZF9pmOYH3Db9/0LqPc1fboAAAA=
From: Carlo Caione <ccaione@baylibre.com>
Date: Mon, 21 Nov 2022 10:42:29 +0100
Message-Id: <20221116-s905x_spi_ili9486-v2-0-084c6e3cd930@baylibre.com>
To: Mark Brown <broonie@kernel.org>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Kevin Hilman <khilman@baylibre.com>,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.10.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_014241_785090_1E744D1C 
X-CRM114-Status: UNSURE (   7.94  )
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

This patchset is trying to fix problems seen on S905X boards when interfacing
with an ILI9486 equipped SPI panel.

To: Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
To: David Airlie <airlied@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
To: Mark Brown <broonie@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-amlogic@lists.infradead.org
Signed-off-by: Carlo Caione <ccaione@baylibre.com>

---
Changes in v2:
- Removed SPICC patch
- Reworked commit message
- Link to v1: https://lore.kernel.org/r/20221116-s905x_spi_ili9486-v1-0-630401cb62d5@baylibre.com

---
Carlo Caione (2):
      drm/tiny: rpi-lcd-35: Enable driver module autoloading
      drm/tiny: ili9486: Do not assume 8-bit only SPI controllers

 drivers/gpu/drm/tiny/ili9486.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)
---
base-commit: 147307c69ba4441ee90c1f8ce8edf5df4ea60f67
change-id: 20221116-s905x_spi_ili9486-aed54ff3cb21

Best regards,
-- 
Carlo Caione


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
