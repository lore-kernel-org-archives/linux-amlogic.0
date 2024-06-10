Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0253EC27C5F
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Jun 2024 19:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=5mAfTetapLVPwJKqMzsdKo4KpvPvv5bNAJXflyNHckI=; b=SVcT+9ua4xzVHjIgWyEqpL9hnA
	5IiP8PEk/n1+H6fK1BjmkTqqhDMxzDDqa7ciYqCrn5Ywv5ye5B14w68KWKOo+6d7jCh9hfZaomJxg
	X4YS5wiIxOKYhCid51GrsdBdMpRAkXU03OY8R3BwOW1yvtt8zkRI8eRmWTzzBOZzzHA7LrjmjhQiv
	DdtL0FXYFnnIKt8KA20e25JdIj1Ig/RcS/L0mTgQzUsRXTKRSBIQXgXTm15wBWcpSO0zyFg2icM4l
	ZvWuAcX18fG7jR9MQ/Q/2wRCf5J+Cf1EPsfehk8pUSIDZn83mRXZSG1BQkr8G74eSE3yk+B9hEjgx
	J6CR38lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGl6s-00000006Je9-36B1;
	Mon, 10 Jun 2024 19:55:18 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGl6p-00000006Jd6-1HGi;
	Mon, 10 Jun 2024 19:55:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 3C4E0CE17E2;
	Mon, 10 Jun 2024 19:55:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5207CC2BBFC;
	Mon, 10 Jun 2024 19:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718049312;
	bh=ZXno21ruQX7U9aDUjGK6FqcPyvaWK4QVLpAwyNfzCEE=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=nhBaCMGNS+8oSuHkiBunoxU4rsqzW0XmtDCnlK20fkoFpO7rkBYeODA0BBq/A6LSl
	 Wf7OpAqQwKFvY0IZTYo2QO1UfB4uW675xM/IpqEvTWaChULATQSyHNa08X5QItebKs
	 GXIzB62HYXI5LvORc9C31gn8I6U0Oqtw8O9m/dp6bcY4pEH+KjpoXEuKVciQiARj6z
	 Tcl6u/NTe7CUzttQYJndBc+CSNRF1X1l1QcYXnjINKyRP+37YIUDsq3Uyxv4dFOJPz
	 9THunnSLwyta25WX0LIJHqxrtmkIm/xUyUmZSXwANWikwA2G7rV2zhQfxCIO0yxCDm
	 g/k4HQnVl7OMg==
Date: Mon, 10 Jun 2024 13:55:11 -0600
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Viacheslav Bocharov <adeep@lexina.in>
Cc: Jerome Brunet <jbrunet@baylibre.com>, 
 linux-arm-kernel@lists.infradead.org, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-amlogic@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 Rob Herring <robh+dt@kernel.org>
In-Reply-To: <20240607145148.2246990-1-adeep@lexina.in>
References: <20240607145148.2246990-1-adeep@lexina.in>
Message-Id: <171804879810.2984676.7472745438656826180.robh@kernel.org>
Subject: Re: [PATCH v1 0/2] arm64: meson: add support for JetHome JetHub D2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_125515_736528_BEB8DED9 
X-CRM114-Status: GOOD (  13.25  )
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


On Fri, 07 Jun 2024 17:50:02 +0300, Viacheslav Bocharov wrote:
> Add support for new controller.
> JetHome Jethub D2 (j200) is a home automation controller with the following
> features:
>   - DIN Rail Mounting
>   - Amlogic S905X3 (ARM Cortex-A55) quad-core
>   - micro-HDMI video out
>   - 4GB LPDDR4
>   - 32GB eMMC flash
>   - 1 x USB 2.0
>   - 1 x 10/100/1000Mbps ethernet
>   - two module slots for radio/wire interface cards
>   - 2 x gpio LEDS
>   - 1 x 1-Wire
>   - 1 x RS-485
>   - 3 x dry contact digital GPIO inputs
>   - 2 x relay GPIO outputs
>   - DC 9-36V power source with battery UPS on board option
> 
> Viacheslav Bocharov (2):
>   dt-bindings: arm: amlogic: add binding for JetHome JetHub D2
>   arm64: dts: meson-axg: add support for JetHome JetHub D2 (j200)
> 
>  .../devicetree/bindings/arm/amlogic.yaml      |   1 +
>  arch/arm64/boot/dts/amlogic/Makefile          |   1 +
>  .../amlogic/meson-sm1-jethome-jethub-j200.dts | 614 ++++++++++++++++++
>  3 files changed, 616 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/amlogic/meson-sm1-jethome-jethub-j200.dts
> 
> 
> base-commit: 32f88d65f01bf6f45476d7edbe675e44fb9e1d58
> --
> 2.45.2
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


