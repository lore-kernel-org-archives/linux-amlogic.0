Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89525C3DA45
	for <linux-amlogic@archiver.kernel.org>; Thu, 11 Jul 2024 14:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=EIESNrS3syD3XOFJaN8eK9nrHVE7enA3oy184SsGfOk=; b=fZC7KAyt4g2ut7nQpBF8H8RUTX
	fItimmgAgkWSgQbdgA+zSFje6JwUsKwkDZOVPY0zEQDGP1gjxuC2fXtayvUBfm+Jp+Yg0LfF5+N1q
	Uzbw8zPlXii/SuMEApDb/tNUfyMFg4hoA9VtneZXUX1eyM9wjseEq60tOdtwo5qNRwVRwsbJpSKgK
	vhpBG8DVazhiO64nFBs909/P2tSByXNGn6AgLGxGSTMtDAeYz1dmIfTAWc3T0sOA/ZdRY5xJRJwh/
	B68nEh7IsKB5g+IRYJSc6V8n8A07XGyuoiFt+KxC0qMb7nFxuclpvKRDWpQpfZ+rvYxCv2oz4aYec
	6V4Vs1Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRuf7-0000000EK1z-14oH;
	Thu, 11 Jul 2024 14:20:45 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRueq-0000000EJuO-0XDM
	for linux-amlogic@lists.infradead.org;
	Thu, 11 Jul 2024 14:20:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4609B61D42;
	Thu, 11 Jul 2024 14:20:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3F27C32782;
	Thu, 11 Jul 2024 14:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720707626;
	bh=LxCPWPJanWr/40VyavUDIHFEM0JdUXOwGJhBB9Uep5M=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=k0HaH+4geE4rWD/6MijnWVcjEwSh5c7/KE66gmGemghUNUVRRfl3UJo/ElZZPHbO8
	 3K31cPYXHQzWjBkDGgPfbZ4VERdXjFS6+vt4FuX9UyZt1cM/OW6ECwbFlynKXLAk52
	 JBqZedJRpOLjU/g97Px5E8hkYuVbImty0SENF5duTgVDCdN5f/wCuIjiO1mUJHlXqK
	 q9ddzopV7GDzWAxTvQH+zjM1Z/O15a9S9oRz3z3cGiFZlF1Iq7u35xbtf0hCDXlNhH
	 tTQSBsX7zeC3kKxgKmkH1TsmzdPrq05sZAyT78nYutDb+gF93nCkBTo8UEiOyCXX8u
	 fIVgCFVEt1UwQ==
Date: Thu, 11 Jul 2024 08:20:25 -0600
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: FUKAUMI Naoki <naoki@radxa.com>
Cc: khilman@baylibre.com, devicetree@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, martin.blumenstingl@googlemail.com, 
 krzk+dt@kernel.org, neil.armstrong@linaro.org, jbrunet@baylibre.com, 
 conor+dt@kernel.org
In-Reply-To: <20240711034035.3921122-1-naoki@radxa.com>
References: <20240711034035.3921122-1-naoki@radxa.com>
Message-Id: <172070684786.2129336.9140137087518774504.robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: arm: amlogic: change product name for
 Radxa ZERO 2 (Pro)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240711_072028_273761_B2B7280C 
X-CRM114-Status: GOOD (  11.60  )
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


On Thu, 11 Jul 2024 12:40:34 +0900, FUKAUMI Naoki wrote:
> a while ago, we changed product name (hardware is same),
> 
> from: Radxa ZERO2
>   to: Radxa ZERO 2 Pro
> 
> this patch reflect the change in dt-bindings.
> 
> Signed-off-by: FUKAUMI Naoki <naoki@radxa.com>
> ---
>  Documentation/devicetree/bindings/arm/amlogic.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
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


New warnings running 'make CHECK_DTBS=y amlogic/meson-g12b-radxa-zero-2pro.dtb' for 20240711034035.3921122-1-naoki@radxa.com:

arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero-2pro.dtb: sound: Unevaluated properties are not allowed ('assigned-clock-parents', 'assigned-clock-rates', 'assigned-clocks' were unexpected)
	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-sound-card.yaml#
arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero-2pro.dtb: sound: 'anyOf' conditional failed, one must be fixed:
	'clocks' is a required property
	'#clock-cells' is a required property
	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#






_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
