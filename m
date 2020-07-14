Return-Path: <SRS0=jorr=AZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D4F8C433E5
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 Jul 2020 13:30:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1741224B1
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 Jul 2020 13:30:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dpX9RbgJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1741224B1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dlrobertson.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cZ/yCJEl75Wf/gI4PvmkG2GTKRC7Fr9LFzzZ8i0qk/c=; b=dpX9RbgJYh9h6xdRjQMBwehQJ
	cwhuvXDYUormpu17LtwN8E6hEz8TgroDepi/If6cJGyMRFBWv0Ji+eZiePC0FI2+YAsQt8vWJzN1w
	t8VelIsBd2XnnYhOddp7A6st57anfFZJM5QMnq/qvPDXMkeCXQugtdIu/c961B7RScZFT/iY9h+8l
	EhO8SuO1lFVJshOQkB5bpOyHQAbwjvqN0o0QWmO3j4AQwA8IbPFWbagkWh/oXmKDMG1lMTZQkEqVM
	pl2xtJGIeHKlm1E4GZThXYWVuwYf1MkMQZrIgGGWrrn2uNRSm+cr5OEMawal8qNPbzod2TZ/7LAVU
	NwZdOkAMQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvL15-000249-M7; Tue, 14 Jul 2020 13:30:39 +0000
Received: from sender4-op-o17.zoho.com ([136.143.188.17])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvL13-000232-2W; Tue, 14 Jul 2020 13:30:38 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1594733431; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=a4/bFkvIpFwG5LcsbUwHW050lXfCUc+YAXwi2/0OdkK/+aVS4B1dH3TwbL47zpOat2yBOFr/lYJfimRdiBk4qqTkh9LpTHel0jxhCnZjl0gkqRgijmwkkyLffqVXjYtLqnpbdhw9CqftpBZeaUNPrGHdeO9ut8x6/TOwHGMIx/I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1594733431;
 h=Content-Type:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=5aS2Om7zs7QC5qSvMF4Wg9nw45NYTT5ngFfOSHgfKhg=; 
 b=TJBt7X0wcY4Htu37AS/uU/8o7FCrOoA4JDcjji/0PyetbrBOAR65VsL2ePFlECS1GuXyIcXtbqSJPtnWJ9IKsNUhLWByT2bPjrYN5joQsolUvO6pHpyjl6Ap7jLc7JzzVrN9JYww+J3+07ZWWHBaSiweZP5Huxva0gorK8DCrRY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=dan@dlrobertson.com;
 dmarc=pass header.from=<dan@dlrobertson.com> header.from=<dan@dlrobertson.com>
Received: from gothmog.test (pool-108-28-30-30.washdc.fios.verizon.net
 [108.28.30.30]) by mx.zohomail.com
 with SMTPS id 1594733427187422.3583129792786;
 Tue, 14 Jul 2020 06:30:27 -0700 (PDT)
Date: Tue, 14 Jul 2020 09:30:24 -0400
From: Dan Robertson <dan@dlrobertson.com>
To: Anand Moon <linux.amoon@gmail.com>
Subject: Re: [PATCH 0/1] usb: dwc3: meson-g12a: fix shared reset control use
Message-ID: <20200714133024.GA27406@gothmog.test>
References: <20200713160522.19345-1-dan@dlrobertson.com>
 <CANAwSgR3ry19bxi8ZG026tHi-Bj+mP_O=PHuzUR_ujhjsdeLzA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANAwSgR3ry19bxi8ZG026tHi-Bj+mP_O=PHuzUR_ujhjsdeLzA@mail.gmail.com>
X-Zoho-Virus-Status: 1
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200714_093037_194001_413B047E 
X-CRM114-Status: GOOD (  29.45  )
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
Content-Type: multipart/mixed; boundary="===============2510506273190588299=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============2510506273190588299==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="sm4nu43k4a2Rpi4c"
Content-Disposition: inline


--sm4nu43k4a2Rpi4c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Anand!

