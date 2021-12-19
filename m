Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18DBAC433F5
	for <linux-amlogic@archiver.kernel.org>; Sun, 19 Dec 2021 09:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SLeSFt+HGHGJWf3hs77LJRT1uvmP5tRAo9h4+/rWIBI=; b=3XC6z4q9Z0YH2C
	WVKOnvm7AqWGg7Zk9azi1EFnKybKJw5jV8KbVxMxZxkX6LntMydZjjOTgaXDS1ur4yH+S/eOETfTA
	4kCpcpXese4Luy+G053+IiuKX39XjWmy85hr2QBevOZE0SEcViBAcqt7qc14oO1gCw9QhPVCFIwJ8
	rdlehiv5z1M48M84WvFdVW8XO9L4x+1Z/PBZMZrksaYd9RW+8tFmSf58rd3aPA3GNBBCR7EcQ7YZd
	7El00ImnOhUUz2yBlF/geAq6gUSc74UWo3qHZ2Oss+JAKPFb+2fwQXMNvuWRFkCottjeAGJE8sLzQ
	syMBsNjXX8gzG41wPLjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mysvW-00Fe1x-Ie; Sun, 19 Dec 2021 09:56:22 +0000
Received: from mout-p-201.mailbox.org ([80.241.56.171])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mysvS-00Fe0U-PO
 for linux-amlogic@lists.infradead.org; Sun, 19 Dec 2021 09:56:20 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [80.241.60.233])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4JGym003HBzQjkC;
 Sun, 19 Dec 2021 10:56:16 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1639907773;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IqNonhnZ7va7CG4xM/AGGpFbwPX8GSn4tg3EfD8HA5c=;
 b=TqmHdHnJy+RlFc3gYwkc7BwG1sbIEM3bJKFNta78h4sCa4XvGUghkjP2bqZrzAN4A7jraA
 dBpcJG+AesTBrYei+AIL1bOcMsMeyMzU+bMpXUi//+k7gEwp3V74J5Gz3ZY3Zmnrm+D28L
 ThxqCZI5DuOLFlMXj0jrXbiUNhpquJ16GdlNeXdUBec5ohBoEntHk9Yt0FZxSlBwVL2rpy
 p1zo0wB1r7Ht3M+eBPq+RntwWs0L77hNYRgfaDu9QJeYYfi/jSD4Q2ps+ImaF3AP/63GXY
 lfw9+7nnXY+6sKCHE0ikEXhOb/WonHAbjOQ9uXOw7xGiNwvHNTlB2fRLaBPqlA==
From: Alexander Stein <alexander.stein@mailbox.org>
To: Rob Herring <robh+dt@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jerome Brunet <jbrunet@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 1/1] arm64: dts: meson-g12b-odroid-n2: move assigned-clocks
Date: Sun, 19 Dec 2021 10:56:11 +0100
Message-ID: <4534376.LvFx2qVVIh@kongar>
In-Reply-To: <1j4k769ch7.fsf@starbuckisacylon.baylibre.com>
References: <20211218142632.15293-1-alexander.stein@mailbox.org>
 <1j4k769ch7.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211219_015619_003206_E877F411 
X-CRM114-Status: GOOD (  18.67  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Am Samstag, 18. Dezember 2021, 16:03:16 CET schrieb Jerome Brunet:
> =

> On Sat 18 Dec 2021 at 15:26, Alexander Stein <alexander.stein@mailbox.org=
> wrote:
> =

> > dtschema expects a 'clocks' property if 'assigned-clocks' is used, but
> > 'sound' node does not.
> > So move the MPLL[0-2] clock settings &clkc_audio which actually use the=
m.
> =

> No, this does not make sense.
> The sound card needs the clocks set in such way - nothing else
> The clock controller work just as well regarless of the clock rate
> =

> Having a clock property or not does not change that

Well, I checked what others did to fix this warning. So I did the same as i=
n [1].
Despite that, IMHO if you split 'assigned-clocks' for the same clock =B4all
over users who is gonna win? Because the sound card needs the clocks set
his way it is set, it is done in the same file.

Best regards,
Alexander

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it/?id=3D4afb06afd76855932a2d19c983c013105f1cfb9a

> > This fixes the dtschema warning:
> > arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dt.yaml: sound: 'clock=
s' is a dependency of 'assigned-clocks'
> >
> =

> Then the schema needs fixing IMO
> =

> > Signed-off-by: Alexander Stein <alexander.stein@mailbox.org>
> > ---
> >  .../boot/dts/amlogic/meson-g12b-odroid-n2.dtsi    | 15 +++++++--------
> >  1 file changed, 7 insertions(+), 8 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi b/ar=
ch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
> > index 9c05c83453f5..85257507206c 100644
> > --- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
> > +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
> > @@ -252,14 +252,6 @@ sound {
> >  				"U19 INR", "ACODEC LORP",
> >  				"Lineout", "U19 OUTL",
> >  				"Lineout", "U19 OUTR";
> > -
> > -		assigned-clocks =3D <&clkc CLKID_MPLL2>,
> > -				  <&clkc CLKID_MPLL0>,
> > -				  <&clkc CLKID_MPLL1>;
> > -		assigned-clock-parents =3D <0>, <0>, <0>;
> > -		assigned-clock-rates =3D <294912000>,
> > -				       <270950400>,
> > -				       <393216000>;
> >  		status =3D "okay";
> >  =

> >  		dai-link-0 {
> > @@ -365,6 +357,13 @@ &cecb_AO {
> >  };
> >  =

> >  &clkc_audio {
> > +	assigned-clocks =3D <&clkc CLKID_MPLL2>,
> > +				<&clkc CLKID_MPLL0>,
> > +				<&clkc CLKID_MPLL1>;
> > +	assigned-clock-parents =3D <0>, <0>, <0>;
> > +	assigned-clock-rates =3D <294912000>,
> > +					<270950400>,
> > +					<393216000>;
> >  	status =3D "okay";
> >  };
> =

> =






_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
