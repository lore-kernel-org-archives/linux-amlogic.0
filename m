Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65712C30653
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Jun 2024 14:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IgRHg/72KFPSYGmjuIxqdS3BB+TdddLFEyW9dAPpZlM=; b=qTBw0jeCyvvIsvufJ8mRNNgM3M
	TqaZVe0Hf8x/mQZvfawUxc4kbefpOpmNWecKmh7RXQO9oFuQmk2w9qFUPUzWRkBM0EwunK5xUsylR
	Fj4bFFXBytlpBPWa00O0z7GjD0lmj77Rb27bUxLRakKlR9PyZzuEXVDOw0GR9Pvc/lym05kPNrvyp
	pvT0vlgmqKg7dS8/Filzs7diD+0naXwwV/uQbYl7bbcF8Woazx8QIj6SK/eyjkd0inOogFwFh0gUh
	9NI5gGA+MMV8suXjUkxLEDfU+DlOo6NyjOufw/a+eugMGIwNJCARCvTW71fyHg0wnz9bADtveiZKy
	FP5c23zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMqYc-0000000AjtM-12DA;
	Thu, 27 Jun 2024 14:57:06 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMqYZ-0000000Ajsw-24o2;
	Thu, 27 Jun 2024 14:57:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 923FDCE2F53;
	Thu, 27 Jun 2024 14:57:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B55D2C2BBFC;
	Thu, 27 Jun 2024 14:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719500220;
	bh=i0jPmHeV6CW8BboUWCjCcCcbiGOGEGkREHGrut7jWv0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wyvw3kj7OLX/75jmYALHB97fyIeiAH0iDxbn/BkWcjaAGoC70sXoNhJjKlyOSlBYC
	 zwAtQhABTFQ/tQ6UZpQQORIkqQhKuS2qk7CkRMZx7b56tZXu/CSgXXyFg3EVHg93Hx
	 8huPSdgfgEHy4xEOqLNTWJ6D6YqGuZqUK78ohOg5OQKuK8TVUBXKRkT1wirNFZoZNk
	 k47gmn1A22mUQtYYLu7MlMqyndABXPKAtPQe/RGmfGrHOYeg5IWNWrSfEY6DkdATXs
	 1plpqQdbEHS6OgqoQjjg8fw57VH/ZQQoZwQj+uO5Ez/y4401OBnFEtuKA8xf82ML/L
	 bT6MTqIf7kFzQ==
Date: Thu, 27 Jun 2024 15:56:55 +0100
From: Conor Dooley <conor@kernel.org>
To: xianwei.zhao@amlogic.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jianxin Pan <jianxin.pan@amlogic.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, Hongyu Chen <hongyu.chen1@amlogic.com>
Subject: Re: [PATCH 1/3] dt-bindings: power: add Amlogic A5 power domains
Message-ID: <20240627-fool-willfully-381d32cb7189@spud>
References: <20240627-a5_secpower-v1-0-1f47dde1270c@amlogic.com>
 <20240627-a5_secpower-v1-1-1f47dde1270c@amlogic.com>
MIME-Version: 1.0
In-Reply-To: <20240627-a5_secpower-v1-1-1f47dde1270c@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_075703_749753_6EBD53EA 
X-CRM114-Status: UNSURE (   7.89  )
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
Content-Type: multipart/mixed; boundary="===============5232678820408762338=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============5232678820408762338==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Nb7gwQ9rDGfruR6Q"
Content-Disposition: inline


--Nb7gwQ9rDGfruR6Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 27, 2024 at 07:47:51PM +0800, Xianwei Zhao via B4 Relay wrote:
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>=20
> Add devicetree binding document and related header file for
> Amlogic A5 secure power domains.
>=20
> Signed-off-by: Hongyu Chen <hongyu.chen1@amlogic.com>
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--Nb7gwQ9rDGfruR6Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZn19twAKCRB4tDGHoIJi
0kGoAP0fbvycpS60F3qceed5hqd3hvVpzthMCcPCceocqcNgggD8DdsmSP5iVjUF
/SiVKgXplReeg0WEoSoQAy7qQUiHQQU=
=G7MA
-----END PGP SIGNATURE-----

--Nb7gwQ9rDGfruR6Q--


--===============5232678820408762338==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============5232678820408762338==--

