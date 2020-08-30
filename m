Return-Path: <SRS0=MBsY=CI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE7E4C433E2
	for <linux-amlogic@archiver.kernel.org>; Sun, 30 Aug 2020 20:06:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77447208A9
	for <linux-amlogic@archiver.kernel.org>; Sun, 30 Aug 2020 20:06:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1+n80kj3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tEcjKtkO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 77447208A9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=i9owGurx2Vp7Vz9dHx2XF8A+EuokjCRXF1J6okB28Q0=; b=1+n80kj3SQxuoNC/sWHGzivXn
	SjJaL7K61sWJKpQtdJ/uIyxj7QyS+n0SK48lnHsvKXo4bxSTWTVuNWdyLweD6f1ZXRzTxRVqZiVFM
	vQokUwtXEV1RY0SFeJvXULsazOVmP9KmFRmNJbV5Gy4SLtmBG8igaMOKlxstkIFg8EDF6oGrRaicK
	sPMTfP6SScY1Zo4j13TsnJo4/lJ6ySUbF0jWdnQV6cVj2or12lO1Zq5T+aiZWKLUbdzGowBmq0tWW
	hwCKKQf/3siyEZvnw7JovnZJK+hYsK9SakZ7+JNnxo38q3ucXMtR0H09QRk/Qg9BM0iMdMs2TOHBs
	cBjf91cqA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kCTaj-0001lP-Eq; Sun, 30 Aug 2020 20:06:17 +0000
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kCTaf-0001kL-Di; Sun, 30 Aug 2020 20:06:14 +0000
Received: by mail-il1-x141.google.com with SMTP id 16so2602250ill.6;
 Sun, 30 Aug 2020 13:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3z5XdXsgvD+nH7zCf5Gwtyiq31V0gPdWkz0sp8uWVaY=;
 b=tEcjKtkOLoWym+8QvlohWzXDduWWS4m9nWpY6QDnGvKIl4nyhUW04uniBLOhiW03nE
 mDr+nT6OiupIb+cAADY3pPB8c+YSVYEKKjOUmcXwPKjItjACnr9NXVaWhiGQYta47Gs6
 64bnHSXKfygzzTsmibzszE7oUPafm7j7zmJsd+0aIn1Z4wKW7lz2TCUuGHh35yF2IyHz
 ONkQX/bRrAZma925jXwnTHVdr8ddC33RatYf6I5+PDke61vtNwO97b/GE0CBxhsPRh9W
 Ll8iS0bNDuxm31j94TL7CaetooRq7v5BFZqAWrWpmyzREGjo7Nbek34igYMIeJRv/ZIf
 7TMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3z5XdXsgvD+nH7zCf5Gwtyiq31V0gPdWkz0sp8uWVaY=;
 b=decL6G1iZbsNc5NffQHzktvbCgaL1pC1Dt42gypli33qCgoMm+0FdmfCrO9wFq/ZCS
 ev3nL7Wk7mNBNgeyZSYBZCBKbMLF3zYkt91I0QBNWe/wJJ36wW9fHwVOeWCXdayFf0lT
 82H1XvYOhe4rfBHuCgesTzoNFDmNyrf/6RpCYE4SJFU9mTyFuFuOZAvSHesmpH5SH2uH
 +VU4Q6D7ijjp7Tp3NN9c+ozRgbnIoFk2oVLFIQUAgEIy42j+/pm84+sjtSRP9Xl2wXtw
 xzQ0N1Zwd7ciXVEiezDJTxU64wX/y/8op1v4uPKI8qMKet4JzDa+9aPzToh0bZenAdDI
 pepQ==
X-Gm-Message-State: AOAM530qgU1Y/rZxhChYg2NiuoszaFVZM9toP7HSKMhxYowHV3tdWLTr
 G4KDjUrEDvDTtY7XtWwJGykWcTlFox3EJRd2c3UZHH1Yj4Qbww==
