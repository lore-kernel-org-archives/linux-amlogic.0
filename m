Return-Path: <SRS0=Pv2c=KA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39630C433B4
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 May 2021 02:14:15 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A37A961168
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 May 2021 02:14:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A37A961168
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SPwYAsCDkP0wha3S9fNcT5l/KPMK7M0KkWoCFPWYwC0=; b=hlVPF7pRqFF4xjGUaMEtRYTJD
	uAk5nU+5wiFO655gjh0IY32V2cWt05jiJPNPoNcOvv0bXvTUSkiu8GtcOVzjSLXvUcUmJEVA5knH6
	OQrVpGtRAr7ZKOhX6vDcutoMAK+nWAPRupioVTNLCZ0QPO24YST5Y+mmW8BEg7TWI3FSMBNnHXpAb
	N0TAgyChdzwAaUDUcCfxFz8DPHMfBewmDMAv/n2ElwzEpF2ulY8neLcidYAA6kJcr0BjhX93IPxBK
	k8MNPO4P/rkGTZzEuxE/KZxntADOccXfjjrD6q+QZ972Jg5V3eaxC4dZM2Q44Wvvsb0AxyTe94+TI
	4EiYQQRpQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1le732-0000CW-0C; Wed, 05 May 2021 02:14:00 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1le730-0000C5-6n; Wed, 05 May 2021 02:13:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:Reply-To:In-Reply-To:References:MIME-Version:Sender:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Dv7HGoGw8Qg9jo03MrEkOqD/Lyo3Gz9jYcv00PvJ+EY=; b=lmxEpfoAYWaLJGwmJuVCbmMht8
 LR2tKs07Mz5OAZog3McMO5rkCUYVWmi1oXDs2FLHdytg2re5ey/+NSfME/v1DfJ0Ty72YbJ4jSnKA
 lapGkQuYmS05C6TM9MoqJ4ptAHZbdkZeWn1tILoZa6acrfkgM7JU2Stc/DyXyK3T4RJ3D9DdLoVQe
 T4yoZo6j9pLA6noKUAHqv4EhO6O344fAepnfE9vfRoBtFpg0vucLo03BylXYGW7RPwZ77iKo9lJG2
 14uAOsVaC2FtpUxxCON4PdTfPOg0R0pI9bgn736U4PPFvLnuPFCVAiCWfrE81zsIGK/7c4lEaZd7d
 0sRswYQg==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1le72x-004P6n-Lg; Wed, 05 May 2021 02:13:56 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1B5C4613B4;
 Wed,  5 May 2021 02:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620180835;
 bh=MS/d4ZN0JnYDku5sm2cm+kvbugSMciKF/8ZcDFMH82Y=;
 h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
 b=ZTnAKba9HzNnwk/31MfKNoaJVhv9kXxI+4ipPLwhN65rWvH7x8Tbb3SOk1Q6wSvn5
 ApTZEuZ2feffM3TKjYyjSQxuf/cXBDTHvnCMO5XxLfVhgxRM1yBN1Dp+XbIXdkMlMW
 l+Re2zb8TtcfIks0DxhmwlGvBYHpmI8rBVhDa4I24kXTRX1vZTHEXJUcnK3+AEbUb3
 bk5PW/PZfnc7moTPKZz8ePuR4jGV5gBf2yN2GvUbqaea92sNfDc9LaDI1C8dIyWOs2
 G5w+cdq0CGEbxGwUlN10Fmtxzgx/1sB9bmnAfaIemts00rhcBh5/NVkmsxyjVOf3/Z
 4ShMLcH6t2olA==
Received: by mail-lf1-f52.google.com with SMTP id c11so340882lfi.9;
 Tue, 04 May 2021 19:13:55 -0700 (PDT)
X-Gm-Message-State: AOAM530ISavbuAIHGbplqg2K8ihuFvy4nns2fKJSKh5vdTJ916/xi/Ju
 SYZ3M7E8skTzFwp49mo6ijlzu1SmTae85fuVo8c=
X-Google-Smtp-Source: ABdhPJw70gAAhcuwtjzZMCSy1Meu3USnDN3fd80aidrCUZR9Mm/KKzuSfSLYwDIbq80gQA55kyu++poc26ICP6AbXD8=
X-Received: by 2002:ac2:5f72:: with SMTP id c18mr66079lfc.233.1620180833466;
 Tue, 04 May 2021 19:13:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210504041659.22495-1-wens@kernel.org>
 <CAFBinCBZa-OjjLE0oaNQzAL+tGTkiC_Kf+iHR1H3K5-b+uFK0w@mail.gmail.com>
In-Reply-To: <CAFBinCBZa-OjjLE0oaNQzAL+tGTkiC_Kf+iHR1H3K5-b+uFK0w@mail.gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Wed, 5 May 2021 10:13:39 +0800
X-Gmail-Original-Message-ID: <CAGb2v670njcGHvcYCVARgVMrvK5gx=Ua-eew=Gvhxo4bYk8zjg@mail.gmail.com>
Message-ID: <CAGb2v670njcGHvcYCVARgVMrvK5gx=Ua-eew=Gvhxo4bYk8zjg@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: meson-gxbb: nanopi-k2: Enable Bluetooth
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, devicetree <devicetree@vger.kernel.org>, 
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210504_191355_766721_7C6DEBF4 
X-CRM114-Status: GOOD (  25.72  )
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
Reply-To: wens@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, May 5, 2021 at 4:52 AM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> Hi,
>
> On Tue, May 4, 2021 at 6:17 AM Chen-Yu Tsai <wens@kernel.org> wrote:
> >
> > From: Chen-Yu Tsai <wens@csie.org>
> >
> > The NanoPi K2 has a AP6212 WiFi+BT combo module. The WiFi portion is
> > already enabled. The BT part is connected via UART and I2S.
> >
> > Enable the UART and add a device node describing the Bluetooth portion
> > of the module.
> >
> > Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> > ---
> > Changes since v1:
> >   - added uart-has-rtscts property
> >   - added alias for uart_A
> >
> > Hi Neil, Martin,
> >
> > I dropped your review-bys since I added the UART alias and I'm not sure
> > what the policy for those are.
> >
> > ChenYu
> > ---
> >  .../boot/dts/amlogic/meson-gxbb-nanopi-k2.dts      | 14 +++++++++++++-
> >  1 file changed, 13 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts
> > index 7273eed5292c..f017a263784f 100644
> > --- a/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts
> > +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts
> > @@ -15,6 +15,7 @@ / {
> >
> >         aliases {
> >                 serial0 = &uart_AO;
> > +               serial1 = &uart_A;
> this should not be needed anymore since
> a26988e8fef4b258d1b771e0f4b2e3b67cb2e044 ("tty: serial: meson: if no
> alias specified use an available id")
>
> IIRC for "newly added" .dts we are only adding the alias for anything
> that shows up in /dev/ for the user
> meson-khadas-vim3.dtsi for example is not adding an alias for uart_A
> (also used for Bluetooth)

I see. So if some user had a customized .dts enabling more UARTs, they
would probably have the user visible ones aliased, and the Bluetooth
one would be in the reserved range regardless.

I'll drop the extra alias then.

Thanks
ChenYu

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
