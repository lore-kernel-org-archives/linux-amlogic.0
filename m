Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CEF8CD11DF
	for <linux-amlogic@archiver.kernel.org>; Thu, 28 Mar 2024 22:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6wWYWx04Hb+9hJ5fW80CIIYpwaNR6YqJ5kXD5JY8P54=; b=UzIoUVuFB1PGPlbVlZ2ldRu6c0
	SbuTPXgyIkRgQoc0tPadCXpdjDRoUwko8FXp5MoPOHis64fFjMRDFNb5mz+s+5nIXSDQYVIE0t3bD
	0yMza0pyCyMN4EDhU6WAfYMgrzq5cmViaBDnHYvg0T60b1u5JVkub4B/o8VeNrwCr8fJiY2Ukvu71
	aRMSJ+oioWJstS0K7NLIUkkTuQhw6X/tyKfgAAFLRDzB0vXnuDXXI36Pduyh30gz6oPFuX7aO7mGk
	xkWbeVE8TtgO0ldpa+ihO+B74zuXlYEBUR6kS5I76qPQWY3bQ3Xo0iNpV2A5BXad/7BpzIZxz7wNS
	O+mzxAOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpy7Z-0000000Fv7g-4Ayg;
	Thu, 28 Mar 2024 22:21:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpy7X-0000000Fv5v-33bn;
	Thu, 28 Mar 2024 22:21:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7AB4E6171D;
	Thu, 28 Mar 2024 22:21:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 049D4C433C7;
	Thu, 28 Mar 2024 22:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711664474;
	bh=bsSpq2w4oaQS7kD7JI8nwjuSOuDf0gdzrs5EEVCG4Fw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r6vF72lYF1z6UGUgicOrv8mOgCUAVX9ejvJfqMEGf+KWg0mOd8QRBSk5ODn2dEb6F
	 nMoD6qfE4mfWRADfW8V7SkyhtNVs9pPVorRWS/6PMQGQHIXrUQRSJ5A4MqD9LUr6KO
	 +1Objm5Ppqb4Yfw5H6liWjCUKtCI0HVe6U9YFfC21qdsl5iJaTTMqkL+5Q6exlEjh3
	 QyvPGn31vgVBc+JwROFSRmDbidRw2vmPcM9zqWd6SqUxI4oS+MtrMg7pUvoGT1bPfe
	 g8Bofxz696RnKT7IgBkcFnOAssUotPbTtdGSTpv5ZrxSnOGUmO+FEqjcWmgRLG5SRs
	 VCdLNrP7aCX1A==
Date: Thu, 28 Mar 2024 22:21:07 +0000
From: Conor Dooley <conor@kernel.org>
To: Dmitry Rokosov <ddrokosov@salutedevices.com>
Cc: neil.armstrong@linaro.org, jbrunet@baylibre.com,
	mturquette@baylibre.com, khilman@baylibre.com,
	martin.blumenstingl@googlemail.com, glaroque@baylibre.com,
	rafael@kernel.org, daniel.lezcano@linaro.org, rui.zhang@intel.com,
	lukasz.luba@arm.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	kernel@salutedevices.com, rockosov@gmail.com,
	linux-amlogic@lists.infradead.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/2] dt-bindings: thermal: amlogic: add support for A1
 thermal sensor
Message-ID: <20240328-crummiest-snare-cfdd5f3676bd@spud>
References: <20240328191322.17551-1-ddrokosov@salutedevices.com>
 <20240328191322.17551-2-ddrokosov@salutedevices.com>
MIME-Version: 1.0
In-Reply-To: <20240328191322.17551-2-ddrokosov@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_152115_839993_E04B3851 
X-CRM114-Status: UNSURE (   8.38  )
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
Content-Type: multipart/mixed; boundary="===============1433737068429391767=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============1433737068429391767==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="q47ai3GyIvUiEQNG"
Content-Disposition: inline


--q47ai3GyIvUiEQNG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 28, 2024 at 10:13:10PM +0300, Dmitry Rokosov wrote:
> Provide right compatible properties for Amlogic A1 Thermal Sensor
> controller. A1 family supports only one thermal node - CPU thermal
> sensor.
>=20
> Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--q47ai3GyIvUiEQNG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZgXtUwAKCRB4tDGHoIJi
0t8dAPwOdnpLHUuMl9milt9H60HZRcx8vIKeJHzJzSPxZycsOgD/Tap8JbmOP7iC
4qa6cJjymaDGRdbAt/HGE/o0XnrSpwc=
=AzG/
-----END PGP SIGNATURE-----

--q47ai3GyIvUiEQNG--


--===============1433737068429391767==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============1433737068429391767==--

