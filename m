Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D8A7C35274
	for <linux-amlogic@archiver.kernel.org>; Thu, 21 Dec 2023 09:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2cc7YVoeoBF620nFNnHgP5LLxyVtpA/pyJSAilS13Qg=; b=clfunXnf9f0phM+0ctZigf2dGC
	juye5ooA6FGLJKWJUBO+ESi0jOIRbPV6Osnse7NMRs6tuQWU3m3BtOLO0n4sfv5du/5GhT7w6WjjI
	b/jquCHFGGuuwJV44z/Z72UmAv2QX475lhfBU/1zDo3tX+RE6cLNwIeNA7ggxDRar8st7yOWj/+vc
	zaKJwd0DoKRRaXZOUnGHCindlFIJ9zVZZ+EOH68++2QyyusVIWqTsI7oSFSSOX/JOxjnc9wy6Ifnu
	VhAVnXR29FWGvU54OJTGZem/ump6HhEWjr0zhY28L0Fj8go5lcV7sYW+zXdXtve5FysU6g3JijZcK
	cBIYxcwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGFo2-002MFu-1J;
	Thu, 21 Dec 2023 09:57:30 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGFnz-002MEs-33;
	Thu, 21 Dec 2023 09:57:29 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-50e2d00f99cso743019e87.0;
        Thu, 21 Dec 2023 01:57:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703152645; x=1703757445; darn=lists.infradead.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=czNdiwtjM+Bf3wxnWNI65fEHbodGPjXoLCSns14aIQM=;
        b=Sir7jj7kA3hFCWNw5u/EcIAMFeEpeeMiP3AoxHXksV5AdGb1RgIJMcuXgOhuwHKT2J
         EnGMCpAYDoJ463VKIh6p7iQmaLj9jmUorQSCRcN88Ie8/uYMFsDqPqS5Xy/HuR5W8LrI
         6kIRlYNnEcwQ5MljzFawilXFZoredwogTGVdbT+m2vsDmE/S0/7Fras9tR40dsTK3GeP
         VKTenASA5Ca7U1x1bL/4xRM0D71vN7F94fkB4L0KhBvs8kAkMjVWi7674qzGvkC+FQ3g
         mGOp+NMA7qqIf0q3nQboz4tjMrvMe5l3dYnItJ/tcBLdCVxbcmwJLr4C3F6JMow+UChx
         Tj5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703152645; x=1703757445;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=czNdiwtjM+Bf3wxnWNI65fEHbodGPjXoLCSns14aIQM=;
        b=tpv/j610U5YIoIz6oYI53SaRZkGFFvg2bMiLpexv8TJiKrKWCE35jntFBFngNO57mD
         1MoI4rHY/xa/tTjjbQGVpVn3UkOsaL3FVta2zy0KHs1YbzB6BekoqhdFdzhnDxsO+CMi
         ZewWGlbXrF0kC4DApJLepLElWUfqazjj0GpdKk51wHi+N/xGVnMV7nuXpxF9uCvqJB5z
         LDj36OV/nTwQW/J3J9dmP8HI/+cpuKSn0qjWOZJyW9XXmguVTRe11lCpGrVTtAw3U15i
         iC/9TqrrHj8ZdD7a2TaQv14KlIi4OWL0Ir8fxeauShmROrbg+INu2AWTs61gH6lQfk7K
         ossQ==
X-Gm-Message-State: AOJu0Yy/6R8+kAVa+MIXlgjI7DeESNPrJ/3kQjyJJPZvNJ7LinnkM5YT
	eBWNwNBPg595R+7vaNowjqk=
X-Google-Smtp-Source: AGHT+IEBLTiON+N2o0ZM18qKYqb279iJAAAWZJb3MkxNoSZ4VkOf1WKVYg2cLN90TjeVduOvKF/VNw==
X-Received: by 2002:ac2:4119:0:b0:50e:3ca0:d695 with SMTP id b25-20020ac24119000000b0050e3ca0d695mr2618973lfi.89.1703152645110;
        Thu, 21 Dec 2023 01:57:25 -0800 (PST)
Received: from orome.fritz.box (p200300e41f0fa600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f0f:a600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id gq14-20020a170906e24e00b00a26ac39ed4dsm134040ejb.11.2023.12.21.01.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 01:57:24 -0800 (PST)
Date: Thu, 21 Dec 2023 10:57:23 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-pwm@vger.kernel.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Kevin Hilman <khilman@baylibre.com>, kernel@pengutronix.de,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH] MAINTAINERS: pwm: Thierry steps down, Uwe takes over
Message-ID: <ZYQMA-tM-zl5IJyC@orome.fritz.box>
References: <20231206214817.1783227-2-u.kleine-koenig@pengutronix.de>
 <ZXM72QYBbb32Q_aL@orome.fritz.box>
 <20231208190620.5qobgtyii2wt7tfa@pengutronix.de>
 <ZXbsDRslZNKCeJF9@orome.fritz.box>
 <20231211141900.x6tpyctch5fv3uqf@pengutronix.de>
 <ZXcpswXxb1oQldp5@orome.fritz.box>
 <20231212203352.wl3rzob75fct4lov@pengutronix.de>
 <ZYMPc50eBi6oBClu@orome.fritz.box>
 <6nj7rmq36hj5m26b7yhlbmpfps5wuxkx4zwyvttg4cpgocimj7@xtqm4qleo3s6>
