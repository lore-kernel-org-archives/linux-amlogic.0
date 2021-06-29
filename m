Return-Path: <SRS0=fP31=LX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 749ADC11F67
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Jun 2021 19:00:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2683C61DD6
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Jun 2021 19:00:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2683C61DD6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CRMHZh513F8NAmN7xiUOVe+cd85/+9lRBtph40RmveQ=; b=V5JCC1dXEtp36b
	ogQRpWLTA1nxlQchD+G9n9bNizkQcSkgXl/R5M5or1ozrQj3lOuA2+zJMqtqj6rDTXJcZw1Fv7aae
	/TBCQeYcjnvIh9ONRufcfFSn8I8xhhUUdWHKuul4tTRZzKh8fGQ3ojjDBnHuTyVIqRZblq4OKbPRm
	S/WBfcn8DESfqhOBD32tqAWzDbxjYjQqZlUWKPt2XQC00IByUMot5cbfSTVYFTLpggxgenoE8rNuz
	KkO8PEpVuqkHO+Lp39mWYKcO7Rv3Cl0e3gBUrbFxMgNDoXh89Z1NgxqqcdOfyHt4kGxDrqRSCLMBP
	AoovYplO7CG/YGvtGlZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyIyP-00BtW5-4U; Tue, 29 Jun 2021 19:00:41 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyIyB-00BtRK-CU; Tue, 29 Jun 2021 19:00:28 +0000
Received: by mail-ed1-x52d.google.com with SMTP id t3so32685597edc.7;
 Tue, 29 Jun 2021 12:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=T2w95C+qM8k4odXnWTg+Qy+O6s4VgV9B2PzrgUQXnKg=;
 b=BSv5xS6GlW9bzmWJDOWNhjaCgHH2uVlFFzpO6OOCFWUGAayOsUbIpHR2I9n64dwUeT
 0BFcKHQzFU4g+ygEfNZTqJBSYWcwOjYIo5pH+T8xkrTZmYvHfTrvF69lRCqSf8UsfEVa
 0M65hf3m4blUhYbiFgulaMPx9HmmEWZ8Ha0DqOI9fvSd5dFVOakp+txRPhqW48bX2gVH
 4IZ5LSZIA4Vn6UKS6Zq9qIqiW6TSVlTBPcEYZAfsVNB+/J8Iy6h3LRQPnf9J5471L2/X
 NNKmdMbhYRKoPoVV4B3wuywafJ5cFpfHAwhh1nSe91rC41vH9rHThILaSW1z4oCStJfu
 yyww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=T2w95C+qM8k4odXnWTg+Qy+O6s4VgV9B2PzrgUQXnKg=;
 b=JBcjZ0rf1ieNLAL9B0ezXUQt8oCv8013w2gOALxjoZuWeQwTzpq3/In0zRLf/jOIs0
 QVeyXs8DiBYR8Z7CZsQsr7Wxm9D5oiHZYVI0ZV1OFgrJt2IitwHHKB+Lm8J3w1oqkB21
 kulUevj9kG0dsE+RtbLSyIbqjtsWqSRJIj+U0FLACd9EYfc74P76Tm2MvAjlq/D8OAt+
 G3C2rw0T/WZy3e4P5DN770AUWun0lLyrKvKaeeDvZ68HjQKVbjwQ+oQVsWr7cm153syP
 2cDrSdXkZznZAguzeFTDNQtB4ACEg3OsTYXiTqx81m0+DRoOl7iWZxu1bYp6gkbY0Vgi
 IinQ==
X-Gm-Message-State: AOAM530x6TvjwQIX7OwK++DtN2ILMy/OB3UDSb7YtNQqfTo/rTqVNb3B
 Zy/gWkrMnq3+c/IbIyabpOaU9O2/D0tNW+ecpm0=
X-Google-Smtp-Source: ABdhPJzrCyLePOZbwU/YpHBQ4dDhsP2MEebHmIWdFgk1MHa6jvvw6Bo0yP64kVLq5ru5+iYeULC4Bf9NSf6Uk3j1hlM=
X-Received: by 2002:a05:6402:b83:: with SMTP id
 cf3mr36314741edb.130.1624993225914; 
 Tue, 29 Jun 2021 12:00:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210629121459.6341-1-linux.amoon@gmail.com>
 <CAFBinCA=COnsN4Cp-z0HAPgs4kqPdiKtkZkr_LDkGz68s7B7hA@mail.gmail.com>
In-Reply-To: <CAFBinCA=COnsN4Cp-z0HAPgs4kqPdiKtkZkr_LDkGz68s7B7hA@mail.gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Wed, 30 Jun 2021 00:30:14 +0530
Message-ID: <CANAwSgRD9_B7f5UjPrxeL+x-eMMc2MAG3tXLQw36x0ho+ba_Uw@mail.gmail.com>
Subject: Re: [PATCHv1] arm: dts: meson: Fix the pwm regulator supply property
 in node
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-amlogic@lists.infradead.org, 
 Linux Kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, devicetree <devicetree@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210629_120027_485518_206EDEB9 
X-CRM114-Status: GOOD (  21.85  )
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

Hi Martin,

Thanks for your review comments.

On Tue, 29 Jun 2021 at 21:31, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> Hi Anand,
>
> On Tue, Jun 29, 2021 at 2:15 PM Anand Moon <linux.amoon@gmail.com> wrote:
> >
> > On enable CONFIG_REGULATOR_DEBUG=y we observer below debug logs.
> I (as non-native english speaker) suggest rewording this to:
> After enabling CONFIG_REGULATOR_DEBUG=y we observe below debug logs.
>
Opps: I will fix this in the next version.

> > Changes help link VCCK and VDDEE pwm regulator to 5V regulator supply
> > instead of dummy regulator.
> >
> > [    7.117140] pwm-regulator regulator-vcck: Looking up pwm-supply from device tree
> > [    7.117153] pwm-regulator regulator-vcck: Looking up pwm-supply property in node /regulator-vcck failed
> > [    7.117184] VCCK: supplied by regulator-dummy
> > [    7.117194] regulator-dummy: could not add device link regulator.8: -ENOENT
> > [    7.117266] VCCK: 860 <--> 1140 mV at 986 mV, enabled
> > [    7.118498] VDDEE: will resolve supply early: pwm
> > [    7.118515] pwm-regulator regulator-vddee: Looking up pwm-supply from device tree
> > [    7.118526] pwm-regulator regulator-vddee: Looking up pwm-supply property in node /regulator-vddee failed
> > [    7.118553] VDDEE: supplied by regulator-dummy
> > [    7.118563] regulator-dummy: could not add device link regulator.9: -ENOENT
> excellent catch, thanks for sending a patch!
>
> > Fixes: 524d96083b66 ("ARM: dts: meson8b: odroidc1: add the CPU voltage regulator")
> > Fixes: 8bdf38be712d ("ARM: dts: meson8b: odroidc1: add the VDDEE regulator")
> >
> > Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> Tested-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>
Thanks

> For the subject:
> - patches for 32-bit ARM should start with upper-case ARM
> - personally I also include the board name so the git history is easier to read
>
> My suggestion for the subject line is:
> ARM: dts: meson8b: odroidc1: Fix the pwm regulator supply properties
>
Ok I will try to incorporate your suggestion in the next version.

> Are you also planning to send patches for the following 32-bit SoC boards?
> - arch/arm/boot/dts/meson8b-mxq.dts
> - arch/arm/boot/dts/meson8b-ec100.dts
>
Ok I will try to send all updates in the next series.

>
> Best regards,
> Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
