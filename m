Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A50DC19F2D
	for <linux-amlogic@archiver.kernel.org>; Tue,  9 Aug 2022 15:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pHINeKaDmjclyH9WSQ9eoTEQ+BVq+wu4ZDRPbCduR+8=; b=P1HlD2mc5q5Vb91BapHsf9olWs
	PkMGp1SkmzXuhPqTT59KEck5B3RiB4xzHc9LiL8oHz3X7gVNRYw9Ss7Le0UfPVVULicl61I1eQASm
	5YKRILWQv6TKqPbZywNZwbxbROYArxlnWnl4iA0wzbejcqomG8zRQPkpl+bqQWOGpZcydFccDRKyu
	etbk6nznG/hq6GfEYulXLNlz4aN3RTpgSRDa+53tC2kz+apA25Cz2e7tQBWEiLvxMSdIV6B4UThiZ
	jz3RzJZN8KBfQ8fIHhPP908A5QBODQLgQ1BpNgXQ5QMj3fW+Lw/p0uPQhhQ5JvbGKrD3M5Xs0Y302
	3noX98iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLR8u-004dD5-AG; Tue, 09 Aug 2022 15:27:40 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLR8r-004dAb-CL; Tue, 09 Aug 2022 15:27:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 52CB8611E6;
	Tue,  9 Aug 2022 15:27:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F63AC433D7;
	Tue,  9 Aug 2022 15:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660058855;
	bh=fQ1vxx5hvw6lsWVefkUSI+jjDL0i6RgRtYeopmp59/c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XEnCGY9pciB+LdPdZXSY7FDJxCstebFVLJ4fGtjOLqcMK1FqJZFbkocRuXjrstDTC
	 NtsI27Wrp/hcva7bVxlFQ0tsVd19dN4bIdo0O7BOo4nLmj2PeDDD62jgtVF5AhLFlt
	 OP8ze/pzfmUui6nnuSM07hjug7DdXkM6MBxxPasRfgaBOo3YLBNCQP6OxAJamiKU67
	 dIvyIV5Ug9MBWPLdqoUVr9YASK3N8nEwLuLNgqAayiPYtyXVinMXS2vKz0DhDfGu4X
	 GweuxDWrw09R9PoZ7U9fKl5wBGw4CY/Ryw2A5cyRmLfurwLQuWsp45cU8EWmlBbw7P
	 6M2eFOnGYudfw==
Date: Tue, 9 Aug 2022 16:27:30 +0100
From: Mark Brown <broonie@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	Da Xue <da@libre.computer>
Subject: Re: [PATCH] spi: meson-spicc: save pow2 datarate between messages
Message-ID: <YvJ84qkuXdvVgXRm@sirena.org.uk>
References: <20220809152019.461741-1-narmstrong@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <20220809152019.461741-1-narmstrong@baylibre.com>
X-Cookie: A nuclear war can ruin your whole day.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220809_082737_493370_14C4EF99 
X-CRM114-Status: GOOD (  16.18  )
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
Content-Type: multipart/mixed; boundary="===============0862128172293270509=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============0862128172293270509==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lBVgeDOGXQW0ujkF"
Content-Disposition: inline


--lBVgeDOGXQW0ujkF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 09, 2022 at 05:20:19PM +0200, Neil Armstrong wrote:
> At the end of a message, the HW gets a reset in meson_spicc_unprepare_transfer(),
> this resets the SPICC_CONREG register and notably the value set by the
> Common Clock Framework.

> This saves the datarate dividor value between message to keep the last
> set value by the Common Clock Framework.

When you say the value set by the clock framework does that mean that
the clock driver is adjusting hardware inside the SPI controller IP
block which is then getting reset by the SPI driver without the SPI
driver knowing about it?  That seems like a bad idea as you're finding
here.

> This didn't appear before commit 3e0cf4d3fc29 ("spi: meson-spicc: add a linear clock divider support")
> because we recalculated and wrote the rate for each xfer.

Note that the rate might change per transfer.

--lBVgeDOGXQW0ujkF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLyfOIACgkQJNaLcl1U
h9Awagf+OUcsezR87epB5sRf0iUOehYNcaHJv9CU74vZ9hdz23rciUwHLGp+gGaO
6VTnFgYp20wC+Zxy/W0fT6WgbqQ9D+RujmabrST1jgVFd/ml24q/qCE7YL/GZ1pj
Z7GGoe9GmrfRFUW7zRmKMrQsOFQtxXsZSR0rM8iMHlPm9lI8pVEBDY1AI1TFPL+0
U0ncLcbJ0pibxGz2cboKDEfRoU5OJu8a0F9EBJ4OVJeI+XgjEiRounhW+g9E1rc2
8XOrwsOdwFkRckIzeZqAuAECA4px79Fj24pJObWousC7M3x+1VkctwWe8SZHAUjq
+FI09JvFwqg6AThV8fUxh5x8xxS/MA==
=yNF+
-----END PGP SIGNATURE-----

--lBVgeDOGXQW0ujkF--


--===============0862128172293270509==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============0862128172293270509==--

