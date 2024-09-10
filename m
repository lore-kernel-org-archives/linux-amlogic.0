Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADA10EDE99A
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Sep 2024 16:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RjyZe5o7AGquDo+sa55ACeRgsFn+aMer/qHFnt0h9Rk=; b=FhrA7nZaunBjYmAU3afCcEmjM2
	JKx9ByrvJJeJQcRtAWhHjakpA0IylEUyq/AIDZQyU7IpY0M4clen8MBJbegT8AZOoyjuD5vm78XgT
	4D9PjjYEt3fulYE2LNrRP46SrYZ8JCsi6izhPM4qI8IVfqQIzZKMrLIuN25NwgPDhihhHBN2QocR2
	maIwYZU/YJZVcuzmpGTe3Wm8z1BANgRJoLwmMsSUyJFlSbIW2YQbSDqwPHvatLGAm+Qs49dt+ueEK
	pSIOIp6fOdi8cSCDiNcgw6BM/jBxSj0E0DaTIz5YyHL6f3eKzKxZrsWfuVg8n1QM32gRwJryc8Z+P
	1cbWuAcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1so3QH-00000006HkT-2SaJ;
	Tue, 10 Sep 2024 16:08:57 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1so3QF-00000006Hjm-1AH0;
	Tue, 10 Sep 2024 16:08:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 856355C034E;
	Tue, 10 Sep 2024 16:08:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59CF6C4CEC3;
	Tue, 10 Sep 2024 16:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725984533;
	bh=Izu951Sl9t2/R5OLHami79GgbINGuYVw9e04vhzirIw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aak9+NUdwOtEelTeAYRYCgqaTI7v898hkuQZ14wneZHbota+fjdl0Z9+E3C1rl2yo
	 bUviukvri0YZDUzG6ATWCuXLkjGJz9kwFROCzrtU8VNmg5lV5B1f4KDi9IWHIT72TM
	 s9rQeg9gNAPDN3p16PaEk/W4nemi5/8lERDzLOH9ZzBUuymcTfBplkMvRQIu+uqUF/
	 mqYycX3ieZpJEyZhfA8ma3xqgrTWRJvj3ZM4o94WHnW21x1MFSYUudlvffO0QZqfEW
	 ZYiH+Z2WC7dpetwy7ze4pqxBZd5RA3RbBuiT4gC3njhM7kF7VPEB5yG6gyS5CwUekm
	 kanee57Fk/nwQ==
Date: Tue, 10 Sep 2024 17:08:48 +0100
From: Conor Dooley <conor@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: George Stark <gnstark@salutedevices.com>, Rob Herring <robh@kernel.org>,
	conor+dt@kernel.org, krzk+dt@kernel.org, neil.armstrong@linaro.org,
	khilman@baylibre.com, jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com, hkallweit1@gmail.com,
	linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel@salutedevices.com,
	Dmitry Rokosov <ddrokosov@salutedevices.com>
Subject: Re: [PATCH v4 2/3] dt-bindings: pwm: amlogic: Add new bindings for
 meson A1 PWM
Message-ID: <20240910-kerchief-custody-a0741f9a256c@spud>
References: <20240710234116.2370655-1-gnstark@salutedevices.com>
 <20240710234116.2370655-3-gnstark@salutedevices.com>
 <20240712125219.GA472311-robh@kernel.org>
 <55f73e79-2d21-48ba-8486-26ee168c7bc3@salutedevices.com>
 <20240725-excursion-waving-0e0ad54006d4@spud>
 <ak53ha3kltm24s45n5pczvibtltzocg33inpnro4bjeolu25re@33lae7y7qzvw>
MIME-Version: 1.0
In-Reply-To: <ak53ha3kltm24s45n5pczvibtltzocg33inpnro4bjeolu25re@33lae7y7qzvw>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240910_090855_432542_58EDC71E 
X-CRM114-Status: GOOD (  23.83  )
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
Content-Type: multipart/mixed; boundary="===============7154557334541142469=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============7154557334541142469==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="GfjYjimy2LOyoHtK"
Content-Disposition: inline


--GfjYjimy2LOyoHtK
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 10, 2024 at 10:01:39AM +0200, Uwe Kleine-K=F6nig wrote:
> On Thu, Jul 25, 2024 at 03:08:53PM +0100, Conor Dooley wrote:
> > On Fri, Jul 12, 2024 at 06:12:26PM +0300, George Stark wrote:
> > > Hello Rob, Conor
> > >=20
> > > On 7/12/24 15:52, Rob Herring wrote:
> > > > On Thu, Jul 11, 2024 at 02:41:15AM +0300, George Stark wrote:
> > > > > The chip has 3 dual-channel PWM modules PWM_AB, PWM_CD, PWM_EF.
> > > > >=20
> > > > > Signed-off-by: George Stark <gnstark@salutedevices.com>
> > > > > Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
> > > >=20
> > > > Missing ack from Conor. When you submit new versions, it is your
> > > > responsibility to add tags.
> > >=20
> > > I had Conor's ack in my mind but his response was related to the
> > > squashed patch (a1 compatible + power domains) and the current patch =
was
> > > a bit different that's why I didn't dare to add the ack.
> > >=20
> > > Conor, do you mind if I resend this patch (and may be [PATCH v4 1/3])
> > > with your ack?
> >=20
> > Ye, both are fine :+1:
>=20
> I interpreted that as an ack for patches 1 and 2 and applied these to
> https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/fo=
r-next
> . I guess that interpretation is fine, please tell me if not.

Yah, I was okaying my ack being added to both patches in a resend.

--GfjYjimy2LOyoHtK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZuBvDQAKCRB4tDGHoIJi
0hgwAP9JpE/xlF+q9oXUlWavKoI1Z11cHC528mE+fTzlDB/QGgEA3kEAQDDGtmlX
1TMFRdnlnCWQIn11dhQluJFv6qn3nQ4=
=v7N1
-----END PGP SIGNATURE-----

--GfjYjimy2LOyoHtK--


--===============7154557334541142469==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============7154557334541142469==--

