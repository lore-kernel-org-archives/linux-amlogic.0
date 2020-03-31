Return-Path: <SRS0=GB2T=5Q=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75C67C43331
	for <linux-amlogic@archiver.kernel.org>; Tue, 31 Mar 2020 16:10:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 143BB206CC
	for <linux-amlogic@archiver.kernel.org>; Tue, 31 Mar 2020 16:10:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RujnJiy9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="DuCn1jb5";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="EbrJxT9+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 143BB206CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2KeRyKdnYLurS2vKJ+SgmrA0EQrLKPvvlYrc/aCKJ4s=; b=RujnJiy9bHflXY
	Rn2FIrInOAHOLqKR07Xoy4gcSKYn3q4zzXDYTXG7pjNmoDz0vFr/Z+eAShXpZyr9N/RzFOE5SehLr
	Tvb1yQeDcGYY5qo2lACiWEg69xY3MxERrBiylNiE44etTf4UaLZ9xXncvL9+tlL5ZplnfgTohWIUa
	El+gWUe8Z01tlAxjLXzntAVGpLzTPeUds0shBWpKxdobPq6OMwz5o6W9LUwbVgMR7r0dfJ5AcUcIm
	ps6DH2UCDTM0z3f1s6nAzgiTlhHNAvwm1CGJiZYaEmHCHdaT6aYYVbbeeYVK9ve0C1iTJ6Dm6DrFJ
	AYSGHBDs8oXe69CoRtQg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jJJSY-00024S-SN; Tue, 31 Mar 2020 16:09:50 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jJJSE-0001ox-W6; Tue, 31 Mar 2020 16:09:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Type:Cc:To:Subject:Message-ID:
 Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=4YMjUqvn1g16RkZxnamj/llluRX/Zmwc24eVst39m28=; b=DuCn1jb5ejgWXlMFOsZqpCvNio
 92aCdzkTbkMpP32gJFPD1oBfB+vt6JDjuXXNWcfk715CUpGuQ8nRKZHbWEtZqQlA8mxs+M7hKDhP1
 hGOwWvGL2xp5z0MLDYmFRrUNHBwZYPcm1Zh16Gaie6LI9wfSelTk9D8h/6iGgXcn2DKUlVh1gEyET
 cZgkh+FaeDSXVFo7VzizkDIVTs2CGax3na+PII35L7Ze3hM2M6A3JmX6QMkUiYTy+OC/01Wkeg7Vw
 dVA8vIoNIMrssMaraToY/OMYd8OldNW2Tx3lRJjoord0+VSOTZf6tG4sw4JynNJwV1ecHZJ8uIQqV
 E+UrYmpQ==;
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jJIC9-0004Tt-BG; Tue, 31 Mar 2020 14:48:50 +0000
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com
 [209.85.219.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 800BA20848;
 Tue, 31 Mar 2020 14:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1585666128;
 bh=e/7jTSv5Ln/7N2erMxSAhTPfQO0mGgov7i4pB0Kxz8M=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=EbrJxT9+qQ4vbmfQodNUZ75MqmrVy3/2NQDxPg4GsBywCzjeqIw2fq6lj3s7435X2
 NIM+7Ydop9wv5/4CkHGw9c7dOJtPBA/zSDJDrPe+DungVFsSYeZaSpNvpWfCUq24L2
 R+q388+xL8Vgv6ukYJr671hgBiLOn4kma+Cvp9Ro=
Received: by mail-qv1-f49.google.com with SMTP id t4so6778724qvz.8;
 Tue, 31 Mar 2020 07:48:48 -0700 (PDT)
X-Gm-Message-State: ANhLgQ1M5VssF55xxp0BYiiWZwq03NJJCAk2mkz4Oq+8Tasw5AkSra3O
 m4G4aPSk8Ck1eKrM7MnQQwYMoUvtfZIdkoWAHg==
X-Google-Smtp-Source: ADFU+vsm7QnLg9VC47OO+I8GiU3/k2tefVEY+Sy39Kwt/VBNT1kmLS6ih/sV4b6JI7vayYbVNykmFae5IwQbSwKy9fk=
X-Received: by 2002:ad4:4bc3:: with SMTP id l3mr16286378qvw.79.1585666127545; 
 Tue, 31 Mar 2020 07:48:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200325220542.19189-1-robh@kernel.org>
 <20200325220542.19189-2-robh@kernel.org>
 <20200327202159.GA12749@ravnborg.org>
In-Reply-To: <20200327202159.GA12749@ravnborg.org>
From: Rob Herring <robh@kernel.org>
Date: Tue, 31 Mar 2020 08:48:36 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+zFGvJ+3CmKw3OzgEWi-p4Uz9+nmnS5ax0J9ewoz5qZg@mail.gmail.com>
Message-ID: <CAL_Jsq+zFGvJ+3CmKw3OzgEWi-p4Uz9+nmnS5ax0J9ewoz5qZg@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: iio/accel: Drop duplicate adi, adxl345/6
 from trivial-devices.yaml
To: Sam Ravnborg <sam@ravnborg.org>
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
 "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Guillaume La Roque <glaroque@baylibre.com>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Lee Jones <lee.jones@linaro.org>,
 linux-clk <linux-clk@vger.kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Zhang Rui <rui.zhang@intel.com>, Brian Masney <masneyb@onstation.org>,
 devicetree@vger.kernel.org, Michael Hennerich <michael.hennerich@analog.com>,
 "open list:THERMAL" <linux-pm@vger.kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Stephen Boyd <sboyd@kernel.org>, netdev <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Hartmut Knaack <knaack.h@gmx.de>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Jonathan Cameron <jic23@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, Mar 27, 2020 at 2:22 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Rob.
>
> On Wed, Mar 25, 2020 at 04:05:38PM -0600, Rob Herring wrote:
> > The 'adi,adxl345' definition is a duplicate as there's a full binding in:
> > Documentation/devicetree/bindings/iio/accel/adi,adxl345.yaml
> >
> > The trivial-devices binding doesn't capture that 'adi,adxl346' has a
> > fallback compatible 'adi,adxl345', so let's add it to adi,adxl345.yaml.
> >
> > Cc: Michael Hennerich <michael.hennerich@analog.com>
> > Cc: Jonathan Cameron <jic23@kernel.org>
> > Cc: Hartmut Knaack <knaack.h@gmx.de>
> > Cc: Lars-Peter Clausen <lars@metafoo.de>
> > Cc: Peter Meerwald-Stadler <pmeerw@pmeerw.net>
> > Cc: linux-iio@vger.kernel.org
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > ---
> >  .../devicetree/bindings/iio/accel/adi,adxl345.yaml     | 10 +++++++---
> >  Documentation/devicetree/bindings/trivial-devices.yaml |  4 ----
> >  2 files changed, 7 insertions(+), 7 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/iio/accel/adi,adxl345.yaml b/Documentation/devicetree/bindings/iio/accel/adi,adxl345.yaml
> > index c602b6fe1c0c..d124eba1ce54 100644
> > --- a/Documentation/devicetree/bindings/iio/accel/adi,adxl345.yaml
> > +++ b/Documentation/devicetree/bindings/iio/accel/adi,adxl345.yaml
> > @@ -17,9 +17,13 @@ description: |
> >
> >  properties:
> >    compatible:
> > -    enum:
> > -      - adi,adxl345
> > -      - adi,adxl375
> > +    oneOf:
> > +      - items:
> > +          - const: adi,adxl346
> > +          - const: adi,adxl345
> > +      - enum:
> > +          - adi,adxl345
> > +          - adi,adxl375
>
> I assume it is my schema understanding that is poor.
> But I cannot parse the above.
>
> The mix of items, enum and const confuses me.

compatible can be one of 3 possibilities:
"adi,adxl346", "adi,adxl345"
"adi,adxl345"
"adi,adxl375"

For a single entry, 'items' can be omitted.

> I guess that if I am confused then others may end in the same situation.
> Can we improve readability here or amybe add a comment?

example-schema.yaml explains this to some extent. I'd rather improve that.

Rob

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
