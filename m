Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A2D6C88E5A
	for <linux-amlogic@archiver.kernel.org>; Fri, 11 Sep 2026 22:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=I9zKUlnSMBwe64pnNR5m7jObA4kIwQmHWLOwzTHY5y4=; b=x5B9B0SGfMV5YV
	NZHhG8J96YkHEC8c8Ws6yRmeT1mhw3qZVvoHxu5xEfl2DrGi5m1MtBu7cMsbefBWiq0/kMrVcyBfL
	kUE1iqDGj4/rOBUx3JU3SrPysquOOYxrlxPkVkwaiuaCp/KWwlz/qCOZsaOukSJbJT9wp8fWzXwta
	tOGfDux9vJyWpLDsxfxLQQtSjRcbqkrwltjHeyvfZkfT6im1Dq7BCCEKYu9dUZcqB1YXwusEJjFkQ
	0aJC/JXGNQITZedhJW61kJTKjAuc8mD7TntVvT9ZMIj8ZgNY2+dswNgfxnAEUoAS06URxkxM9Q/S9
	YCY0U9q0YWRwE9gwAXQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x59Wm-00000000FJs-3vwX;
	Fri, 11 Sep 2026 22:15:24 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x59Wb-00000000FBw-2pgx
	for linux-amlogic@lists.infradead.org;
	Fri, 11 Sep 2026 22:15:16 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49d1fb0cf5eso2894675e9.3
        for <linux-amlogic@lists.infradead.org>; Fri, 11 Sep 2026 15:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789164911; x=1789769711; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=srhabopEjDrPGbNiaixTBBq3q3UYUb7b5seSM2Uisn8=;
        b=HAWIMcGrAUb+covAW6bygnX9li1krdshYcGyoEHrtNwHWTyv3n9nBz0rsYRIqIOizM
         drNSpL1AXjNwvsaIYOuEyj+BjOULwgT3MBmIGrQ1NRgxoyl0eRzlK6vMdIb3lOkvk+bj
         DObSKARgfBAceMqUtiJ1bvVeKdgp1y4xa9qhNLoMDb0F33XF3feZDEq5pp/F1qSDRi9y
         +9ZZc2d+W50f+AAvmy2cK52mQIZl+1/Lxrgu1LTEeJXjU1kbhHsB2PBYmzl7fKzPdci4
         rOlTInpxUUlYIl93sHUmnzzJjVOsA8B+fpKjsVXhPp8Ac2M7N5NUbIjlp3Rf/c3jTUu+
         Bt+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789164911; x=1789769711;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=srhabopEjDrPGbNiaixTBBq3q3UYUb7b5seSM2Uisn8=;
        b=aUWGz8n2PIa8+bhQd2Df6Om0YEqBTXcnMrhLaXFgX3YYCt83iDyn+z8mD0cEiqemAz
         /hRmIEAADTDQtvIHSW1tjgltxQFuNQGSZDnKMDWSzPj9jFJUzBmumpyEEwPQksHOETKd
         jUnQpKiACx3YYVyoDCtb1vL8gPbQidhrBHhM614WjdtzN4/sZgm+/LWNmm2oLR2HvaeE
         FI+M6EIiRSiFBk4GIbELV6/l779tfvdB/0qzSzNTfokkID8ToFOmEs/Qt29zM41+69Cl
         8ls5djI/x2n5w+ByUufM//V1tO1zVb66WjPWXOzBmj0Zab/NHR1Ja6GsnyQP5mWCzn79
         liFg==
X-Forwarded-Encrypted: i=1; AKwUvBywAx19G7vRfKs64I6caot2BailrWkKzp7UeL8I80HGqyKU4tPhgzm0Aa4DM2TE8N04Iw5cAjGi+3kZ1oIg@lists.infradead.org
X-Gm-Message-State: AFuF++kLAeCXGQrwm0QJpX/w9W6dNk3MkGvOnxK+uXsHHPl51Y0plDKN
	dRdNhEsbVyAj8LpIijm7AOMO4bbHAQzS6Y0Ho1B405SWPVt1G7tXwntTTGjhsWF9ebg=
X-Gm-Gg: AYBFou16DB82g1bffEpB4DyAYHDWMKng6cFbjMIz34ER0+WPh1tHrBh02alc1bRi5Cy
	2W/ya89zHazHieBrmoS+FOcQi0rVyzgKKlDo/0uCurBZ5cZxxGw+R4zi6ki1Y9YDw4cTOzxXKoB
	mPYfCtvKe7lnuk0aPkd40OQzj37iM8LR2l1SD9B3deV46tpu8g4P2Tv0AuROInWzyf4GYiUz7ju
	3t5+NoXi6NxTOzpFkj+u1veqty9UXDUMYJiIcexaF4dXP+Ebj++iZz9XWUtgM38yLsgPa2IdSnM
	CXu2rx8Cp/N044ONbtcAYoCd4OZ5znEfAsRa67v/Lwd9GnaDUleF021nWteFvJqU3CKL/rga964
	wkIRXBrJ8D+aZiIJiPR4ZkJRKBdR7F8vIKE9F6nQt5z+godDj8IGrOJ5b8rlEgdWfExQpsbLXpI
	a6wfJzJFsihuN3xiv4jVKBxKc16bJbn3ZGpBMNxeJFohMFcS8/lOjHrpKdLiBM2JM53fvRRMgZS
	U00
