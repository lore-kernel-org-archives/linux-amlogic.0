Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D48C2CD1288
	for <linux-amlogic@archiver.kernel.org>; Mon,  1 Apr 2024 10:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VWRxxUcUy5zNMRRM6fPe7ymXzrxyfGfVHpFoIS12dvQ=; b=FZVpSXbGVoPHqnphB5wg75MPGK
	WLcrNeDFYnirTc8Pi/BzIfzIE07gyeA6/c7Iqgds5fYg2YVqK9YBhpFifA7/iGcEgO/CeHKcFElUF
	y/wdjCciRRlcu3eMO3gnnfUwdmg6Q7xq1JwruAk3IhdGXDTRHc0x6g4WxBbAC4eWnrKvucuCKMyOa
	ObBA5Gm49qZaslsHb9Sq+Ju8Un6mOMBqGtAXDf5wFx7HpcoZOnAHhABaSngFwJnyP/oLmlWgR0i4+
	+k7JoS/NXxCM04FP7COMDk0sbuEnJdwAcKrhWKA3NFuI5fzcHqSSeCM4LOxrML8iMGTFXUIZg2FWb
	+f7B/Tdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrFB0-00000007Uiy-1AAN;
	Mon, 01 Apr 2024 10:46:06 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrFAx-00000007UiQ-0frw;
	Mon, 01 Apr 2024 10:46:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 13DEB60BBC;
	Mon,  1 Apr 2024 10:46:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDD07C433F1;
	Mon,  1 Apr 2024 10:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711968359;
	bh=1+YXVkWDpfnDUkyfFIwwtuJIeFa+QdWmoa8giba2BLU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RQe1IZ0Pc0N4U9C9FfHJXZxrN0K3WmUQFOM9JLj5qzxpsOGP32LUqGIHO/UtVbMA6
	 W+T0dqktkiFd2AjnuDmlhccud5h53EmnYoScLlloZJ4u5A0Dx+BbL2MHynokoBwtfE
	 B3ZNtrHkxmuN3KN6z0ESFKJqMs1zq5osH7DN2IgXSh+EKJmo3DYHve5aHR6fsgwD+M
	 yNq88slX8Gg1I2uutmTbmsMfGdUpRP7SRu475rufrd6O1EvmzPQjL/rWE4DZhli+KU
	 Hl+N/UOoWRP+jiYQ7VwXm/zbY7a071Ef3vGT16zLmt/wQfL7s+/ia/CSYl/mX0K4Yl
	 tCbmRqYiUhDIw==
Date: Mon, 1 Apr 2024 11:45:54 +0100
From: Conor Dooley <conor@kernel.org>
To: xianwei.zhao@amlogic.com
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH v3 3/5] dt-bindings: serial: amlogic,meson-uart: Add
 compatible string for A4
Message-ID: <20240401-tipoff-company-68396618e0aa@spud>
References: <20240401-basic_dt-v3-0-cb29ae1c16da@amlogic.com>
 <20240401-basic_dt-v3-3-cb29ae1c16da@amlogic.com>
MIME-Version: 1.0
In-Reply-To: <20240401-basic_dt-v3-3-cb29ae1c16da@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240401_034603_284165_CB4D3EA6 
X-CRM114-Status: GOOD (  10.33  )
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
Content-Type: multipart/mixed; boundary="===============5673288142413903245=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============5673288142413903245==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Pr9sKHOsz+G6y9G0"
Content-Disposition: inline


--Pr9sKHOsz+G6y9G0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 01, 2024 at 06:10:51PM +0800, Xianwei Zhao via B4 Relay wrote:
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>=20
> Amlogic A4 SoCs uses the same UART controller as S4 SoCs and G12A.
> There is no need for an extra compatible line in the driver, but
> add A4 compatible line for documentation.
>=20
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--Pr9sKHOsz+G6y9G0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZgqQYgAKCRB4tDGHoIJi
0lJtAP9emVjhHRD0uUk/qOkv8tNvKQBjEObm+PXChnwbg2mINAEA5Xe6IFCkPP9y
BuNnPt2S+bduALibxROpFV5QaRImPwo=
=09wH
-----END PGP SIGNATURE-----

--Pr9sKHOsz+G6y9G0--


--===============5673288142413903245==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============5673288142413903245==--

