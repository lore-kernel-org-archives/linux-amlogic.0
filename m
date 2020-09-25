Return-Path: <SRS0=7OpP=DC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48098C4363D
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Sep 2020 08:04:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 908EA208A9
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Sep 2020 08:04:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="szaoWaMj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="k4bh6DUj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 908EA208A9
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EVMXS48gcW12goQVpSM7TdUjmrBk6F9lD5kN5XdTQQE=; b=szaoWaMjngeQMoNEfnmwXxdu0
	aOlODnjxgMcYQuBui/xHV77CbSujK6ZEGI0BXy2XUee2VSE4JgzPlkTyfnR4uO0vJ7Vs1R2+FCf4z
	Mm9ugX6u8Extm4/2BKdtMEc2zvEHa6tv1YOFP0y5yANQRGNHe0BUwtLUrLCVbPJ0XZeSJ4HaDsAhe
	ajslH2aXrgAks999/elU2OyeLkRaCQ8A5YiZe8VtHI0L9yvIU2t+kao2pPUtEUaGHyvfQra/U0W+L
	ZSmGyYbQyvMaa4S1Si8XGgT9V4I2GWx6UWD+MKI4e/LwOow2yQ7Wr8C4HtZWjZ5OiLiRn1X8bVIJ1
	jiXuSqd1g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLiif-0007sI-D5; Fri, 25 Sep 2020 08:04:41 +0000
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLiib-0007rH-RY; Fri, 25 Sep 2020 08:04:38 +0000
Received: by mail-ed1-x543.google.com with SMTP id w1so1578009edr.3;
 Fri, 25 Sep 2020 01:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9nCoifbkeuSkm32g7FfRMjrrGtoOLRMD6Zxww8rwgSY=;
 b=k4bh6DUjkzSke+B7L/UMoe1ivoznzvxi0ad4wPwtsZGoWWxk3Udc+bdz7nyo6ZmxfS
 qkPJshm7a2kWgy6KAEhURguLEO4FJflS+R/I1mdeCCmfiU0BhzyucFSgjoSIiknjqS/3
 5LDc1Qz9DCmxM2zeZzyCXs/M58SfCe0gx94TBzDZfRMHZIqRM3vulgl2BldpdenUS4DZ
 kpg0EXJManOmZwY0vT1SeOP6Eelac7dtp/TS1xaLt96PfJmjz0QCDPIep9SaoEuM/8kK
 01FVFLu6nuBWpYrWDrn1QrmQ4azWiIXsyAjZ5Qn35TwO0+DxfgkqlpufcovPi7zAnE2S
 xJgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9nCoifbkeuSkm32g7FfRMjrrGtoOLRMD6Zxww8rwgSY=;
 b=nF8fE+NMRjLJboopdAwm9o2d931SNmYbeSv0Nssz6uTCfMzjN9gvRe2bjhbpVy377Y
 tA6AUGx6KI+B2HIXlnWcAC7XumnsVg/hEGkoMd/FVqQpWlwPHJg5CT4uIsN48PHgArua
 5sH3cVIjsUJaoxqM8YM+FtAnPFAYESA7hu/Ze4Co2i+PI9D+oqsUGa/YSsf/LJqyY5HH
 1fiHd0f6neKSII3ge/Vex8pN+KZ3h949IcPgy1oWoYlZvclc299Vhs0jB5O+wPT7JD1a
 8ajczfrJ1ZOMLe6+6QTqOLqB2zFHfnugvtlZBELMP+Kr6JgLHJMcSHnamAm8HonwANt5
 6xpA==
X-Gm-Message-State: AOAM532v+ESjcpqs2W8Bvq/DwbXRqy4NYppbrJALU1Y2DHpTtgXzDege
 vPXnMghH+y923ifvddLyIVSjpkihk6Vcy16ZiaY=
X-Google-Smtp-Source: ABdhPJxeDIGT9fA+GFpnV/N6d8qqejXu7XMaJ3dwMmOkk5HsY/gbxhunvPYF46+CM+RrsH5NNhmumepRvh+9msyzJwg=
X-Received: by 2002:aa7:d6c6:: with SMTP id x6mr14862edr.338.1601021072020;
 Fri, 25 Sep 2020 01:04:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200925033017.1790973-1-art@khadas.com>
 <20200925033017.1790973-6-art@khadas.com>
 <CAFBinCAJ6svwiv9OM6EHz7468D9h+jW_ULiGrorgLetcODsAKQ@mail.gmail.com>
 <CAKaHn9+CWLJYN1Tt46VxBGNBEbVVJZWeL6ZJSf9w-5DmoxrvgQ@mail.gmail.com>
In-Reply-To: <CAKaHn9+CWLJYN1Tt46VxBGNBEbVVJZWeL6ZJSf9w-5DmoxrvgQ@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 25 Sep 2020 10:04:21 +0200
Message-ID: <CAFBinCD0_QgKKcH+Kb2QbMWnx_csoXMEhSFYzmDscdTVB2TUJw@mail.gmail.com>
Subject: Re: [PATCH 5/8] arm64: dts: meson: remove reset-gpios from ethernet
 node for VIM2 meson-gxm-khadas-vim2
To: Art Nikpal <email2tema@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200925_040437_904164_EA4CCC24 
X-CRM114-Status: GOOD (  15.33  )
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
Cc: devicetree@vger.kernel.org, gouwa@khadas.com,
 Neil Armstrong <narmstrong@baylibre.com>, khilman@baylibre.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, nick@khadas.com,
 linux-amlogic@lists.infradead.org, art@khadas.com,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hello Artem,

(adding back the mailing-list recipients)

On Fri, Sep 25, 2020 at 9:50 AM Art Nikpal <email2tema@gmail.com> wrote:
>
> hello
>
> > what is the problem that you observe here?
> > did you investigate further why resetting the PHY changes this?
>
> just try next commands
> ifconfig eth0 down && ifconfig eth0 up
> and ethernet never up again - need full reboot only
this means that "something" is either set up incorrectly in the Linux
kernel or that u-boot does some magic (and the same magic is then
missing in the Linux kernel)
I'll dig out my Khadas VIM2 to test this. what should I look out for
(are there any error messages, dhcp not getting an IP address anymore,
etc.)?

> but if reset-gpios will be remove it works fine already - i have checked it many times
>
> for example VIM3 same didnt use reset-gpios
that's interesting - I'm surprised to see this
I did a quick check and for 15 out of 18 .dts(i) files with RGMII
phy-mode we use the reset-gpios:
$ grep -R 'phy-mode = "rgmii' arch/arm64/boot/dts/amlogic/ | wc -l
18
$ grep -R 'ethernet-phy@0' -A10 arch/arm64/boot/dts/amlogic/ | grep
reset-gpios | wc -l
15

so really I would like to add the reset-gpios to the VIM3 .dtsi as
well once we figured out what's wrong on the VIM2


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
