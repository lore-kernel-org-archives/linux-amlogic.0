Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26382CA5FD2
	for <linux-amlogic@archiver.kernel.org>; Thu,  1 Oct 2026 16:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=l+hxWGBDiTgD55Kayd5nbpfc1BOkNYg5tSasEE8f/+o=; b=unr3AyJBYhMqdr
	WavtiPlUdlptaSlxRVYQiQ+oaF1YktNMKmnX/oQnHSm91yYWdrK/NLw2CjuyjZdAbQA4miI4xC0Yh
	cnw4zvvnAHL7f6ne4dYgMCcibmGvV2VDQaPbsKi3d0w5eGLUBu5llNMrlAasB4lrCKgWPpifjauto
	RVm+cbZjfA64qwkk+tNkAX6pLQe6zDsWMaF782JcZjL2RlFN9o2HJJifmfeU+22NgvsBNZxreGKqv
	HfeTMPnC8vu7jiP4JawVi4VJuP97SP3RpRodWvGjNbnL46pP6S3S6DAft3JEd/Hu7CgunBbe4HxiM
	BaQ7C8Qp6vHH3SimmQoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCJIx-00000009dnL-2HYD;
	Thu, 01 Oct 2026 16:06:43 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCJIt-00000009dkM-1JKk
	for linux-amlogic@lists.infradead.org;
	Thu, 01 Oct 2026 16:06:42 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49b912e4b11so40457185e9.3
        for <linux-amlogic@lists.infradead.org>; Thu, 01 Oct 2026 09:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790870797; x=1791475597; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5nZpXcJbXMJzdg62qAg+c4KRRXxPmmTywOGusgAV+Us=;
        b=mpob8aK/D5sEnK38TyI04uO+ovJaeXE4wG/VNYExuoiXjGFEWlPg2i/o1ibaOV6pkw
         un7CqsBv4pyHImhHI/58NucEEYZLYpyCNwhSUGx+8ajFHE66ME7NUY6t/lCLM4BWsvOT
         teu/dFmE9RO7rQeS6MwXP6g3qYAjcNijbSob51TSopR/rBYhZclqnKRfE7dFaPtvu+yC
         cUflr+Hz4Qvso/3adG3rLmqY4qP31RwjrzUw+5JwPE66mO0IGJ8vSwoLwWoq9pPFta/V
         6ZQBdaJ9RxoTp/MNb4xQATVhDKRXdu9hv9tyq4uUtnkuxX4HaJEbu87zuPSTvodhAaM7
         5oeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790870797; x=1791475597;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5nZpXcJbXMJzdg62qAg+c4KRRXxPmmTywOGusgAV+Us=;
        b=sa95oYF8g67cfvMNNJJpHq2ouHt4ca6zOxvT7iqcfzj6d/YwB/Z49pD6XXGiSoptbf
         XndpP07nPJaOP3sFgZAuhnnQ8eMKwv1dxc8QG/iGZq4GXuOO8eOmALtkP0iyDxQOSvU1
         K1kDClS11/pDOWyecGMTdeAPaTZ0bUdu6n1P6QMRDimmKrDw/dNd9amBHQAbU9JUFQVG
         bB4lYNZQ/+2wKBSXsZSfap3e0JnjSNA8F0xwuWmfSv6trrBi4D8EiIgXhmGpVk54RlXE
         RCzezj0he13J1E0vw+0Q1NE58Ww1hcBjvC8fVjBkDhdQQA3cAB64tHJRxX2UbrI7qztG
         fEhg==
X-Forwarded-Encrypted: i=1; AKwUvBwSblKBYK4FSv1469Ik00TEjQDDyYG2gyZjkjcub+Vf79O+vE/uSsydjP5L3x9m1e5mqLFePjNGt5//IWZG@lists.infradead.org
X-Gm-Message-State: AFuF++n1BDMXMKuXgLJVwdmaG9z4c3E347Pg1pBerIW1RGOEOiZ6t8U0
	1GK3gaBrgwkoBuQMotFVWlzUKTX/G5WZNW7gLhB9asc4rKotXQk6qkvNqv72ymBLrKo=
