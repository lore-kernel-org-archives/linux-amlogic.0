Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED954ECAAA1
	for <linux-amlogic@archiver.kernel.org>; Mon, 31 Oct 2022 22:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/cfKMYc/o3ZE32IdyHrqELKwgc/LrHmN8/y/FFi/y7Q=; b=uEDSle/q/iabRC8jfraYuMtphr
	OdkpDjl3rrc29NG1MoXFknyRrw9ksC9ZTVstWe7jY80Vo5piqnwUgmnWIjBtRMjesJzKHg0eLR2lp
	ITyHeTEgxU9dnqLb6A7NXjFjYTGK+CezjhTc4sDMIkjZEit8Ylk5AqGnr+RSgeqAN4Qn6+9Teg8eu
	cDp0KWPU+7gdN3LCPKXrkD0MWHdV9L+F4RP74C9c7IX2fugkzafJAevDsR5ymIYDuEhUdWDoMTy7E
	iXKjP2mWAsElgBhBJGOdtKzQAoDU3+szk73nSU3FUCvYRVdIU3hIHEpDQN49PNuGL7AKBgayxb+Lz
	18/x+wUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opdHa-00GCnM-MD; Mon, 31 Oct 2022 22:29:26 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opdHY-00GClw-9d; Mon, 31 Oct 2022 22:29:25 +0000
Received: from mercury (unknown [185.209.196.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id BA6996601E58;
	Mon, 31 Oct 2022 22:29:21 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1667255361;
	bh=y7NHk+x/vkwV4B6bPqXt9h+kTokITc8sWrGBHP8NPNg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JYpPB0aO/MMbrQkYic+RHqVrLuAwKNI0ud8uCXdiAarhfFi43aQfo1mwfZPFQUVf1
	 ny0VvEs0HTxMMLY6jC+h8BTa+tIf+zvtpag4Qahv2T58+rlZe6DavftrokXx1dQ45a
	 ggpyHAZU2BxGnB7SFMT36OeKjqMdvppN807wIfHh8zelXnWvZsFxZIDAKg2pqgFaNc
	 OGrFWyudfLmF7+U4U8nZWOcyT1qY9VD8RGV8iJ0jVtx3sOjNFKn5s+NpK0SIqYD4PH
	 uU/OKM69U2ewrpSdH5z/VioJ06tLmh5sYzLGfgiv9m4+Z4/xHvepfPU/Vo9pdbOwZF
	 pWFhl9HsdzoYg==
Received: by mercury (Postfix, from userid 1000)
	id D6D1E1061C6E; Mon, 31 Oct 2022 23:29:18 +0100 (CET)
Date: Mon, 31 Oct 2022 23:29:18 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 2/4] power: reset: add Odroid Go Ultra poweroff driver
Message-ID: <20221031222918.knzv3lotfn3sp7bl@mercury.elektranox.org>
References: <20221031-b4-odroid-go-ultra-initial-v1-0-42e3dbea86d5@linaro.org>
 <20221031-b4-odroid-go-ultra-initial-v1-2-42e3dbea86d5@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20221031-b4-odroid-go-ultra-initial-v1-2-42e3dbea86d5@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221031_152924_561306_19D8CB0B 
X-CRM114-Status: GOOD (  10.14  )
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
Content-Type: multipart/mixed; boundary="===============3109262276728945258=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============3109262276728945258==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eujrc3kuhfvtgn3s"
Content-Disposition: inline


--eujrc3kuhfvtgn3s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Oct 31, 2022 at 05:47:26PM +0100, Neil Armstrong wrote:
> The Hardkernel Odroid Go Ultra poweroff scheme requires requesting a powe=
roff
> to its two PMICs in order, this represents the poweroff scheme needed to =
complete
> a clean poweroff of the system.
>=20
> This implement this scheme, and overrides the PSCI pm_power_off.

Please use devm_register_power_off_handler() or
devm_register_sys_off_handler() for new drivers.

Thanks,

-- Sebastian

> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> [...]

--eujrc3kuhfvtgn3s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmNgTDsACgkQ2O7X88g7
+pq7uA/9H2d0rwb0Y8DB6tj/S2dpXLu4UNe10uTTfw48HwbZ/u9iAZA10IpCLUsN
v1nLjSNKO0KZAV4V8oQaic8k3g3ZW50mt26gDPSCo19q/D3VcIwzFjUV93XDP/ue
z3M1ftw6SWWIByaL7PoB9JSh5NCQsLAofDCCwVrJP8xC6Po59AXNUfYl1oLakV+x
+3+HPE5KnQBH+c2kQwD6RteiSRc9oBj5TzUJGPQJVj3sAns//vRnSAkPnUKj6cSc
1YIxtfuZM+f0lHZ4q0QPP9CZnoZrOZGKBfuk51GzkBCqRqHNlXQyo3IALzARWkzC
ybj5PYeiAtt/9065o4qW8l/5ZkRnBgKtXLo6yEeZ4QWi4v8k+peULZUhj15hYIu1
PFNMbCPYgrdw0zAhYF+ZGalmj7V0Bc2dt/Vdmy8P67G+Z/yFrHPkOPd+8annG1P9
f32huAi+Moe5KUGplibWRdWHivxosVV48HH1Mcl7FD223VSt2HIzIHDEshufM0Wq
BghGc+J2KEs9+dKwxnaZzKco59tjCmw+78inlEeyJreEEGh9vqfWFOJN0At47VPa
cQcqGGXPMOOJHDlTFZVTLmxlZA9tl9FT+7X78IrqFZFSKEJ15VnY3Bfl2BZwwYSs
vdojcitlJoJUU3vfa11ut36Rd2hSFSoaWdmS+mzXnuFcDD7hIqI=
=j9s8
-----END PGP SIGNATURE-----

--eujrc3kuhfvtgn3s--


--===============3109262276728945258==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============3109262276728945258==--

