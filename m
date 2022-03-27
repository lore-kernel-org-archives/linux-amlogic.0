Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D0FFC433F5
	for <linux-amlogic@archiver.kernel.org>; Sun, 27 Mar 2022 19:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WuP6Brfc6YUgSKUb1msrZKoAYomXck2RSi//5AQusfM=; b=H6evGO9XmZK9Sx
	7vOhAnlD/hcMcto9U7z1Qx9mD4PKjz1tfRFpEwqsiKEi/Hsb+IG7gIoe0pcp+At7FDFI9mqul+Lz5
	damIM1xa3SwHaBn+qP8hkSv8G/QfH2ofC8nu8Yi0oQ/WrJ2bkwpvZf84VO58gBOqmIxaY864bMmmk
	Ru7wvQIs9UJQGWyjwekbcRalJJs7tJ/Vognk5PRVsOLlUDgqek0/V99aZqo01jMVpflE8lIaw66JL
	98LIbxnh+QJjAG5Db4Z05MwEhtq/Y0lFdxrnGJNY3SmpEcJZY+dbPktEvMD2Rwi7mwvA8zq3go+n2
	RoZTgMTxCmVzaR2LdYxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nYZ2P-00693d-Lh; Sun, 27 Mar 2022 19:58:57 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYZ2D-00690g-8M; Sun, 27 Mar 2022 19:58:46 +0000
Received: by mail-ed1-x533.google.com with SMTP id g22so3651238edz.2;
 Sun, 27 Mar 2022 12:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SJC0OBpbo1wPJs92walEXwvuMKGL+QuVz9UtNgWIQO4=;
 b=cbr7IATfDrBAabV81aPZWOvIUBIUIpSdkVpz3wjkORMU+Td/ujiwFi9ZmSk3nHQVca
 qjNhZ+aFm+JtQYK//RiGq1gFJxM3cmSauYqUO2zFMLO92vxv2idh3/kJkah5hdsKpIGu
 ohyvdc6aUDzyrgxarmcXEakKWBjWYqlfE3WMVENslcooChfSlJsQNnzSyLyNuECHCTUB
 bRs1z9EhRBXqUQTHHRdq+XJEiCuxMkMsGkp4wRMPUhOZcZzxM7/lQ4CY1YO15gUoudXV
 1CUzBCwGedNlRNVXhiCntP139L693MrUoHassTyuCBVby16DlShHN5rHMaHEZH4B0VAv
 665A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SJC0OBpbo1wPJs92walEXwvuMKGL+QuVz9UtNgWIQO4=;
 b=UMwt6KktLGhhlzIoiQeiYKJkzbsiILRzJhkOulvKZ2y9bcgAesRfaID5OCvmaRFjts
 GSoe2Qb3HahiGyIXhlYfZ2UUUDH/MlEpykZlbNJwKuYgSX6Z9hPQSUP181pkZMI7UjuG
 IVrnJ2VM9SK7WZOSJ1kpdM4yZoZeopgNnrGt0L3JF3gF1e6LK7luxzKrNDPvWATC3biN
 c/Dipjbn9/OSRmDFXaTJBMwRAOUS27jhqbUQJmkGMqHWzk7nYary7oRIRDTfDn3kfk1a
 fJoQVDSKqwf7kzNGcaQWsnIqbXm/LqNvlN2KR99qHCwNy359nsz/Aj1xVOfMkY0kRI6z
 sQzw==
X-Gm-Message-State: AOAM531S3XHeErK/KBKKWxiDQVfGkRAxNt0abj7rVLZ9lLO3FebQU0GL
 SHUj3++XrBAFfE1wBauaEXMHC0Q/vAmFsekQ6A8=
X-Google-Smtp-Source: ABdhPJwgGCwymYiuaBSFEllOtIN0gwhVm7kC5VU8kOJXl9C6VXio0PVhOi6MtGOhiTL4+DgFpjcuqUXIPq2NqVcjDUg=
X-Received: by 2002:aa7:c30f:0:b0:419:2af:4845 with SMTP id
 l15-20020aa7c30f000000b0041902af4845mr12139494edq.296.1648411122928; Sun, 27
 Mar 2022 12:58:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220325200338.54270-1-andriy.shevchenko@linux.intel.com>
 <20220325200338.54270-5-andriy.shevchenko@linux.intel.com>
 <3415996d-e8b5-2416-fb66-e65779a9b507@omp.ru>
In-Reply-To: <3415996d-e8b5-2416-fb66-e65779a9b507@omp.ru>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 27 Mar 2022 22:58:07 +0300
Message-ID: <CAHp75VdoKOqaR5XuBvZ9EBPRE+ULvXf+B3sh1rQ6RXt_ovcsbw@mail.gmail.com>
Subject: Re: [PATCH v1 5/5] pinctrl: armada-37xx: Replace custom code by
 gpiochip_count() call
To: Sergey Shtylyov <s.shtylyov@omp.ru>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Linus Walleij <linus.walleij@linaro.org>, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, 
 linux-amlogic <linux-amlogic@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Andrew Lunn <andrew@lunn.ch>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220327_125845_331626_FF4061D9 
X-CRM114-Status: GOOD (  11.90  )
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

On Sat, Mar 26, 2022 at 7:02 PM Sergey Shtylyov <s.shtylyov@omp.ru> wrote:
> On 3/25/22 11:03 PM, Andy Shevchenko wrote:
>
> > Since we have a generic function to count GPIO controller nodes
> > under a given device, there is no need to open-code it. Replace
> > custom code by gpiochip_count() call.

...

> > +     nr_child_nodes = of_irq_count(np);
>
>    Mhm, 'np' is no longer assigned to it at this point...

Good catch! We may retrieve it by calling

  np = to_of_node(device_get_named_child_node(dev, "gpio-controller"));

like it's done in the previous patch in the series.

--
With Best Regards,
Andy Shevchenko

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
