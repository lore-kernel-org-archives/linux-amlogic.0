Return-Path: <SRS0=EW34=TU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 458B4C04E87
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 15:05:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1882520856
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 15:05:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QSgOt5VB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1882520856
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=the-dreams.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KRoqpVkGv+xYy7pPF7MbjubcbAi6VQTkvKSQbkSi9sM=; b=QSgOt5VB+EWjoseGAf1q7+uHj
	L81qTkMnfMZr8zRoL2pOspOPXKuKaOK44HO+merkPPE+7/ziIBgJvW9ERqgUcOv7dzlrx8Qep5NM9
	yjYo19iX1BVfZVUH4AQyKeISGkP6gJO2wFm3rlI80/bMLYJxnD0lC7Y72iJFVntjJAmRCSdUi1dsG
	N9xZY3kjxHu38k06ojGBfIfxQbEzPGpe38Ddq4c7MsGqs+iZ0dYjudVX+1DxwM1a/Jf7KiNiNF4ZD
	gXyyMsp6NI/BWo0gsi57xotc7w8mwoXZTjtmqpvTlUlumJb9qaGrynMQnD379eF4DGrWvLTGDIac2
	XdgyoTJxw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSjqo-0002Wr-Jk; Mon, 20 May 2019 15:05:18 +0000
Received: from sauhun.de ([88.99.104.3] helo=pokefinder.org)
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSjql-0002Vr-4m; Mon, 20 May 2019 15:05:17 +0000
Received: from localhost (p54B333DA.dip0.t-ipconnect.de [84.179.51.218])
 by pokefinder.org (Postfix) with ESMTPSA id 3853E2C2761;
 Mon, 20 May 2019 17:05:11 +0200 (CEST)
Date: Mon, 20 May 2019 17:05:10 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Subject: Re: [PATCH 10/10] docs: fix broken documentation links
Message-ID: <20190520150510.GA2606@kunai>
References: <cover.1558362030.git.mchehab+samsung@kernel.org>
 <4fd1182b4a41feb2447c7ccde4d7f0a6b3c92686.1558362030.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
In-Reply-To: <4fd1182b4a41feb2447c7ccde4d7f0a6b3c92686.1558362030.git.mchehab+samsung@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190520_080515_330990_3673171B 
X-CRM114-Status: GOOD (  10.67  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: kvm@vger.kernel.org, Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-pci@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-mm@kvack.org, linux-i2c@vger.kernel.org, linux-kselftest@vger.kernel.org,
 devel@driverdev.osuosl.org, Jonathan Corbet <corbet@lwn.net>, x86@kernel.org,
 linux-acpi@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-edac@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Mauro Carvalho Chehab <mchehab@infradead.org>,
 linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org,
 virtualization@lists.linux-foundation.org,
 linux-arm-kernel@lists.infradead.org, devel@acpica.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Content-Type: multipart/mixed; boundary="===============5440170162988656679=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============5440170162988656679==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6c2NcOVqGQ03X4Wi"
Content-Disposition: inline


--6c2NcOVqGQ03X4Wi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 20, 2019 at 11:47:39AM -0300, Mauro Carvalho Chehab wrote:
> Mostly due to x86 and acpi conversion, several documentation
> links are still pointing to the old file. Fix them.
>=20
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

Thanks, didn't notice that.

>  Documentation/i2c/instantiating-devices          |  2 +-

=2E..

> diff --git a/Documentation/i2c/instantiating-devices b/Documentation/i2c/=
instantiating-devices
> index 0d85ac1935b7..5a3e2f331e8c 100644
> --- a/Documentation/i2c/instantiating-devices
> +++ b/Documentation/i2c/instantiating-devices
> @@ -85,7 +85,7 @@ Method 1c: Declare the I2C devices via ACPI
>  -------------------------------------------
> =20
>  ACPI can also describe I2C devices. There is special documentation for t=
his
> -which is currently located at Documentation/acpi/enumeration.txt.
> +which is currently located at Documentation/firmware-guide/acpi/enumerat=
ion.rst.
> =20
> =20
>  Method 2: Instantiate the devices explicitly

For this I2C part:

Reviewed-by: Wolfram Sang <wsa@the-dreams.de>


--6c2NcOVqGQ03X4Wi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlziwiIACgkQFA3kzBSg
Kbb/+hAArOEJ2RcuEqvOP7Ge80J7VxtEVTCR0sWRFg/7cpRGLnwf1qLSAUlfAJYj
fUhZ9ANfeB4Y4ZltOPwJ34KNtZy/kYzYyoy/WgiNfJUrf+s7auOF+dMXRvBe8VyX
v/pHpAMzTf8rtNkaESOahPExL1lgrI2dShZa3Mxofm2eb3Kam0OJRr6Cvj7mA/Rq
PHq1QUlG+Y3hZdvAHjQ6GN6wr+pNnhqeSSAd3BZg5MZQpPRiaK+C4tPkqOD/TNwX
9+iPJTMPhWsdei4UO1POHGCOclFatxkPOQm9JjsTD1h1lEJK7Afs1cTCd0crwpzW
nQuj+MSjKTqcOwQ4hF1x6PwlbJm4Hq/+r6b50UsnQYai6pt7Khp9OISmYTxPQhgI
8aXZbjsMB3k9ebYulULGdF0f3p/IPoqneTUf3yi5OxNbhJ8eyNcQ4l35MP9hEyYb
H/9a/G4GXP7CLyCtKd53OtNeE1tTF4zGKIhe7v9OInHolA3gLx1R1rxiBeQB+XyA
NO/4FdEIZ1QWAyl7m1aWBtYpar2uvFyEhZWG3sVhZYsA9dQNBfgzFSu60wus7hy4
D9FxYijaEnHZvPivrTwfcp8ittAvsIrM3xANcOhWXEU6eC6w0KX15QiiyPQUbssL
H3fPVUBxQlwicyY98Dvh7eJmnD1WEsMcDmDI5RqrAxhdD/bxbN0=
=b4+p
-----END PGP SIGNATURE-----

--6c2NcOVqGQ03X4Wi--


--===============5440170162988656679==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============5440170162988656679==--