New warnings running 'make CHECK_DTBS=y amlogic/meson-sm1-jethome-jethub-j200.dtb' for 20240607145148.2246990-1-adeep@lexina.in:

arch/arm64/boot/dts/amlogic/meson-sm1-jethome-jethub-j200.dtb: /soc/bus@ff600000/bus@60000/clock-controller@0: failed to match any schema with compatible: ['amlogic,sm1-audio-clkc']
arch/arm64/boot/dts/amlogic/meson-sm1-jethome-jethub-j200.dtb: audio-controller@300: compatible: ['amlogic,sm1-tdmin', 'amlogic,axg-tdmin'] is too long
	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-formatters.yaml#
arch/arm64/boot/dts/amlogic/meson-sm1-jethome-jethub-j200.dtb: audio-controller@340: compatible: ['amlogic,sm1-tdmin', 'amlogic,axg-tdmin'] is too long
	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-formatters.yaml#
arch/arm64/boot/dts/amlogic/meson-sm1-jethome-jethub-j200.dtb: audio-controller@380: compatible: ['amlogic,sm1-tdmin', 'amlogic,axg-tdmin'] is too long
	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-formatters.yaml#
arch/arm64/boot/dts/amlogic/meson-sm1-jethome-jethub-j200.dtb: audio-controller@3c0: compatible: ['amlogic,sm1-tdmin', 'amlogic,axg-tdmin'] is too long
	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-formatters.yaml#
arch/arm64/boot/dts/amlogic/meson-sm1-jethome-jethub-j200.dtb: sys-ctrl@0: '#address-cells', '#size-cells', 'ranges' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml#
arch/arm64/boot/dts/amlogic/meson-sm1-jethome-jethub-j200.dtb: audio-controller-0: clock-names:0: 'sclk' was expected
	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
arch/arm64/boot/dts/amlogic/meson-sm1-jethome-jethub-j200.dtb: audio-controller-0: clock-names:1: 'lrclk' was expected
	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
arch/arm64/boot/dts/amlogic/meson-sm1-jethome-jethub-j200.dtb: audio-controller-0: clock-names:2: 'mclk' was expected
	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
arch/arm64/boot/dts/amlogic/meson-sm1-jethome-jethub-j200.dtb: audio-controller-1: clock-names:0: 'sclk' was expected
	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
arch/arm64/boot/dts/amlogic/meson-sm1-jethome-jethub-j200.dtb: audio-controller-1: clock-names:1: 'lrclk' was expected
	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
arch/arm64/boot/dts/amlogic/meson-sm1-jethome-jethub-j200.dtb: audio-controller-1: clock-names:2: 'mclk' was expected
	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
arch/arm64/boot/dts/amlogic/meson-sm1-jethome-jethub-j200.dtb: audio-controller-1: Unevaluated properties are not allowed ('clock-names' was unexpected)
	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
arch/arm64/boot/dts/amlogic/meson-sm1-jethome-jethub-j200.dtb: audio-controller-2: clock-names:0: 'sclk' was expected
	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
arch/arm64/boot/dts/amlogic/meson-sm1-jethome-jethub-j200.dtb: audio-controller-2: clock-names:1: 'lrclk' was expected
	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
arch/arm64/boot/dts/amlogic/meson-sm1-jethome-jethub-j200.dtb: audio-controller-2: clock-names:2: 'mclk' was expected
	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
arch/arm64/boot/dts/amlogic/meson-sm1-jethome-jethub-j200.dtb: sound: Unevaluated properties are not allowed ('assigned-clock-parents', 'assigned-clock-rates', 'assigned-clocks' were unexpected)
	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-sound-card.yaml#
arch/arm64/boot/dts/amlogic/meson-sm1-jethome-jethub-j200.dtb: sound: 'anyOf' conditional failed, one must be fixed:
	'clocks' is a required property
	'#clock-cells' is a required property
	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#






_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
