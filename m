Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28ECDC83F1D
	for <linux-amlogic@archiver.kernel.org>; Thu, 10 Jul 2025 11:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kkz8OMfbHjXzlTd5tuYMXs6L5fhEYyTGY/MwHC6eyp4=; b=gHTFVuIqxjoI3j
	k5WjLQgWKwwMk4cZCwWBimocNbmxF9DnR8D2SzdqIHEqcgdJJIxxJwHMq7GAJ1xvDYR6W5lvouiI9
	MaN0HXdr/VPuvwatiR7OSwR2o/SXKkCvbESWRj75bPRuNLH6s3eqik2WWyVb4gvsQmGyZh/IltCEC
	r4fjN4wO1Efm2lWp50MBvZNzNvhCkvpEL6YVizNTF9bu+2npiO6qr7BwX1DlOKdGjknu3vEvSV58A
	aSLeA4BhEc6hkTfD+ymCIxZYWa6+RjlOiew1sikBnsrmDK+R/U59nN4DLmF0JPw4ltut+i9KMpFyw
	jY0ySe7OSFnrSwkitstg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZpGM-0000000BblL-2SKr;
	Thu, 10 Jul 2025 11:16:26 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZne4-0000000BM89-2D13
	for linux-amlogic@lists.infradead.org;
	Thu, 10 Jul 2025 09:32:50 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3a6d1369d4eso445978f8f.2
        for <linux-amlogic@lists.infradead.org>; Thu, 10 Jul 2025 02:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1752139967; x=1752744767; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0R0Hr4CE1RY0MwuVSGpjrdEwFEFKJYZxZJ8a7zSdbcY=;
        b=vaciCoGuAYLKz4v6expMz7zzLrltMYOuMsfFBA723dUcSGer9xjakEwO4IWZFx0/4D
         fv88MvjxzGbY3pH152DY4r+1PNLk9WD5ZHz8b5hOlOy/OimmOaf4P6WU9yI3h/jNP86V
         6PgyN59eFDJsLr3ucTlvqdIRxKLBnEzRzTA6byr0wqzafYwxPOZyMIHc5StlQ7YzXdpG
         tK915+ry6lmBoT8vBn0UvagpU0tDJfeQR6m7NL048QwZCw3vO8OM8KxsqCJZqwZK/XPe
         UqrSaPBKMlzKhQsDhnkbOVZ/58eMDjVRRohrB0DcKUyVkU1bKLYLhSN4Y8goQS3ELv9c
         cFcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752139967; x=1752744767;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0R0Hr4CE1RY0MwuVSGpjrdEwFEFKJYZxZJ8a7zSdbcY=;
        b=fRqcZT0rknBCoZCCaeDxZQFNEBWFmI4yvTlZMC4AVAUJYI8Bry0vgrxNWnqQXBKdbe
         EtJae7MfmeytdeMltq7BtljYYl3AgPGSiRQwCybNswBABtVeVY06+3YxnrlE0MXFFFvM
         kkypPi2RlXXrv5Vrz+un4V9n3pvBkhO3Z+x05TSO3rKpwVk/oFrxFQFV//nM8GHDD91n
         0wA0R5nIekKnNVuGMSIPHVS9MEowltlL7ngLy3pIebxTjz0dSQZz2wGn0ZomLi8TYV9b
         WcwCa/5eQISzLz9iTmxyiS/HMjA885Z3ZHMuz1xXF3cnMiMcDsXQGi2adCLb9kQNKRUu
         nQmw==
X-Forwarded-Encrypted: i=1; AJvYcCUDELFmb0w5lQF1cAf0lQDF4tlyOglgEP0Avka692RxXSuaOEbbHw/hlW/MTPwsRVzGZUE9/UqYDzBnypD/@lists.infradead.org
X-Gm-Message-State: AOJu0YwuHqQe5MXzOWCKVKKZNMc/TByChNc65j2BKvHctqmQuBcpFAdd
	g+v3LH5Ce35c1L4i5SlS2wmam7wfTsSeb16qc3AYh4ItnO5omwPELADuG332zg0UD9k=
X-Gm-Gg: ASbGncuoQgcGw3HxaQ9tY1Uw124EWPdcZYNE0XLGS+DN69H7G02rLZPJRVgEfMN1nRr
	7XRHpZ1RJgoEGSQAHIBlYye7S0LCZjV7v+wy4u34g+M2PO0BtGlClh+NI0BqnQkmYOBzB+0S5tT
	vm5qo4Dszre3RVzzw6icU+KzUTZziroyHZrja3nPZRSinTXCuw7VBSG1v3xQJQQTvo8ZWKcC9kD
	9GncYohVhoAaKIV8tMlF/JKd/3Yx8qAC/kt9s1rnJ5k7TeO2OoPpC+uObBlh4/fWjbwvqREhcVS
	C3l1a8NqMQd/2cZMRCk/N43zHfbioD9nOR8VzK0lU3G/gCBnsQA+AJrMB/oHRA==
