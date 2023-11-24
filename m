Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0C08C61DF4
	for <linux-amlogic@archiver.kernel.org>; Fri, 24 Nov 2023 12:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YDiTtPb7TZHk6NuyvRr3zLV1r1iucKpF/iS+A+lwvSU=; b=v4j7+Ftre8TWqgdFt3aqh/67Aa
	KYVYOgkVTb6Em1A4SfKD7P5A1fcJj4wSJxedRuC1rDcadGMtFdKye6axxS3zHnxsXHH27IDeKYsIB
	tZkl98tF7I6k9cetdEDQcFChXLjstgg4rKr8CI7hQkaKVlbmiHONXHF8/1911t+QTPKbQZH7X/OZ/
	lyioTFCoh5+dy85SaOoTN9fsmmtLEm5Ky7At0N2HPpgVvxgS2RGoj5eMZGomaHtrdbxAWNoQyC8+I
	nSGqe1i2ndBIlCcpKrgErAhxlND0dfcUHkReJW9FvidNKhNsxCoYi1H773B5lh2rx7HcgpyUS1ywH
	xMl4vJtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6VFn-007C6u-0L;
	Fri, 24 Nov 2023 12:25:51 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6VFj-007C4K-25
	for linux-amlogic@lists.infradead.org;
	Fri, 24 Nov 2023 12:25:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 969E8CE28E8;
	Fri, 24 Nov 2023 12:25:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D6D1C433C7;
	Fri, 24 Nov 2023 12:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700828737;
	bh=vlxD35wUZLsa3nu20qeMCvKiG+VbVgsNZnGNx/02fxg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MEiy96NIaGLuNYOdK94gKbB9z+I3s/FeaIKV0dBKmINUWvHX3MacJgcR/0ynhWw73
	 IIFk1fma1iNdNrikyHikmXCCesbtdUDE7Ot+SvRtsLCoZJQYwhCrpNQp7WaT14cbuE
	 elmGwdQEoRLZQN/tHB6VW0+FApvFzptjCYF1Ecn7tTEukSwsp6myfWpTcmVysLZQTZ
	 SIE5rwoPxWoKpu2y3VDMwfAWQEJ2uO7eBMeQJ9vj+mEf/LzozfyeU/+igyGLfCfybF
	 ipkwdv6owRq9ndEiTm2swcH1CT3oObSX117KQ9G7u4WzZUpoGMU5YneuqXG1lB8Yzz
	 gbkVOIMrK4GVg==
Date: Fri, 24 Nov 2023 12:25:33 +0000
From: Conor Dooley <conor@kernel.org>
To: Anand Moon <linux.amoon@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Icenowy Zheng <uwu@icenowy.me>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: usb: Add the binding example for the
 Genesys Logic GL3523 hub
Message-ID: <20231124-clear-aids-2fd63e1dcbcf@spud>
References: <20231122182351.63214-1-linux.amoon@gmail.com>
 <20231122182351.63214-2-linux.amoon@gmail.com>
 <20231123-skeletal-smirk-390543e2d6ab@spud>
 <CANAwSgQCOw_CY_Yy7zYHdme92O=O35Ev=MqHcznYnR=ycaxdPg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANAwSgQCOw_CY_Yy7zYHdme92O=O35Ev=MqHcznYnR=ycaxdPg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231124_042548_157218_B67EE29F 
X-CRM114-Status: GOOD (  37.81  )
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
Content-Type: multipart/mixed; boundary="===============7558668078844809604=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============7558668078844809604==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Sjy+fap+ufnQLlh0"
Content-Disposition: inline


