Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55335C8303C
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Jul 2025 13:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pcxq2S5GAEfMVQ1lFFTqmYS8QJZ2GFIhW8K9NkjziYs=; b=1q7B2KxeJUH8bMagP0lH6TQsTQ
	PU9Jf7o2TTbG7YJUOCEzrhBc3430HQXorkZ5PnMAoiYNNFYP1YgqSiFCfCZOT7e2VQlv5dF7Clekj
	Yxb1WNGWyUqirJy50hpQFoALFdAwexatYlnFowEyqPv4pU+zsq21mK7MhoF+gAdi7dqmnY03fpccS
	p7Was4wlrRSeW/q9soOEWFhWDwvOtf8wPwCam8H/6eezDF8jfPVdwMQgbvevhsTkUcAC9eiGEqPc/
	laqoTZzQzN9hYLwqmjdQV1+EagI0clLdsaunnEbmqqhLVbua1yXTa6KqM/M5DHCAB901H89Dsnezq
	ONtS4+/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ8i6-00000005UEq-03re;
	Tue, 08 Jul 2025 13:50:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ8i4-00000005UES-3YxQ
	for linux-amlogic@lists.infradead.org;
	Tue, 08 Jul 2025 13:50:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DFFA7613AD;
	Tue,  8 Jul 2025 13:50:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF68DC4CEEF;
	Tue,  8 Jul 2025 13:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751982611;
	bh=29g+uhpj2QzdZ423+An5/+0mpgfq6lvJTx/RgRs9JIY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CGDdLBPziNsNLj2//q2YZHfQEIKfINZQtkKL3CD9FUYVTmjnu/BVwx1YODx3LSe66
	 JMGISY2VmKWjNHZCnEGjsecJ1gFTqM/2PZpFz9P1Uj0y2nNUXfvsfTDTVgFCBiFel/
	 GiDnG0aaryHhiCELTDUsq3c23EO7MSDt9pKHdtssJpcXbYIVMGoXWZ9tfi9xErRoKB
	 bVcUH4CMDl8yIhNe40PTJqHvOXMJr4C8YgmBbrbrW8QaofqrnXY5Y/TvssOK81x5GP
	 xPss8tOHNBhUtwKLxBhSZEcuY2RV9ImO4Jytft4x9a5wezJZS/uTmusTopAXsDxFID
	 S1Fwhnc6M86lA==
Date: Tue, 8 Jul 2025 14:50:08 +0100
From: Mark Brown <broonie@kernel.org>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Sunny Luo <sunny.luo@amlogic.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-amlogic@lists.infradead.org, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/3] spi: Add Amlogic SPISG driver
Message-ID: <aG0hU5nbjLjTWS6p@finisterre.sirena.org.uk>
References: <20250704-spisg-v4-0-6b731dfbe610@amlogic.com>
 <20250704-spisg-v4-2-6b731dfbe610@amlogic.com>
 <3ac88119-9980-42df-9e1c-c0ec30bbaadd@sirena.org.uk>
 <55ecc836-7fed-44d5-aa4b-94bc17894ef0@amlogic.com>
MIME-Version: 1.0
In-Reply-To: <55ecc836-7fed-44d5-aa4b-94bc17894ef0@amlogic.com>
X-Cookie: Do not cut switchbacks.
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
Content-Type: multipart/mixed; boundary="===============2884625546823892823=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============2884625546823892823==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WrWFthDkvK4JeMBC"
Content-Disposition: inline


--WrWFthDkvK4JeMBC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 08, 2025 at 06:34:02PM +0800, Xianwei Zhao wrote:
> On 2025/7/7 21:05, Mark Brown wrote:

> > Is it worth having a copybreak such that smaller transfers are done
> > using PIO?  With a lot of controllers that increases performance due to
> > the extra overhead of setting up DMA, talking to the DMA and interrupt
> > controllers can be as expensive as directly accessing the FIFOs.

> If the data volume of a single transfer (xfer) is small, PIO mode does offer
> some advantages. However, since PIO requires the CPU to wait in a busy loop
> for the transfer to complete, it continuously occupies CPU resources. As a
> result, its advantages are not particularly significant.

The CPU overhead tends to be higher (you can avoid some of it with a
dead reckoning sleep), but the latency vastly improved which for many
applications is a worthwhile advantage.  It tends to be things like
accesses to one or two registers on a device with registers where this
wins, 16 bytes or lower would be a common number off the top of my head.

> If PIO is to be implemented, it can only handle one transfer at a time (via
> transfer_one), and not entire messages (which consist of multiple
> transfers). In contrast, when processing messages, the SPI controller can
> handle the entire sequence in one go, which also provides certain benefits.

It's probably worth adding something to the framework to be able to take
a decision at the message level, for writes this tends to all fall out
naturally since the write will tend to be a single transfer anyway.

--WrWFthDkvK4JeMBC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhtIhAACgkQJNaLcl1U
h9ANKAf/TOPGLrepxVdVEdgQXME4De4Z1WJWC5NPGi72O7c3tqTcPlr7JVtjPorg
OSsLf4N4B8tjQZy/HHdpY7B1CgmiRU2EHrkGj0nJhJy2/HWG++cjbEOXp2IYvgbz
5OPv+8spjS8A3WipQLKHGelthRYC/vFjPmQ6AgYJvy0fhXrg32z99mtvz0+qY4+D
LxJxMX44/4sD7ODMSe39XOjNvEfJ1a1MRZqPehGdvh05H0D9qzaNiYUEpXBj2yQa
Rvtb3EmoXCMJR/1dXbXmVtIVnO5+rKOUHEU0eV8Payk2wldyYox43oPWkF6dj/5L
o/cQvnwE35OoA2dfZrIm0korHc8asA==
=3T3v
-----END PGP SIGNATURE-----

--WrWFthDkvK4JeMBC--


--===============2884625546823892823==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============2884625546823892823==--

