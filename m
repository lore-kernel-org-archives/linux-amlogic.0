Return-Path: <SRS0=kcVe=53=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7DC6C2BA19
	for <linux-amlogic@archiver.kernel.org>; Sat, 11 Apr 2020 20:54:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8034A2084D
	for <linux-amlogic@archiver.kernel.org>; Sat, 11 Apr 2020 20:54:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EZPK1+pa";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="uV8o6Zrz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8034A2084D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X8xYV7QTUDiV2J8khI96oN9CMfvW65F3bZ3saOabZWU=; b=EZPK1+papkZhyj
	/x3e0X8JJDnAC2quhzoPkrrTzCDQTjUFK/epkFeJ/s0cQUoEyFqazMsy1gOTxsWecp90Q2ueEccZY
	gf7R9c+j/4CYaAXmxze8mo5XqHWQu3Qu25DrF84Vb02mzatz5iRrQf7vQYw1lSX9Z10GKaJVYLs6H
	T7gJqUvG5JrI+vVzch8DHOx89gkaA0EIm7ik5Jk4ExcfwbDD+JOuKUnszWjavu4UoGIX+HjtPVd2M
	YgrrfykdBtRA+Hz4OLbqzSTtSUwFUx3HhYcNSitnmlpMUXsfuen5NObyeJqyBmx9TLNAsRYOjagqa
	CgYQLM88x49Bhmn5kq2A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jNN8f-0000Lx-VJ; Sat, 11 Apr 2020 20:54:05 +0000
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jNN8d-0000LQ-Nq; Sat, 11 Apr 2020 20:54:05 +0000
Received: by mail-ed1-x543.google.com with SMTP id w2so351454edx.4;
 Sat, 11 Apr 2020 13:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DpPxEWdUioZn0HQBN6mQ3Q1Ob+fhxROdq5kNfultqe0=;
 b=uV8o6Zrzip2ioASe/aWS4uXvVFMa3myxewPYeEnNDC0qaR7bBZVUnx5TAXo42zU+mT
 EGyAyToZyyI3SNTjHdnBQXAnBZ0YpvS+8sWFjlkbN006pdPypOunFi28q4GHWhiyC5UN
 V04MspF2oljn/e7Muu86Rn+VMAFmYYp3V8mmy9pjPGv3b7+2Wa9lDQKQ2gczJPiqfWDO
 Mn8yGKCpAjPKRs/jHFX9fa479geh2aNUNEUNvvbKYG4ZO6P0Q14saXOSGjLKPkxfkwU9
 LNLgd+l6Jx2PjSnzAWJuhsq4WdmYLsRBNguCYN8YxzOWoiQv4jTJjVgR4jhaFJ/nGYP6
 Ji8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DpPxEWdUioZn0HQBN6mQ3Q1Ob+fhxROdq5kNfultqe0=;
 b=QkFAVU9VhZbHYyX+7z8MJslkkWK4EyeXYgLC0R709/M7h6YNoO9g9lQGLknWv9Tpci
 Jn9dZW+mzEHd3Bk0Ik8+MdwsUiC6Z9zIV2mtm4DbDTry3mv+j2Jdq/7vyow0ryCfDmRU
 kJ7t8W7eNj7OrUjq3/0DrRPTdl1ne+pD5d8oudXP58tYl3+/6tRnRJc57fhoATECdvW4
 v5a+GndhSMzuPWNi2/ONbhRqNH+tPoHme4NthQdvu/nwmmnpmaoeHYGAfPFIgLoHFS4P
 jVXveNV6smfzaHI5DFB8xKYAAvhdYexCjTgrYr8q6bYJRd/5cQPco4qUPUCfJBEe/Ahx
 gIQw==
X-Gm-Message-State: AGi0Pubosl9RM5DE2wR8sN28f3kNCtpjKhb8wVSHrcZvxmkSWd2Daq0b
 hoAfKOUPHOYHOqD8IBIuTg8EwcepQygRiHKbgyQ=
X-Google-Smtp-Source: APiQypJIyy959kWit6wOcPV+RL4aML0qO6rTxQ8ZWgimKnCOgqQggo5+d4M8bUVBY9+zdR8WOiKOCdL3T3EfdqTZdT0=
X-Received: by 2002:a17:906:4048:: with SMTP id
 y8mr1640707ejj.258.1586638441265; 
 Sat, 11 Apr 2020 13:54:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200411170356.1578031-1-martin.blumenstingl@googlemail.com>
 <20200411170356.1578031-3-martin.blumenstingl@googlemail.com>
 <1jlfn2szqp.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1jlfn2szqp.fsf@starbuckisacylon.baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 11 Apr 2020 22:53:50 +0200
Message-ID: <CAFBinCDut=qY9f8BTwRrHC6zKMGK4DEqXFnd8BxN6S2OatXrWg@mail.gmail.com>
Subject: Re: [PATCH RFC v1 2/2] pinctrl: meson: wire up the gpio_chip's
 set_config callback
To: Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200411_135403_799416_67F4EC7E 
X-CRM114-Status: GOOD (  13.23  )
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
Cc: linux-gpio@vger.kernel.org, linus.walleij@linaro.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Jerome,

On Sat, Apr 11, 2020 at 7:23 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
>
>
> On Sat 11 Apr 2020 at 19:03, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:
>
> > Use gpiochip_generic_config for the gpio_chip's set_config callback so
> > GPIO flags like GPIO_PULL_UP or GPIO_PULL_DOWN can be used in the board
> > .dts descriptions.
> > This is required for some Meson8m2 boards where GPIO_BSD_EN provides the
> > "MUTE" signal and requires enabling the internal pull-up resistor.
>
> I think your addition makes sense but, FYI, there is another solution to
> your problem that should already work as it is.
>
> If the platform requires a pull-up, you could set the pinconf 'bias-pull-up'
> property in dt in the pinctrl definition passed to the device using the gpio.
Thank you for this hint.
personally I find GPIO_PULL_UP is easier to write when I'm passing a
GPIO descriptor anyways.

> There is an example of that in meson-gx-libretech-pc.dtsi with the phy
> irq pin.
I'm still hoping that pinctrl-meson will gain interrupt support one
day, then the driver will (hopefully) take care of that :-)


Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
