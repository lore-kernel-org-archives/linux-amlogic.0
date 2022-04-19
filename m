Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5B6EC433EF
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 Apr 2022 08:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d5K/LQV8zZJZglLzqcuKHfTvBjYLzitrsQq2c0mjHNY=; b=J9mPzQnv7Jwcyr
	X2h9cxI/FZdKBlZ3MueeZdo/4P0VYiRnmeUufQN9j7MxNydcOyM4B1adUaHmyHpFG1xtH+kc30KpB
	K788OL6+tUHr8vgkMiSe8qRTQcN6rLflSSvdKXaGp15xQPGMpsZ3GyeY1a8XOFwkZ5xqgaS+1el9b
	3Ay13kS5p6rJ1lSFBXaQHBAH2dzAPYJUp61u18CBgoCdHDZTHgh63EjoWMkwTmns7kzAmtLnWJ4ma
	qXL0OrhrQD5KccMsNDYvaDgeYlZGFD9K5PLlc5dY3KCmAGkE02cM9a6rlO7NCrk//ilw+sM2Wz4vJ
	F7TCICRlehiLBaciFj9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngj83-002I5R-PI; Tue, 19 Apr 2022 08:22:31 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngj7k-002Hux-3g; Tue, 19 Apr 2022 08:22:13 +0000
Received: by mail-ej1-x62c.google.com with SMTP id s18so31397489ejr.0;
 Tue, 19 Apr 2022 01:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aDezyw7oAUdrZNSvtrlYFBOqIqBL/GY7YbeRS6TE8iQ=;
 b=bPSYUl/EaJ3C6Tecf4Uf0NbSMXV8VtkVBYgVginaVN7zmCBGBRbDERUOE+V52oJstl
 WrOho5AtwZ2he/XVu+3gjnKmNOoFrnYS50UiBw9/G/SYevyPq0uZ5NeeanfNhQnool/+
 w3VYKNcHXFx95ZT/iUcUofzDHJN/qF0YllzgwtMx3FsqC3Y8mqJwGVRwGiHYIr4XZ1hW
 JxpztDCp1KtUIodshiR4OO1t4uC009P9dS1HoiQthzrLSGFvzh8qiiTKC7IQLK8sp/LS
 0UkJADrf0kaXf261R3h/20dixv5WWZ+Rn+2t2MCyaijIfPdjVdh7xYtkDvJZg6/Q2OCi
 nmiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aDezyw7oAUdrZNSvtrlYFBOqIqBL/GY7YbeRS6TE8iQ=;
 b=POPnEJJhNFD8s9wMh8EwilKuwqPOF8isLNO7efnERcT8HekfIJ/HUA7lrGzagRxka8
 7u+obYd9kXO0VVw+xgoaQRgM4Me3P600KA6V62UM6aiaKVb9Xs0pY/UId8vjIAAj6uUu
 07neNyUqwmMpGm7HbrusdxtdhxuM+J+xBK/LuEZA8p1+knheyK/cp1GUIJqlUXlvH/5G
 jin8Q09gyTC3ryTUk+E76UJZOBDkkY5vzWaGkAoxBkuUzy61NkVeRzdOP2hY7K2GXa0r
 E6qsfouaucDN1or4Wv2VNGC8rTFznq49I+MBIaTOCuOhaA7Q4PjLkzYi3V4fFxgHDjXd
 corQ==
X-Gm-Message-State: AOAM532vP0DO0eso+sPVQQ7OegHQSQGaz4yvTyna1waSthkymheveTT5
 wNvgDUWqr3BXox+6y6XoNisfifEc3JaD3KzP00E=
X-Google-Smtp-Source: ABdhPJy1BI+kV6WyWW37ji+ylkjjIWTBWFf1qwtkGDw3Mxc8DghxigPvlj/PBqptD5608TIHvHb826oYhxBwwZ8+2WI=
X-Received: by 2002:a17:906:1692:b0:6e8:d245:44a9 with SMTP id
 s18-20020a170906169200b006e8d24544a9mr12378077ejd.639.1650356528238; Tue, 19
 Apr 2022 01:22:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220418053202.24528-1-yu.tu@amlogic.com>
 <20220418053202.24528-2-yu.tu@amlogic.com>
 <CAHp75VeW65dV9jJu8-yUWME+XKnaxZBu5Zv8iEJxP2dizA=HUg@mail.gmail.com>
 <d10e27ff-e674-87bd-2c98-63c7040baeb1@amlogic.com>
 <9af92c78-73a7-d524-182c-3ebffa69b08a@kernel.org>
In-Reply-To: <9af92c78-73a7-d524-182c-3ebffa69b08a@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 19 Apr 2022 11:21:32 +0300
Message-ID: <CAHp75Vc87oTmJ6zVeY2mGbP8Jx_SSDtp39Uq4YhWerDUX9RdQQ@mail.gmail.com>
Subject: Re: [PATCH V2 1/2] tty: serial: meson: Add a 12MHz internal clock
 rate to calculate baud rate in order to meet the baud rate requirements of
 special BT modules
To: Jiri Slaby <jirislaby@kernel.org>
Cc: Yu Tu <yu.tu@amlogic.com>, 
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>, 
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, 
 linux-amlogic <linux-amlogic@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Neil Armstrong <narmstrong@baylibre.com>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_012212_221850_519526DC 
X-CRM114-Status: GOOD (  14.33  )
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

On Tue, Apr 19, 2022 at 10:38 AM Jiri Slaby <jirislaby@kernel.org> wrote:
> On 19. 04. 22, 9:29, Yu Tu wrote:
> > On 2022/4/18 20:09, Andy Shevchenko wrote:
> >> On Mon, Apr 18, 2022 at 8:50 AM Yu Tu <yu.tu@amlogic.com> wrote:

...

> >>> +struct meson_uart_data {
> >>> +       bool has_xtal_div2;
> >>
> >> I would prefer to see this as an unsigned int and with a less
> >> particular name, e.g. xtal_div would suffice.
> > I don't have a problem with your suggestion.Let's see What Neil has to say.
>
> Actually why uint provided it's a boolean value? Or do you mean to store
> the divisor directly in this member, Andy?

Yes I was thinking to provide the value and then always provide the
private data. In such cases we don't need an additional condition.

-- 
With Best Regards,
Andy Shevchenko

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
