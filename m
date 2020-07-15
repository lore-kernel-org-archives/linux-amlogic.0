Return-Path: <SRS0=rXaj=A2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5570C433E3
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 Jul 2020 03:18:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7242E2070E
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 Jul 2020 03:18:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Pfnw7svS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7242E2070E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dlrobertson.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jYu4kgtr6D3ORnM/Pg5OF0B72pBQoRJnGbAdrRQILBQ=; b=Pfnw7svSxM6wDuHFuFEbU/Chc
	2DxEWKXKBmEAKIiFcLSVpu0CvEmCnj94r2FKqHYOb0v6NeUxVkh7xKaP9xI+diohteZAXh7It7620
	3RLla2sGq6ZJbN87TG+ZO6DuLavk8Mrssf+rH0XpsjKiVUotCtvT5qKxrNhlgfLT5EP78TLpsFuAC
	wMllfnQVdEurxUj2Ev0c6LX3Y66xpgmN33P1pHlzMZCkMwxsU5dMgJDKZ/3PRJfYUyNmAzeFPO4pj
	7dUjyqFmRUXHWGHRx80U0gNL6szCeEPAxOt7rlo0PjEOLWcBO2yFP4B4ldyHqynQhZ4bHeGm1TCSV
	A/qKphHcw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvXw7-0006BP-HD; Wed, 15 Jul 2020 03:18:23 +0000
Received: from sender4-op-o17.zoho.com ([136.143.188.17])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvXw4-0006Av-Kg; Wed, 15 Jul 2020 03:18:21 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1594783094; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=M8jFZ5w31BGSKuDrRQFUlAWEZdPssNSV1ybtkuWCfaneZLF0NSCrHFbNGxzAwvwK1p+Nn5IhZXQOJfKcNNng39pWSlwZOuKxG4S2VGQdksF0wfhOKYs8aRBA7DSKVnImxrLG+caBEappQs9WcQFh0NVe9X9BKRER0sBJzaJOXVk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1594783094;
 h=Content-Type:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=f+1eAUhYomjoHe1caTpLxfdRQP9aa8Lrm5dd0dEOGWw=; 
 b=kQrLDj3chvXKzVfsNZWAP7Y4ILOnpl5N5sx9i+Awl43fOBZh9miWNGsk6lVDBO0Zfgy0b5TjX6nyL1q9+MFj6tOlrou0dTRdsvk2vC4SaLUrAWy1/TmGVkdjiZtU81863rwTdlm4xO776DqPv9XU6hGayQsBA37vKbl+M4dAWpc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=dan@dlrobertson.com;
 dmarc=pass header.from=<dan@dlrobertson.com> header.from=<dan@dlrobertson.com>
Received: from nessie (pool-108-28-30-30.washdc.fios.verizon.net
 [108.28.30.30]) by mx.zohomail.com
 with SMTPS id 1594783091744625.0831092958844;
 Tue, 14 Jul 2020 20:18:11 -0700 (PDT)
Date: Wed, 15 Jul 2020 02:58:49 +0000
From: Dan Robertson <dan@dlrobertson.com>
To: Anand Moon <linux.amoon@gmail.com>
Subject: Re: [PATCH 0/1] usb: dwc3: meson-g12a: fix shared reset control use
Message-ID: <20200715025849.GA8160@nessie>
References: <20200713160522.19345-1-dan@dlrobertson.com>
 <CANAwSgR3ry19bxi8ZG026tHi-Bj+mP_O=PHuzUR_ujhjsdeLzA@mail.gmail.com>
 <20200714133024.GA27406@gothmog.test>
 <CANAwSgQJgqHC41D8f+9J5cEpeg71PD-Oc08wQgzdjRPY6ZsuLQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANAwSgQJgqHC41D8f+9J5cEpeg71PD-Oc08wQgzdjRPY6ZsuLQ@mail.gmail.com>
