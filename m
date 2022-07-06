Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F287C433EF
	for <linux-amlogic@archiver.kernel.org>; Wed,  6 Jul 2022 17:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n+JUezVqzNUUbXOvtOJC5qcmUByuGM5lQvt2Pm4AN0o=; b=x+3G4O6fPGtKD/
	anRxSjoGM/x3NcY3PMiGqX0D7E6YPslM8gx5rD2fl5NeuIAjBtGozsW+1nGtRfvV2a8EsmKAxEgm+
	+Ry1sLS2tf426IXdVzHr9mmo2kz172mHKRWLG518FMHMKfWIhT6SgpxK0ndcyjbT6pBe494i/5YhY
	KVCoyzVI3A2lcd7wZunBtMj+tMjtzSvXHd2InqNMJRKGu/e+MpI0eGzpDH7+RsUCbT6EKlPQbEFVS
	H4rVDTYncnnAnSlHpjFaXwGoq3F6SaSCkid63atJ3c/M9KIl8tS3s1TaOVY6F3ds6FbOTgvs1BA8b
	syOZqds31Y1TkMcYb8yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o98iq-00Bgel-W8; Wed, 06 Jul 2022 17:21:57 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o98Wm-00BbU4-76
	for linux-amlogic@lists.infradead.org; Wed, 06 Jul 2022 17:09:35 +0000
Received: by mail-wm1-x329.google.com with SMTP id f190so9199915wma.5
        for <linux-amlogic@lists.infradead.org>; Wed, 06 Jul 2022 10:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=references:user-agent:from:to:cc:subject:date:in-reply-to
         :message-id:mime-version;
        bh=5LUOM8ZYJNqDNXNRkK8SW6v1KeODGn/t/tSrSeB93Hg=;
        b=FWxQ9w9QQNjX8fhNNM4ShlZTIrizS+PKUFTG21pr1iRgQ7Vf64He23QLE9Bp6vZC9d
         QZu2/gYfSpYUu+IGln2mRJLyYTBfq/2oQnalM/9l2402od6QikiGfzuLSKyyHtUvM0ND
         H8c1Ve5FE8EFWb3V5w4SgEjotxtGfnYtzZH/0u8do8Ur8T0RcZirfEQuMgVoNg6hEjJl
         IFvuFdAFs7G+vCfMwzF+R9e5ptnM53k9g6vDUW9c9MrHQ6945QoFT/IiVHoXUxXm909V
         DfjWv/xGi1nJsBJDn0frsfD/P79LZl9yDkDVyV2rDWgVln6fVNSHmzJB+nvuFcX8uCDE
         vGYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
         :in-reply-to:message-id:mime-version;
        bh=5LUOM8ZYJNqDNXNRkK8SW6v1KeODGn/t/tSrSeB93Hg=;
        b=XV0C2jXipPZddBVthn25ygXUG+QVtIqXXZY6NsSgFxu5FCxf9ydQsT/G02aELNQdep
         3Odxylrlougi5c5rcJabICGBWZ49NZYQBBIf/ssL8Qnl4aOc+V+LpkbfpAKa9hyOJTQ2
         P6Kr+1WKr+CsYfAD//61Ww+o1PfLZ2Kej14E49KK4dTCQ7smPjYW8o/4yKdimjYbHsKv
         LUV6Hypa+QUe5fUc2yOdkwPNPAUYI9H1vLw09qNK9a3xacQGv8JD7oVghShAE+dnAdd2
         a7u+g8eToBie4IHvH+wSsrlaUoGaNJKk0kM1XG1ZV9eLUuEGqF0lvQyjiUDM4NGDeBSk
         ezMQ==
X-Gm-Message-State: AJIora8lLLtCl/cSzCXpLMqxOw1ZV7vamffB9oUABxxwdpUzFcNDnGA4
	c6Yg9gGtFqtANQHJ33EzpKHWyQ==
X-Google-Smtp-Source: AGRyM1tDs+r809drkm9fTo8mDedQDX5NO3elMnVmkCGdj1wZQpsTYCLXuaPJsjJ/fdV04pS7uHNxFg==
X-Received: by 2002:a05:600c:1e14:b0:3a0:2bba:4b2e with SMTP id ay20-20020a05600c1e1400b003a02bba4b2emr42964111wmb.196.1657127362770;
        Wed, 06 Jul 2022 10:09:22 -0700 (PDT)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
        by smtp.gmail.com with ESMTPSA id m16-20020adfe950000000b0021d70a871cbsm5605291wrn.32.2022.07.06.10.09.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 10:09:22 -0700 (PDT)
References: <20220705142444.17063-1-pboos@baylibre.com>
 <f756b2d5-56e7-6e52-2739-eca4bb33508b@baylibre.com>
 <1jmtdnwd7y.fsf@starbuckisacylon.baylibre.com>
 <20220706124139.GB492220@roeck-us.net>
 <1j8rp6z720.fsf@starbuckisacylon.baylibre.com>
 <20220706164325.GA776177@roeck-us.net>
User-agent: mu4e 1.8.3; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Philippe Boos <pboos@baylibre.com>, Wim Van
 Sebroeck <wim@linux-watchdog.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-watchdog@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] watchdog: meson: keep running if already active
Date: Wed, 06 Jul 2022 19:00:39 +0200
In-reply-to: <20220706164325.GA776177@roeck-us.net>
Message-ID: <1j4jzuyxq8.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220706_100928_302692_68C0ACB2 
X-CRM114-Status: GOOD (  18.23  )
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


On Wed 06 Jul 2022 at 09:43, Guenter Roeck <linux@roeck-us.net> wrote:

> On Wed, Jul 06, 2022 at 03:24:27PM +0200, Jerome Brunet wrote:
>> 
> [ ... ]
>
>> 
>> No worries. That being said, I have gone over 
>> 
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst
>> 
>> It just says that Reviewed-by sent on the list should be collected for
>> the following version. Nothing against adding the tag if the job has
>> been done, on or off list. Same goes for Suggested-by, Tested-by, etc.
>> 
>> If I missed something or it is non-written rule, please let me know.
>
> Your interpretation is quite a strict one. I don't think there is a rule
> that states that tags not sent to a list must not be collected.
>
> Anyway, I would have called it common sense, especially since it does
> happen that someone accidentally hits "reply" instead of "reply all"
> and replies end up not being sent to the list. If you expect me to dig
> through e-mail headers to determine if you meant your tags to be published
> or not, sorry, that won't happen. Do not send me e-mails with any tags
> unless you accept that they may be published.
>
> Guenter

Exactly. Not expecting anything. I'm 100% aligned with you.
Maybe this is where is misunderstanding is.

The Reviewed-by was there when Philippe sent his mail.
I was meant to be there and taken. Plain and simple.
No other expectation whatsoever.

I'm not asking for the tag to dropped, quite the opposite actually.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