X-Gm-Gg: AYBFou0n/q88xyT/L9HwZ4cNN7qRD1UDc1B4HPmdFQikENiSbrZebvlOZuy7g6VdzJB
	/Sg9KZU1tf6yzRnlfXauDQkZrMaYUi0uUrr1+R+anWuL8iq8rhzCOq7XCr/WWHk/I1p15hm15Z4
	Cj7WXZAJ/uAkV6ZkgDXBUaBaWSp5ESKLy/nmesy7KZVxxDjrUGhRcgOn1qYKFMBAlgQEsOJ6U0i
	FdKOviOE48iUYXBMXR2D+EwNulvbs0ax9Gwhy4uCQfVc9HReyNb0gdhhbYcoPhnJGtjL5SWJSLq
	USMFGjKogS+cJipxfOU5IPjujLesrgVX5S6PQ6ufQu8SJwDOcCaSXTGpfBuMhkGTHIZ6cyqJHEJ
	ZmVTG8ixebscQfwZS96/H/fLI23huo0rQUwTwGbnHS115Moi9tJyzX9l7ELO2ZWAuqrwcuLj3TK
	ZmLA31TXHX13jO3PDLdistcVRnLTvTHyqCeqWbExUv/Qj+sPEVKSQ3a5z9VGPexahS
X-Received: by 2002:a05:600c:42d3:b0:4a0:1e68:d27d with SMTP id 5b1f17b1804b1-4a0276a20a2mr1055955e9.9.1790870796877;
        Thu, 01 Oct 2026 09:06:36 -0700 (PDT)
