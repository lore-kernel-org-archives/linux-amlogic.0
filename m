Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 418E7C54E58
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Mar 2024 10:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YsIfq13sP7DcNHDLcAc64bLLn+Up4s7MloUkqCiK9X0=; b=a9HcC/WV1C2dsI
	DKyk7esUUgbdVVWsBjAtPBqYlu1H8S/hgYdMhK4KBW6baG/IVLSQeF0W4OahabzD57cyiIkB6f+yS
	3BLfBWLIC+WK6c8SDBbLVuIusAigo0SbZMjUKGbZS+bhJNMIeV27nTEDyY0MVI8DERAPzZYGPe++2
	07KWyozlGEu35+8+jzU9rS4MWPwyt4FggGvMRKZOfoiHDsS1z5118Vsac0C1gsWyOtqSzZjU4eS3Y
	jG4ouZ0Ss2AoTok1PVRZlcHPNc7owVOfoj6PFemqEOvWtuqktGTBnwnmoGN2+JTHy4ZxQMbxP6ZnE
	z5vYs8FveHq7ZpQTpksA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl4Sb-0000000HPJC-1OpR;
	Fri, 15 Mar 2024 10:06:45 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl4SX-0000000HPGI-0GrS
	for linux-amlogic@lists.infradead.org;
	Fri, 15 Mar 2024 10:06:43 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-41401f1d665so1996515e9.2
        for <linux-amlogic@lists.infradead.org>; Fri, 15 Mar 2024 03:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1710497199; x=1711101999; darn=lists.infradead.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=JSJDar4M2yUm4D8l+v7Mwxi0TV8x67pqYTNsZ2PsayQ=;
        b=j2kCdAh1cJ2iGechtlCdaLMAF82+v32D6HMKawV6n5ZPbWrDlaATZeXAYQpiSxTRBs
         XJAyJOfafkGqHVQjbTqZ5ZF5A5HAB4xS4HUfqputsFVoFOOQeim0p+tHRKz7TGe3huQy
         2smHWgW6BxXTvz7A579LqK106YEKx//AZ9OTZnak1mUqU+e/olaq4dzx4x23iAzEEojl
         YGAGOCadsDS23mJMU+mHUmN5P/NIRIxkUfK3EsD3f1s7LhoClVDS1SjSkzVk9+qpF/JC
         Qg10xw2VpdBCPsdApJ277XJeLl8rCAvzQztOIXKQFE8tLxRwKEHEXe8ibkWJgAtqDjIf
         Uv1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710497199; x=1711101999;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JSJDar4M2yUm4D8l+v7Mwxi0TV8x67pqYTNsZ2PsayQ=;
        b=dS0I5Ecyl/Rbkv1MFj8PfC95p8gNM1gHFKScK1O9KmSmLtpdUJwWRFJ/5xNpCGeh/i
         cFCj4icghSIGvr/qdl0jkLjIamyWJTX3GSc6a7SHbk1qs9pDY2o+kzsAPS/eTJ/pSbq2
         BhYxv/vaSPiB2Y76i3hd0zvrkYRZ8HZiM5eZtHcAhuT8ABKItL79M0fikbJ3j87hjIK7
         wVulpmPE/sA4Qugk3MNVbOrnzaXiGfn8VuX1EwZQ7imw0azzMYo1C2eKHFDa06kgzO4L
         uXYEH2XRFaZk510ddJzK3hc14bSRDkU6XJoJfKYD5wOpabWDEzppxYPvu4ig/322zNVa
         c13w==
X-Forwarded-Encrypted: i=1; AJvYcCXMPkPgIVmAdWUo8DwwlXdOR3qn28LbYBEOaj+sjBaWhL6qa0cMbgD4BCuKxs5tSosdKtVDHm8eOaRz6eMs9qkCrFdtX9m5gMyMjy9VUh8n0I0=
X-Gm-Message-State: AOJu0Yx8UBGQ1eocOlMj2XkD6EUQaKADmgKEswj0mo3rY0UeIjr5YVVW
	F911o1kNryTzlyrkLVtLRDj2ry354P94oa/NgCD6NIT7MhbufbwwAGNjlWcF96I=
