Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4689AC25B78
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Jun 2024 15:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=wCQVMJ55fg+dpaTYxZAMkGAaivuWCkqNgxxQ2MbqIZQ=; b=ePZPURmClOkVYl9pn/FI1Mw/1A
	VittXoNNMgS8ROc82sNWArTXLsGn1H7KR1bXjrkBfznnjrvUiEUMsYn/UEIZtfOUsxARPgk9w7v5p
	9xADbX/MagNj90m8wuUDKFLt2cnqtcnu/rXArDNpcSyx6M9g/uaWTmbK+GhKT7o/YJ1YPaxx3JXoK
	j1S3MXtXjdihuX3s3tOlHLk265yGlCniNZe91A2WBxJvnqAE+EZpu06ar2RRjgwuLEnReU8H5N3Su
	yNo/FMxFI3ztpU7FzguOd90LRhCCRPYNVdIwll0Phykjl1GFr8uUdHNVjupJuKDwfgFRtkQVEc3fK
	C8cKDNvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEW5w-00000002uxh-0uJU;
	Tue, 04 Jun 2024 15:29:04 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEW5s-00000002uuO-2Bky;
	Tue, 04 Jun 2024 15:29:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C995CCE11E3;
	Tue,  4 Jun 2024 15:28:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C879DC4AF07;
	Tue,  4 Jun 2024 15:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717514938;
	bh=aXE8gOS2TuQOrCEK4qKB62qDKs93x0nvxlcAsf6CsQg=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=mb5BLESp0dCeu1l4lVu/jtlOXaoiG+X9Tk0jKTHIF6aArnOo3vs/aI0TzWnuFLjm4
	 3FcGMhI6J8BByrzvmX1srj1un0RRU32bHH98btU7RE6VuaTjUlHn6rX3AVGQDp0f07
	 PcRZPf6LcwRVxeMWona4WjGK/KYmo7P7OZujTmcjdDjayNyIPSbDZtvdHp3vdD6Drp
	 y/2ZxIIWDk4ALp26sV/jBA4dxnm10tBd3oUCRpzKtb4mzECWgUGKW72zdEIbjT/lkW
	 oQePp8Vjruy7WoeARDGBtalzZw6aD9fGOgSulDnRu0n8tpv7TRBrWauD1mi9q4aUvq
	 7ykG8peR3pbhQ==
Date: Tue, 04 Jun 2024 10:28:55 -0500
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Christian Hewitt <christianshewitt@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 linux-amlogic@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>
In-Reply-To: <20240604084134.3315841-1-christianshewitt@gmail.com>
References: <20240604084134.3315841-1-christianshewitt@gmail.com>
Message-Id: <171751454959.786114.9525171695833472350.robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: arm: amlogic: add GXLX/S905L/p271
 reference board
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_082900_894200_9F889CC2 
X-CRM114-Status: GOOD (  11.94  )
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


On Tue, 04 Jun 2024 08:41:33 +0000, Christian Hewitt wrote:
> Add support for an Amlogic GXLX based S905L SoC and P271 reference
> design board. The S905L is a low-cost design similar to the P281
> (S905W) and is similarly derived from P212 (S905X). However S905L
> omits support for the VP9 codec and uses Mali 450-MP2 (not MP3).
> 
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/amlogic.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
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


New warnings running 'make CHECK_DTBS=y amlogic/meson-gxlx-s905l-p271.dtb' for 20240604084134.3315841-1-christianshewitt@gmail.com:

arch/arm64/boot/dts/amlogic/meson-gxlx-s905l-p271.dtb: /soc/bus@c1100000/adc@8680: failed to match any schema with compatible: ['amlogic,meson-gxlx-saradc', 'amlogic,meson-saradc']
arch/arm64/boot/dts/amlogic/meson-gxlx-s905l-p271.dtb: /soc/video-codec@c8820000: failed to match any schema with compatible: ['amlogic,gxlx-vdec', 'amlogic,gx-vdec']
arch/arm64/boot/dts/amlogic/meson-gxlx-s905l-p271.dtb: sound: Unevaluated properties are not allowed ('assigned-clock-parents', 'assigned-clock-rates', 'assigned-clocks' were unexpected)
	from schema $id: http://devicetree.org/schemas/sound/amlogic,gx-sound-card.yaml#
arch/arm64/boot/dts/amlogic/meson-gxlx-s905l-p271.dtb: sound: 'anyOf' conditional failed, one must be fixed:
	'clocks' is a required property
	'#clock-cells' is a required property
	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#






_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
