Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4A1BC83F1A
	for <linux-amlogic@archiver.kernel.org>; Thu, 10 Jul 2025 20:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:To:Cc:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=SbD7eez1/QEg3EVyXdbN5mO3W2iCKhxncFMZusWxDGI=; b=ocHLoxdhlbBGRXYBa0dHryBl4t
	yoSktqbofOE0a6kiM3NsAmtcuVgEX+OvmvBboup5web0F0TA7KDHh2rY+trMfEpXuLoRXOegimYlb
	b+/MNKTb53HT70SkKo2SoC0oRI2a7Cn0UK+Aw6fQmuoyTn0wOl5NM1Gvv0LpdGLHQOnAWZ2xce+Tw
	1dWSFmJuLV6UdUf0qvk36H1zxePp8s/blCbgFfczarB69y8OaF8LISoQIrlIe08zALCa6o4kTnwkQ
	4JXOZfNy1D/eWlYiMPLx6Vc6jFTBU6uTpu9kDKrROT+oZ5AKZ4PzInCPQLFT+OHyv97lnN8M9g8ZQ
	qxo/0fvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZyI1-0000000Cz4u-0RN6;
	Thu, 10 Jul 2025 20:54:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZwaL-0000000Cm2f-3Gvk;
	Thu, 10 Jul 2025 19:05:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5ED9546F24;
	Thu, 10 Jul 2025 19:05:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E1CEC4CEF1;
	Thu, 10 Jul 2025 19:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752174333;
	bh=WTdySniEXJwh9zm+X3t0eM0XdacPv4vH2YSk2MMBsKM=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=VdtcAp87DeTeG/zCy8Rcl8gCkk2Nu7vLr7M5VtJBWzktPQVdGQ/+fESZpbPew56kV
	 TQiPcuDIEEBjy1opZeVlHqZIN4KR0iSZeS61tcOqGR0A1/aXSwzn6z4mRy079YeC/C
	 OKw4mY2bVzuUX3oGv4cyV3w+e4YpsLWJdm+JCpaqhP34ufbdY3mqw68Klmp/wB3Och
	 uE9wqx/nlC6aWFILKNz4gD+OzgRvmgsvTAFuIpKkMAPGXnfqBLju1Sy2P43jW3N2Ua
	 fqaCF1pXxTWzArM5h3d2QByz72ZSOKsiXtjYCQ05BGGDVzniVYPH1o31/AL7tZ+uLZ
	 91c2jWD80GYfg==
Date: Thu, 10 Jul 2025 14:05:32 -0500
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-sound@vger.kernel.org, 
 jian.xu@amlogic.com, Mark Brown <broonie@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, zhe.wang@amlogic.com, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 linux-amlogic@lists.infradead.org, Jaroslav Kysela <perex@perex.cz>, 
 shuai.li@amlogic.com, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, 
 linux-arm-kernel@lists.infradead.org
To: jiebing chen <jiebing.chen@amlogic.com>
In-Reply-To: <20250710-audio_drvier-v5-0-d4155f1e7464@amlogic.com>
References: <20250710-audio_drvier-v5-0-d4155f1e7464@amlogic.com>
Message-Id: <175217427132.3135674.349171933373202278.robh@kernel.org>
Subject: Re: [PATCH v5 0/6] Add support for S4 audio
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_120533_860627_211D9C24 
X-CRM114-Status: GOOD (  21.77  )
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


On Thu, 10 Jul 2025 11:35:36 +0800, jiebing chen wrote:
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
> --
> Jiebing Chen <jiebing.chen@amlogic.com>
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


This patch series was applied (using b4) to base:
 Base: using specified base-commit 6ecd20965bdc21b265a0671ccf36d9ad8043f5ab

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/amlogic/' for 20250710-audio_drvier-v5-0-d4155f1e7464@amlogic.com:

arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dtb: clock-controller@330000 (amlogic,s4-audio-clkc): reg: [[0, 3342336, 0, 216], [0, 3346048, 0, 16]] is too long
	from schema $id: http://devicetree.org/schemas/clock/amlogic,axg-audio-clkc.yaml#
arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dtb: clock-controller@330e80 (amlogic,clock-pads-clkc): power-domains: False schema does not allow [[14, 7]]
	from schema $id: http://devicetree.org/schemas/clock/amlogic,axg-audio-clkc.yaml#
arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dtb: sound (amlogic,axg-sound-card): 'anyOf' conditional failed, one must be fixed:
	'clocks' is a required property
	'#clock-cells' is a required property
	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#






_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