MIME-Version: 1.0
In-Reply-To: <6nj7rmq36hj5m26b7yhlbmpfps5wuxkx4zwyvttg4cpgocimj7@xtqm4qleo3s6>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_015727_986190_2EBA5F93 
X-CRM114-Status: GOOD (  23.27  )
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
Content-Type: multipart/mixed; boundary="===============3060221010490639589=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============3060221010490639589==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Bpadk4LYFr5KK+oq"
Content-Disposition: inline


--Bpadk4LYFr5KK+oq
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 21, 2023 at 10:21:36AM +0100, Uwe Kleine-K=C3=B6nig wrote:
> It's not easy to let go responsibility for a subsystem that one cared
> for for a long time, but Thierry realized that his heart isn't in the
> pwm framework any more.
>=20
> Thierry cared for the pwm subsystem (commit 200efedd8766 ("pwm: Take
> over maintainership of the PWM subsystem")) as a maintainer during
> nearly 12 years. A big thanks for the time, effort and dedication spend
> during that time.
>=20
> Uwe takes over maintenance.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
> Hello Thierry,
>=20
> On Wed, Dec 20, 2023 at 04:59:47PM +0100, Thierry Reding wrote:
> > On Tue, Dec 12, 2023 at 09:33:52PM +0100, Uwe Kleine-K=C3=B6nig wrote:
> > > On Mon, Dec 11, 2023 at 04:24:35PM +0100, Thierry Reding wrote:
> > > > It all adds up in the end and keeps me from doing other things.
> > >=20
> > > If that means you'd be glad to give up the PWM maintainer job, I'd
> > > happily take over this post.
> >=20
> > "Glad" is not the word that I would choose. After all I've looked after
> > this subsystem for almost 12 years, and letting it go isn't something
> > that is particularly easy. However, I do realize that my heart isn't in
> > it anymore and I don't want to be in the way of anyone.
> >=20
> > So I'll take you up on that offer. Do you want to send a patch?
>=20
> Sure, here it comes.
>=20
> I hesitated to remove you completely, but I guess you intended a clean
> cut? Or would you prefer to stay as a reviewer?
>=20
> Usually I would have added you to CREDITS, but as you will continue to
> fill your various other responsibilities (I expect), this felt wrong.=20

Looks all good to me. I'll keep things going until the next merge window
and will then send out my last PWM pull request and let Linus know to
expect future requests to come from you.

Thierry

--Bpadk4LYFr5KK+oq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmWEDAMACgkQ3SOs138+
s6GNYg//XoJfUeZxCmfz6spN7CsYd9q987+bqWzWKwEmrBjBHLO7YOY55ZhDeOQt
5mj73V2HPXnOcEUk+0nxlioXrnmhw6J8ruHoUvK43yoQp/WizV48KEOszKwLF3Lo
pixM3gbLj3t9h8EAhlcWy96sFZJIBTqSpL1sQcKIRNVx9e0GvswKvxqCUjfb7KZn
b6RF6ueiuzQWRic3NLWZSvoxh4dWg3fYB2h18DVkq9b+K632a0SsETBmMFry7+1P
yPmLb6wci2Aw2aK2lmXFzO31MD0/lCYC3BLGMTnsXI+Hrl6eASe7WXJ5PVjsrhM7
9B0Si87xDQRKnxHFekuXJSG2+Mw00TBwQN0g+uJt7xaC/47DUO3mWrV9SaK97ksu
CRiH+h22t0wnyWQiqyhsQ1DbLj/c8+WNLYX3gssoSTj9T7trT8/yt5xjU3Td1Xb1
ZA6x0D62WLtz0P44aAxUY5L2nVi7xMXi2v9EBCge9omujFxj98mhWNSFcVNku3fn
8eX5SghdUusYjjl53JzAvqfhFmcHVcRl0dR/O/ro0D+lZ4OZI6i1LhERo9s0IM3z
zZNZQ+HyK46/ZYDWA6G5TZ+Io7thbhY32C5+jneriiEB/B5yFwUzJQU5zXD+A8EW
nmv3sCgW9QibvwpKuryVPPUGBS/l+sJajHsEUJ2OD4JT12rXgpY=
=MIpe
-----END PGP SIGNATURE-----

--Bpadk4LYFr5KK+oq--


--===============3060221010490639589==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============3060221010490639589==--

