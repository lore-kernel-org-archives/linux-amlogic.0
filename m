Return-Path: <SRS0=Jxtm=P4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2B40C433F5
	for <linux-amlogic@archiver.kernel.org>; Tue,  9 Nov 2021 07:58:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9685E610F8
	for <linux-amlogic@archiver.kernel.org>; Tue,  9 Nov 2021 07:58:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9685E610F8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FpIZGaumNW1G8D/cBE3fLOXKRg8vqWIUxodVHt/fRng=; b=E4lrr/xRee2jRi
	phGMKg6zGIV07Em0tGXAytxF5xlVwBgSV2b6nKcm60A4VGtBYIv6q/2vHZkbMirmYeMdxoGWvsHHc
	JAi7IyVbucF/ObPTzfuCaCS/+2EPF4PjDZrG0qQIoN7h+8QiBxSxvhkRctCk6t4pB6Jtb1tFBMsoB
	rFuiplmLELQOgBvS413/ICO/lXuahbQk7Le/FQj5oQIM9j39G97cBjeUwlVwU6D50PHdnv+5dCWo0
	94PR9b2RbvWAUkD2IhoJkxFv/Xb1zpxYLBNxCkmLXlbOzrkzdieR7Q0A22uMt5b43At8ZXBNr2+9p
	Si9mTZIqQn/dy0MzeFiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkM1r-000tnC-9P; Tue, 09 Nov 2021 07:58:51 +0000
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkM1e-000tjg-AG; Tue, 09 Nov 2021 07:58:39 +0000
Received: by mail-io1-xd2c.google.com with SMTP id 14so3826254ioe.2;
 Mon, 08 Nov 2021 23:58:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mwjsBGGCD6Y+on4qfMjaXA33EoSJBoNN2vPwpqcskAw=;
 b=IUrbL9AlXk0fdCuMK9JGzIsT37RIpNJ6ScHSRTi1DByphfQvE3lOk9ocM3uDuXg7PB
 gnVVwQte6EMSeXZV05BV+85MANq9JJEED/KtO8xUVV9cBYhTpIGQSEdIAYbZ3JTmd4+o
 /AfJf7g08Ob4VHcZbz7jlBiffZgU37nw4B9cBuyTemakQuTrzlGZV4kuoYYpVwa8cXYP
 WjhgnHc8NN2jefYORH+ysnkAsjkb/z1VNKYjDqNfwTpqQJGKn/6IJinYvBGG4XUtgG7b
 Atj4Uo+cPIFWbwlF2gJLrTr24uiTTz4tfhvXx8gNTylOLSe6t9r0Im+jbdYumsXSuZ5Z
 jJvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mwjsBGGCD6Y+on4qfMjaXA33EoSJBoNN2vPwpqcskAw=;
 b=anfw8DAKVZr2BevfZ+6L39o0nHLzSg8kdougmcwxXrfYZNmracx1pQLvjWPCN9drcn
 FeOAcvk3OC/ykbvAucubL/L6FXhyJU2osQdChqi4y2zB4Y0xZVJqWWfSOt+QIn6eqKIR
 L6Jy5yeqgNmaEQu68YHsQcg7IQWUAlm5GE4c4C4dvjB13XZ8jyk2JN3A1lCyQQd3k3Qf
 RPH5nnRwr5ize3vJ5dLTm4hqopCDKABQeSus/Qg+rOOar2mXmB2SWsUI6fs20sQBxW3x
 j8t5AqUBh0PAhL1ILUpPBgkq4NBQL/XNxqOVIxzjevS+KarBEGgug1WJSYgjPkSMRsR5
 VGDw==
X-Gm-Message-State: AOAM532GDTqPrgTkDLl8Xs6T+Dl8sRMWZtJqJCNaydTMt92p7B7dgie0
 QIaXSEs/4IL2xIiYF4OZc+4Knkuq174dk7nD0bc=
X-Google-Smtp-Source: ABdhPJycZ82/dQ2znBgL0pLuCJ13f6SPkBhb/onDv2o3TeaSMpKRDUvadmLYqNTD72F5RNua1MGHp83w166OTPswtPQ=
X-Received: by 2002:a05:6638:348e:: with SMTP id
 t14mr3805695jal.145.1636444716827; 
 Mon, 08 Nov 2021 23:58:36 -0800 (PST)
MIME-Version: 1.0
References: <20210730041355.2810397-1-art@khadas.com>
In-Reply-To: <20210730041355.2810397-1-art@khadas.com>
From: Art Nikpal <email2tema@gmail.com>
Date: Tue, 9 Nov 2021 15:58:25 +0800
Message-ID: <CAKaHn9+sgFXtOXFNx=BGVyaoh6B_ZmVOS0RcWw49tvpJyNcgow@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] watchdog: meson_gxbb_wdt: improve
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: wim@linux-watchdog.org, Guenter Roeck <linux@roeck-us.net>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Christian Hewitt <christianshewitt@gmail.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-watchdog@vger.kernel.org, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>, 
 Artem Lapkin <art@khadas.com>, Nick Xie <nick@khadas.com>,
 Gouwa Wang <gouwa@khadas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211108_235838_380407_F9421D17 
X-CRM114-Status: UNSURE (   8.93  )
X-CRM114-Notice: Please train this message.
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

hi Guenter Roeck
why still not merged to upstream ?

On Fri, Jul 30, 2021 at 12:14 PM Artem Lapkin <email2tema@gmail.com> wrote:
>
> * Added nowayout module parameter
> * Added timeout module parameter
> * Removed watchdog_stop_on_reboot
>
> https://lore.kernel.org/linux-watchdog/20210729072308.1908904-1-art@khadas.com/T/#t
>
> Artem Lapkin (3):
>   watchdog: meson_gxbb_wdt: add nowayout parameter
>   watchdog: meson_gxbb_wdt: add timeout parameter
>   watchdog: meson_gxbb_wdt: remove stop_on_reboot
>
>  drivers/watchdog/meson_gxbb_wdt.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>
> --
> 2.25.1
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
