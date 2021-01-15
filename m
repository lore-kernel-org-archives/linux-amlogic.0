Return-Path: <SRS0=d+9B=GS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9771BC433E0
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Jan 2021 09:43:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 255FD2339D
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Jan 2021 09:43:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 255FD2339D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lespocky.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YYek/OCSCxd3OacAQ81So2dHhrDLz4G1cANbmsHEGZY=; b=hlHBUxdvo99C3fhTv3VUtv4l1
	qRj+Y2GxtUMt3i0mtP2CsWKN091PyhCRlNFGAHDH0tJZ+zGdIpqlMqfRkx7teICrjyMxOIDy8mwRI
	dRDQ5TCMVsKXOgHIq47uNucaSsT4vW65A14D521ZyYiJZpc1jGN3RIHdSO1zZlir2NJsnR6vDfsPb
	vXtPay39Nq9JL0iHw0+SZhGg56mJxrxDrZG3aEb3oasJW1uy4TnEGGO7w8QHEVlC9TIs2UK4g+7BB
	VnUr8JADO1f49O0jnVJvrzi1M6IGxBRbKJzo8Ch9hFGTQeKJh8mE4wkSz2ddOxQpCb9x1VFK2ISty
	s5t8mteiQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0LdJ-0005Ct-Cl; Fri, 15 Jan 2021 09:43:05 +0000
Received: from mout.kundenserver.de ([212.227.17.13])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0LdE-0005Be-E3; Fri, 15 Jan 2021 09:43:01 +0000
Received: from methusalix.internal.home.lespocky.de ([109.250.106.207]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MLhsE-1lHsVq2E4W-00Hh89; Fri, 15 Jan 2021 10:42:46 +0100
Received: from falbala.internal.home.lespocky.de ([192.168.243.94])
 by methusalix.internal.home.lespocky.de with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94)
 (envelope-from <post@lespocky.de>)
 id 1l0Lcu-0004aO-T6; Fri, 15 Jan 2021 10:42:42 +0100
Date: Fri, 15 Jan 2021 10:42:39 +0100
From: Alexander Dahl <post@lespocky.de>
To: Jeff LaBundy <jeff@labundy.com>
Subject: Re: [PATCH v9 1/4] dt-bindings: mfd: Fix schema warnings for pwm-leds
Message-ID: <20210115094238.s36rrgmpq63a622p@falbala.internal.home.lespocky.de>
Mail-Followup-To: Jeff LaBundy <jeff@labundy.com>,
 Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Alexander Dahl <ada@thorsis.com>, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-amlogic@lists.infradead.org, Rob Herring <robh@kernel.org>
References: <20201228163217.32520-1-post@lespocky.de>
 <20201228163217.32520-2-post@lespocky.de>
 <20210114100312.GL3975472@dell>
 <20210115035050.GA27243@labundy.com>
MIME-Version: 1.0
In-Reply-To: <20210115035050.GA27243@labundy.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Scan-Signature: cebb1f1cd8c059b76424c23a7b2a6eee
X-Provags-ID: V03:K1:NOWsO8Ky6tGtOQE7h7YxhW4mI24HkwY3RcOJvf3uTx/DSwn0422
 t3p/GnUrPrcY6dSeMEjz4Gi1aPxDyKCZbGnRdPknJs1xPu/QdBkX4OTdDgKFTLX5HDq+Qoo
 3g79+oqgBQOupbSUNvA4eKCRAU4A9edEdOR12g5fIzuwHx0TmP9mhGQIlVKWlQDcnr4PlCK
 gNvY+sW4GDySGzNlEuwFw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:EY0QcSCryvE=:5JD5RiuQuL8HuXAa4U4PyI
 wKLLWN3SWcddfqVqVFKdjScZS9LtLYCJaOZR0CfVfLmmLLWmQD0rJH6FQy29bRv/TdUCUrnFE
 dbLMVVMftbkID9hoM+WDk3/e1O/kwekew1qtYEaXdGSeG7SELWcQvSSm24k+Uwd6UdzNuMPXM
 GiKXuZSC01P1LXGumFcYQLEx0MX1ofOYqH5xLNXFaySgSd5J3JbhPrzmKPb8TTrN3JNDwJZPD
 ehkTV005W2KyePA5MeEu4KJLNmvikv6J00shbQCwLyil/Zclpi5YXHPWJEqFRvidKKeWOoKvh
 AbG/3Jom1XgmOqedpuYn6mWY777mxKHc3VxohDWmqwL6KkhQBKbRP4XHeV+5d3F1+XoOp2hPF
 2cfZrjR1nslQ/yoYi14CXdc+Buk4Cn0r8X6t7rk8KPaBs0JAMPdteMBAflSOH
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210115_044300_689880_6FB41300 
X-CRM114-Status: GOOD (  24.78  )
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Alexander Dahl <ada@thorsis.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Alexander Dahl <post@lespocky.de>,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 Lee Jones <lee.jones@linaro.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-leds@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============1502854747707434954=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============1502854747707434954==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="h2j7lras76hzpifw"
Content-Disposition: inline


--h2j7lras76hzpifw
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Jeff,

