Return-Path: <SRS0=svws=A3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DF14C433E3
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Jul 2020 08:02:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 398D22071B
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Jul 2020 08:02:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wbYE3waA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ioMBvp9t"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 398D22071B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6PnsPYoSY6vtcxuwFdscwqZCKd43lPVfsLn02UPQl9k=; b=wbYE3waA8XMQnubaZeTWAWfDb
	6PkGhz677wHbFumhA/dK1TuVATs0vsYH9/8uXrh8ro+fpCpjBLPMzj6GlBaxs/OuNUvZEdiL9y6Ei
	kE558xK02dqwQdWfUqrcShmfwdlsYjI7Ha3xsijnRqVSiLnifv78WsxSl8qDm4SwEaQ1Z3sGNBJio
	gKGLqPt30y57NK7p2GUjSMXMDexMF0a9vJuhO+IkfWmuA4NaZNCgLIgH5RBhj8HgsheD4tKG2YOwi
	FfbstIzDQJgvSMQp6sPAsnKpyxPCCApBBOZTJ9wqAcjnstOOX/EMSbA6L5IiKChoYWM+DYOZ+BbBp
	pitVBercQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvyqj-0001xb-FV; Thu, 16 Jul 2020 08:02:37 +0000
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvyqe-0001wR-SV; Thu, 16 Jul 2020 08:02:33 +0000
Received: by mail-il1-x141.google.com with SMTP id r12so4282737ilh.4;
 Thu, 16 Jul 2020 01:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=x8Ce9j7zk91Xc63rHhNEf95IY70/+EmDpEcw9U4m9jo=;
 b=ioMBvp9teLR1HYUEl0KtqdLDBB9P0+jiD7Ax4pKzABAY0HdU65W1xMtORZ22h/b7qj
 SdTCtQMgFZ53UTiaOoeA84t5mjXsFX42l9T5wG1CpPTC9tefdGmYlzjwg4WSh8/gM2BW
 qGKjV8XPylz02mcMFGG+nmthaR1MyjG/vnL3vxdIIkrvFESNSJoqEjbVJyWpHjFYaOi/
 fK8fUZ12GqF940Hl+5lpXF5puy9Is4RPwIL3V0vhp+2ffuUkTVkTP4GjTyJnSoakOtAT
 zQjxdE0TfBm1CT9r/LBfQDpxL7CAgR55sUbU1PoM8seFJ7A2VhVvkz8ixUtf3jk1xlnw
 FMlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x8Ce9j7zk91Xc63rHhNEf95IY70/+EmDpEcw9U4m9jo=;
 b=gSG7uqpO5BSZSA6AxBFrT4CGVPcsaN41nWeSuyBEVt+2XuKJWpUkei6wu1oCc0a7SN
 QSrj1kA5HwtLl7S/6gtbWPEW83a40FSdnWelQCn7WaYk2PXqvSrFqVBwxNBaWot0ZS8s
 /uXXCyWH5IvLH3SRyoEatJSMNE65QWpGwRU8YlRSrXJMjl5vBhYk3y0AkM6U7kIvbq1B
 c6cH3N4zvRjBX/YE4m1J6VjEF9U+Ylcl5quUPefGiRSh8v5C5FdX6FalVP2x7mKzGn/i
 OFw66hB9fQYLM2M3VS8dqJGVWKsoFQTDxann+S6XLFLbX53eUbdI6QYmxwxDO1eph8zV
 HQlw==
X-Gm-Message-State: AOAM531Nr4QYGL1IZ6iL65OoLkRffFGw/ZayrgSnkDLgYnPWpfoe+xAj
 thnqxus7zvoG38T64fgWBIAkx9fK9t/ZitSHveQ=
X-Google-Smtp-Source: ABdhPJzcIm9z3NmSkVW5PNnnqLFE0Sg0Xe+eDAwGmuJuSVaGREwAbJNIJw8WDqyqqWpbQnInV7A0ByzS2XY68AtGWcY=
X-Received: by 2002:a92:5ecf:: with SMTP id f76mr3654015ilg.6.1594886550795;
 Thu, 16 Jul 2020 01:02:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200715160209.652-1-linux.amoon@gmail.com>
 <20200715160209.652-2-linux.amoon@gmail.com>
 <de587578-9da5-cd1d-826a-ab83b7c3dcc1@baylibre.com>
In-Reply-To: <de587578-9da5-cd1d-826a-ab83b7c3dcc1@baylibre.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Thu, 16 Jul 2020 13:32:20 +0530
Message-ID: <CANAwSgT9KPt5xTMd77LtSm3ojUiUqVHzJ3mKuKKbFW2c11J=Ag@mail.gmail.com>
Subject: Re: [PATCHv1 1/3] arm64: dts: meson-g12b-odroid-n2: Enable RTC
 controller node
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200716_040232_990053_77673AA5 
X-CRM114-Status: GOOD (  17.53  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 linux-amlogic@lists.infradead.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Neil,

Thanks for your review comments.

On Thu, 16 Jul 2020 at 12:38, Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Hi,
>
> On 15/07/2020 18:02, Anand Moon wrote:
> > Enable RTC PCF8563 node on Odroid-N2 SBC, In order
> > to support the RTC wakealarm feature for suspend and resume.
> >
> > Cc: Neil Armstrong <narmstrong@baylibre.com>
> > Cc: Kevin Hilman <khilman@baylibre.com>
> > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > ---
> > $ sudo hwclock -r && date
> > 2020-07-15 13:11:53.862508+00:00
> > Wed Jul 15 13:11:54 UTC 2020
> >
> > $ hwclock --show
> > 2020-07-15 13:17:30.903300+00:00
> >
> > But RTC wake up is not working at my end.
> > Any inputs are welcome.
> >
> > $ time rtcwake -s 30 -m mem
> > rtcwake: /dev/rtc0 not enabled for wakeup events
> >
> > real    0m0.002s
> > user    0m0.002s
> > sys     0m0.000s
> > ---
> >  .../boot/dts/amlogic/meson-g12b-odroid-n2.dts      | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
> > index 169ea283d4ee..a447cba4dd53 100644
> > --- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
> > +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
> > @@ -391,6 +391,20 @@ hdmi_tx_tmds_out: endpoint {
> >       };
> >  };
> >
> > +&i2c3 {
> > +     pinctrl-0 = <&i2c3_sda_a_pins>, <&i2c3_sck_a_pins>;
> > +     pinctrl-names = "default";
> > +     status = "okay";
> > +
> > +     rtc: rtc@51 {
> > +             reg = <0x51>;
> > +             compatible = "nxp,pcf8563";
> > +             #clock-cells = <0>;
> > +             clock-frequency = <32768>;
> > +             clock-output-names = "rtc_clkout";
>
> The clkout output is not used, so I don't think these 3 lines are needed.

Ok Thanks I will drop these 3 clock lines.

>
> > +     };
> > +};
> > +
> >  &ir {
> >       status = "okay";
> >       pinctrl-0 = <&remote_input_ao_pins>;
> >
>
> Neil

-Anand

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