--Sjy+fap+ufnQLlh0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 24, 2023 at 04:18:23PM +0530, Anand Moon wrote:
> Hi Conor
>=20
> On Thu, 23 Nov 2023 at 23:26, Conor Dooley <conor@kernel.org> wrote:
> >
> > On Wed, Nov 22, 2023 at 11:53:46PM +0530, Anand Moon wrote:
> > > Add the binding example for the USB3.1 Genesys Logic GL3523
> > > integrates with USB 3.1 Gen 1 Super Speed and USB 2.0 High-Speed
> > > hub.
> > >
> > > Onboard USB hub supports USB 3.x and USB 2.0 peer controllers.
> > > which has a common reset pin and power supply.
> > > peer-hub phandle each peer controller with proper gpio reset
> > > and help each peer power on during initialization
> > > and power off during suspend.
> > >
> > > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > > ---
> > > v4: Fix the description of peer-hub and update the commit message.
> > > Schematics of the Odroid N2+
> > > https://dn.odroid.com/S922X/ODROID-N2/Schematic/odroid-n2_rev0.6_2021=
0121.pdf
> > > V3: fix the dt_binding_check error, added new example for Genesys GL3=
523
> > > v2: added Genesys GL3523 binding
> > > v1: none
> > > ---
> > >  .../bindings/usb/genesys,gl850g.yaml          | 67 +++++++++++++++++=
--
> > >  1 file changed, 63 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/usb/genesys,gl850g.yam=
l b/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
> > > index ee08b9c3721f..bc3b3f4c8473 100644
> > > --- a/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
> > > +++ b/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
> > > @@ -9,9 +9,6 @@ title: Genesys Logic USB hub controller
> > >  maintainers:
> > >    - Icenowy Zheng <uwu@icenowy.me>
> > >
> > > -allOf:
> > > -  - $ref: usb-device.yaml#
> > > -
> > >  properties:
> > >    compatible:
> > >      enum:
> > > @@ -27,12 +24,48 @@ properties:
> > >
> > >    vdd-supply:
> > >      description:
> > > -      the regulator that provides 3.3V core power to the hub.
> > > +      phandle to the regulator that provides power to the hub.
> > > +
> > > +  peer-hub:
> >
> > Should the property not be "peer-controller"? Your description refers to
> > them as such.
>=20
> No, as per my understanding, peer-hub represents a complete USB hub.
> See the lock diagram in the below link.
>=20
> >
> > > +    $ref: /schemas/types.yaml#/definitions/phandle
> > > +    description:
> > > +      onboard USB hub supports USB 3.x and USB 2.0 peer controllers.
> >
> >
> > > +      which has a common reset pin and power supply.
> > > +      peer-hub phandle each peer controller with proper gpio reset

This is what I don't get. You say "peer-hub phandle each peer
controller..". It is hard for me to understand that portion of the
sentence, but the interchanging of "hub" and "controller" is
confusing. The title of the binding says "hub controller", so maybe it
is better to use that here.

> > > +      and help each peer power on during initialization
> > > +      and power off during suspend.
> >
> > I generally hate to talk about non-native speakers grammar etc, but what
> > you have here is in need of a lot of improvement. The below is my
> > attempt to understand what you are trying to say:
> >
> > "For onboard hubs that support USB 3.x and USB 2.0 controllers with
> > shared resets and power supplies, this property is used to identify
> > the controllers with which these are shared."

"For onboard hub controllers that support USB 3.x and USB 2.0 hubs
with shared resets and power supplies, this property is used to identify
the hubs with which these are shared."

I re-worded this again to try and remove the use of "controller".
Do you think that this still makes sense?

> Sorry for the poor grammar, I will update this in the next v5.
>=20
> > Also - this is one particular system, what prevents there being a hub
> > that has more than 2 controllers? Also, as you insist that this is
> > generic, and not just for genesys, should this not be defined in a
> > common location?
>=20
> Here is the block diagram of the Genesys GL3523 hub.
> [0] https://www.genesyslogic.com.tw/en/product_view.php?show=3D67 [Block =
Diagram]
>=20
> It has two USB 2.0 and USB 3.1 controllers, so using peer-hub node
> the onboard hub module will bring up this hub.
>=20
> There are many examples that use similar properties hence it is generic.
>=20
> # Documentation/devicetree/bindings/usb/cypress,hx3.yaml
> # Documentation/devicetree/bindings/usb/microchip,usb5744.yaml
> # Documentation/devicetree/bindings/usb/realtek,rts5411.yaml
> # Documentation/devicetree/bindings/usb/ti,usb8041.yaml
> # Documentation/devicetree/bindings/usb/vialab,vl817.yaml

Which brings me back to the unanswered question, should this not be
defined in a common location given there are several devices using it?
I assume because it only applies to hub controllers and not other types
of devices.

Also, the descriptions that I saw when looking at some of those other
bindings are similarly poor. I can't bring myself to care any more,
just clean up the ambiguous wording here and I'll ack the next version,
I don't expect you to sort out the wording in other bindings.

Cheers,
Conor.

--Sjy+fap+ufnQLlh0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZWCWPQAKCRB4tDGHoIJi
0n2KAP4gfrkarKYYdtk0+pmhfTKrC35P8NCTE3zgnTcc7D19xwD9EzBpIn9jIfF4
gxd2BDzJFdP2jjGpQP195vHDU5eDFgY=
=r79W
-----END PGP SIGNATURE-----

--Sjy+fap+ufnQLlh0--


--===============7558668078844809604==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============7558668078844809604==--

