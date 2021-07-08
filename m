Return-Path: <SRS0=GyIY=MA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45112C07E96
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Jul 2021 12:58:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 03E2061456
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Jul 2021 12:58:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 03E2061456
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HHzCedRIO58i8iugZ3tfY2u67pcBsyCuzuOYOlWu4xk=; b=WBlkWlxpLo95Us
	OrtPfg/pP7Mu+n9TQlv/KxaQVI14e6VJ8LMTancsU7mfKILNliPiLkM6WTCk7rgiBSa37JYBbd+FZ
	TU8bdNI1eUU/Icxx66wURBgkItx0QdB+PqGyNhRcVskP35CSC4xh1CfLyDDBXDKbUZ8RFtaq+/92g
	NijltSH1ZqCgk5p8Olhu5SBS9WKKjtGhpOLO/chSqcU2fKz9jYGZd/ym7AExnfCoYSn+qciZHcdHe
	ARJvQHHY5YrQ7sJ/Vl+G3HF58CRR+PfkjihcQK0SBHuvdBDuiBg+B7oeULg/aPvMPmasw3TwQ2xw8
	g8hZg2aFu4OiP/sXNzog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m1Tbu-00GzPQ-Ma; Thu, 08 Jul 2021 12:58:34 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m1Tbh-00GzLM-8W; Thu, 08 Jul 2021 12:58:22 +0000
Received: by mail-ej1-x629.google.com with SMTP id he13so9424666ejc.11;
 Thu, 08 Jul 2021 05:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6s8n9vrT87My3E6DX+6DGL/DAUdwKgYVA6j/IcbbZfE=;
 b=tO0i0726Ql5fGaRAzhNoGLJXndmFJDrVzeJ4Gs25f7K50DVpyAmO9ivg9gT3qUBewk
 ejApU9PGkHEAigwnwmwm8nxMW1SkMXxr1HTNQQ/9HAnCy6CZGtFqU5kAf6REvCtyMrU6
 q4acdbmsBpOreDu82XGOZ2tbz2EF656wFktGdkUoMGmNcU74YreoDDmtXojRIYr1IGHh
 GqsJpiOXedilvYQaZZO7OAAq4RBbG9pCk4YbvqEpkfXDRtLnGX9tu5jlNFqvLHArZmbm
 GnetzX+6VUbpF2LcK9b7g1j4V9rlhFYnYT+LKz/zRs28nc8WyHOMnEQ31g+2YbavdyaX
 1qPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6s8n9vrT87My3E6DX+6DGL/DAUdwKgYVA6j/IcbbZfE=;
 b=HF6MaSloOrHqoLl26frR5EuXH5JKVoPM8MFQ+ZGAXbDOk9xDG0MY3SpULdWSfh4xOD
 WR1nigSbHqHjqXx+nrS79TmL+3mHpEWoOM5O+J2OIdchU+/fis0SbqAFkbbjtL7NY4vj
 /kyuey5WP7e6OBoityLd//NFIAsNle2wbeDbn9kc9Tc1TmzCJs0cV5oI7V4ZHK2H4NoY
 1CAkkPB0QZ+UPMPCxbpX+lEdecP0qXfb408J7TT0wl7Eu3YHa0fn5vUi2wP6W/RQWufz
 pyv0bOTebJgmZAJW8fvRxebD4v7vewJERE0uOL3ZPJRLAXPr5JYeauqIKNVuaPs0u9cY
 Rf+w==
X-Gm-Message-State: AOAM5315zkborHuUfwaIF8w2e1FMjSmoENJ1UArU0FUbp4LE1QKaDqnK
 83Edns0pH3xYvJpbp+d5RegphX0iaSwul0nGSY4=
X-Google-Smtp-Source: ABdhPJwKktIYeiljgC8utUJP2pYHqZaFRVd2qAyoVyuCOGhLzFmXBPN2e0GbJXvv/Q2ls95yoXc3vbfOu3XWtZ9mQuc=
X-Received: by 2002:a17:907:2d86:: with SMTP id
 gt6mr30027442ejc.428.1625749098639; 
 Thu, 08 Jul 2021 05:58:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210705112358.3554-1-linux.amoon@gmail.com>
 <20210705112358.3554-2-linux.amoon@gmail.com>
In-Reply-To: <20210705112358.3554-2-linux.amoon@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 8 Jul 2021 14:58:07 +0200
Message-ID: <CAFBinCDaiu-tuo654_UTmxb0yeqQ8YqxCC7oVxq1EU4AmQRQdA@mail.gmail.com>
Subject: Re: [PATCHv2 1/3] ARM: dts: meson8b: odroidc1: Fix the pwm regulator
 supply properties
To: Anand Moon <linux.amoon@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, 
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210708_055821_376500_50A8C9C7 
X-CRM114-Status: GOOD (  10.36  )
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

On Mon, Jul 5, 2021 at 1:25 PM Anand Moon <linux.amoon@gmail.com> wrote:
>
> After enabling CONFIG_REGULATOR_DEBUG=y we observer below debug logs.
I think there's a typo here: observer -> observe
maybe Kevin or Neil can fix this up (in this and the following two
patches) while applying the patch so you don't have to re-spin a v3

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
>
> Fixes: 524d96083b66 ("ARM: dts: meson8b: odroidc1: add the CPU voltage regulator")
> Fixes: 8bdf38be712d ("ARM: dts: meson8b: odroidc1: add the VDDEE regulator")
>
> Tested-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
