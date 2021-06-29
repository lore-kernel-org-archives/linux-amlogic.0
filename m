Return-Path: <SRS0=fP31=LX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70445C11F67
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Jun 2021 16:05:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 25F1561D88
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Jun 2021 16:05:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 25F1561D88
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g9UfFKi5EPfwhddI8siLYXXrwWSuTw/+TtSdLN4aB0M=; b=Mm5G8cRmPZBYIE
	xk/cbxDh9OgWa7eyUk4+fBRNYeJZOALXUd3u5fobuIWrgdrB16voe0inMarl9a996xT1N4JlTGIKS
	lavKCRoFIrZ29PMh9/MNel2N5DA/XdCZYsQn3AXn1MSFtVVzx4hDDyA52DeloFGFV61Jy8wIeDePe
	zqgjHLspKUlwL2QLmBaa7L2D6DI3cwsusbBQb9uhYjAQn23o+aBLZc6t6aOq4U861YvTWtxcQH8q1
	jZrsdcANDoqhvGxCK42WaYdJRIiDbWddZNq9gd+0lFYqJqY4gvwZupfN6z8e8dWnzus6AYVWN0ImX
	e0+SFW/X+ecOqMviTvWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyGEa-00BZ3t-L4; Tue, 29 Jun 2021 16:05:12 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyGEL-00BYzB-9o; Tue, 29 Jun 2021 16:04:58 +0000
Received: by mail-ed1-x533.google.com with SMTP id t3so31996191edc.7;
 Tue, 29 Jun 2021 09:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mSMaKeRnKB2oNlMP7+IS/2ZtzKYmdtUtkqxJbkL2T2k=;
 b=ngM9W5N2paWWM2+rpyaTLcjFN1N38663nn69udGelKAcal77EX3val2Y6ts8pvhpmT
 9p1m8sV2vPV2DBLdEI0Dvq80UbjPDfYzkssVhnA9VhmiCd1nH1U5k4/18HcUQb15ZSwH
 mwf9jnmgIgyjU6gwHYpfx5KcRtYx/c4zGUQqubTnRr0Kp74KgcN8arF+3N8RIdhs8NGD
 /1FD/7rZ+qWQwFGR2s8VtX8hjXU0YJaYr3ctPzunw5tGAmreTBO+ATjU4QNHrcu5+DFN
 Q6JzbYFpx9RpGjrGlYTpKJRLuyUAqf2yVcv+xF6l7hqTABQpPHQjtwZCKxBcGTwjc+8h
 O2Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mSMaKeRnKB2oNlMP7+IS/2ZtzKYmdtUtkqxJbkL2T2k=;
 b=E4EYL/JNpEY6s0BMuLr6l+sVhs6EUKHhCwf5iCs5FlT+YeAVWDa6cs7HmVgvkzS+yB
 FRI+/Sr8ngPU49mJnqyvLkcdEmtX5A5tmIvT55F5jYTqPD4399wrRZIj6M81+yO7iQrb
 Q1CxdCMgL6P83vc1ZY15GtixmoB+4URbzRzRKNlcyxtvOg2+IVNnkCIzYvBCChr1PltW
 vHyKLSIcD3o7aHXuHYp1EiA8xjm0mYqEHspc0k3fzT9ZJ0yGP4F0gzCoH6Q61+SqYViz
 hM+Z5byX+2eBmn2e4sNn19S4Nl/sTf0yMS3UtzgDtqYVezVTRYXUdi7rVUXzIBu9zC9p
 2l8A==
X-Gm-Message-State: AOAM531VjbXgBoHc67zv5HkMZ3cFl03AnsjexUHhnwISd8yt1YI2Ybj3
 GMGZGAsxGggwu3EooHBlQiO3wg15MVvMCeHXjAQ=
X-Google-Smtp-Source: ABdhPJyBHEpuzEymX76+Mx6swN/2YyM7JkqD0xhzNhKytAogRq9nQTi/CZio/kVrUB5BqYa3tTaMsKrhfnc6IIyv98U=
X-Received: by 2002:a05:6402:b83:: with SMTP id
 cf3mr35497334edb.130.1624982695390; 
 Tue, 29 Jun 2021 09:04:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210629121848.6527-1-linux.amoon@gmail.com>
In-Reply-To: <20210629121848.6527-1-linux.amoon@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 29 Jun 2021 18:04:44 +0200
Message-ID: <CAFBinCB8Gnj++2YKD3hf-8zyLfj5KyE3twv58XKV9L7-2jRmJg@mail.gmail.com>
Subject: Re: [PATCHv1] arm64: amlogic: Fix the pwm regulator supply property
 in node
To: Anand Moon <linux.amoon@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>, 
 Rob Herring <robh+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210629_090457_400934_2A4C3144 
X-CRM114-Status: GOOD (  12.26  )
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

thanks for investigating this and for sending a fix!

On Tue, Jun 29, 2021 at 2:19 PM Anand Moon <linux.amoon@gmail.com> wrote:
>
> On enable CONFIG_REGULATOR_DEBUG=y we observer below debug logs.
see my comment on the previous patch

> Changes help link VDDCPU_A and VDDCPU_B pwm regulator to 12V regulator
> supply instead of dummy regulator.
>
> [    4.147196] VDDCPU_A: will resolve supply early: pwm
> [    4.147216] pwm-regulator regulator-vddcpu-a: Looking up pwm-supply from device tree
> [    4.147227] pwm-regulator regulator-vddcpu-a: Looking up pwm-supply property in node /regulator-vddcpu-a failed
> [    4.147258] VDDCPU_A: supplied by regulator-dummy
> [    4.147288] regulator-dummy: could not add device link regulator.12: -ENOENT
> [    4.147353] VDDCPU_A: 721 <--> 1022 mV at 871 mV, enabled
> [    4.152014] VDDCPU_B: will resolve supply early: pwm
> [    4.152035] pwm-regulator regulator-vddcpu-b: Looking up pwm-supply from device tree
> [    4.152047] pwm-regulator regulator-vddcpu-b: Looking up pwm-supply property in node /regulator-vddcpu-b failed
> [    4.152079] VDDCPU_B: supplied by regulator-dummy
> [    4.152108] regulator-dummy: could not add device link regulator.13: -ENOENT
>
> Fixes: d14734a04a8a ("arm64: dts: meson-g12b-odroid-n2: enable DVFS")
I suggest changing the subject to include "dts", for example:
arm64: dts: amlogic: ...
(note: lower-case arm64 is correct here - even though it's different
from the 32-bit ARM prefix)

$ grep -lR pwm-regulator arch/arm64/boot/dts/amlogic/
arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
arch/arm64/boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi
arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts
arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi
arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
Are you planning to also send patches for the other board .dts as well?


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
