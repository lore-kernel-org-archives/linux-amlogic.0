Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2E9ACCF2CC
	for <linux-amlogic@archiver.kernel.org>; Sun, 18 Oct 2026 10:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OFfI5qSx7/Ijo9aJQq3RV0D7d6//q37irnJVL3udznw=; b=Y0usm8OhIIz3dX
	Y7/tApLqDlR8n52XRFCr+ZouYsZG/A3wGoKJl1H8YUh/yr6MOy0TZANG0Pte/DvICmAJijTLGWoGU
	cS+v7g7MDrid6d0n0Zk88MOEkhhyL7BikIHm3j7JBF6r94kz+1TU7xJwEmgogheDeZ6rlnqsaOlHP
	kfNlgX/5wX+vLnXi6RZJkfQflOzEKs/3QcpwOppXvtJxBuq2SYS0KlnxsU1bhjyOLBDPRREnoaSH9
	A9/op0rb8x7dyHieLlyLBEmAXpSJg5tsd8WvP0sidO4SMxEqU+l/Y/FV5Fm1b89/MA+jXOJtGoUmi
	lRgSsBeqeuU4HWJEFHlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xINyW-00000005jgb-4BJM;
	Sun, 18 Oct 2026 10:18:45 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xINyS-00000005jeM-32FO
	for linux-amlogic@lists.infradead.org;
	Sun, 18 Oct 2026 10:18:44 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-48df0fa43c5so829992f8f.0
        for <linux-amlogic@lists.infradead.org>; Sun, 18 Oct 2026 03:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792318718; x=1792923518; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=c8IHe+CUIm/KPhpOQ7ziP0T0YfArguySEnc0dVC2++w=;
        b=cXtRH/EQ5s1LARXSEIpHrEWjv4aIAcLN+sZgxOziSztFgncZCYWDFyhiL3RCa4GwTP
         OxmQdBU9VwJABzd0tUvomF+zHgbEOOHs698Rjtpth3+JTpOJsizoMLVb9R1nSmqcu3ed
         M4wbdVQg1pe4XDewqpGLL4o6obcmF2X0Q0u57UAWG6aeXlhd+044T7WDvN4cWXxmIpwh
         r0nPMVg6JwSLYJIeZSHrOSYwQ1KglJ2SIi31H9CdAZ5wEuASTo7KoFFrZupl/MKV2XpT
         al+mFGqVUgvojVMzjuRlm5qJRrqsOMXDrnUEoafik5Ilxv/yZKvP8fdJjFGvHxdnWxro
         GeqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792318718; x=1792923518;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=c8IHe+CUIm/KPhpOQ7ziP0T0YfArguySEnc0dVC2++w=;
        b=MzG5WSHfEGKYGezzwCSQv0iaoc++rol/fsfMzuHPW+yu1FW9lDBJS39vlYyEcHdxCz
         WLaTDiONH3EJAMkOG2nXL+9hQLRv5MZ/P4/ummjQMbUZ7uPh0tOtk/VZAH5mY8iv0MM3
         ZRMpkXzl/3n19nZslwhXOjbrSSEqUIcjQugml4R90tkUufGtWN6/BUvfhvrePlT4U+yT
         wvZEajlMFIUl0tPBSoyNxSdEsAG5886wVfGvIeAxrcoD8GcCvbQLq1faTlauusqPVXsh
         s/O+WoamBJajkfO7Wd3rxfvD39xqL9y1Cj9k8b/horEVwtOoEdB0P+kmBX/6BlWks31q
         sdIg==
X-Forwarded-Encrypted: i=1; AKwUvBytim11STFY8TYvoQ0fi3aUVqpgg9+1zEdA/XQ1kw43P2+8pv+nwJSm0PxG/XxhmbqcCcKxR6WrAC5PxeiP@lists.infradead.org
X-Gm-Message-State: AFq9FYKVhbNhcIicYKzXaNURKHYGznIsq59tVXfhbKF8samgAsPcbhSs
	CaH82PyIAEn2hXyUqkqx4yh35ep6C8rmTKHxWoi8Icvuikowh23gg1cPJHN6i5Jljdha9kcECNl
	pv9+WKSERkg==