On Thu, Jan 14, 2021 at 09:50:50PM -0600, Jeff LaBundy wrote:
> On Thu, Jan 14, 2021 at 10:03:12AM +0000, Lee Jones wrote:
> > On Mon, 28 Dec 2020, Alexander Dahl wrote:
> >=20
> > > The node names for devices using the pwm-leds driver follow a certain
> > > naming scheme (now).  Parent node name is not enforced, but recommend=
ed
> > > by DT project.
> > >=20
> > >   DTC     Documentation/devicetree/bindings/mfd/iqs62x.example.dt.yaml
> > >   CHECK   Documentation/devicetree/bindings/mfd/iqs62x.example.dt.yaml
> > > /home/alex/build/linux/Documentation/devicetree/bindings/mfd/iqs62x.e=
xample.dt.yaml: pwmleds: 'panel' does not match any of the regexes: '^led(-=
[0-9a-f]+)?$', 'pinctrl-[0-9]+'
> > >         From schema: /home/alex/src/linux/leds/Documentation/devicetr=
ee/bindings/leds/leds-pwm.yaml
> > >=20
> > > Signed-off-by: Alexander Dahl <post@lespocky.de>
> > > Acked-by: Jeff LaBundy <jeff@labundy.com>
> > > Acked-by: Rob Herring <robh@kernel.org>
> > > ---
> > >=20
> > > Notes:
> > >     v8 -> v9:
> > >       * added forgotten Acked-by (Jeff LaBundy)
> > >       * rebased on v5.11-rc1
> > >    =20
> > >     v7 -> v8:
> > >       * rebased on recent pavel/for-next (post v5.10-rc1)
> > >       * added Acked-by (Rob Herring)
> > >    =20
> > >     v6 -> v7:
> > >       * added warning message to commit message (Krzysztof Kozlowski)
> > >    =20
> > >     v6:
> > >       * added this patch to series
> > >=20
> > >  Documentation/devicetree/bindings/mfd/iqs62x.yaml | 5 +++--
> > >  1 file changed, 3 insertions(+), 2 deletions(-)
> >=20
> > Failed to apply:
> >=20
> > Applying: dt-bindings: mfd: Fix schema warnings for pwm-leds
> > Using index info to reconstruct a base tree...
> > M	Documentation/devicetree/bindings/mfd/iqs62x.yaml
> > /home/lee/projects/linux/kernel/.git/worktrees/mfd/rebase-apply/patch:3=
4: indent with spaces.
> >             led-1 {
> > /home/lee/projects/linux/kernel/.git/worktrees/mfd/rebase-apply/patch:3=
5: indent with spaces.
> >                     label =3D "panel";
> > warning: 2 lines add whitespace errors.
> > Falling back to patching base and 3-way merge...
> > Auto-merging Documentation/devicetree/bindings/mfd/iqs62x.yaml
> > CONFLICT (content): Merge conflict in Documentation/devicetree/bindings=
/mfd/iqs62x.yaml
> > Recorded preimage for 'Documentation/devicetree/bindings/mfd/iqs62x.yam=
l'
>=20
> It looks like the following patch already beat this to the punch:
>=20
> 8237e8382498 ("dt-bindings: mfd: Correct the node name of the panel LED")

Which tree is that commit on? This one?

https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git/

> That patch does not retain the LED's label or rename the parent node to
> led-controller, however. The label hardly matters for this example, but
> perhaps we still want the parent node change to follow leds-pwm.yaml.

Should I rework the patch then to have that change only?

Greets
Alex

--=20
/"\ ASCII RIBBON | =BBWith the first link, the chain is forged. The first
\ / CAMPAIGN     | speech censured, the first thought forbidden, the
 X  AGAINST      | first freedom denied, chains us all irrevocably.=AB
/ \ HTML MAIL    | (Jean-Luc Picard, quoting Judge Aaron Satie)

--h2j7lras76hzpifw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEwo7muQJjlc+Prwj6NK3NAHIhXMYFAmABY4oACgkQNK3NAHIh
XMab+xAAiHeOZzBFG4YB0oYV5i8ACoy6/kajEnF698M7uAJyVfCdryYdg9vejNsY
N43fEtfkWgqaNph449fNAFJIzrfCez8Y7uz3HHXaSfPSYkXpDsM+248YuSUEBBV1
AMji0bj3CiUGh4WtVfLBR5L13xeSR/tKKoZqpIaFBgOlsii/8W+Dc7vw2CoFIE6U
Ac4eVKylR8D/619Oij//lMFT3YiEUEsKmH2oiQ21yKHL5IuYMmGJAMZJg3COgVf+
Abn1i7Dln8iz3OMdISlUgClhRpNv5DGXf8U1z3JeaWWK1f0EQYfgMWy8gz8zSmv9
v07Bx90iY8YABFkdIRXJTbm4kKfiZ9WQQepfN2sHuQXvnKM3aKORx6o43fIR/A1G
yaCIsU49ONg/zWQtdLMzXomLdIfhZNx0poREu01GhLVbWNQLtZzTCnVRNfp/tCkz
irqNzETxwk6MjHV2xgY1kJ3Sx4rM/BVX+sYO/fwdKT95v/voCJNob52H16w6TUue
hIKktspa97v9y31m7ejI/8WHMt9Qgb+aHWvRtFaNI7g3XF9UDUxGD5WRzor8a/Ii
MOh2Tr5tS9nl0BdR2iHn4FMWkSwnr8Q4DiQLkvdNW5e4/92ODuMN/q1A66kxiWm5
KrIpfaNcUmg/NBYoE9vnOKej5D8dNQryaiVb6TwSpbVYJ3vVJyE=
=wtKq
-----END PGP SIGNATURE-----

--h2j7lras76hzpifw--


--===============1502854747707434954==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============1502854747707434954==--

