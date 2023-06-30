Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A996EB64D7
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Jun 2023 18:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TITgG94kKD5lnN1YlL8TiyyEMz5nQhAtqNV8YO121ro=; b=nCcxxA+ayET0ZgxqP0sVZPPWXa
	1Ed7b1+Veb/xcTQkGC6ZBBDJXGP62KsUGozQy74hJenW9UMxMRosse0xZmi5GtLvOqVbJxssaRfGN
	VM8UE4XjUWxHvYnTFFTOTzSSqjXZ67uC0K5dcb0VV4NsXaoGLEMIQ/Jx1p/q/CfTkyc7z7qjVZ92D
	gPqoLZcKBAJlhpzxPcJQnR8TA/RgTupbB00JhFxxNlR4rM8U0RRKd3u46eao7wQE52RdF8uE7uCWE
	/wOMnwP57TPhI5jv2lnb49wa4txHebU+t7WXPrULpaN5U2dhOOxoieFsv6fHTKSslXKENEfb3Edc2
	EStXiFEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qFIXM-004Gem-1w;
	Fri, 30 Jun 2023 18:08:04 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qFIXK-004Ge1-2I;
	Fri, 30 Jun 2023 18:08:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F07B3617C1;
	Fri, 30 Jun 2023 18:08:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7925C433C0;
	Fri, 30 Jun 2023 18:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688148481;
	bh=0Or+SFZ0SHOUTDSagR5mJ/56XhzgF/qhUAA6D6CG8t4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qHpnGiVlZmskeHYt7wuTO34HaXpPdQdYTc3PeOuRC3/odSA4wD3u4gPgw82PneuRF
	 05A2PuS8P+Wsldhi+0EvtI4jk1+WfkA9h5lnUUknpUFZJ+3OjhRWgw4MGDdDeiQ9Xy
	 m20Pcz8w92UJJ6XIYL0FtvKkZ+EKHzww2+h5cp+jkxtqUzF9MojybXxyYl7iMJPNfp
	 TfteMeJrHfpzlaTzjg2HJid9XRBWvFUCeqfJKlo6TRZ7rso3JlqlcAz9EcNy100JNW
	 UibqojsSB5X3Rvw3aB9fLrz+i+aBqUME4GHlHYQNedppf1u6zlVVZ5bgRtlYFFB34f
	 vjgaEXC7phnhg==
Date: Fri, 30 Jun 2023 19:07:55 +0100
From: Conor Dooley <conor@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Nicolas Belin <nbelin@baylibre.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v6 8/9] dt-bindings: arm: amlogic: Document the MNT
 Reform 2 CM4 adapter with a BPI-CM4 Module
Message-ID: <20230630-serve-annuity-1ee92993e42e@spud>
References: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v6-0-fd2ac9845472@linaro.org>
 <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v6-8-fd2ac9845472@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v6-8-fd2ac9845472@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230630_110802_789943_D765FDC5 
X-CRM114-Status: GOOD (  10.07  )
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
Content-Type: multipart/mixed; boundary="===============8821332899462027614=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============8821332899462027614==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="PIC40N/CDnE3uSF8"
Content-Disposition: inline


--PIC40N/CDnE3uSF8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 30, 2023 at 06:29:15PM +0200, Neil Armstrong wrote:
> The MNT Reform 2 CM4 adapter can be populated with any Raspberry Pi CM4
> compatible module such as a BPI-CM4 Module, document that.
>=20
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--PIC40N/CDnE3uSF8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZJ8Z+wAKCRB4tDGHoIJi
0qDcAQCqzCa/eZq9IhbI1ejK8z9NQ/ZJ2bRUJdMcmMQ+wg4wpgEAsbauVpLse9T4
0BGhgecOD97mZqVrA2Sltk3hQBSIGQk=
=4s+I
-----END PGP SIGNATURE-----

--PIC40N/CDnE3uSF8--


--===============8821332899462027614==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============8821332899462027614==--

