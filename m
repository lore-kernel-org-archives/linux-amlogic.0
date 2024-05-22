Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64A0AC25B7A
	for <linux-amlogic@archiver.kernel.org>; Wed, 22 May 2024 13:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=VlUYD/XSWChurF74xKhw6dV2gXazOrSgtxHamghK5Mc=; b=mEBabKlniblZ6Ee1Y5ZqZo91sX
	nPUEYRnDqljEHBT/n/+m7SjEiTUBFxw2nb0L19OPiomMN2X+LtG3VrPtStwJUyRQ4X9DIrFsFsYWq
	efsLiy44vQ5NSHuk9pHw2lwYzfNZzMoSHOs6daBtne4aWFOmgzKPFNEeXIhT/1GoM6HhKBtCbxJPn
	Em9t8QQz5pUGvRbO2dHQB1WPJwNL44d28PQ/0U24i1+SMPNY2IoWcBuN7JMaf/7bFAcV1l/GH284o
	SJT60zMlCIJrkiBAZILJEgWA1RH0dv6DFZWZaIlz+9RivKsWOXDMZmI0Uc1/hRpmGWoruNXFMFttB
	H1+x0YBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9mIo-000000035zx-1Ghc;
	Wed, 22 May 2024 13:46:46 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9mIk-000000035xx-2ZnO;
	Wed, 22 May 2024 13:46:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C79E1CE11B7;
	Wed, 22 May 2024 13:46:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 696FDC2BBFC;
	Wed, 22 May 2024 13:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716385597;
	bh=iv23FVjeQKm1NNTk/dWFfJ2tDnqx1XnfEogDHQlZoj8=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=iBGFgFqGj8zFV3wbU1qQCwnEIYFOprpN0cFQVbDZO1y3YoKyrYFKqtihDTmR170Tq
	 y026iootcvRWZK/HCL8G7UTqTtN1RH6rSRPE7FTrvgMXpY7jGvEB69qy9k/8PDR/Yc
	 g2S96td4p0cL1pJ9oXHQ4QuJiMBiH+2hNUIytalF3b1I658zA9uGe499XqcHsnb9xZ
	 lO9w3IjK4N0ba3b+nSbXgiWze9X+i4TkBaAddwa7V0EPPlEJMfgX7GsRuLvCKTBOkR
	 lIRQMNb6uwo4hrU9XIBHT4ZmqLUiv0D/hOqnOnNWRqNTMxHsBKOKnecO1UaPjPu4BR
	 E0TVKRUPlwYAg==
Date: Wed, 22 May 2024 08:46:36 -0500
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, Lucas Tanure <tanure@linux.com>, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Dmitry Rokosov <ddrokosov@sberdevices.ru>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-amlogic@lists.infradead.org
In-Reply-To: <20240521222155.28094-1-jan.dakinevich@salutedevices.com>
References: <20240521222155.28094-1-jan.dakinevich@salutedevices.com>
Message-Id: <171638551693.3169786.7201121718393921307.robh@kernel.org>
Subject: Re: [PATCH 0/3] Introduce initial support of Amlogic AC200 board
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240522_064643_267948_B7D32C7D 
X-CRM114-Status: GOOD (  11.83  )
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


On Wed, 22 May 2024 01:21:52 +0300, Jan Dakinevich wrote:
>  - Make some cosmetics in existing device tree files;
> 
>  - Add the board.
> 
> Jan Dakinevich (3):
>   arch/arm64: dts: ac2xx: make common the sound card
>   dt-bindings: arm: amlogic: document AC200 support
>   arch/arm64: dts: ac200: introduce initial support of the board
> 
>  .../devicetree/bindings/arm/amlogic.yaml      |  1 +
>  .../dts/amlogic/meson-sm1-a95xf3-air-gbit.dts | 87 -------------------
>  .../boot/dts/amlogic/meson-sm1-a95xf3-air.dts | 87 -------------------
>  .../boot/dts/amlogic/meson-sm1-ac200.dts      | 22 +++++
>  .../boot/dts/amlogic/meson-sm1-ac2xx.dtsi     | 87 +++++++++++++++++++
>  .../boot/dts/amlogic/meson-sm1-h96-max.dts    | 87 -------------------
>  .../dts/amlogic/meson-sm1-x96-air-gbit.dts    | 87 -------------------
>  .../boot/dts/amlogic/meson-sm1-x96-air.dts    | 87 -------------------
>  8 files changed, 110 insertions(+), 435 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/amlogic/meson-sm1-ac200.dts
> 
> --
> 2.34.1
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


