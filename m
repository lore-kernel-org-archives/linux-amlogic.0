Return-Path: <SRS0=B/3x=JU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A775FC433ED
	for <linux-amlogic@archiver.kernel.org>; Fri, 23 Apr 2021 11:48:22 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C24E613AF
	for <linux-amlogic@archiver.kernel.org>; Fri, 23 Apr 2021 11:48:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C24E613AF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qpu2iVpGcBRiPMLiAWoT+rIHp4K9O9Q/2V2VaWL0T2w=; b=iKGzCMvGgbg6aK3xtB2pXimPy
	Ckr9kLS+wb47NUwIC4QotM+aL65hXkBM0EUtpIcag53r+XfEUTRAFuuXqQkjh9ARlY0hPxsaWZUYL
	CRyke7N2QuMWTOEWCISDpEddwAxU7XupIdfs1NSNP7xVwLIsRhTcmcWjIn85Gah3Dt5cdFtw+1kAc
	rlPQTS7Xhkd3YCOgC1ChKaDXg1/TBZTK/L3vY7WeECiN04uqX1c1557ZuHz7+e9IfySXxjsuYxy7S
	Pzp9kOse3eOd3LvLBnBygsMOng/ZHhFz1KKR5Oaih5/X6tQkP8ZKippQz4rol6Z04rwZKyhDtLYo9
	MeHemkS1A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZuIB-001OEL-Te; Fri, 23 Apr 2021 11:48:16 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZuI2-001ODl-QH; Fri, 23 Apr 2021 11:48:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=CW3Uq6Pdmd7FaILHK6Yr9b7m9abU7V26b/ZqurukDMk=; b=fksNYM+M6aZupcCJ8cUqw1wsSE
 xjOJYiRNq7/io4wZheGkCFALhFSu22TjX44d/YWxZd+Z70ZWvHB6Ze6fysMreiT8pE7TXl6UoS3rW
 Mf5Ng/IHZkPC3QeFxCGKzU8pXk6hwkHQbGW9SgY48AN7Umzmn0SzL13c8m01byv8QdtUiBotaPwdN
 yFPjFRV+0zxrpUJBFaDqgHmw9aU+IGTf/9bfaYmQX/YQM2u9C441T0U+i1qvxQ0/hLUUtqJCxsFBH
 cAbU7F4/wns9R1RVKEfv+XafYu8yTRrnfQOh/ewJcY48TrwHVbzKZQ4+v1VPzLQSeuGLH3uFL3H+F
 bUZs9rmg==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZuI0-00ENBw-ER; Fri, 23 Apr 2021 11:48:05 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 760D86144D;
 Fri, 23 Apr 2021 11:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619178484;
 bh=Nso+Npc+3ue078XmTC6Z8rq554dlaIy0y0IZvc0L4j0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YgrhGeDWQKDwDgzc0U2oo8W0xIXto5ga2sHax46ojxl9XfDadv1hoilzWHf31hy/a
 xkLmuksSJ6XrwYcyuOD+SYMirF10GO5vlvm+G2rHAL8fxhtkeCT3ImmsMb3r5zvxdD
 nOUOF+LBuBWBOcU090MKOwS7kzhDWv0RhtXAHX5o6Mq3rTirfpRN3SR1Un7PcTHhh5
 yEH9o7OrhS/2Vq5OcKQr7OnUf8hwHB0yRF5OZnxMA/+IOUAYiczj+9hHoPFIDB9Yrw
 Yyu5mubFhx9y3GNT5UuG7CGYpYGvskajIn9kq6gybJuO48AqDQYFNNIL8ErFXsz+Sa
 W0R4winzEm41w==
Date: Fri, 23 Apr 2021 12:47:35 +0100
From: Mark Brown <broonie@kernel.org>
To: Artem Lapkin <email2tema@gmail.com>
Cc: narmstrong@baylibre.com, khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, dri-devel@lists.freedesktop.org,
 linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 christianshewitt@gmail.com, art@khadas.com, nick@khadas.com,
 gouwa@khadas.com
Subject: Re: [PATCH] SPI: meson-spifc add missed calls to remove function
Message-ID: <20210423114735.GA5507@sirena.org.uk>
References: <20210423034247.992052-1-art@khadas.com>
MIME-Version: 1.0
In-Reply-To: <20210423034247.992052-1-art@khadas.com>
X-Cookie: This is now.  Later is later.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210423_044804_538259_9DED211E 
X-CRM114-Status: GOOD (  11.85  )
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
Content-Type: multipart/mixed; boundary="===============6779205214524182673=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============6779205214524182673==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wac7ysb48OaltWcw"
Content-Disposition: inline


--wac7ysb48OaltWcw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 23, 2021 at 11:42:47AM +0800, Artem Lapkin wrote:
> Problem: rmmod meson_gx_mmc - not stable without spi_master_suspend call
> and we can get stuck when try unload this module

> +++ b/drivers/spi/spi-meson-spifc.c
> @@ -359,6 +359,7 @@ static int meson_spifc_remove(struct platform_device =
*pdev)
>  	struct spi_master *master =3D platform_get_drvdata(pdev);
>  	struct meson_spifc *spifc =3D spi_master_get_devdata(master);
> =20
> +	spi_master_suspend(master);
>  	pm_runtime_get_sync(&pdev->dev);
>  	clk_disable_unprepare(spifc->clk);
>  	pm_runtime_disable(&pdev->dev);

I would expect the driver to unregister the controller at the start of
the remove function, suspend doesn't really make sense here.

--wac7ysb48OaltWcw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmCCs9YACgkQJNaLcl1U
h9AxQgf+NlVIXfo4DOWLGzUTZV9JpnM/W5ePWMfS5eiwLH2U4IkyBKd4pMwv590c
P2VHkZMC+XNYg+5Awbqpx8ayhuD4qbKspg+px/r6HrJ0pdXL6hIKfQ5nx3yWn41w
TSkY44nLWNKrKMWJo3moixzryzv+vVAXkaNYpNi5gRijEZnpLE4LbZihh0d6bIja
uSKmBE0Q9KuXo83ENaVGjPofkSVrdHovWQb4cC7NnKqi6JX0/9ZqYEMX7FAxgh0p
3ewJqVtXwbfapK2FwhufuRpwaMKN7cCMqqf0GAdLIDZ+jp4p2NsWjv9syeaQ6R5U
yjmI4PA1Le3oAZFmU6ZMcsDP68YaLw==
=AYVf
-----END PGP SIGNATURE-----

--wac7ysb48OaltWcw--


--===============6779205214524182673==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============6779205214524182673==--