X-Google-Smtp-Source: ABdhPJy2xzukOmZ6jrpihqoZ6Lo/wS1efaLMrUJNQstm/cK3YHqa5tts6ZqEA3sNyC5n2UPVnXv+3lEim//csX/BZsQ=
X-Received: by 2002:a92:d8cb:: with SMTP id l11mr6141767ilo.221.1598817970039; 
 Sun, 30 Aug 2020 13:06:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200820121323.564-1-linux.amoon@gmail.com>
 <20200820121323.564-2-linux.amoon@gmail.com>
 <7hlfi9xgch.fsf@baylibre.com>
 <CANAwSgTZ23jFPAO46vRg1Dx_Bzi=4Bg6KHE0ozLQGky4p_fgKQ@mail.gmail.com>
 <CANAwSgQLnqDnuQvLv4cvaeTPeBW=H_g5F2aaNue_hb4nKLdovg@mail.gmail.com>
 <f7e6ce5f-02b0-065b-ffcf-2826159f926a@baylibre.com>
 <1j7dto3ylq.fsf@starbuckisacylon.baylibre.com>
 <CANAwSgQ1Miu73hfdK+cgL3howpekn2xj_5qwGasQZwtQpSGj5Q@mail.gmail.com>
 <1j4koq4x38.fsf@starbuckisacylon.baylibre.com>
 <CANAwSgTWnHXRFRUrbdCph+eBxL2PNXe6Q4aTXxEU32i7dGS=dw@mail.gmail.com>
 <CANAwSgQV7_4VdGRMgJDMjPFvOS3Nabkqbf2ucE5vqo6zrhxPDw@mail.gmail.com>
 <CAFBinCCEJJT_kfJ4qfTEz0R7Mo3ciCGDSw_MJYi_5PyNJA6x5w@mail.gmail.com>
 <CANAwSgRV8y3Cc72CtppfJMPFKDSfpddzAKLeBGExn8G4OBVJ6g@mail.gmail.com>
 <CAFBinCCpM=ea=zzormJ_m5RcsMtE6hUkq5-UkYpNpXK8fbXdAQ@mail.gmail.com>
In-Reply-To: <CAFBinCCpM=ea=zzormJ_m5RcsMtE6hUkq5-UkYpNpXK8fbXdAQ@mail.gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Mon, 31 Aug 2020 01:35:58 +0530
Message-ID: <CANAwSgTf0jCPtfLP7bc1VxATdGbdSMR4DKjojJWtpqrwCeS27A@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] arm64: dts: meson-g12b-odroid-n2: Enable RTC
 controller node
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200830_160613_525489_29889F7D 
X-CRM114-Status: GOOD (  22.74  )
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
Cc: devicetree <devicetree@vger.kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Martin.

On Sun, 30 Aug 2020 at 19:34, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> Hi Anand,
>
> On Sun, Aug 30, 2020 at 3:12 PM Anand Moon <linux.amoon@gmail.com> wrote:
> [...]
> > +       /* Make sure the rtc irq pin is properly configured as input */
> > +       rtc_irq_pins: rtc-pin-irq {
> > +               mux {
> > +                       groups = "GPIOAO_7";
> > +                       function = "gpio_periphs";
> check meson_g12a_aobus_functions in drivers/pinctrl/meson/pinctrl-meson-g12a.c
> GPIOAO_7 doesn't support "gpio_periphs", instead I think it should be
> "gpio_aobus"
>
Thanks for this information, I really learned a lot on this feature..

> I'm surprised that you don't seem to be getting errors from the pin
> controller driver about this.
> On the other hand you have not attached the full kernel log, so maybe
> it's in there but hidden somewhere
>
> > +                       bias-disable;
> shouldn't there be output-disable or input-enable here?
>
Thanks for this information and correction.

> > +               };
> > +       };
> > +
> >         hdmi-connector {
> >                 compatible = "hdmi-connector";
> >                 type = "a";
> > @@ -481,7 +490,8 @@ hdmi_tx_tmds_out: endpoint {
> >
> >  &i2c3 {
> >         pinctrl-0 = <&i2c3_sda_a_pins>, <&i2c3_sck_a_pins>;
> > -       pinctrl-names = "default";
> > +       pinctrl-1 = <&rtc_irq_pins>;
> > +       pinctrl-names = "default", "gpio_periphs";
> I am not expecting this to work because it means that the I2C driver
> would have to manage the "gpio_periphs" pin state (but there's no
> pinctrl_* call in drivers/i2c/busses/i2c-meson.c)
> instead I would try:
> &i2c3 {
>   pinctrl-0 = <&i2c3_sda_a_pins>, <&i2c3_sck_a_pins>, <&rtc_irq_pins>;
>   pinctrl-names = "default";
>
>   ...
> };
>
> or even:
> rtc0: rtc@51 {
>   pinctrl-0 = <&rtc_irq_pins>;
>   pinctrl-names = "default";
>
>   ...
> };
>

Thanks for the input on the IRC,
I followed Neil's suggestion to work for me.

Best regards,
-Anand

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
