Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EF8FC6FA8F
	for <linux-amlogic@archiver.kernel.org>; Thu, 24 Aug 2023 15:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bP1dFKepGo/1etLxYk4J6YDUKP4s5/ThvlSWh68bq7M=; b=R/jz+KUtGIQCVEox1qAdsNXsVE
	J8KHZ+RkIQGaa3NahkoCdVJSXz3SrMUuDw1+nLbb9RvlavbGvQ8j+sP+Osi3/L5JDmP/5ow1ohLPS
	faleNP88sdqokvjM/bgeAzSGMXwwrbptIsvO0ULX5Z+h8XHahUNh87xIC+nZx+sNvP6Nlry4NlZ2d
	BZRYloOtD4qAWU//HZJ+Pu1So3oiHFYAlgZJwsXGSxu6ln8uyIfzvbO2ugwjRrl6kaYrKFH63TYpP
	SWfUqsSyswIPLZD11aYNRsGP7nYpFw/RefB0E4CnzNWSFTPqmeWkxEUOeGNxSuyD645UHyFFX1E9Y
	SQRa62sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZBvy-003Kgh-1L;
	Thu, 24 Aug 2023 15:07:42 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZBvv-003Kg7-2p;
	Thu, 24 Aug 2023 15:07:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C678160B3D;
	Thu, 24 Aug 2023 15:07:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 267CCC433C7;
	Thu, 24 Aug 2023 15:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692889654;
	bh=uPRW448ygskzoQJKpbz5l5EdoVqXpDqJxdDyLkZhpCA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IeMBWOETb/l/BuGEJczqQ4MoKEVpXhnDkyjTmMzxhQCTr53OqHc+zduN/RbQN2vb3
	 JbGZIVvmGzak3sA9MHy7Ly9bmxcJh0u79uGol5BRaUToTs0zNx0L1LU6c6q8gPlMkA
	 xwlDs5Wk5kzvfZSgGRU3lWD07PT7Ex5EbEw0j2SpCeJuq5VKld4XjtIHDTsI+25MAA
	 0hmlj3lDqn0sPRZphsz364Dx4oLPbMTAgIYoJ30QlUfASpkTvHEH47GkgOD4lAA37v
	 xMnOndfo8HkrmiojzeQZvuuvwg+jMxiSJcTcIXkgu1ECReV2jaqnhFyoCiMVOCjuP3
	 uUeSetW9wNOGg==
Date: Thu, 24 Aug 2023 16:07:29 +0100
From: Conor Dooley <conor@kernel.org>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH V2 4/6] dt-bindings: power: add Amlogic T7 power domains
Message-ID: <20230824-easiest-donated-6c0fed4e88f0@spud>
References: <20230824055930.2576849-1-xianwei.zhao@amlogic.com>
 <20230824055930.2576849-5-xianwei.zhao@amlogic.com>
MIME-Version: 1.0
In-Reply-To: <20230824055930.2576849-5-xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230824_080739_974358_C7457D5F 
X-CRM114-Status: UNSURE (   9.60  )
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
Content-Type: multipart/mixed; boundary="===============7454079736986151002=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============7454079736986151002==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6nFLsB7ZwbeEzcob"
Content-Disposition: inline


--6nFLsB7ZwbeEzcob
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 24, 2023 at 01:59:28PM +0800, Xianwei Zhao wrote:
> From: "xianwei.zhao" <xianwei.zhao@amlogic.com>
>=20
> Add devicetree binding document and related header file for
> Amlogic T7 secure power domains.
>=20
> Signed-off-by: xianwei.zhao <xianwei.zhao@amlogic.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--6nFLsB7ZwbeEzcob
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZOdyMQAKCRB4tDGHoIJi
0ug0AQDBHP2c21Zxixx7md1Wp11gomoHV6tufjv3WeA+dhJMBAD/YIdfAOxjTDzH
nAxyf7peyDyRmmFRrChJsBNihgC+NAU=
=ClxV
-----END PGP SIGNATURE-----

--6nFLsB7ZwbeEzcob--


--===============7454079736986151002==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============7454079736986151002==--

