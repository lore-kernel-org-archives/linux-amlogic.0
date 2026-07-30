Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 849DCC55165
	for <linux-amlogic@archiver.kernel.org>; Thu, 30 Jul 2026 13:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YOLgMo6RjA9zbs2ZTcHAHi58p1A3RcAjXz8bHSv1ZbU=; b=XcGFH184v7M7XjaCKAbPpNQz/b
	+4No6HkpLzEnquppCqKwHE9IPi2HmTZnuyh/Y/S18Rk9BqjMRX+Wmehwq7OWb/coDNkWN4zpylcad
	cJ7GAdanVvZLzKWq0EmiWKbVg/CN2OJetNkaIDLgMdu1RBVl+Oh4PcBly+zENXDq7zvWnPgqXrINp
	WBMfxfjZsZiIahBPzHRAgVd87NG2Dqbq0vgG9Ev02iDLCVnApmNgzYZ7M3pIeJ9OA3uKit3A/Kvys
	b0de6zjpZTCrhJoWAP14VBPZ3zORkMzOcA2okf1SjbB/QyvDNWxvmxZhX1ir3I9/PQiPiONEPix4z
	9V12SeSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpQiZ-0000000Aa9v-01GW;
	Thu, 30 Jul 2026 13:22:35 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpQiX-0000000Aa9n-3vfo
	for linux-amlogic@lists.infradead.org;
	Thu, 30 Jul 2026 13:22:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4A2A3600B1;
	Thu, 30 Jul 2026 13:22:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C06F1F000E9;
	Thu, 30 Jul 2026 13:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785417753;
	bh=9Q3HIxWWSodqt0Bo0OCgnfV4yYAcllzEKkbzND1L9o0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=B/O8Ol09cZSmMUODobcKqSgd5Q/JcwB+2tZgm0DaW+RO4xPO7iONvAMbU7s8GrSss
	 tF71RlusA1A8HJt452LGRwMCcB+O2o5A+ngycPYg/Pn6KsVL8Zy1VIuU7WWaMht3I1
	 0050WXTMkk7gol4vgXHOeTeAFqzR2l3icuVR7z2g0PmSwR0DM3skSzni0sjgoafmZd
	 vnSfQHPVUf0C8FiZDURuUF/UMKh/fEO/i4hKC8kSFW0RbqHKFp5TJhPoRk56uEhQO/
	 8ihOS88SOl29wZ09Wr6XN2aX/RUL7xIZD0rW0ttoinnmiUzo65zvplml7lv7YQ5Lcl
	 cyf7wIqfPgXgw==
Date: Thu, 30 Jul 2026 14:22:28 +0100
From: Mark Brown <broonie@kernel.org>
To: xianwei.zhao@amlogic.com
Cc: Sunny Luo <sunny.luo@amlogic.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-amlogic@lists.infradead.org, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] spi: dt-bindings: amlogic: spisg: Document
 A9-specific properties
Message-ID: <db111663-27a2-4299-a692-6154f1f842ca@sirena.org.uk>
References: <20260723-a9-spisg-v2-0-9fc39106b7e2@amlogic.com>
 <20260723-a9-spisg-v2-1-9fc39106b7e2@amlogic.com>
MIME-Version: 1.0
In-Reply-To: <20260723-a9-spisg-v2-1-9fc39106b7e2@amlogic.com>
X-Cookie: In specially marked packages only.
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
Content-Type: multipart/mixed; boundary="===============1697848232373399293=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============1697848232373399293==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9CS4vkVm2ZtSBEMP"
Content-Disposition: inline


--9CS4vkVm2ZtSBEMP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 23, 2026 at 06:43:42AM +0000, Xianwei Zhao via B4 Relay wrote:
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>

> Document the Amlogic A9 SPISG controller and its additional
> Device Tree properties.

> Add the "amlogic,a9-spisg" compatible string and define the
> A9-specific "amlogic,mo-idle-output" and "amlogic,word-gap"
> properties, which configure the MOSI idle output level and
> the inter-word gap, respectively.

> @@ -35,6 +34,23 @@ properties:
>    resets:
>      maxItems: 1
> =20
> +  amlogic,mo-idle-output:
> +    description: |
> +      Controls the MOSI output level when the controller is idle.
> +      0 - Drive MOSI low
> +      1 - Drive MOSI high
> +      2 - Follow the last transmitted bit
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [0, 1, 2]
> +    default: 0
> +
> +  amlogic,word-gap:
> +    description: |
> +      Number of idle clock cycles inserted between consecutive SPI words.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [0, 1, 2, 3]
> +    default: 1

I'd expect these to be per-device properties, not per controller.  The
word_gap sounds a lot like the existing word_delay feature we have - if
it's different it'd be good to be clear why.

--9CS4vkVm2ZtSBEMP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmprUBMACgkQJNaLcl1U
h9B6Igf/X+zzg9VfJoUN5T5BGj5eihf8ukNh7rLmr4zYQsfOkHIr/NcL/kZsXsxf
7KuCeVVRO/KVxZesl6kSr8Kf7h8SEjJChTauUDDy2Yy3up9zzI0seOO2Kpibc3Nh
Xq+6ZmSDie9G3zBKMHNB71//bhMI+K5duCbfk8A0F6dsG1wsJobxAAlhTcHZnsiu
LkmiQ+7p/rbBodJ6B+zk7tnpSvNFYaOkXVYO0I+kgDCF7uCyHok1/UKT/iYaaBbI
R6ryWEykKC5fRmxPgculPRoamYLQhC/uMIMtSLdQK1DiKxVc5tEzp0pVLkKi4xss
nQMdyTzCWVf4gThGtW1MS6J6xSXnRw==
=2hV1
-----END PGP SIGNATURE-----

--9CS4vkVm2ZtSBEMP--


--===============1697848232373399293==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============1697848232373399293==--

