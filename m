Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E649DCD98F2
	for <linux-amlogic@archiver.kernel.org>; Mon, 22 Jun 2026 16:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PZdIbsa7kGxdnkDVwgS2Edi9lPs6WgsPrv2U9jxrN+0=; b=C1G5XeB0NtNxUPN40jB+bbGwRq
	goXVoVj+0eyXuxMu5SLaL1NErUyLPIgrq3ZEz1iBBO7X17xISQwDhfeZVv6OF/LiPcnE29lCNRhRa
	fgpODJp09fMzqZSvC2x3lB5SB09ySqP6+kkFiV+Rbh9KWI4Xugk0DSyXg+myV+Yjtnz5iq2uQ6Uym
	eYFaINw5KBCQ4KdrZYJv80Qt57bzwXCQO0dnRslWQuAysalp8IEWXF6NbEe66oGIIBZPLE8+pjRGW
	E+UX24McArcqaFwZjkZeK91HkPIs5+Rociq9XVa56EC8mYhUN/RBj13YpoTa+vkMDDc4eWQsFPc+L
	4fAeAVOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbhlk-00000005Cit-1tj5;
	Mon, 22 Jun 2026 16:45:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbhlj-00000005Cij-0eqv
	for linux-amlogic@lists.infradead.org;
	Mon, 22 Jun 2026 16:45:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 61471601F3;
	Mon, 22 Jun 2026 16:45:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 747681F000E9;
	Mon, 22 Jun 2026 16:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782146706;
	bh=zElci/os7/jfn0A3RRkTkeT4o+9LImhbDkPRqYp8/WE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mRH30SM62YpD2Z+K9rgpoEji+0iTSa1+8T+yA1AiKDwhK88HqRGRtCmoCAzNk+UBq
	 yDePdxjlnviQRP5tviQOoQ0hkA++9MRNhPYX0wYVvm08AqmXAvc/hKQcZS6zCqS5C/
	 nFFNcJjrpFtS6Jp029Tpv7OPEvpsuj7LSpu9kYW4+vPyR/igvTOjMqf0//Mx1Ewnr2
	 2gvGpivanhrDrGTbzEbg9Kzqw9J4o0pp8F5nCrHKmsQpwB5AbByNw2np/6syGjeKBi
	 Mem0Ta3NKALsne4MfGWAKGJW0bBUmP2g+lrXJ6O3+P1q+l8wMVbLu9gtZVVBr2gzuf
	 OjF0R2oiHZxLg==
Date: Mon, 22 Jun 2026 17:45:01 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Guillaume La Roque <glaroque@baylibre.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ronald Claveau <linux-kernel-dev@aliel.fr>,
	linux-pm@vger.kernel.org, linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: thermal: amlogic: Fix missing header in
 the example
Message-ID: <20260622-pointless-rebirth-ef77e609d5c0@spud>
References: <20260622100231.438435-3-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
In-Reply-To: <20260622100231.438435-3-krzysztof.kozlowski@oss.qualcomm.com>
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
Content-Type: multipart/mixed; boundary="===============6137329447847970410=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============6137329447847970410==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MKrwKpMqithOr1GF"
Content-Disposition: inline


--MKrwKpMqithOr1GF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--MKrwKpMqithOr1GF
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCajlmjQAKCRB4tDGHoIJi
0j+0AP9/kaVJ5YKD8KOSM/zeSpTH30n0PabudqDxHmktnTBKDQEAz+EvpXQJ7fcu
yP2y1kIeTx60Yc0SovfQ09YiHJuAuQc=
=+rkZ
-----END PGP SIGNATURE-----

--MKrwKpMqithOr1GF--


--===============6137329447847970410==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============6137329447847970410==--