X-Received: by 2002:a05:600c:3513:b0:493:f140:c3fb with SMTP id 5b1f17b1804b1-49e619c0357mr123658065e9.7.1789164911027;
        Fri, 11 Sep 2026 15:15:11 -0700 (PDT)
Received: from [127.0.1.1] ([151.42.87.32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c2a419sm202882745e9.7.2026.09.11.15.15.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 15:15:10 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Subject: [PATCH 0/6] ASoC: meson: gx: add base support for I2S audio input
Date: Sat, 12 Sep 2026 00:14:30 +0200
Message-Id: <20260912-audin-v1-0-7fbefe928711@baylibre.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAEZ9pGoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDC2ND3cTSlMw8XcvkxKQkE1OD5GRLEyWg2oKi1LTMCrA50bEQfnFpUlZ
 qcglIs1JtLQAVIgntaQAAAA==
X-Change-ID: 20260831-audin-9cabb450cc94
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Valerio Setti <vsetti@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3226; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=PWDc5RQ3INoxq0fo7alWh++0I6W5IGuIRf0MFpXSV8s=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFlLanOaRdZMWiury/nzTfOTv99ijh7ZIG6rNWFa9b6ZK
 3/UeT+M6ChlYRDjYpAVU2RhmX7vd0Gp2kPjhJMFMHNYmUCGMHBxCsBEAo8x/A/Z9ERcTLvnivwC
 h9+mV8XKT96fcuzu+WOqXI3LGX5Jh01m+J9+cd8XMRsXcV1mrd9NDN5LohSW15geuMURO3uHM5d
 TDjcA
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_151513_733524_657DCE19 
X-CRM114-Status: GOOD (  14.58  )
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

This series is the 2nd part of the initial RFC [1] proposed to add audio
input support to the Meson GX SoCs. After the AIU reshaping series [2] that
has recently been merged, this one adds the audio input path itself.

The biggest change from the RFC concerns the I2S data formatter. Previously
it was a DT node owning a single register, which was deemed an invalid
binding. There is now a single audin node owning the whole audio input
register range; it instantiates the widget for the I2S data formatter,
following the solution already used by AIU, and then probes its DT child
nodes implementing the FIFOs. This lets the three FIFO instances share
one driver.

Resulting capture topology is:
  pads --> AIU I2S Encoder -> AUDIN I2S Formatter -> AUDIN FIFO -> RAM

This series includes all the changes related to this work (dt-bindings,
drivers and device-tree) in order to give the full picture in one single
place.

Unfortunately, since no Meson GXBB/GXL board available in the tree feature
an I2S capture capable codec, this work cannot be directly tested out of
the box. To test it an external codec must be connected to the SoC.
When working on this series, a custom hat board with an NXP SGTL5000 codec
has been plugged on top of an Odroid-C2 (GXBB). The last commit of this
series fully details all the device-tree changes which are required to
finalize the support for this scenario.
With this hardware configuration it has been possible to succeffully
validate the implementation with:
- alsa tools (arecord)
- pcm-tests

[1]: https://lore.kernel.org/linux-sound/20260411-audin-rfc-v2-0-4c8a6ec5fcab@baylibre.com/
[2]: https://lore.kernel.org/linux-sound/20260610-reshape-aiu-as-axg-v2-0-cac3663a8b51@baylibre.com/

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
Valerio Setti (6):
      dt-bindings: sound: amlogic: add schemas for audin components
      ASoC: meson: add audin main module and I2S formatter
      ASoC: meson: add audin FIFO driver
      ASoC: meson: aiu: add I2S Capture DAI
      ASoC: meson: gx-card: add support for audin FIFO
      arm64: dts: amlogic: gx: add nodes for audin and its FIFOs

 .../sound/amlogic,meson-gx-audin-fifo.yaml         |  52 +++
 .../bindings/sound/amlogic,meson-gx-audin.yaml     |  96 +++++
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi          |  35 ++
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi        |  22 +
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi         |  22 +
 sound/soc/meson/Kconfig                            |  14 +
 sound/soc/meson/Makefile                           |   5 +
 sound/soc/meson/aiu.c                              |   7 +
 sound/soc/meson/audin-fifo.c                       | 466 +++++++++++++++++++++
 sound/soc/meson/audin-formatter-i2s.c              | 174 ++++++++
 sound/soc/meson/audin.c                            | 109 +++++
 sound/soc/meson/audin.h                            |  14 +
 sound/soc/meson/gx-card.c                          |  16 +-
 13 files changed, 1025 insertions(+), 7 deletions(-)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260831-audin-9cabb450cc94

Best regards,
--  
Valerio Setti <vsetti@baylibre.com>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
