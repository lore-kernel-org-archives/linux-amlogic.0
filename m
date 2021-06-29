Return-Path: <SRS0=fP31=LX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B372C11F67
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Jun 2021 16:01:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E26D561DC0
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Jun 2021 16:01:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E26D561DC0
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e//mxis5yMrcFp1asgxwz/IKW4JRMdfVNHQNcRKXhOM=; b=C9bWlxbChNhkjN
	d1ZWkd7RoWX/yTBWVNlBHDoBMu5GJumM4YZRRVxdqq+2DrAvaxylqnTOTVk5ZXVPH1ba3Hae61lGr
	VS2o6QcWLnO2qJbg6PZDh+zi2LoVQvyshmrwNLK6Lz0h3+maMN9d/naemUbQ282jfhh+CSmvG/7w2
	9cxqyXSvFwfp0cZYnMsKnLGsIxdtk2lXZRff2p9XhouUpnGmkm2uW7dGAlQ3aEkoNWIKCgUDGlb0P
	W0l0VnACcxb6zZrjlEn9pfCzha0RQG1r37qilOSJeKLEQsuxacQqy/ItZIJTDkpekHg7kMqYYtAEE
	EAxI6SI3a4FENJaG2thw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyGBB-00BYDZ-JU; Tue, 29 Jun 2021 16:01:41 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyGAw-00BY9a-7B; Tue, 29 Jun 2021 16:01:27 +0000
Received: by mail-ej1-x635.google.com with SMTP id o11so24068158ejd.4;
 Tue, 29 Jun 2021 09:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CIUGtD1bEi8eoUbDB+wA/CgJYYMPlq0BzUAT42Y9V0k=;
 b=KY1ebxS45Not5cYkWjeUO9g0K+pOkWHpuYWwvigvSekrUgQf8B9aMyjZyvOvSIPohe
 MRDIhzcLMFUwkry7MIo+mXyWpmBOqz8524RarDKeljUscfem6vSbkYrkQn8eLVaVHTEe
 l+hyuHhMg7NikvRQBAIMmiFrVlrkFOcg57pksunjR65ClaCLLE2Ywk7dx1ATmCmTHbtw
 Dzf7yJ5mblmvsPF7e8O1tPk/wf0vpx2ItEzuLiNngc0IszwpxIAEjQVit7tT8sehjuXW
 J9Wyw+/YruoHjUJ4+/CdA7BZQE/A5nCizXlwLNMjIN1OjkX5vy1Q1cVrkYKtI50kM85e
 TM1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CIUGtD1bEi8eoUbDB+wA/CgJYYMPlq0BzUAT42Y9V0k=;
 b=cBx+n1n9uEl/tOT2ZBglq/AsY59dwMEZxferqW/U89oriJKK2mn6CKU9JykCETes7I
 EhHKEAteDrWyxU4rJYpY3pKQWF8tfB1XWqD5CVuLpPlMW5qjHk1LppMeJrZviYx2VyKd
 1GNhxMtejz5ig0ElDErnFy75fJcPHoxJbnsICuzNYG7hyf8kkH7nx3YnUCDCvm+EwK85
 MvPNEKr24Q0BdtwV2hs6MYA0bAO7UOA9G5qOSVhFcDVf97QpZg3A/Q8qkff7Ik8qKr68
 JShJc4m7paHkfAHLCOWN6MT3JI3vabk4IKvqhliQoPKS/LVc+ewI7JXa+7mc/vZ1nxmD
 N/3A==
X-Gm-Message-State: AOAM531UKRu7LYQBFaljMI3RFJAeYeeFuR1DM+Lp1Fh2DKuP6PVby9Ix
 Fqy+Z4wNpkqqoaImRAa54gO/z+4F7G6v17AO/iA=
X-Google-Smtp-Source: ABdhPJwL0a8Z0qyHuDQ5nOn433fUQTT/9Adpa/RgGpa+Uk5hfcT9+hMbCvwns9mpypZMUeAd/h3HXLvSZLd9XFGOANo=
X-Received: by 2002:a17:907:2d86:: with SMTP id
 gt6mr611612ejc.428.1624982484212; 
 Tue, 29 Jun 2021 09:01:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210629121459.6341-1-linux.amoon@gmail.com>
In-Reply-To: <20210629121459.6341-1-linux.amoon@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 29 Jun 2021 18:01:13 +0200
Message-ID: <CAFBinCA=COnsN4Cp-z0HAPgs4kqPdiKtkZkr_LDkGz68s7B7hA@mail.gmail.com>
Subject: Re: [PATCHv1] arm: dts: meson: Fix the pwm regulator supply property
 in node
To: Anand Moon <linux.amoon@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, 
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210629_090126_310363_DC27B34D 
X-CRM114-Status: GOOD (  12.38  )
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

Hi Anand,

On Tue, Jun 29, 2021 at 2:15 PM Anand Moon <linux.amoon@gmail.com> wrote:
>
> On enable CONFIG_REGULATOR_DEBUG=y we observer below debug logs.
I (as non-native english speaker) suggest rewording this to:
After enabling CONFIG_REGULATOR_DEBUG=y we observe below debug logs.

> Changes help link VCCK and VDDEE pwm regulator to 5V regulator supply
> instead of dummy regulator.
>
> [    7.117140] pwm-regulator regulator-vcck: Looking up pwm-supply from device tree
> [    7.117153] pwm-regulator regulator-vcck: Looking up pwm-supply property in node /regulator-vcck failed
> [    7.117184] VCCK: supplied by regulator-dummy
> [    7.117194] regulator-dummy: could not add device link regulator.8: -ENOENT
> [    7.117266] VCCK: 860 <--> 1140 mV at 986 mV, enabled
> [    7.118498] VDDEE: will resolve supply early: pwm
> [    7.118515] pwm-regulator regulator-vddee: Looking up pwm-supply from device tree
> [    7.118526] pwm-regulator regulator-vddee: Looking up pwm-supply property in node /regulator-vddee failed
> [    7.118553] VDDEE: supplied by regulator-dummy
> [    7.118563] regulator-dummy: could not add device link regulator.9: -ENOENT
excellent catch, thanks for sending a patch!

> Fixes: 524d96083b66 ("ARM: dts: meson8b: odroidc1: add the CPU voltage regulator")
> Fixes: 8bdf38be712d ("ARM: dts: meson8b: odroidc1: add the VDDEE regulator")
>
> Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
Tested-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

For the subject:
- patches for 32-bit ARM should start with upper-case ARM
- personally I also include the board name so the git history is easier to read

My suggestion for the subject line is:
ARM: dts: meson8b: odroidc1: Fix the pwm regulator supply properties

Are you also planning to send patches for the following 32-bit SoC boards?
- arch/arm/boot/dts/meson8b-mxq.dts
- arch/arm/boot/dts/meson8b-ec100.dts


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
