Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B633AC55171
	for <linux-amlogic@archiver.kernel.org>; Fri, 31 Jul 2026 22:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VmoWdjEbRg8KJsEt2BqwXhmHnJ7AC+ex0OvrQjdi52A=; b=kZhbq9oRolDPvfY/PYfPDP/zYy
	3XauGHKuecWV7HV6BZahZfpu3sm8TbwXhKPHX2vVmCmqSWZrA4SNBTUGX/OabtpkvqBdGE8flWNNs
	UWvetizhcVuhVY5eQFdPCH7ZYrzHfOUvbKgINHCVVT9dYW0Gn+BfTNtuW9jMZl/gnyzyCupcled5A
	gOBrOgGVGtFK6bU4ZF/gXKXH0Lmuld0/pu5IV2rfDGqsnBQjiu2/HlHCLPJNCD9i1h3asVwd38+rG
	dB8RO22t/aeGHfIMc9HYO3Gt35xJwI0IpHal3Zk++U9WsA5jDUX2uxfFYC8PaGIjSQ/3gLV17Z7uR
	4XviGJQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpw4K-0000000DhZj-087z;
	Fri, 31 Jul 2026 22:51:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpw4I-0000000DhZT-1a1f
	for linux-amlogic@lists.infradead.org;
	Fri, 31 Jul 2026 22:51:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C9DC54125F;
	Fri, 31 Jul 2026 22:51:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B62ED1F00AC4;
	Fri, 31 Jul 2026 22:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785538265;
	bh=WVKewVt6jU8PO8TNBGUDNql/WkOfmdCohX/gNa/Duyo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OcuVJaQJ2gso9gBzoXTyT5UXsLZpk8k7ygVvJlwz+k9rYRlJ0G3qyeHiomxOmH00J
	 fqdkrWcFq+t+DLlublLUvZE3OotdTU1TUyaSxt0aNs3G8qxONF5mCI+OcXD+jRkNpS
	 3bNNFUfWbkDelwpActv6QxyT+pc/SYltjq1P2YYWOopqYkWOo8uJ7kMBKy1rRYAG5V
	 b7FpoHmJ1xKr2/HRpdQv2sUxuAlLd1gDLmD20RYNUOlz2RLdLFeQtoj/KQ8hBIQEj/
	 OQstNVBi6HInhD3fryq+1AVdvFIb8hjZMKC3/Q1TAyLsi6BmmzBq6nUAoHB54d9cJU
	 eoh1jOAcjwHXg==
Date: Fri, 31 Jul 2026 23:51:01 +0100
From: Mark Brown <broonie@kernel.org>
To: xianwei.zhao@amlogic.com
Cc: Sunny Luo <sunny.luo@amlogic.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-amlogic@lists.infradead.org, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/4] spi: dt-bindings: amlogic: spisg: Document
 A9-specific properties
Message-ID: <b09ba781-9042-4199-a7bf-126d07e97408@sirena.org.uk>
References: <20260731-a9-spisg-v3-0-a15da3f70029@amlogic.com>
 <20260731-a9-spisg-v3-1-a15da3f70029@amlogic.com>
MIME-Version: 1.0
In-Reply-To: <20260731-a9-spisg-v3-1-a15da3f70029@amlogic.com>
X-Cookie: No shirt, no shoes, no service.
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
Content-Type: multipart/mixed; boundary="===============4350456644951326678=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============4350456644951326678==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qWk8ktmf4xBbOZ3h"
Content-Disposition: inline


--qWk8ktmf4xBbOZ3h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 31, 2026 at 09:08:25AM +0000, Xianwei Zhao via B4 Relay wrote:
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>=20
> Document the Amlogic A9 SPISG controller and its additional Device Tree
> properties.
>=20
> Add the "amlogic,a9-spisg" compatible string and define the A9-specific
> "amlogic,mo-idle-output" property, which configure the MOSI idle output
> level.

> +  amlogic,mo-idle-output:
> +    description: |
> +      Controls the MOSI output level when the controller is idle.
> +      0 - Drive MOSI low
> +      1 - Drive MOSI high
> +      2 - Follow the last transmitted bit
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [0, 1, 2]
> +    default: 0

This looks like the standard SPI_MOSI_IDLE_{LOW,HIGH} we have in the
kernel, plus one new option.  Usually the client driver would control
this.  Why do something different here?

--qWk8ktmf4xBbOZ3h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmptJtQACgkQJNaLcl1U
h9A3qQf/X4NBWrjUXdjd5pQUpvotXq++6lKv73KQ1S09OkFsnDohDY0i/0KYiioM
EmC+GEO0NlyJjgcV21jaWiqqgGtpP0ApoNbt/gw4UgU6KPSzVUTgNGa+1z9WfuzP
2xHyPwI+OcRdVA1XrvlX81jRAM07NFiZFUY07KEL4A6xxXnIhDsA+3UDHIvJ7w3S
x6PiApjV/07YkDYA329ke6gKW4JuRzjlhjjvUZ7qUUS7luKD7P9bgzZi/GWhw8Li
AAGQpM9deg0TcO0WeKDrIEZgxwCXKet1Za+iKoMBUiFKdQpD49FPYuFvKYetWjoz
y1BPChJzQRvvK/awXFouQBzf3mqnNw==
=Dttr
-----END PGP SIGNATURE-----

--qWk8ktmf4xBbOZ3h--


--===============4350456644951326678==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============4350456644951326678==--