Received: from [127.0.1.1] ([151.42.82.6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f93ad0bsm52969705e9.4.2026.10.01.09.06.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 09:06:36 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Subject: [PATCH v4 0/7] ASoC: meson: gx: add base support for I2S audio
 input
Date: Thu, 01 Oct 2026 18:06:25 +0200
Message-Id: <20261001-audin-v4-0-2476646118b5@baylibre.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAGFvmoC/23NTQ6CMBQE4KuYrq3pnxRceQ/jon08pEbBtEAkh
 LtbQA0xLieZb2YgAb3DQA6bgXjsXHB1FYPabgiUprogdXnMRDCRsFRyatrcVTQDY63aM4BMkdh
 9eCzcc945nZccWntFaCY8NUoXmtr381HHp96ymXHx3uw4ZVQXFgvMRKo5P1rT35z1uIP6TqbZT
 qyh/kARoUxzVBZ4jlL9gXIFxfdRRmh0wiQXwHQCP3AcxxcMBs6iIQEAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5604; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=v1b8eqA53vWyaoL/nk77SSDjdPtd/icodDftAaYnipk=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFn7Wtm1OY9/WCrGain38nCmlc27de18mqFznq+5bRGmG
 GZ8Zb9sRykLgxgXg6yYIgvL9Hu/C0rVHhonnCyAmcPKBDKEgYtTACZSMYOR4bh39Mdl4UsbzFXd
 frjmGwjpGa24UWG4/HN5xsrM7DjPVwx/+GKCJm9+wcv4/E2k7M9upVd3gztnTd7CyXH5nWTr1rD
 zbAA=
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_090639_396089_CC1E1535 
X-CRM114-Status: GOOD (  19.74  )
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

Apart from some glue commits for gx-formatter Kconfig split, a fix for i2s
clock divider disabling in aiu-encoder-i2s, DT, bindings and integration
with gx-card, the core commit is the 4th one, which adds the AUDIN driver.
This is the counterpart of AIU for capture: it gets the entire register
range, it handles peripheral clock and reset, it instantiates the I2S data
formatter as widget and FIFOs as DAIs.

Resulting capture topology is:
  pads --> AIU I2S Encoder -> AUDIN I2S Formatter -> AUDIN FIFO -> RAM

This series includes all the changes related to this work (dt-bindings,
drivers and device-tree) in order to give the full picture in one single
place.

Unfortunately, since no Meson GXBB/GXL board available in the tree features
an I2S capture capable codec, this work cannot be directly tested out of
the box. To test it an external codec must be connected to the SoC.
When working on this series, a custom hat board with an NXP SGTL5000 codec
has been plugged on top of an Odroid-C2 (GXBB). The last commit of this
series fully details all the device-tree changes which are required to
finalize the support for this scenario.
With this hardware configuration it has been possible to successfully
validate the implementation with:
- alsa tools (arecord)
- pcm-tests

[1]: https://lore.kernel.org/linux-sound/20260411-audin-rfc-v2-0-4c8a6ec5fcab@baylibre.com/
[2]: https://lore.kernel.org/linux-sound/20260610-reshape-aiu-as-axg-v2-0-cac3663a8b51@baylibre.com/

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
Changes in v4:
- Dropped the family compatible 'amlogic,gx-audin'. 'amlogic,gxbb-audin'
  and 'amlogic,gxl-audin' are now the compatibles for GXBB and GXL SoCs,
  respectively, with the former also used as fallback for the latter.
  [Krzysztof]
- Link to v3: https://patch.msgid.link/20260922-audin-v3-0-a760312c076c@baylibre.com

Changes in v3:
- Fixed i2s clock divider disabling in 'aiu-encoder-i2s' 'hw_free'.
  [Sashiko]
- Specified const value of "#sound-dai-cells" property in dt-binding.
  [Sashiko]
- Advance 'last_pos' by whole periods in the FIFO polling timer to avoid
  drifting period notifications. [Sashiko]
- Link to v2: https://patch.msgid.link/20260917-audin-v2-0-38de4bc1de34@baylibre.com

Changes in v2:
- Dropped FIFO child nodes from AUDIN in device-tree. Now AUDIN is the
  only sound component and FIFOs are its DAIs. This is the same design
  used in AIU. [Krzysztof]
- Renamed driver compatible, using 'amlogic,gx-audin' as fallback and
  'amlogic,gx[bb|l]-audin' as SoC specific. Fixed also other reported
  comments on the binding. [Krzysztof]
- Adjusted headers inclusion in 'audin.c' and spacing in the empty entry
  of 'meson_gx_audin_of_match'. [Uwe]
- Replaced 'snd_soc_component_read' with 'regmap_read' in 'audin_fifo_pos'
  in order to prevent sleeping in atomic context. Also changed the hrtimer
  from hard-irq to a soft-irq one. [Sashiko]
- Added 'sync_stop' callback in 'audin_component' to ensure the hrtimer is
  fully stopped before attempting to restart the stream in a
  "start->stop->prepare->start" scenario.
- Link to v1: https://patch.msgid.link/20260912-audin-v1-0-7fbefe928711@baylibre.com

To: Jerome Brunet <jbrunet@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>
To: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Valerio Setti <vsetti@baylibre.com>
To: Jaroslav Kysela <perex@perex.cz>
To: Takashi Iwai <tiwai@suse.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-sound@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-amlogic@lists.infradead.org

---
Valerio Setti (7):
      ASoC: dt-bindings: add amlogic,gxbb-audin
      ASoC: meson: build gx-formatter as a separate module
      ASoC: meson: aiu-encoder-i2s: ensure clk divider gets disabled in hw_free
      ASoC: meson: add AUDIN driver
      ASoC: meson: aiu: add I2S Capture DAI
      ASoC: meson: gx-card: add support for audin FIFO
      arm64: dts: amlogic: gx: add AUDIN node

 .../bindings/sound/amlogic,gxbb-audin.yaml         |  69 ++++
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi          |   9 +
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi        |   5 +
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi         |   6 +
 sound/soc/meson/Kconfig                            |  14 +
 sound/soc/meson/Makefile                           |   7 +-
 sound/soc/meson/aiu-encoder-i2s.c                  |  12 +-
 sound/soc/meson/aiu.c                              |   7 +
 sound/soc/meson/audin-fifo.c                       | 371 +++++++++++++++++++++
 sound/soc/meson/audin-formatter-i2s.c              | 174 ++++++++++
 sound/soc/meson/audin.c                            | 188 +++++++++++
 sound/soc/meson/audin.h                            |  30 ++
 sound/soc/meson/gx-card.c                          |  16 +-
 13 files changed, 893 insertions(+), 15 deletions(-)
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