X-Google-Smtp-Source: AGHT+IE1D9auCg4xgGpZ6zuosoUHXOAtKOoG+1ROyX+EBevhLJgYW2QgO4A9PEzjJQELPZ9swbZlmg==
X-Received: by 2002:a05:6000:4a12:b0:3a5:2f23:3783 with SMTP id ffacd0b85a97d-3b5e44ea414mr5599937f8f.24.1752139966897;
        Thu, 10 Jul 2025 02:32:46 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:9fcc:5953:3d1a:6b41])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b5e8dc3a54sm1402833f8f.39.2025.07.10.02.32.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 02:32:46 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: jiebing chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,  Mark Brown <broonie@kernel.org>,
  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>,  Jaroslav Kysela <perex@perex.cz>,
  Takashi Iwai <tiwai@suse.com>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Kevin Hilman <khilman@baylibre.com>,  Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,
  jiebing.chen@amlogic.com,  linux-sound@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-amlogic@lists.infradead.org,
  linux-clk@vger.kernel.org,  jian.xu@amlogic.com,  shuai.li@amlogic.com,
  zhe.wang@amlogic.com
Subject: Re: [PATCH v5 0/6] Add support for S4 audio
In-Reply-To: <20250710-audio_drvier-v5-0-d4155f1e7464@amlogic.com> (jiebing
	chen via's message of "Thu, 10 Jul 2025 11:35:36 +0800")
References: <20250710-audio_drvier-v5-0-d4155f1e7464@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 10 Jul 2025 11:32:45 +0200
Message-ID: <1jo6tspf0i.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_023248_571294_997C7DBE 
X-CRM114-Status: GOOD (  17.67  )
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

On Thu 10 Jul 2025 at 11:35, jiebing chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org> wrote:

> This series completes the end-to-end audio support
> for S4 SoC from hardware bindings to driver implementation
> and system integration.
>
> 1 Device Tree Bindings Updates 
> Added audio power domain support for S4 SoC.Defined mclk/sclk pad clock IDs in AXG audio bindings.
> Add S4 audio tocodec binding support.
>
> 2 Driver Implementation
> Implemented S4 tocodec driver for G12A architecture.
> Add mclk pad divider support for S4 in AXG audio clock.
>
> 3 Device Tree Integration
> Add Amlogic S4 audio subsystem support in arm64 DTS.

Several subsystem in a single patchset spams a lot of people.
It is not strictly necessary here.

Ideally, one patchset per subsystem please.

>
> Signed-off-by: jiebing chen <jiebing.chen@amlogic.com>
> ---
> Changes in v5:
> - Fix warning Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yam when make dt_binding_check
> - The audio reg is mounted below the APB bus in dts file.
> - Deal with pad clock in a distinct controller.
> - Fix warning for sound/soc/meson/g12a-toacodec.c
> - Link to v4: https://lore.kernel.org/r/20250319-audio_drvier-v4-0-686867fad719@amlogic.com
>
> Changes in v4:
> - fix dtb check warning 
> - add maxItems of power domain for dt-bindings
> - fixed audio clock pads regmap base and reg offset 
> - use dapm widget to control tocodec bclk and mclk enable
> - Link to v3: https://lore.kernel.org/r/20250228-audio_drvier-v3-0-dbfd30507e4c@amlogic.com
>
> Changes in v3:
> - remove g12a tocodec switch event
> - Modify the incorrect title for dt-bindings
> - Link to v2: https://lore.kernel.org/r/20250214-audio_drvier-v2-0-37881fa37c9e@amlogic.com
>
> Changes in v2:
> - remove tdm pad control and change tocodec base on g12a
> - change hifipll rate to support 24bit
> - add s4 audio clock
> - Link to v1: https://lore.kernel.org/r/20250113-audio_drvier-v1-0-8c14770f38a0@amlogic.com
>
> ---
> jiebing chen (6):
>       dt-bindings: clock: meson: Add audio power domain for s4 soc
>       dt-bindings: clock: axg-audio: Add mclk and sclk pad clock ids
>       dt-bindings: Asoc: axg-audio: Add s4 audio tocodec
>       ASoC: meson: g12a-toacodec: Add s4 tocodec driver
>       clk: meson: axg-audio: Add the mclk pad div for s4 chip
>       arm64: dts: amlogic: Add Amlogic S4 Audio
>
>  .../bindings/clock/amlogic,axg-audio-clkc.yaml     |  55 ++-
>  .../bindings/sound/amlogic,g12a-toacodec.yaml      |   1 +
>  .../boot/dts/amlogic/meson-s4-s805x2-aq222.dts     | 218 +++++++++++
>  arch/arm64/boot/dts/amlogic/meson-s4.dtsi          | 387 ++++++++++++++++++
>  drivers/clk/meson/axg-audio.c                      | 435 ++++++++++++++++++++-
>  drivers/clk/meson/axg-audio.h                      |   6 +
>  include/dt-bindings/clock/axg-audio-clkc.h         |  11 +
>  sound/soc/meson/g12a-toacodec.c                    |  42 ++
>  8 files changed, 1152 insertions(+), 3 deletions(-)
> ---
> base-commit: 6ecd20965bdc21b265a0671ccf36d9ad8043f5ab
> change-id: 20250110-audio_drvier-07a5381c494b
>
> Best regards,

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