X-Google-Smtp-Source: AGHT+IFei/VwSLVdZGr+j7usNgdM6Q0VdRkbBr81xPcXXnlj2dvPsRezr8PqGBRTcMb21KM9bWZ5bQ==
X-Received: by 2002:a05:600c:4fc8:b0:412:f4b4:2717 with SMTP id o8-20020a05600c4fc800b00412f4b42717mr3308624wmq.26.1710497198823;
        Fri, 15 Mar 2024 03:06:38 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:8151:4d0a:14d8:1124])
        by smtp.gmail.com with ESMTPSA id m9-20020a05600c3b0900b00413ebaf0055sm5294640wms.7.2024.03.15.03.06.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Mar 2024 03:06:38 -0700 (PDT)
References: <20240314232201.2102178-1-jan.dakinevich@salutedevices.com>
User-agent: mu4e 1.10.8; emacs 29.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet
 <jbrunet@baylibre.com>, Michael  Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob  Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Kevin
 Hilman <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org,
 kernel@salutedevices.com
Subject: Re: [PATCH 00/25] Introduce support of audio for Amlogic A1 SoC family
Date: Fri, 15 Mar 2024 11:01:57 +0100
In-reply-to: <20240314232201.2102178-1-jan.dakinevich@salutedevices.com>
Message-ID: <1jv85nhkr6.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240315_030641_359820_D32BBFE8 
X-CRM114-Status: GOOD (  19.71  )
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


On Fri 15 Mar 2024 at 02:21, Jan Dakinevich <jan.dakinevich@salutedevices.com> wrote:

> This series includes the following:
>
>  - new audio clock and reset controller data and adaptation for it of existing
>    code (patches 0001..0004);
>
>  - adaptation of existing audio components for A1 Soc (patches 0005..0021);
>
>  - handy cosmetics for dai-link naming (patches 0022..0023);
>
>  - integration of audio devices into common trees (patch 0024);
>
>  - audio support bring up on Amlogic ad402 reference board (patch 0025). This
>    patch is not actually checked on real hardware (because all ad402 that we had
>    were burned out). This patch is based on ad402's schematics and on experience
>    with our own hardware (which is very close to reference board);
>
> Dmitry Rokosov (2):
>   ASoC: dt-bindings: meson: introduce link-name optional property
>   ASoC: meson: implement link-name optional property in meson card utils
>
> Jan Dakinevich (23):
>   clk: meson: a1: restrict an amount of 'hifi_pll' params
>   clk: meson: axg: move reset controller's code to separate module
>   dt-bindings: clock: meson: add A1 audio clock and reset controller
>     bindings
>   clk: meson: a1: add the audio clock controller driver
>   ASoC: meson: codec-glue: add support for capture stream
>   ASoC: meson: g12a-toacodec: fix "Lane Select" width
>   ASoC: meson: g12a-toacodec: rework the definition of bits
>   ASoC: dt-bindings: meson: g12a-toacodec: add support for A1 SoC family
>   ASoC: meson: g12a-toacodec: add support for A1 SoC family
>   ASoC: meson: t9015: prepare to adding new platforms
>   ASoC: dt-bindings: meson: t9015: add support for A1 SoC family
>   ASoC: meson: t9015: add support for A1 SoC family
>   ASoC: dt-bindings: meson: axg-pdm: document 'sysrate' property
>   ASoC: meson: axg-pdm: introduce 'sysrate' property
>   pinctrl/meson: fix typo in PDM's pin name
>   ASoC: dt-bindings: meson: meson-axg-audio-arb: claim support of A1 SoC
>     family
>   ASoC: dt-bindings: meson: axg-fifo: claim support of A1 SoC family
>   ASoC: dt-bindings: meson: axg-pdm: claim support of A1 SoC family
>   ASoC: dt-bindings: meson: axg-sound-card: claim support of A1 SoC
>     family
>   ASoC: dt-bindings: meson: axg-tdm-formatters: claim support of A1 SoC
>     family
>   ASoC: dt-bindings: meson: axg-tdm-iface: claim support of A1 SoC
>     family
>   arm64: dts: meson: a1: add audio devices
>   arm64: dts: ad402: enable audio

