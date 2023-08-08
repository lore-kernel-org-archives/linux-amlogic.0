Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A345C001B0
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Aug 2023 12:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oWlhBKZfgkrgA1aI9BFSPvAHoMP2nfWJg6MjxgemwRo=; b=gL+/isL7UMM9PbdqL+gR+FjHmt
	2WN2gi4Sb9dgxUCmxEo3Cb4zpi0v6SQaPS87NdPKEj6NaZpsaQOV+GSmjbbJun0a5a/wyINhrQOan
	A4z0JfAvS62qfEehN/tzL14p2nDGlDyKfKtTpA+DK21El+c/756NRUHLAh9tm7H+vIEUNUPaWbtoQ
	pnL9rbbN+IfMudoJuM+RWBj2/k8wTwlH6uOisjn1TT67bvQDZqnW/23ATrmn9NlUeMM1oznSqepYE
	50nmQLib+Zhd0EfKOZz7hrN0RZ0wXfSbnGFjN/r9eT3Ar3kdQ9raBPKzbEeVlLWzYNcJ74D7oS1nY
	ucG7sSrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTLYj-002Xd4-1f;
	Tue, 08 Aug 2023 12:11:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTLYh-002Xci-0s;
	Tue, 08 Aug 2023 12:11:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BE48F62526;
	Tue,  8 Aug 2023 12:11:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BA43C433C8;
	Tue,  8 Aug 2023 12:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691496690;
	bh=96VTB/JKve/lcwcYA/LVnZ1+6F4oYEZrmgfcvmfSTM0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PGRUeMhvgx8j7ItBIo8IDG4iysdY+5QTLi8NJackenmM6S0mnqJu5JtIThopDGbS0
	 r601kiz6J//C6Zi8CsMcMnJCbEavL+yZ5PBI9K4+xg15YJGdJavbEuCNXaYLZ7GdDX
	 TBlUksujh06CbwXRUkCowZ1SQyOeMlYHh+SAdeQ3baLFpAsSAn9jw7kf5EpIHvPIME
	 CBVgZxbLbKA36f+/wAn5DgbaSO5NL8oNQyz0RJ+XS0zuCK27qLKnv+JFAqJb2j8aOg
	 F52ZqLau9HBXQH76LcOoZh/e8s/tL/8N8wEouLdPicbQ6toqSuOP/NauDtkoEvqR8d
	 KZxwvJP8bsRqQ==
Date: Tue, 8 Aug 2023 13:11:24 +0100
From: Conor Dooley <conor@kernel.org>
To: Alexey Romanov <avromanov@sberdevices.ru>
Cc: narmstrong@baylibre.com, neil.armstrong@linaro.org, olivia@selenic.com,
	herbert@gondor.apana.org.au, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	khilman@baylibre.com, jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com, f.fainelli@gmail.com,
	hkallweit1@gmail.com, lists@kaiser.cx,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-crypto@vger.kernel.org,
	kernel@sberdevices.ru
Subject: Re: [PATCH v2 2/3] dt-bindings: rng: meson: add meson-rng-s4
 compatible
Message-ID: <20230808-diabetes-ultimate-f3f4afc53d6d@spud>
References: <20230807130611.63914-1-avromanov@sberdevices.ru>
 <20230807130611.63914-3-avromanov@sberdevices.ru>
 <20230808-calcium-smasher-5f6c410fb226@spud>
MIME-Version: 1.0
In-Reply-To: <20230808-calcium-smasher-5f6c410fb226@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_051131_355737_42300D4B 
X-CRM114-Status: GOOD (  12.60  )
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
Content-Type: multipart/mixed; boundary="===============7123003271842118646=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============7123003271842118646==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0Io72FXexd1hCxZL"
Content-Disposition: inline


--0Io72FXexd1hCxZL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 08, 2023 at 01:09:45PM +0100, Conor Dooley wrote:
> On Mon, Aug 07, 2023 at 04:06:10PM +0300, Alexey Romanov wrote:
> > Now the driver has a separate algo for S4 SoC.
> >=20
> > Signed-off-by: Alexey Romanov <avromanov@sberdevices.ru>
>=20
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Actually, one comment, please, for bindings, write commit messages that
relate to the hardware rather than drivers. The bindings describe the
hardware, after all.

--0Io72FXexd1hCxZL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZNIw6wAKCRB4tDGHoIJi
0ufhAQDEwiUsmmmJ5vqZLwTZzcnnxminVSw73imTDPpTMWNkXwEAmLS4+h8XAIUR
6XGM49WckQHg/4mRuvhymrjQWwbtgAQ=
=X56w
-----END PGP SIGNATURE-----

--0Io72FXexd1hCxZL--


--===============7123003271842118646==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============7123003271842118646==--

