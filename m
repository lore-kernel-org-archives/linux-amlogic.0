Return-Path: <SRS0=YI5+=XS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8834CC88CAA
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Sep 2019 20:50:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5CF12207FD
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Sep 2019 20:50:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="d5zX36be";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="Uc1rJg9E"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5CF12207FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BuLWHUQCRMh9a7tQPNb9fCjX84O1w72YHTptEWcZiu8=; b=d5zX36beEiuCjJ
	Bfj3MX0+fFpoDmj0Ub9NARQ6UkDdn3a9k7dpTwf2OtQVYwKMw1FFr1dSGA3wQTwZZ9xkFjey+2rvk
	WjqPdsHYb/UGObIxOOBy6WOuSL9fgly71XPZDC+1aOCAc03+z4uKvJeLFKCGkq360Ex2qOjG0vF2x
	RDaRO+eiK13M0ijTD6xzkt8FrkeNtCN/eunjcOJlIMVuDQmlKXoVeXy8Y0hPcwclmqCKMExELHVZ0
	J5oixLNSm3F5ydPa31b5+L1njcXkL2nMWroCPJgaoTUVcI6dXjZ7dO2Dlbm/rHkWUaT03R175/ruv
	ZDnLMB4rHXWRkGrvkfwA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iCVHN-00040N-TN; Mon, 23 Sep 2019 20:49:54 +0000
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iCVHK-0003za-Oh; Mon, 23 Sep 2019 20:49:52 +0000
Received: by mail-ot1-x342.google.com with SMTP id k32so13406146otc.4;
 Mon, 23 Sep 2019 13:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MAD3Xg1lcz/vWNfKOXbNQkNK8JcAqagoLevWw8c1H8w=;
 b=Uc1rJg9EHlGwJNJeN6soMEoo/3M+ZsjMSxAMCVEA+f9rOyJvTLPXhHKYXJwgIcEzBr
 e+3CndfndOMezv1Ptw3MLfFegfdCU9l142+6xMNb6yc4r537qDyguMUGRJy+2tVBa8tR
 F3znac2BBuFbLhadIwE1d+eNekHVycr0brsa51/cTtZc6+gj6CyZzfwmL64hoJreYrbK
 BNsn+vt4zqHzlSpK9FPzf9skcHsynz8YunjI1ogBbKbkLYBspiO7cYeF+/GORadBkgQs
 BoXGJUuzpml3+FLUCkphSuXEpIZ0v82lo8jO+mArHKkjDH3EoiOUfBwEJn5ZHqf0JXAZ
 jGjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MAD3Xg1lcz/vWNfKOXbNQkNK8JcAqagoLevWw8c1H8w=;
 b=k2vKxFePKV1OJVY5o82v5IQhRKWvMBqA3D+cA8f532wY2kPx50lT/NYxR0pCtmw8a+
 BFacWZlS1wbMKFpxA5iyAc1HRqyKSdmSgqpRR2zozNLhgxKcdpK1WJgUqMTZJBV+4rMt
 9Fza6mfFxvXriOXa8vjYGedSbU74J8w1nrL7arlm9KMgmiXeW7qLC4lNgX7BrfLLXLXi
 vRILKFA3wVxtVNYb6WyMN+RjSO9TnUBYWTUdKL7s3jXmGwmzbOXtGxAMq2tVC0Oxos4U
 j43O1vttOEE12BcA86ZTCEaVQo4961AtmaR+HYGJBuZX9ylYPRfC8kRw9P+6H2z42DwZ
 xYBQ==
X-Gm-Message-State: APjAAAWgvpvIVDRUaxha1lvJSrLqsDKVHX34M1auN6uHzCC9TCyEDHlp
 Zc5XIKaNqS+ohDyA+gKv0ly492u5V0aAMoFzKzA=
X-Google-Smtp-Source: APXvYqxg9tfZ17T4nhNMMZMbP5FnSoEzZH0Yj/hpHqWL0Dt5cVhCyLOpWwrFdj59nZDuupSIBtRiMaKO4g+TxYTiSnw=
X-Received: by 2002:a9d:7d17:: with SMTP id v23mr161527otn.81.1569271789175;
 Mon, 23 Sep 2019 13:49:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190921151835.770263-1-martin.blumenstingl@googlemail.com>
 <1jsgons4wy.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1jsgons4wy.fsf@starbuckisacylon.baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 23 Sep 2019 22:49:37 +0200
Message-ID: <CAFBinCAHD+D=a2mHeHMGq12MvoksHBr308jSrdcH+UYsUmwd8w@mail.gmail.com>
Subject: Re: [PATCH 0/6] add the DDR clock controller on Meson8 and Meson8b
To: Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190923_134950_832933_DB413C05 
X-CRM114-Status: GOOD (  15.81  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>, khilman@baylibre.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Jerome,

On Mon, Sep 23, 2019 at 12:06 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
>
> On Sat 21 Sep 2019 at 17:18, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:
>
> > Meson8 and Meson8b SoCs embed a DDR clock controller in their MMCBUS
> > registers. This series:
> > - adds support for this DDR clock controller (patches 0 and 1)
> > - wires up the DDR PLL as input for two audio clocks (patches 2 and 3)
>
> Have you been able to validate somehow that DDR rate calculated by CCF
> is the actual rate that gets to the audio clocks ?
no, I haven't been able to validate this (yet)

> While I understand the interest for completeness, I suspect the having
> the DDR clock as an audio parent was just for debugging purpose. IOW,
> I'm not sure if adding this parent is useful to an actual audio use
> case. As far as audio would be concerned, I think we are better of
> without this parent.
there at least three other (potential) consumers of the ddr_pll clocks
on the 32-bit SoCs:
- CPU clock mux [0]
- clk81 mux [1]
- USB PHY [2]

I have not validated any of these either

> > - adds the DDR clock controller to meson8.dtsi and meson8b.dtsi
> >
>
> Could you please separate the driver and DT series in the future ? Those
> take different paths and are meant for different maintainers.
sure - so far Kevin has been doing a great job of still tracking these
but I'm happy to split this into two patchsets


Martin


[0] https://github.com/endlessm/u-boot-meson/blob/345ee7eb02903f5ecb1173ffb2cd36666e44ebed/board/amlogic/m8b_m201_v1/firmware/timming.c#L441
[1] https://github.com/endlessm/u-boot-meson/blob/345ee7eb02903f5ecb1173ffb2cd36666e44ebed/board/amlogic/m8b_m201_v1/firmware/timming.c#L452
[2] https://github.com/endlessm/u-boot-meson/blob/f1ee03e3f7547d03e1478cc1fc967a9e5a121d92/arch/arm/cpu/aml_meson/m8/firmware/usb_boot/platform.c#L22

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
