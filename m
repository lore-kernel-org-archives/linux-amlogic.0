Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C1A0C48297
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Feb 2024 18:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p9Ixr5yj28Y1kjzQCjUvYAQwwXUiUOCVKLkx8wbVtyI=; b=fuLqtSAhs7ocDNwvvlI10/u6N8
	1D9VOvvOhvfLm/kfQdA2H6K+bKq+kONGVnH6T9WiAVOqVylmp0In8ypfQXyN5L0pTXEJf/6SWDXge
	yedIBjpXj6nQ+YMmNfoJoklBGKH3bHBPcumBDsw3GolNPzVky5TiL3nqAPfHlnCLa4bVyrS8fYNrA
	ielmUOCS0vDlDBWNHnm0mbe1pc9NPzsHRillVO/pwJJ7HZRQsC8gSKe1Rn9Jpd4cw2R6QeZk/iOqt
	xZI9/pcv82gBXZQ/wpHjcrqOFm95CwdNb7dQS6aHWJ0cPlTyOGV7LxBu+ShfhKmiQQZgbGg/sIYvc
	PlmMmJ2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZadI-00000006Ya7-49Sz;
	Mon, 12 Feb 2024 18:02:20 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZadF-00000006YZk-3ivS
	for linux-amlogic@lists.infradead.org;
	Mon, 12 Feb 2024 18:02:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 81E73CE13CA;
	Mon, 12 Feb 2024 18:02:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F7DCC433C7;
	Mon, 12 Feb 2024 18:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707760933;
	bh=9gbv+NcQcD3ZyPjI/+60jSNlPd+JXy2PrfzQ74Ne0fo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D7Pmnx+aIkCbOAZg6+6YYrvFYnisSB0PKeFuF0mnoODcXQQGtoea7lW5PEwLA74Si
	 r60i29SkOjI0x4Mj7tbjJw7p0cbT0v8AJ9to+UIMzoAMbVtpYaapxfTpqlKtNONmpk
	 W/6smCr6CERZ5IkiI8MgWyqScgvw/eLZjNUwEUHycs1UmnZJBvv1fozORKGidP+JU2
	 iqXeuwGvnJy8DSW2mf5Ke1rmMf/VbDpGxmkHofmaKKfeQwMgGsFHspUHexSiNwGMd8
	 3EACBrn5GI2yTMhnugUl6b++RtbXAKtoUqD0QQkK74ThH2ZguWAn1TRjSEumlhESs6
	 p0yVtBigUmT2w==
Date: Mon, 12 Feb 2024 18:02:09 +0000
From: Conor Dooley <conor@kernel.org>
To: Marc Gonzalez <mgonzalez@freebox.fr>
Cc: AML <linux-amlogic@lists.infradead.org>,
	DT <devicetree@vger.kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Pierre-Hugues Husson <phhusson@freebox.fr>
Subject: Re: [PATCH v2 1/4] dt-bindings: vendor-prefixes: add freebox
Message-ID: <20240212-relative-alkaline-ba33b36f7a6b@spud>
References: <77edaf7e-aeb5-4fc0-8b69-85dcddfd5a58@freebox.fr>
 <47a5baee-866d-437d-8950-4e730f210bdf@freebox.fr>
MIME-Version: 1.0
In-Reply-To: <47a5baee-866d-437d-8950-4e730f210bdf@freebox.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_100218_126952_ACA8BFBC 
X-CRM114-Status: UNSURE (   7.57  )
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
Content-Type: multipart/mixed; boundary="===============2441303211943787779=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============2441303211943787779==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+qn9gfo/ju42T3ts"
Content-Disposition: inline


--+qn9gfo/ju42T3ts
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 12, 2024 at 06:49:11PM +0100, Marc Gonzalez wrote:
> Freebox is a French ISP who makes gateways and STBs.
>=20
> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--+qn9gfo/ju42T3ts
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZcpdIQAKCRB4tDGHoIJi
0qG7AP9BsiQSCzXozaccBvF4tAp5eGTWw9GGc2L6v6mz4RQz9QD/ds/pbcd6KGly
8ugLQH1ZO3/RdJRQvlWwqJKyfvyAugA=
=X/EP
-----END PGP SIGNATURE-----

--+qn9gfo/ju42T3ts--


--===============2441303211943787779==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============2441303211943787779==--

