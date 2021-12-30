Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31FB6C433F5
	for <linux-amlogic@archiver.kernel.org>; Thu, 30 Dec 2021 22:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L1pKE+7fpilcpPf794q8owjsWOM86WPu8VnHoPXQGKk=; b=rbZcD5o23Fn/k8
	nR5cPdKaVb5eUS+Fqi9jsq63VkpUa3HPOvTd3xzJFa4Tn/yh4B9KWB2yjLsFchpnB12DLGtg05fxN
	P+DFHwSb/ayHKMOyDX+h3D2PQwPy6bV/iq2PE7OowGEvL1GJoIxCc5y5AjxmqiqhqJoVB+kbata7R
	y/rMmFWFn2qUwMrJ2WKWLYm+7417hoJVdUVZyvkJ+dQRehvxQfX3bPp0dkyMAor6RY0XGTC4FrCq7
	ixi5MhUimmzEg3reBZd7ZDavmvUshhaF18Wd2yiny3GzufjCJzSNT2yUWpgO8/90rkb0hjvZVcwL1
	98KSoVx+CcwiJd69Q1AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n33vD-005LPy-GZ; Thu, 30 Dec 2021 22:29:19 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n33v1-005LO1-Gx; Thu, 30 Dec 2021 22:29:08 +0000
Received: by mail-ed1-x534.google.com with SMTP id b13so102833292edd.8;
 Thu, 30 Dec 2021 14:29:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NqXfFLNZe3MOTkxHA6XZpTvA+blOj1sbzkN2OP2yLa4=;
 b=S6TWvNpu10nutY4a2KKlJZMh0dVrAIhjd4EK54By56V602c2Kg95O+vqw2w+hLGbRd
 9gkvZmq927SOl4r6XBcV6j1gNe1lp6amB5SMMhSZx4ORemzkQ6W+WPQml782Kc2medvH
 +aInmvXHyhuWr3PJMqinwFPfSSdqowhchDqksg+/1wW91pkRqlfgYpg2scLceKcjw8Ed
 CHIN5zj80lUuVc+uaUnyRuCbPy7PwHdqUDkD6uPGT+p0CyAOm1JItFQv5cj3wXMNR7G/
 O/41ecs1/626dH1cgg3Ksuzkhr2drt6dkDRHm6wMJnXEqY958pr0k8ofAXFeKN1ph2zN
 giJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NqXfFLNZe3MOTkxHA6XZpTvA+blOj1sbzkN2OP2yLa4=;
 b=U3G/TCUgsFN6hMFpd6Ae19bwQdjRqgXYU7FERMeWVfFRv8CxaZ8va40oIvVzY9KTp9
 P/0/IBjhj2AJV8I0D7S8VDxR4ObxAsAqcq+PGGrpUSke24nPDLuBUcEAqBAT1Zf2K0lA
 OUAO5DUtvHCzUHJrXtTn0Ku+zGnVe02jrTrFPis+bF3fGEaq7mC+T4flhWHDWmGvdAlE
 d4lEfoc5ztHPOVGXMx28pU9BCs4TAn/Ezdm+h6MV73cnlMG60sR031lnETFV0jg5YDDy
 ws7rvCnKo8+3bKZm8uu+BpaPC21A49pKksmojBWikl+VEX15RRo/s1rEFUKHrhj+hOQY
 i4PQ==
X-Gm-Message-State: AOAM531+D+iLr+qRz5b+NIfN4UpjfyJNDkOo0SwSnKKo4Rjy/tVd0qS9
 10B8eULs9haq+5c4aPxRDkKoMdC4axJAvw0yFLs=
X-Google-Smtp-Source: ABdhPJwD82JfES0vIiNxaZx2DTK40l5Zfi8AgVI5WeY9/2N0NvgfN7gt9wTmaQxgPyd4hiCUd2GBeZZH9ejXImSQvhI=
X-Received: by 2002:a17:906:341a:: with SMTP id
 c26mr26739120ejb.302.1640903346171; 
 Thu, 30 Dec 2021 14:29:06 -0800 (PST)
MIME-Version: 1.0
References: <20211230102110.3861-1-yu.tu@amlogic.com>
 <20211230102110.3861-3-yu.tu@amlogic.com>
 <Yc2mHOT4WwgUrrhG@kroah.com>
In-Reply-To: <Yc2mHOT4WwgUrrhG@kroah.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 30 Dec 2021 23:28:55 +0100
Message-ID: <CAFBinCBtye7KiEqFbUeNDeRGSQkhnQ-XH-Gr-KMUWYupvioP1g@mail.gmail.com>
Subject: Re: [PATCH V3 2/6] tty: serial: meson: Request the register region in
 meson_uart_probe()
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Yu Tu <yu.tu@amlogic.com>, linux-serial@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>, 
 Neil Armstrong <narmstrong@baylibre.com>, Vyacheslav <adeep@lexina.in>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211230_142907_628090_4F02267E 
X-CRM114-Status: GOOD (  16.18  )
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

Hi Greg,

On Thu, Dec 30, 2021 at 1:29 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
[...]
> >  static void meson_uart_release_port(struct uart_port *port)
> >  {
> > -     devm_iounmap(port->dev, port->membase);
> > -     port->membase = NULL;
> > -     devm_release_mem_region(port->dev, port->mapbase, port->mapsize);
> > +     /* nothing to do */
> >  }
>
> Are you sure a release call like this can be "empty"?  That goes against
> the normal way the driver model works.  If it is empty, why have it at
> all?
In patch #4 from this series some logic is added here again.
I can think of three options here (in no particular order):
- keep this patch as-is
- remove the empty function from this patch and it back in patch #4
from this series
- try to split some of the logic from patch #4 so the relevant
clk_prepare_enable/clk_disable_unpepare calls are added here (meaning
that this function has logic inside it at all times throughout this
series)
- (if you have another suggestion then please let us know)


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
