Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE26BC6FA8F
	for <linux-amlogic@archiver.kernel.org>; Wed, 30 Aug 2023 17:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:From:To
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Gp5Xi1InymiGcSpqyDEPwVqqS4A/KW7LqDEhBGDQLAE=; b=plBa14Byf/ekJJ
	Za4hUOHj2kqnn+cJGxHg+apxDENomk39hBezeQe3EAv+9FdpQ8bFVaunTl/wbM+DqEKi06LvofetC
	rK5eK/dqW1ARU9S/T7gt6t2JlTrQ6g2u5X+bzFjb2Ci/U1xkYREwMulUDmCumP/2JtkCG22Nafg4U
	rbJjjQ/WtrNOxTmXzu9p5REY1rRaMAmw6dRfs9bkYJcj1M+1fEy29vy7oBggyAkI5mi5ziFdcJCif
	0YYHoe5qc6Ng4xkTJB+vtHVpyF9js2sqPrKbrDa77zSKTyzbmBB/0nXT6mqU7Kl2DsEZYA6KTUuX8
	j5FJJWFoSTgZatvK5R/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbPRa-00DwJq-36;
	Wed, 30 Aug 2023 17:57:30 +0000
Received: from mail-4319.protonmail.ch ([185.70.43.19])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbPNw-00Dvx1-1l
	for linux-amlogic@lists.infradead.org;
	Wed, 30 Aug 2023 17:53:46 +0000
Date: Wed, 30 Aug 2023 17:53:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1693418018; x=1693677218;
	bh=gaG7VuiuzeBoCrlddmGSrxFjPIdkHsg1kk6y2rsdpJ8=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=FHhphKz1hvI2qBXyszqDvoXPPB4cvftqd74i4Btt93ojsZC+OUHQ8YjLHe+ONSE3z
	 fA1j6Eb5XlkKptW57MtE141YMNjrbQyIKE+BbtdQA/13zqL10UzIVJvbkchbpUqUZt
	 00QmdfcpBcJAAFXmd8Hjbv/bkWkxEnEbExXYa27Jx+B5ELSLmN641hZmhjHPFE0gQF
	 U2hihEGaOIpS30XiFjYAAcO18KFNuZYbdirk77kETCAvbdYWxGvMVvAOyV2DpfJRfh
	 ZYmxLTJ+UN3KorQ2MFTlQ3QwI0bvHG9Ffr3fqo11HtGo/Mb/vKd1Xi4+uP754zatX7
	 1MVGp03ggC8Xg==
To: sjg@chromium.org
From: Ferass El Hafidi <vitali64pmemail@protonmail.com>
Subject: Re: [PATCH v2 0/1] meson: Demonstration of using binman to produce the image
Message-ID: <CV61D7ULLVZ0.3OCFZ743L1KSE@flaptop>
Feedback-ID: 37421466:user:proton
MIME-Version: 1.0
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230830_105344_768333_6BD0889B 
X-CRM114-Status: GOOD (  10.13  )
X-Mailman-Approved-At: Wed, 30 Aug 2023 10:57:29 -0700
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
Cc: neil.armstrong@linaro.org, u-boot-amlogic@groups.io, u-boot@lists.denx.de, alpernebiyasak@gmail.com, linux-amlogic@lists.infradead.org, mark.kettenis@xs4all.nl
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Simon,

> So I wonder how best to move this forward so that we can build things
> using binman and everything works?

It's still not ready yet, but I'm working on porting U-Boot SPL to some
Amlogic SoCs [1]. I'm currently working on Amlogic S905 boards, but
eventually I'll work on Amlogic S905X devices too. And speaking of
signing, Jonas Karlman wrote amlimage, and integrated it into mkimage, 
and I applied his patch to my tree. There's a few things to be aware of 
about Amlogic signing and binaries in general, however.

amlimage was intended for use with U-Boot SPL, which obviously has 
no support for Amlogic's FIP format and as such amlimage will only do as 
little as possible to get the bootROM to load U-Boot SPL. Most of the 
packaging format is handled by BL2. The fact that the signing process is
completly different across SoC generations makes it difficult to
implement them all into one single tool (and by which I mean all of it,
not just signing BL2 for the bootROM to run it, that's mostly the same
across SoCs). amlimage has been confirmed to work on GXBB (ODROID-C2 and
the KII Pro set-top box), GXL (librecomputer lepotato), and SM1 (ODROID-C4).

My U-Boot SPL port is still rather incomplete. As of today, it still
can't boot anything from any storage device. The goal eventually is to
be able to load upstream TF-A BL31 and U-Boot+linux.

While Amlogic distributes proprietary BL31 binaries upstream Trusted 
Firmware-A has a port for some Amlogic SoCs [2], but as far as I know 
SM1 (which is the SoC generation your ODROID-C4 is using) is still
unsupported. GXBB, GXL, AXG, and G12A are all supported however, but the
overall port still lacks some features the proprietary implementation
has.

As for the SCP firmware (aka. BL30) I'm not aware of any
reverse-engineering efforts for that.

Honestly, in my opinion, including proprietary and poorly-written 
Amlogic utilities lacking a proper license, into U-Boot looks like a bad idea.

[1]: https://git.vitali64.duckdns.org/misc/u-boot-kii-pro.git/log/?h=wip/spl
[2]: https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git/tree/plat/amlogic

Cheers.


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
