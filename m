Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70726C3DA59
	for <linux-amlogic@archiver.kernel.org>; Fri, 19 Jul 2024 14:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yLjgbZIZ5lzwqXU7tA58/IPJfMIdTcuxerRYtombuo0=; b=WqQ8Ag6QuHY3ErGAUSH1nckUam
	9maRRvNiDNz/FbdSX8FlShNkNYP6IWaqXbg7yyQFUl/n9/Jv350QLlYYKTWGu44ziqPONQq4Iu2+J
	rRFGSmHs49j80WKGgj3HdPvN3Ax31XHp8GmN1zX7UFpWOb9qpCLCriEuWDHoCtg1n7vIro2lIeomj
	Cm8ySi55ZDF7mLQ9L84LwhIcmqdVdrD3daNFXw5QI8hMvntcwmWbNVwylAW60auawYTkzNh818lt4
	DtT2DjZX7XhiJb4HURZuIGcFRtIvhjdEIo/AyZb/Iqz/fN9NDmKCgHXI0iPa5HutO7tCt9aZZgboJ
	yZTtm7Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUp25-000000030BK-1QHM;
	Fri, 19 Jul 2024 14:56:29 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUp22-000000030AG-0wU7
	for linux-amlogic@lists.infradead.org;
	Fri, 19 Jul 2024 14:56:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 602B1CE1C29;
	Fri, 19 Jul 2024 14:56:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3C00C32782;
	Fri, 19 Jul 2024 14:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721400983;
	bh=O4VyP2W3zOx8GnJ6GGdeDrEQ0pQ9+VnTxkj3ZXK45K4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k0jemaZP5wjp3mEEiFLCCM/9U+enircAvC6L6HVtSrOSoCYvQ7i1QDvnv54UiqHVj
	 0uxEoXD0X+wYz7X5xkspXENPNSS6C3c3yVnQ8e2i9I02dFsrEa1y9WuvhhecbWTHuA
	 hdC8geb0kUyiPaBTTa5BCLwr0uwBWvmUZ+F+7LvZN86X2l5r2KmNRzKx2P5fggiHbU
	 Fz7f2Q6NJLuRM4aZ3IfqNfvxhSGOeJHX/hv/Je0smz8xbuhcCFRqGq6dWBYEc3Z2/N
	 0HKQgPPOOOOFcJwNYvCa0c3qn3jqwQyEs9qdKorRzvJxY1F2WyuyTyc9Vc9vL3Ta4Q
	 7S5hGiyasdHiQ==
Date: Fri, 19 Jul 2024 15:56:19 +0100
From: Conor Dooley <conor@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: clock: axg-audio: add earcrx clock ids
Message-ID: <20240719-whenever-wanting-bf631afa4663@spud>
References: <20240719093934.3985139-1-jbrunet@baylibre.com>
 <20240719093934.3985139-2-jbrunet@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <20240719093934.3985139-2-jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240719_075626_456736_411335C5 
X-CRM114-Status: UNSURE (   7.85  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============1835121189977242624=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============1835121189977242624==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tN+3GRhTz2+PxInK"
Content-Disposition: inline


--tN+3GRhTz2+PxInK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 19, 2024 at 11:39:30AM +0200, Jerome Brunet wrote:
> Add clock IDs for the eARC Rx device found on sm1 SoCs
>=20
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--tN+3GRhTz2+PxInK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZpp+kwAKCRB4tDGHoIJi
0j8WAPwOPdUj59+e34f5LjrClNS9PlsaIwClbL5o8IH1WiCsmgEA6vxkUeYWF2D5
7qSl94g+GTRwcPCJr3bhHsSBE0J5zwY=
=lfNB
-----END PGP SIGNATURE-----

--tN+3GRhTz2+PxInK--


--===============1835121189977242624==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============1835121189977242624==--