On Tue, Jul 14, 2020 at 12:26:57PM +0530, Anand Moon wrote:
> hi Dan,
>=20
> On Mon, 13 Jul 2020 at 21:37, Dan Robertson <dan@dlrobertson.com> wrote:
> >
> > When testing suspend for another driver I noticed the following warning:
> >
> > WARNING: CPU: 1 PID: 5530 at drivers/reset/core.c:355 reset_control_ass=
ert+0x184/0x19c
> > Hardware name: Hardkernel ODROID-N2 (DT)
> > [..]
> > pc : reset_control_assert+0x184/0x19c
> > lr : dwc3_meson_g12a_suspend+0x68/0x7c
> > [..]
> > Call trace:
> >  reset_control_assert+0x184/0x19c
> >  dwc3_meson_g12a_suspend+0x68/0x7c
> >  platform_pm_suspend+0x28/0x54
> >  __device_suspend+0x590/0xabc
> >  dpm_suspend+0x104/0x404
> >  dpm_suspend_start+0x84/0x1bc
> >  suspend_devices_and_enter+0xc4/0x4fc
> >
> > In my limited experience and knowlege it appears that we hit this
> > because the reset control was switched to shared and the the use
> > of the reset control was not changed.
> >
> > > * Calling reset_control_assert without first calling reset_control_de=
assert
> > > * is not allowed on a shared reset control. Calling reset_control_res=
et is
> > > * also not allowed on a shared reset control.
> >
> > The above snippet from reset_control_get_shared() seems to indicate that
> > this is due to the use of reset_control_reset() in dwc3_meson_g12a_prob=
e()
> > and reset_control_deassert is not guaranteed to have been called
> > before dwc3_meson_g12a_suspend() and reset_control_assert().
> >
> > After some basic tests with the following patch I no longer hit the
> > warning. Comments and critiques on the patch are welcome. If there is a
> > reason for the current use of the reset control, I'd love to learn why!
> > Like I said before, I have not really looked at this driver before and
> > have verify limited experience with reset controls... Was working on
> > another driver, hit the warning, and thought I'd take a shot at the
> > fix :-)
> >
> Thanks, I was also looking into this issue

Awesome!

> So best Fix to this issue is to drop the call of reset_control_assert
> from dwc3_meson_g12a_suspend
> and drop the call of reset_control_deassert from dwc3_meson_g12a_resume
> With these changes we do not see the warning on suspend and resume

We definitely would avoid hitting the warning without the
reset_control_(de)assert calls in suspend and resume. That is a valid use of
the reset control, but why would that be best?

=46rom reset_control_reset():

> * Consumers must not use reset_control_(de)assert on shared reset lines w=
hen
> * reset_control_reset has been used.

If we use reset_control_reset() then we can not (de)assert the reset line
on suspend/resume or any other time. Wouldn't we want to be able to
(de)assert the reset line? And why do we no longer want to (de)assert the
reset line on suspend/resume?

> > Can you try this attached patch?
>=20
> Best Regards
> -Anand

I think I had already tested something similar. Removing the (de)assert cal=
ls
but keeping reset will definitely remove the warning, but it means we can n=
ot
(de)assert the line. My guess is that this is not what we want, but I could=
 be
wrong. Thoughts, input, or references to documentation on this would be
appreciated.

Cheers,

 - Dan

--sm4nu43k4a2Rpi4c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEF5dO2RaKc5C+SCJ9RcSmUsR+QqUFAl8Ns24ACgkQRcSmUsR+
QqV1fA//TIDTawaZrYwSlXoTvSYzWf101qruw0k8D6Mk8/iX3lU7m9aTi8LIS7S8
82uAzZlLsufjz60YtWXiDFQzDUZDLEOc9Ga8lGpZRzdQlFDzpTe2ynr3aK69cpHW
/ix5ws2mYYtYaER8IZAeUFahvKppcyDpRhPzjzUcdkGj9PWvJdhWXtm7b7QE8/0e
lj9SEKaSFSoQB57coEs5Q2EDLPw907zu6kyiZsbhaad677EhaTS3jmikeVhD41SX
GEOoyl+RgK+TqD/+bjSvzjMIsfwXM4DnWXy6T/kcBCRaipKi/H8z9kiFyk3reKQj
mQ7M6+c0SZFz5yRL/n824dSr8QuYUQ0iCMtYs21GXzGafm2DBb6BU5HlildjsGxm
MBDt+3sMRVzbmiTJjs4w1i/jT7KM2Rs3KozFrYYBfnL/jJu8J7ntJI3mzRx6wQIq
L4NzU7fChJZyTLsQrWVyvBcXL7/PYk6lxM3+iu7XYfZ6leCfmRRkrTEGLSAECHUf
sFzmcz1oqM0cRGI8YfOPBwVqM905e9Tmwvb/jheUzEZcPQv95VnImHYTlVO10dL4
gaiYTtWj0GgfZJ/zKbcjLhi2zy39xlCxBh5A1hdPqGajjwSGDrg5qQt9+oTHQI5h
lIptHP8xcjWxx4JjVIQaB+YsACUEYXMllZzVejW/2AL4aJCAhQQ=
=OtX0
-----END PGP SIGNATURE-----

--sm4nu43k4a2Rpi4c--


--===============2510506273190588299==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============2510506273190588299==--

