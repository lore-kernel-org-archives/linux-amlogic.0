Return-Path: <SRS0=bq/Q=ED=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71157C4363A
	for <linux-amlogic@archiver.kernel.org>; Wed, 28 Oct 2020 07:35:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED07922400
	for <linux-amlogic@archiver.kernel.org>; Wed, 28 Oct 2020 07:35:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="s7k6zx9K"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED07922400
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=thorsis.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-ID:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OlX8RcWwnrJ51Z4ZCLn9by1q5ox6xVVqwONfeAAzCwE=; b=s7k6zx9KE8IDTowALgl2mAs/KH
	A9OsljT3U/6ayn172y0arN4PAmF2eeR5kYui/PNYKshuPb5XmvDadsPy4jryVwCmraBpHP4ybwgl7
	Yd4MDLG5ZOmBxdsEIF6bCHJO93EJz79+38S87PdUrdoKC6oxP6Tk7IqM96q/58joDDzZPf+Z6gVVd
	USCDkpBFx71AlRL6OllsRAZcJD/e/IYixz6Ds/S9BOBLThMfJJECsp4U18twf/gpG8lac2bSwy0Rm
	gDM6N5spEuXJC5gw/W96NHxJ5+kaJrFYl0wibEg5Jz5VvwU9zs2UQMDm5F09hCDKv1Lh87RIHve4o
	vNqwalIg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXfyw-00031Y-MG; Wed, 28 Oct 2020 07:34:54 +0000
Received: from mail.thorsis.com ([92.198.35.195])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXfys-00030v-OY; Wed, 28 Oct 2020 07:34:52 +0000
Received: from localhost (localhost [127.0.0.1])
 by mail.thorsis.com (Postfix) with ESMTP id A804E3D41;
 Wed, 28 Oct 2020 08:34:47 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.thorsis.com
Received: from mail.thorsis.com ([127.0.0.1])
 by localhost (mail.thorsis.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SkAFxjigLFVL; Wed, 28 Oct 2020 08:34:47 +0100 (CET)
Received: by mail.thorsis.com (Postfix, from userid 109)
 id 6867938F5; Wed, 28 Oct 2020 08:34:46 +0100 (CET)
From: Alexander Dahl <ada@thorsis.com>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: Re: [Linux-stm32] [PATCH v7 10/12] ARM: dts: stm32: Fix schema
 warnings for pwm-leds
Date: Wed, 28 Oct 2020 08:34:38 +0100
Message-ID: <5231529.NqohY00Rok@ada>
In-Reply-To: <f6ed201d-51b6-f278-7a95-3e3e49dc19ee@pengutronix.de>
References: <20201005203451.9985-1-post@lespocky.de>
 <20201027100536.cpfizc67gwrolp2z@falbala.internal.home.lespocky.de>
 <f6ed201d-51b6-f278-7a95-3e3e49dc19ee@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201028_033451_037440_CCD2CCDD 
X-CRM114-Status: GOOD (  21.48  )
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
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Dan Murphy <dmurphy@ti.com>, Pavel Machek <pavel@ucw.cz>,
 linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hello Ahmad,

Am Dienstag, 27. Oktober 2020, 11:58:10 CET schrieb Ahmad Fatoum:
> Hello,
> =

> On 10/27/20 11:05 AM, Alexander Dahl wrote:
> > Hello Ahmad,
> > =

> > thanks for your feedback, comments below.
> > =

> >>> -	led-rgb {
> >>> +	led-controller-2 {
> >> =

> >> Is a single RGB LED really a controller?
> > =

> > I just followed the recommendations by Rob here.
> =

> Do you happen to know if the new multicolor LED support could be used her=
e?

AFAIK not yet. The multicolor class should be ready and it is used by some =

drivers for I=B2C connected LED controllers, but if I understood Pavel =

correctly, additional work has to be done for a gpio and/or pwm multicolor =

driver. See this thread from August for example:

https://lore.kernel.org/linux-leds/2530787.iFCFyWWcSu@g550jk/

> =

> I find it unfortunate that the device tree loses information relevant to
> humans to adhere to a fixed nomenclature. Apparently led-controller isn't
> even codified in the YAML binding (It's just in the examples). If you
> respin, please add a comment that this is a single RGB led. I'd prefer to
> keep the information in the DTB as well though.

The "new" attributes 'function' and 'color' attributes should cover this =

information. IIRC those were introduced sometime before v5.4 and documentat=
ion =

is in the leds/common.yaml binding. I don't see it in the scope of this pat=
ch =

series, but if we would merge this warning fix first, the information is lo=
st, =

so maybe those attributes should be added before? =


My heuristics on that would be looking at the label and if there's a distin=
ct =

color in it, add the color property. I could do that for all pwm LEDs known=
 to =

the tree currently. That would be a bigger task for GPIO leds though. ;-)

> =

> >>>  		compatible =3D "pwm-leds";
> >>> =

> >>> -		led-red {
> >>> +		led-2 {
> >> =

> >> Shouldn't this have been led-1 as well or is the numbering "global" ?
> > =

> > Also good question. This numbering is for dts only, it usually does
> > not correspond with LEDs on the board, so it could be numbered per
> > led-controller as well?
> =

> I'd prefer that it starts by 1. That way it's aligned with PWM channel
> ID.

Ack.

> =

> Thanks for fixing the dtschema warnings by the way!

Well, I "introduced" them by converting the leds-pwm binding to yaml (not =

merged yet), so I could as well fix the warnings then? ;-)

Greets
Alex

> =

> Cheers,
> Ahmad
> =

> > Greets
> > Alex
> > =

> >>>  			label =3D "mc1:red:rgb";
> >>>  			pwms =3D <&leds_pwm 1 1000000 0>;
> >>>  			max-brightness =3D <255>;
> >>>  			active-low;
> >>>  		=

> >>>  		};
> >>> =

> >>> -		led-green {
> >>> +		led-3 {
> >>> =

> >>>  			label =3D "mc1:green:rgb";
> >>>  			pwms =3D <&leds_pwm 2 1000000 0>;
> >>>  			max-brightness =3D <255>;
> >>>  			active-low;
> >>>  		=

> >>>  		};
> >>> =

> >>> -		led-blue {
> >>> +		led-4 {
> >>> =

> >>>  			label =3D "mc1:blue:rgb";
> >>>  			pwms =3D <&leds_pwm 3 1000000 0>;
> >>>  			max-brightness =3D <255>;


-- =





_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
