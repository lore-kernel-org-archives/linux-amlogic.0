Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70261606A323
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Oct 2026 18:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=upNVWqTX;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JAkEs8EJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=wN+IiOAPzWzswNnj0CtL0wpbHj5Ng0c5x+U7LhG3W/k=; b=upNVWqTXmAhu2mP3o5N78mFjL/
	04m/7DiCREjz+Xa7Ed09G/4ZIsJSxTB6gXYx3+ZG/9T3lpUBwOD3AtSrMZRVk31j1BN0cB5sb3Wu6
	HJShRsSOHurlj2qPkAT+2+4byf6UouorVXPJblORJJBAP/th6vyC3gBLQm27NGUIuyv+NVaSLH/5o
	vUcf/XCSB2D8n4xacwygcpPqsa5dX+kSDZ188Zbq0hmTUR8wzcgKLn5vB75LBMdHpeM1gB7l/w/Wk
	hJIT0DTS6JY3cr8J06bxZWkOQqFKRTN11VUdWpgxaTTeWE1ZKJiYeJ5LxhVfM8jXat8kQFY1fomx9
	mzy+X86Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMV0v-0000000A7xs-0HLD;
	Thu, 29 Oct 2026 18:38:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMV0t-0000000A7tx-1ZjD
	for linux-amlogic@lists.infradead.org;
	Thu, 29 Oct 2026 18:38:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1D63E600DA;
	Thu, 29 Oct 2026 18:38:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83B9C1F01824;
	Thu, 29 Oct 2026 18:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793299089;
	bh=b2w+vj8iicPlV6jF/HQkqNrcUN/p+IVy0qQbtmQn7Pc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JAkEs8EJN/Bf+qs1JTnsMxvRL/eLDI1l4ogYKabyXSaVDPvfJZ4MEqwwUb9CgTxZ3
	 RyVM2Dn2/3LUABGZIwEtv1WQBw4sx3e6AkGAjuxw06pnMyz8lRpeduz3NSrd4iDeEy
	 /P4Z20NH+ukg4wAuV2eqT65X6irMgULu1xgV69x9BVq2ENh1X0x8S85IwzocdcQpcv
	 1L0wCM/h0RnVMCQ+PyPhgedehge2oEiiFrH9imJBRpGH/9jUVLyadiodkKi6W2CFh2
	 NwoHJZwrjy9L4+5XRXl8AlqPEmFRS3zSIJLmG6Hq5K0OvS3s5LGaM5LF6XJ5R5bL3t
	 PRZNrzaIL+OMg==
Date: Thu, 29 Oct 2026 18:38:05 +0000
From: Conor Dooley <conor@kernel.org>
To: xianwei.zhao@amlogic.com
Cc: Junyi Zhao <junyi.zhao@amlogic.com>, Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Xianwei Zhao <xianwei.zhaol@amlogic.com>,
	Junyi Zhao <junyi.zhaol@amlogic.com>, linux-i2c@vger.kernel.org,
	linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: i2c: add Amlogic A9 I2C controller
Message-ID: <20261029-survivor-dubbed-16d6567b1a68@spud>
References: <20261029-a9-i2c-v3-0-7b30ccc00533@amlogic.com>
 <20261029-a9-i2c-v3-1-7b30ccc00533@amlogic.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261029-a9-i2c-v3-1-7b30ccc00533@amlogic.com>
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1458607778997857123=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============1458607778997857123==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="U/zaVfmhbMdnWLNK"
Content-Disposition: inline

--U/zaVfmhbMdnWLNK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--U/zaVfmhbMdnWLNK
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCauOSjQAKCRB4tDGHoIJi
0jzsAQD6EoqJcpsiitqmxnGDZSuKqITsWNdf9GYZdOEpvBqkegEA9b+UlUZT82iG
bj8rtXcmBXBPFkb2mzUl9lmprEjgNgY=
=NgBQ
-----END PGP SIGNATURE-----

--U/zaVfmhbMdnWLNK--


--===============1458607778997857123==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============1458607778997857123==--

