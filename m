Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B804FC43334
	for <linux-amlogic@archiver.kernel.org>; Wed,  6 Jul 2022 16:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xsuMjXbSKnsPuESWsiYIxMbOmtMo2DSerOkX59KW1bM=; b=Zrlv1HBs459ng6
	VRsX0XsMAQzHYuL4OPNReldOhvgIm/sDvM2Ax/tAFlKk6sM8hlY8bgDTyXfAQP5snahcx0b0uqzQn
	4z52CtVGkqjFz3dcC0PAVYO5y1QnoJgZODdwyY4W/MA5epu8JpwJBstY1ESHmYl9TLt2DkDh0bLZV
	kFA8gsrftTAoqbVvshvNSEXDdt+Bp4QRTcsz4HvJDQGn+o79l7L+dLpckkX4q2RVu7ogbb6S1P/BZ
	3HiaQb9uPRwADXm3+OrDFbDO1lRZf49FtnpsYSaU42UMOTabMT5JKSBFV3SeEUUwxrFeBkWex5pO9
	IEankMxrn1fRA0ttjvRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o98BC-00BRzc-QZ; Wed, 06 Jul 2022 16:47:10 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o987c-00BQFo-Px; Wed, 06 Jul 2022 16:43:30 +0000
Received: by mail-pj1-x1032.google.com with SMTP id v4-20020a17090abb8400b001ef966652a3so6512900pjr.4;
        Wed, 06 Jul 2022 09:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=oraZyyvVir1700yNQVzrP9Zwaxp7xrxcJj7xCrbOwKY=;
        b=EfJh9o7U1fzaM7uW6JPnPBco1gx5afL8OEXdBvSEwnnQzDqzqN65FghE6rrrlQ2L3+
         p+Dpmz5ngc/Ntn6shHZm/lOtJEfedW0os2igAWzQR37X8hcZ2mpJBjSIEM3Su+YB8ggR
         NDR6nWv0pqQxrt/gpcDp1CBhiKkQBpST2EnW8i2hECHMUd4yb0oekQ+A+59+p5DdB2M9
         HRQyC99nu2wVuQp0CuL9qk4b4mz7oaFl42gUL2z5dA/gG7QCBZAdFPVfviLOe3u5zMes
         BeLQ9rQRBPQIIhcx2FvpZHMjFgb8pW+fn5nHqQaVW52Ua25EzRK5osDhv2Z9NxlJUe5s
         3hpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=oraZyyvVir1700yNQVzrP9Zwaxp7xrxcJj7xCrbOwKY=;
        b=ABySFw1YaCL3YiEhkkN0b2fPO5c+GtzbAcq9g4++x6Mi9lRmfNZ2I/0HVsh9renh3+
         8CaP1RrY2pXZzPWtkOTrg/DpWefqYFHb6eDdnFkrqjBz44diRUtSnnyj8kJMWhm+dHRb
         N8OX0ZpYLSrM7XJUqLrljklmnqygNk62C5PjNZA8aNIVTnK5fIPQNW4weZZVcZO6q0Yl
         /FhxIfv/LEsOKOqtsAF9Aej2p3JOG49Zh9o60hbflXJUJwJP9AGksUfG1RVgjHTdeo/s
         /0tZvEvivYLiyZCm9kHOb7SiHW2h+AgflkZu82IDH2sv635Z7mqG2Xn91Eu75hb0lZJ6
         GiZw==
X-Gm-Message-State: AJIora/Z0r3sNoHWXfp3t6WY7CUITGgqEpZ7PuUXnPAqVH3C6d8jRSUD
	CNCBqxKLOVVhSllGZ2q/tmk=
X-Google-Smtp-Source: AGRyM1skinJBZte4Q+yq3FR+y6tbCuPsShkOzB4+jvtzpcNoq/exAfYvBFN41bB15wIBO1q8dnwGig==
X-Received: by 2002:a17:90b:38c4:b0:1ef:84e0:90f5 with SMTP id nn4-20020a17090b38c400b001ef84e090f5mr23618932pjb.149.1657125808122;
        Wed, 06 Jul 2022 09:43:28 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x67-20020a628646000000b005252ab25363sm25121974pfd.206.2022.07.06.09.43.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 09:43:26 -0700 (PDT)
Date: Wed, 6 Jul 2022 09:43:25 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>,
	Philippe Boos <pboos@baylibre.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-watchdog@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] watchdog: meson: keep running if already active
Message-ID: <20220706164325.GA776177@roeck-us.net>
References: <20220705142444.17063-1-pboos@baylibre.com>
 <f756b2d5-56e7-6e52-2739-eca4bb33508b@baylibre.com>
 <1jmtdnwd7y.fsf@starbuckisacylon.baylibre.com>
 <20220706124139.GB492220@roeck-us.net>
 <1j8rp6z720.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1j8rp6z720.fsf@starbuckisacylon.baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220706_094328_896364_56AF50A4 
X-CRM114-Status: GOOD (  15.79  )
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

On Wed, Jul 06, 2022 at 03:24:27PM +0200, Jerome Brunet wrote:
> 
[ ... ]

> 
> No worries. That being said, I have gone over 
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst
> 
> It just says that Reviewed-by sent on the list should be collected for
> the following version. Nothing against adding the tag if the job has
> been done, on or off list. Same goes for Suggested-by, Tested-by, etc.
> 
> If I missed something or it is non-written rule, please let me know.

Your interpretation is quite a strict one. I don't think there is a rule
that states that tags not sent to a list must not be collected.

Anyway, I would have called it common sense, especially since it does
happen that someone accidentally hits "reply" instead of "reply all"
and replies end up not being sent to the list. If you expect me to dig
through e-mail headers to determine if you meant your tags to be published
or not, sorry, that won't happen. Do not send me e-mails with any tags
unless you accept that they may be published.

Guenter

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