X-Gm-Gg: AYBFou32xjURSseKl0WTYKAErGL1TTgcpRg717sjD89WOq2Fn/TgXIQ57rYkGt7AbRM
	b80dczMFHv0Q4n8VDso8K5/D6Y84CVNWL4DcQ6Lkum9iblt++0HLBRG0Ko6yJ5013K220EqlH+Y
	HM/hi6f+GaFCmV1NQlK8HRRxXAxuMmNl45A647IzB0M0XdCh8n7MR7HqRombLi9aHF5FXVeMEfJ
	ReRYZHx1azmpm5PwqbVW92mwkHuAskMejCpOBxS4SyTq0AJ74XnG88BDu3nkZGMDQ0X5CY61sNu
	IExc73nWsgQvH+Gh/6Vc3AbsdlIwb5OV+3ZdpXndbPOdtTKs70lVn6OSsMrLABVjpIhwbs3hB08
	FqVMuZvff0KjR9wtjDJMdCAFhVZ3I6kA2A0xa/rmbV8Mt0+XWA4QbddKnmtAIz4W2kuTu5cIVR2
	S8Xvw8kBcsb7ajmwQBGjvAS6IseRK6XqHfsLKa1zBXJe1zPYpvSSuL+kJDO8aY/hg6rfUl
X-Received: by 2002:a05:6000:2c0d:b0:48e:d40:a87c with SMTP id ffacd0b85a97d-48e0d40aa21mr6538051f8f.16.1792318717509;
        Sun, 18 Oct 2026 03:18:37 -0700 (PDT)
Received: from [127.0.1.1] ([37.103.126.255])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4d4978sm14911507f8f.21.2026.10.18.03.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 03:18:37 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Subject: [PATCH v5 0/7] ASoC: meson: gx: add base support for I2S audio
 input
Date: Sun, 18 Oct 2026 12:17:57 +0200
Message-Id: <20261018-audin-v5-0-4b8cc13a1b22@baylibre.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIANac1GoC/23PQW7CMBAF0Ksgr+vKM3bshBX3qLqwJ5NiRBNkg
 1WEcvc6UBCqWH7pvz+ai8icImexXl1E4hJznMYamreVoK0fv1jGvmaBCq1qNUh/6uMoO/IhmEY
 RdUbU7iHxEH+uOx+ft5xPYcd0XPDS2MZ8nNL5eqjA0rttdoB/mwWkkm4IPHCHrQPYBH/ex5D4n
 aZvscwWfIbuDrFC3fZsAkHP2ryA+gni46Ku0DurNCApZ+kFNA8ISt3fL6ZCNM5aYwHa0PyD8zz
 /AoLBkC1aAQAA
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
 linux-kernel@vger.kernel.org, Valerio Setti <vsetti@baylibre.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6232; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=b2LrlLkZJEXop3ZA4rJS2x0ZvQcjdTqgRnxGJins/e0=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFlX5vxSkio3mFTiavE/8c/aMrmL3DMnf3thHGFmHOKk7
 zDhmLtNRykLgxgXg6yYIgvL9Hu/C0rVHhonnCyAmcPKBDKEgYtTACaS5MTIsO3//9BLYjrWwlNP
 yKgtOfpCmfPtha9qH7q36HovYnjScZfhf/2WbV8StuizPj9rKqB/4JBL/ZOfbBG5Z2ZIF07v2s+
 oxwkA
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_031840_815501_62D89A0A 
X-CRM114-Status: GOOD (  21.14  )
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
Changes in v5:
- Take the PCM stream lock in the FIFO polling timer callback and skip
  re-arming it if a trigger already did so, fixing a race on quick
  PAUSE_PUSH -> PAUSE_RELEASE transitions. [Sashiko]
- Cancel the FIFO polling timer in the DAI 'shutdown' callback, so the
  timer is guaranteed to be stopped before the DAI data is freed on
  driver unbind. [Sashiko]
- Fixed commit message for commit 'ASoC: meson: aiu: add I2S Capture DAI'
  as requested by Jerome. Since the code is unchanged I kept the
  'Reviewed-by' tag.
- Link to v4: https://patch.msgid.link/20261001-audin-v4-0-2476646118b5@baylibre.com

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
 sound/soc/meson/audin-fifo.c                       | 392 +++++++++++++++++++++
 sound/soc/meson/audin-formatter-i2s.c              | 174 +++++++++
 sound/soc/meson/audin.c                            | 188 ++++++++++
 sound/soc/meson/audin.h                            |  30 ++
 sound/soc/meson/gx-card.c                          |  16 +-
 13 files changed, 914 insertions(+), 15 deletions(-)
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