X-Zoho-Virus-Status: 1
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200714_231820_810226_4299A8B7 
X-CRM114-Status: GOOD (  41.00  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Linux USB Mailing List <linux-usb@vger.kernel.org>,
 linux-amlogic@lists.infradead.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: multipart/mixed; boundary="===============4032105651202840337=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============4032105651202840337==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ZPt4rx8FFjLCG7dd"
Content-Disposition: inline


--ZPt4rx8FFjLCG7dd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 14, 2020 at 08:57:35PM +0530, Anand Moon wrote:
> Hi Dan,
>=20
> On Tue, 14 Jul 2020 at 19:00, Dan Robertson <dan@dlrobertson.com> wrote:
> >
> > Hi Anand!
> >
> > On Tue, Jul 14, 2020 at 12:26:57PM +0530, Anand Moon wrote:
> > > hi Dan,
> > >
> > > On Mon, 13 Jul 2020 at 21:37, Dan Robertson <dan@dlrobertson.com> wro=
te:
> > > >
> > > > When testing suspend for another driver I noticed the following war=
ning:
> > > >
> > > > WARNING: CPU: 1 PID: 5530 at drivers/reset/core.c:355 reset_control=
_assert+0x184/0x19c
> > > > Hardware name: Hardkernel ODROID-N2 (DT)
> > > > [..]
> > > > pc : reset_control_assert+0x184/0x19c
> > > > lr : dwc3_meson_g12a_suspend+0x68/0x7c
> > > > [..]
> > > > Call trace:
> > > >  reset_control_assert+0x184/0x19c
> > > >  dwc3_meson_g12a_suspend+0x68/0x7c
> > > >  platform_pm_suspend+0x28/0x54
> > > >  __device_suspend+0x590/0xabc
> > > >  dpm_suspend+0x104/0x404
> > > >  dpm_suspend_start+0x84/0x1bc
> > > >  suspend_devices_and_enter+0xc4/0x4fc
> > > >
> > > > In my limited experience and knowlege it appears that we hit this
> > > > because the reset control was switched to shared and the the use
> > > > of the reset control was not changed.
> > > >
> > > > > * Calling reset_control_assert without first calling reset_contro=
l_deassert
> > > > > * is not allowed on a shared reset control. Calling reset_control=
_reset is
> > > > > * also not allowed on a shared reset control.
> > > >
> > > > The above snippet from reset_control_get_shared() seems to indicate=
 that
> > > > this is due to the use of reset_control_reset() in dwc3_meson_g12a_=
probe()
> > > > and reset_control_deassert is not guaranteed to have been called
> > > > before dwc3_meson_g12a_suspend() and reset_control_assert().
> > > >
> > > > After some basic tests with the following patch I no longer hit the
> > > > warning. Comments and critiques on the patch are welcome. If there =
is a
> > > > reason for the current use of the reset control, I'd love to learn =
why!
> > > > Like I said before, I have not really looked at this driver before =
and
> > > > have verify limited experience with reset controls... Was working on
> > > > another driver, hit the warning, and thought I'd take a shot at the
> > > > fix :-)
> > > >
> > > Thanks, I was also looking into this issue
> >
> > Awesome!
> >
> > > So best Fix to this issue is to drop the call of reset_control_assert
> > > from dwc3_meson_g12a_suspend
> > > and drop the call of reset_control_deassert from dwc3_meson_g12a_resu=
me
> > > With these changes we do not see the warning on suspend and resume
> >
> > We definitely would avoid hitting the warning without the
> > reset_control_(de)assert calls in suspend and resume. That is a valid u=
se of
> > the reset control, but why would that be best?
> >
> > From reset_control_reset():
>=20
> Before entering the suspend state the code tries to do following
>      clk_bulk_disable_unprepare
>      regulator_disable
>      phy_power_off
>      phy_exit
>=20
> After this operation it's needless to call *reset_control_assert*
> I tried to move this call before all the above operations
> but still no success with this.

How so? Once the reset() is removed prope() and deassert() is guaranteed
to have been called before suspend, like what is in the patch and similar
to other uses of shared reset controllers, this is possible.

> Similarly on resume we should avoid calling resume
> *reset_control_deassert* earlier
> as the core is just reinitializing the devices.
>       clk_bulk_prepare_enable
>       usb_init
>       phy_init
>       phy_power_on
>       regulator_enable
> >
> > > * Consumers must not use reset_control_(de)assert on shared reset lin=
es when
> > > * reset_control_reset has been used.
> >
> > If we use reset_control_reset() then we can not (de)assert the reset li=
ne
> > on suspend/resume or any other time. Wouldn't we want to be able to
> > (de)assert the reset line? And why do we no longer want to (de)assert t=
he
> > reset line on suspend/resume?
> >
> > > > Can you try this attached patch?
> > >
> > I think I had already tested something similar. Removing the (de)assert=
 calls
> > but keeping reset will definitely remove the warning, but it means we c=
an not
> > (de)assert the line. My guess is that this is not what we want, but I c=
ould be
> > wrong. Thoughts, input, or references to documentation on this would be
> > appreciated.
> >
>=20
> As per my knowledge suspend to mem will do complete power down of the
> devices with support suspend and resume feature sequentially and then it =
tries
> to bring the device up one by one.
> So it should also take care of reset lines as well.

So do we only _actually_ care about the reset line in the probe? Seems like=
 we
should remove the reset controller from the structure if that is the case.

Cheers,

 - Dan

--ZPt4rx8FFjLCG7dd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEF5dO2RaKc5C+SCJ9RcSmUsR+QqUFAl8OcOcACgkQRcSmUsR+
QqXV9g//Xrbt00SopkjisgfWqpjjMVmZ5rp3V6VXDUuu6vw8xK8zwu3QS6icnuNd
6K0VAmrPr/3pye6ArrYi0K0O61oyh6xpDGUx2psu3XM0tDWWoKXIuoGLtnZsaT85
781I0iU08oFtTmIVzm0qxMH1acDg4EiQNBwQou6Nh3Xu8qNWntgT5JkpV9VTQxAU
+uzvz6g8SlEDaRRTEV/vRlrog0Afmg1Cj5CSW8fn0M6TFUUn7xL4cPw8q1uBXKvu
IHYS88jmWjapGVcKO8NveQFsq0jIoooHTn1QDt1mLdJ6b5AoUc4RMxQaY6wb+sPH
KUFtoNleGeCO+pHEbTwZj/hHHlJEjWuAJgpLZ3Anw5HJFH2qJb0zKxlSkzpdBaAD
V+GfcgPNPqP3QT9b7E3FkPC6ZoFiwTybHmDQNx3TSUsVenBEGW+kCW8AnhK4ISQH
gDjXGWjvQxmx7MEafjJBmqO9MuJjG1E9Du4QkFBMK9iZ4agdyrEvBsws3dh6fQ+w
XhzO5exC9RzBSJ8JXfvDONDNDorsEaVWFC6OmAVmXZcZTcytlR3z4tO+QxOX75CZ
bf/uk/UMbDVdde4Yw9TWbF0m4RGRl06KwYDcGZiWfYBNUZcnnO6JsLpWNS01nqPv
D0NGL0UOu7ypPRkRQe1k6fx/N9iD5jF6OvOFyZqAc+9XqMvQfTo=
=R7ca
-----END PGP SIGNATURE-----

--ZPt4rx8FFjLCG7dd--


--===============4032105651202840337==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============4032105651202840337==--