I'm sorry but a 25 patches series is just way too big, especially when
spamming multiple sub systems.

Please try to make one series per sub systems and general topic, I see
at least
* A1 audio clocks
* G12 acodec fix
* Acodec rework
* PDM
* pinctrl
* arm64

I did not review all but I think I've made enough comments to keep you
busy for a while

>
>  .../bindings/clock/amlogic,a1-audio-clkc.yaml |  83 +++
>  .../reset/amlogic,meson-axg-audio-arb.yaml    |  10 +-
>  .../bindings/sound/amlogic,axg-fifo.yaml      |   8 +
>  .../bindings/sound/amlogic,axg-pdm.yaml       |   5 +
>  .../sound/amlogic,axg-sound-card.yaml         |  12 +-
>  .../sound/amlogic,axg-tdm-formatters.yaml     |  22 +-
>  .../bindings/sound/amlogic,axg-tdm-iface.yaml |   6 +-
>  .../bindings/sound/amlogic,g12a-toacodec.yaml |   1 +
>  .../bindings/sound/amlogic,gx-sound-card.yaml |   6 +
>  .../bindings/sound/amlogic,t9015.yaml         |   4 +-
>  .../arm64/boot/dts/amlogic/meson-a1-ad402.dts | 126 ++++
>  arch/arm64/boot/dts/amlogic/meson-a1.dtsi     | 471 +++++++++++++++
>  drivers/clk/meson/Kconfig                     |  18 +
>  drivers/clk/meson/Makefile                    |   2 +
>  drivers/clk/meson/a1-audio.c                  | 556 ++++++++++++++++++
>  drivers/clk/meson/a1-audio.h                  |  58 ++
>  drivers/clk/meson/a1-pll.c                    |   8 +-
>  drivers/clk/meson/axg-audio.c                 |  95 +--
>  drivers/clk/meson/meson-audio-rstc.c          | 109 ++++
>  drivers/clk/meson/meson-audio-rstc.h          |  12 +
>  drivers/pinctrl/meson/pinctrl-meson-a1.c      |   6 +-
>  .../dt-bindings/clock/amlogic,a1-audio-clkc.h | 122 ++++
>  .../reset/amlogic,meson-a1-audio-reset.h      |  29 +
>  .../dt-bindings/sound/meson-g12a-toacodec.h   |   5 +
>  sound/soc/meson/axg-pdm.c                     |  10 +-
>  sound/soc/meson/g12a-toacodec.c               | 298 ++++++++--
>  sound/soc/meson/meson-card-utils.c            |  12 +-
>  sound/soc/meson/meson-codec-glue.c            | 174 ++++--
>  sound/soc/meson/meson-codec-glue.h            |  23 +
>  sound/soc/meson/t9015.c                       | 326 +++++++++-
>  30 files changed, 2394 insertions(+), 223 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/amlogic,a1-audio-clkc.yaml
>  create mode 100644 drivers/clk/meson/a1-audio.c
>  create mode 100644 drivers/clk/meson/a1-audio.h
>  create mode 100644 drivers/clk/meson/meson-audio-rstc.c
>  create mode 100644 drivers/clk/meson/meson-audio-rstc.h
>  create mode 100644 include/dt-bindings/clock/amlogic,a1-audio-clkc.h
>  create mode 100644 include/dt-bindings/reset/amlogic,meson-a1-audio-reset.h


-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