New warnings running 'make CHECK_DTBS=y amlogic/meson-sm1-a95xf3-air-gbit.dtb amlogic/meson-sm1-a95xf3-air.dtb amlogic/meson-sm1-ac200.dtb amlogic/meson-sm1-h96-max.dtb amlogic/meson-sm1-x96-air-gbit.dtb amlogic/meson-sm1-x96-air.dtb' for 20240521222155.28094-1-jan.dakinevich@salutedevices.com:

arch/arm64/boot/dts/amlogic/meson-sm1-x96-air-gbit.dtb: audio-controller@380: compatible: ['amlogic,sm1-tdmin', 'amlogic,axg-tdmin'] is too long
	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-formatters.yaml#
arch/arm64/boot/dts/amlogic/meson-sm1-ac200.dtb: /soc/bus@ff600000/bus@60000/clock-controller@0: failed to match any schema with compatible: ['amlogic,sm1-audio-clkc']
arch/arm64/boot/dts/amlogic/meson-sm1-ac200.dtb: audio-controller@300: compatible: ['amlogic,sm1-tdmin', 'amlogic,axg-tdmin'] is too long
	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-formatters.yaml#
arch/arm64/boot/dts/amlogic/meson-sm1-ac200.dtb: audio-controller@340: compatible: ['amlogic,sm1-tdmin', 'amlogic,axg-tdmin'] is too long
	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-formatters.yaml#
arch/arm64/boot/dts/amlogic/meson-sm1-ac200.dtb: audio-controller@380: compatible: ['amlogic,sm1-tdmin', 'amlogic,axg-tdmin'] is too long
	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-formatters.yaml#
arch/arm64/boot/dts/amlogic/meson-sm1-ac200.dtb: audio-controller@3c0: compatible: ['amlogic,sm1-tdmin', 'amlogic,axg-tdmin'] is too long
	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-formatters.yaml#
arch/arm64/boot/dts/amlogic/meson-sm1-ac200.dtb: /soc/bus@ff600000/bus@60000/audio-controller@744: failed to match any schema with compatible: ['amlogic,sm1-tohdmitx', 'amlogic,g12a-tohdmitx']
arch/arm64/boot/dts/amlogic/meson-sm1-ac200.dtb: /soc/bus@ff600000/bus@60000/audio-controller@744: failed to match any schema with compatible: ['amlogic,sm1-tohdmitx', 'amlogic,g12a-tohdmitx']
arch/arm64/boot/dts/amlogic/meson-sm1-ac200.dtb: sys-ctrl@0: '#address-cells', '#size-cells', 'ranges' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml#
arch/arm64/boot/dts/amlogic/meson-sm1-ac200.dtb: audio-controller-0: clock-names:0: 'sclk' was expected
	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
arch/arm64/boot/dts/amlogic/meson-sm1-ac200.dtb: audio-controller-0: clock-names:1: 'lrclk' was expected
	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
arch/arm64/boot/dts/amlogic/meson-sm1-ac200.dtb: audio-controller-0: clock-names:2: 'mclk' was expected
	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
arch/arm64/boot/dts/amlogic/meson-sm1-ac200.dtb: audio-controller-1: clock-names:0: 'sclk' was expected
	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
arch/arm64/boot/dts/amlogic/meson-sm1-ac200.dtb: audio-controller-1: clock-names:1: 'lrclk' was expected
	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
arch/arm64/boot/dts/amlogic/meson-sm1-ac200.dtb: audio-controller-1: clock-names:2: 'mclk' was expected
	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
arch/arm64/boot/dts/amlogic/meson-sm1-ac200.dtb: audio-controller-1: Unevaluated properties are not allowed ('clock-names' was unexpected)
	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
arch/arm64/boot/dts/amlogic/meson-sm1-ac200.dtb: audio-controller-2: clock-names:0: 'sclk' was expected
	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
arch/arm64/boot/dts/amlogic/meson-sm1-ac200.dtb: audio-controller-2: clock-names:1: 'lrclk' was expected
	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
arch/arm64/boot/dts/amlogic/meson-sm1-ac200.dtb: audio-controller-2: clock-names:2: 'mclk' was expected
	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
arch/arm64/boot/dts/amlogic/meson-sm1-ac200.dtb: sound: 'anyOf' conditional failed, one must be fixed:
	'clocks' is a required property
	'#clock-cells' is a required property
	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#






_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
