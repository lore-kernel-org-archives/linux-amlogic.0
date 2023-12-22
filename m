Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEF7FC46CD8
	for <linux-amlogic@archiver.kernel.org>; Fri, 22 Dec 2023 12:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lDMIuoG4yCoAqnWjUT9LMgLL7eyj8+2nn/0/3+HDNWg=; b=DW7UiHr7FHLfE8pDL5KQ7ojgpm
	h9Bpzj0n/A3P++Syxp6mRH1ui68e/fW9fCnkSyDi62hVH6K98w91LxzAolHf194FIGAkwtQ46xwx2
	qVkT7TwgyjzBPT2p12/JsH1u2VVv1HdkjO1YMIdsAkTJGRFjIl8TTIMbKXmFkB824BB2tPhtuWUSj
	ZhPAc1uUll4+kmuyhUOC/rLvekvPk6m5N/4YXN4HNeJg54pdAMVXtMbp4y/GVXrWuQbZiYtmnxlse
	mra7seIewAlwi/an42a28LWJWFn434Nr+oypNtyLJRteCVS6lxKQ1YDwdNpOgnmVDiDscFGQOsYcV
	/oSrZDvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGeZY-005vOM-14;
	Fri, 22 Dec 2023 12:24:12 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGeZV-005vO2-1Y
	for linux-amlogic@lists.infradead.org;
	Fri, 22 Dec 2023 12:24:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id B5635B822E3;
	Fri, 22 Dec 2023 12:24:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7788CC433C7;
	Fri, 22 Dec 2023 12:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703247847;
	bh=5JEbd/0MfkqBn9EcZaazmNPVjZ1aK33sdc1b4Cp4oj4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KCHkJWROWNx4DEjAnaNatwrpAXjQFrlSUJOrOs2KHXBXLKWYRH1h4a/WbuvA4d09+
	 QyVFjAe0veZUhZ1mgjFItkQM2fXXhvyhfnBenMXLZvf7KG8hwZuq7YzVWpQ0soxSPa
	 wgwNheuAlzRsJ4yay9zocZWfjEbXFZ53Xam8QcHGFwj8Ozb+7KDHdAyzBtBqIzUQvw
	 lnGj0noKdGZyqecQpEPH94H4CphrJegrhDdhrZRnu7sQjqMqN49I9JOkb9VvgOJNPC
	 f/eVscRrHDb8ZPS4Ff1JtE8xPxyxQDHVhtJW/UN8svHbA8LueZrE7cG1oF6F4ztMKY
	 uifkqV0LImykg==
Date: Fri, 22 Dec 2023 12:24:01 +0000
From: Mark Brown <broonie@kernel.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: lgirdwood@gmail.com,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-pwm@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Thierry Reding <thierry.reding@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Dmitry Rokosov <ddrokosov@sberdevices.ru>
Subject: Re: [RFC PATCH v1] regulator: pwm-regulator: Fix continuous
 get_voltage for disabled PWM
Message-ID: <9bea64d5-8689-48f0-a081-5da60434e6c0@sirena.org.uk>
References: <20231221211222.1380658-1-martin.blumenstingl@googlemail.com>
 <0c99b575-5cf2-4bd6-8cfd-af19f5fd58da@sirena.org.uk>
 <CAFBinCDJnVzE2sMwu52MQGTKW7dtCuUoj63ZZHhJPJO0+dZDkg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFBinCDJnVzE2sMwu52MQGTKW7dtCuUoj63ZZHhJPJO0+dZDkg@mail.gmail.com>
X-Cookie: Familiarity breeds attempt.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231222_042409_693219_70B73A07 
X-CRM114-Status: GOOD (  12.63  )
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
Content-Type: multipart/mixed; boundary="===============1300983262021806533=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============1300983262021806533==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="juKFXjvLaxOmiLZO"
Content-Disposition: inline


--juKFXjvLaxOmiLZO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 21, 2023 at 11:42:29PM +0100, Martin Blumenstingl wrote:

> The vendor BSP includes a custom u-boot with lots of relevant
> information for which there's seemingly no documentation.
> It seems that 1.1V is what should be used during normal operation.
> 0.86V is what can be used during system suspend (when power to the
> Cortex-A5 cores is turned off and an integrated ARC core is taking
> over for wakeup purposes).
> Hence the supported voltage range of 0.86..1.1V

That sounds like the constraints are wrong actually, if 0.86V can only
be used during system suspend then it shouldn't be in the valid voltage
range - the suspend voltage doesn't need to be in the range used during
normal operation.  If we might use it during runtime suspend then it
does need to be there though.

--juKFXjvLaxOmiLZO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmWFf+AACgkQJNaLcl1U
h9DTWgf/fUEmRlyJxxj7iLDuRYL+wIRD8ml/KWBIrzLV0ywoeLasM4HG3AgPcOlo
gk4P9Zo3xCf2smtb/Dqal7hjM6i/DvKFNN/u4aQiVZdBA9v1LL+Qtd+ZSfs4/f49
/l8mGJn5/S9FDZroHkIaVVyJMIucUua3dLfGdFA0Wpmcufd+W6TYYCuy1nx4zF+8
d++E/GpQY6O/sZdb5McjKcN/17ylJo29NgyTRRtT6lwua+jTeDzEv0iOSEENwjUl
Wws4Vg79aFs0amAtbLjuKKPQEEgQWNcpRB2Ge52JsFT/69ol9mBeAozdCTgFbP5j
Dr3W71uo+hsk9kjSnL/ZmcjRnmjCog==
=ijuO
-----END PGP SIGNATURE-----

--juKFXjvLaxOmiLZO--


--===============1300983262021806533==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============1300983262021806533==--

