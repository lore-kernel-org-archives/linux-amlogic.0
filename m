Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3DA8C5DF8C
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Aug 2026 17:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pcn60i9NMZ9ytiqlqdxENnHOcLWPKNqBxZLhnb8U0x8=; b=RGFhoNDIDw9E06p4T902wZdAIK
	7ygOa8bF0Nfpo+YC22ONaXovKKL7m1mDxPKuKEZYXDVpQTPG9s7MxvBoVJKYlxdKBeYerlIzBVR/k
	HQdTzo2x8/HoD7r2HPh1PQFU6tstJcdkxDv6BCTeOeAwNHCh/R0D9YxGC0odCL+PjdlhuWgPPCypr
	GxCrCJ/9JD0W7p8A34/dlXIVRbdZlI0sOyKEHd8S/GYo4NwpUifolpHlTHpTHdwf2ppsAyvCQWvBh
	llYBu7+XdRQ7Yc23xZwccNWCEyPn5QmfZe3NpItEzEcGpcChNHcXiw2cU/eOTuxGr//PihFZVRDR8
	EJo7ieYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxSt1-0000000DtTW-0eog;
	Fri, 21 Aug 2026 17:18:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxSt0-0000000DtTQ-1Q9M
	for linux-amlogic@lists.infradead.org;
	Fri, 21 Aug 2026 17:18:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C8B8F4176A;
	Fri, 21 Aug 2026 17:18:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D3FD1F000E9;
	Fri, 21 Aug 2026 17:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787332711;
	bh=GS1qQDP/Be5NshQnlyobrrr7FcIivBLhbPmcuwqsGhs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=R46EMPu2fmoIm4wL7snOkkb+y6mgk7Wp8/BLncHtQKvrebObI05Rd4Yvsx2sggW4N
	 r+kERmMd2NoPJgq5M+de3E/5oCIhBsi54wRE6Zvl5oFCI+qU+rZguTAF8MKV62DVmu
	 VpfIeDk4Xe+cay9Uf+FreiRW5XcneW01L/ZyrM1LDLEeVmavnb1OT4m/0oTYbqvK6L
	 8SHX0fR2eq3AzytoFtEhhhqr8xpe6PaqjBJbAt2xJK7sYYL74l7BlTNs6JHdjSusBd
	 aLEeOCCQuWh5PbD1Ll8mrTCv8DvmchEdokGErId6SB+Iyvbu0pKN3+U1vwAAgYlAcL
	 GKoW40aUX4C/w==
Date: Fri, 21 Aug 2026 18:18:27 +0100
From: Conor Dooley <conor@kernel.org>
To: xianwei.zhao@amlogic.com
Cc: Guillaume La Roque <glaroque@baylibre.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-pm@vger.kernel.org,
	linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: thermal: amlogic: Add A9 thermal
 bindings
Message-ID: <20260821-envision-mousy-bef9a2c51e2f@spud>
References: <20260821-a9-thermal-v3-0-0e7abf3941e3@amlogic.com>
 <20260821-a9-thermal-v3-1-0e7abf3941e3@amlogic.com>
MIME-Version: 1.0
In-Reply-To: <20260821-a9-thermal-v3-1-0e7abf3941e3@amlogic.com>
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
Content-Type: multipart/mixed; boundary="===============1302994316037009121=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

--===============1302994316037009121==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rBQNQ4cmFmVpeZDt"
Content-Disposition: inline

--rBQNQ4cmFmVpeZDt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--rBQNQ4cmFmVpeZDt
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaoiIYgAKCRB4tDGHoIJi
0ieYAP9rHImLhgtylICcvJnyJJVKYYhFsFpKMqhdSEs66+5r4AEA+DIUM4F6Cbsh
vRwJotnGqwmpDT4WSw83ag4UscMZHQI=
=gyny
-----END PGP SIGNATURE-----

--rBQNQ4cmFmVpeZDt--


--===============1302994316037009121==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============1302994316037009121==--

