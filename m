Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAC28CD691F
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Oct 2023 09:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lBNl2oAHK+9uYP2zOkEKGB2DkEyTkk5Okc/3D0I1kPk=; b=qqJpO9lZ5Rt7s4
	2K4SHxqIh6xJv+PkPpi+zS/FwQAlqCAPo8bB/8qsRGcXWkv50EkCTMOtsYpyVlRAgYb4v9hxif5bw
	ccAqcI0kv7xGnuXXx1qDsySqFoC+X4fY/TNa+FzSULgCQsC9MNMRxRc9++mbpsRhYY0ZTi1mTCz99
	ZJX/kZpHlIjim3iX1HezYSnhgd2notkbWZc4bpLKvVlk94yn6keUns8OZslW7tw5TLdvh4E3N59FE
	8elaHYRRsB9Kf+drARZY4zAmun2HGZXVvdSedDK2oqU8wNtrH+VW6duszSfL9ytD0PsyW8hQg20YF
	FjyzIM7jZI0Cvnpo4Iqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qq9SX-00CyjJ-2L;
	Tue, 10 Oct 2023 09:55:25 +0000
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qq9SU-00CyiI-29;
	Tue, 10 Oct 2023 09:55:23 +0000
Received: by mail-oo1-xc32.google.com with SMTP id 006d021491bc7-57be3d8e738so2956409eaf.1;
        Tue, 10 Oct 2023 02:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696931720; x=1697536520; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fRr0GLki14imU2pQsyavD3bnxa727VzXZ1CS3z19LiA=;
        b=Kh3riavnC7HThOazGuBbiAewFYnpYULVbVeDl9rDrMvJ81cu1JSaOp7nqVd28DrAU3
         4x31boyw9fre3kT5/zLgMLlNMiG4CAsGXR7z9p3NBDTkpqgj/tKHBN7IGWFMuyO1EXdo
         bd+RITMmb/NSJbs/HQLIFn09ZGcF/popx0jiLuDZx0tNaK6SkNpO5PxfUxWb7COCC6Dj
         HZhNKVRlfiMmzuJ3im+mFWAz64151CMeXP/3bOTL/VFaxiar+J5shWB9PLKKBTjQhEyW
         ny8Md5XkuLEe6pmu1emLz/GDyEw8f5MQgHFQ1rTGQQRbMp9bKZg8BylswOPnFTUfHugd
         7fMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696931720; x=1697536520;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fRr0GLki14imU2pQsyavD3bnxa727VzXZ1CS3z19LiA=;
        b=nxqlye2WU/2EpbZuHQ0clqbfEix/HpAQrdLFeRVwofV3Wb7bRFgrbDhiS4zV0fj8p1
         WwvrBxDPz4C6mngFQdpkwVeH+lu7T5qT7UJXoCgqvi45f0UBWKNnCeDM9do4hjuQtXxo
         DBfXK/QRnadZAEl0NgtP5E3PdYKxMPZllTfmPQ3UAKnAssMciLWmy1NhKsXYT5FYFQqh
         VufUq8rC/vwpEVZNwb88+4hyDAcHvy40DGBFEIyYRsNPfchDNO719HTe4feLnSreGHgS
         zJIzY6ScmZjICjkfYHderlQ1Uj43SNwgC1iZd1Y4n87x2SdGcMb/OUwlXtGmkTf/0dnU
         ykOA==
X-Gm-Message-State: AOJu0YzewlPoiF0YdBYtW66MwK/PcAck5AmV2Bxwp9Ct778+TKlznSCQ
	gJHBW9I4ri8BP//1m6ER171KK/J0eY3koQPRRLI=
X-Google-Smtp-Source: AGHT+IHgEuySn4JrjKTV0h4pLKEwHPrdQJVtRc1PhXmTOwWq2g2k6eFHdk8ESnnLQW6ySJSfF9cdAUj1M3VbQ+5p4Yg=
X-Received: by 2002:a4a:91d2:0:b0:57b:e100:60ae with SMTP id
 e18-20020a4a91d2000000b0057be10060aemr16550947ooh.7.1696931720475; Tue, 10
 Oct 2023 02:55:20 -0700 (PDT)
MIME-Version: 1.0
References: <20231010032446.3194-1-linux.amoon@gmail.com> <9fe7d0d2-3582-4b62-be9b-aa9134c18023@linaro.org>
In-Reply-To: <9fe7d0d2-3582-4b62-be9b-aa9134c18023@linaro.org>
From: Anand Moon <linux.amoon@gmail.com>
Date: Tue, 10 Oct 2023 15:25:02 +0530
Message-ID: <CANAwSgRv5d5o2cDzbGYAj0srhUO7T5LAMuzMBqP7p+uHJN0xVQ@mail.gmail.com>
Subject: Re: [PATCH v1] arm64: dts: amlogic: Used onboard usb hub reset on
 odroid n2
To: neil.armstrong@linaro.org
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231010_025522_705958_AD18C192 
X-CRM114-Status: GOOD (  18.53  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Neil,

On Tue, 10 Oct 2023 at 13:40, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> Hi,
>
> On 10/10/2023 05:24, Anand Moon wrote:
> > On Odroid n2/n2+ previously use gpio-hog to reset the usb hub,
> > switch to used on-board usb hub reset to enable the usb hub
> > and enable power to hub.
> >
> > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > ---
> >   .../dts/amlogic/meson-g12b-odroid-n2.dtsi     | 36 ++++++++++++-------
> >   1 file changed, 24 insertions(+), 12 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
> > index 91c9769fda20..9e671444eca6 100644
> > --- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
> > +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
> > @@ -31,6 +31,30 @@ hub_5v: regulator-hub_5v {
> >               enable-active-high;
> >       };
> >
> > +     /* USB hub supports both USB 2.0 and USB 3.0 root hub */
> > +     usb-hub {
> > +             dr_mode = "host";
> > +             #address-cells = <1>;
> > +             #size-cells = <0>;
> > +
> > +             /* 2.0 hub on port 1 */
> > +             hub_2_0: hub@1 {
> > +                     compatible = "usb5e3,610";
> > +                     reg = <1>;
> > +                     peer-hub = <&hub_3_0>;
>
> It seems peer-hub is missing from Documentation/devicetree/bindings/usb/genesys,gl850g.yaml, could you add it ?
>
Yes, will add an example in genesys,gl850g.yaml file.

> Thanks,
> Neil

Thanks
-Anand

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
