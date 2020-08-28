Return-Path: <SRS0=gNbl=CG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15679C433E2
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 Aug 2020 07:03:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0A512078A
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 Aug 2020 07:03:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Mct4jbKW";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="sx7QHngC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D0A512078A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xfMQm+vGUCQp9T+cMMq7slGnyWJDvzgvsURfbZmK31E=; b=Mct4jbKWoirtYDG2P5Db9xhmV
	wsUNzWNHY0GA9cJEDcCCLRYnplkI/xqvwiDoERWWYO9DmykaUOUeZG60wMdMFCvGrhWKo+KejdHX9
	PpBgBCRQmPEnmaUyLe9I97xzk+1LRTbqvEfuUpbYJZULORTNYSTWayqTri8NQTLH0P0olqxUPvKOV
	JshSoxEc8/AlpvFI+84TVgO3SH+nDyhSY0pFEf0j+xRKsCTcBeQxcGDwDBgZSQsST/NJD0GPcSmsb
	qB9mj/Wxi6DPNUSDK0BbCGs2dVDVdrtWf4ayXyqGV0s9lOSQ3UJ2OS0rDDaUFhJ8jMa4U7gNGuAQG
	XgqiUfvcA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBYPw-0003Q9-U1; Fri, 28 Aug 2020 07:03:21 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBYPv-0003PK-FP; Fri, 28 Aug 2020 07:03:20 +0000
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8896D20DD4;
 Fri, 28 Aug 2020 07:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598598198;
 bh=4faSGkxwde2dUgjoJLxEPngM/PNDuiR7AsduftolHIs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=sx7QHngCjfwrj5EpTWFj8h72BUzgxBMBKywR+k595Wk3fByAORr3jVBGDZLwGksw0
 PYNKYbUpEnueECWfETWbOSoHpehiGjPGGdGrQ1xkURBaro59NTzuZqovK+ftZZdWmw
 BIoHuIn6C7rK8aWGwpap/DKCec5A9wvC81kDbajc=
Received: by mail-ej1-f52.google.com with SMTP id d11so108995ejt.13;
 Fri, 28 Aug 2020 00:03:18 -0700 (PDT)
X-Gm-Message-State: AOAM530OXrRxB3DD97gUUxW8JOKJbd7Rs0e49Ib4B8F7KBqgbfEnWsZ7
 jDpPurGCwS49yY9jR83997HflrW7Jn6pV53ob7o=
X-Google-Smtp-Source: ABdhPJxeqj21bGrdAgawvMqE4DUECkHszI8hRw0tB+YmvQTkV+0igeB3UuUCefttjGSqXjyZ8z82C9AEfK2QoACQnCo=
X-Received: by 2002:a17:906:3e0a:: with SMTP id
 k10mr409528eji.148.1598598197045; 
 Fri, 28 Aug 2020 00:03:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200827192642.1725-1-krzk@kernel.org>
 <20200827192642.1725-9-krzk@kernel.org>
 <f4a5777e-fe85-9f3f-4818-f7539f223adc@axentia.se> <20200828062443.GA17343@pi3>
 <3a5cb59b-454e-2c3f-9f31-43147e843c66@axentia.se>
In-Reply-To: <3a5cb59b-454e-2c3f-9f31-43147e843c66@axentia.se>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Fri, 28 Aug 2020 09:03:06 +0200
X-Gmail-Original-Message-ID: <CAJKOXPcqNE5U82UThzBTPCvucCf2LsCVSfAHE1vnecJGCKCaig@mail.gmail.com>
Message-ID: <CAJKOXPcqNE5U82UThzBTPCvucCf2LsCVSfAHE1vnecJGCKCaig@mail.gmail.com>
Subject: Re: [PATCH v2 09/18] iio: afe: iio-rescale: Simplify with
 dev_err_probe()
To: Peter Rosin <peda@axentia.se>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200828_030319_639226_32E1E2EC 
X-CRM114-Status: GOOD (  28.15  )
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
Cc: Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-iio@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>,
 Tomasz Duszynski <tomasz.duszynski@octakon.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Kevin Hilman <khilman@baylibre.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Kukjin Kim <kgene@kernel.org>,
 Beniamin Bia <beniamin.bia@analog.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Hartmut Knaack <knaack.h@gmx.de>,
 Jonathan Cameron <jic23@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, 28 Aug 2020 at 08:58, Peter Rosin <peda@axentia.se> wrote:
> >> I'm not a huge fan of adding *one* odd line breaking the 80 column
> >> recommendation to any file. I like to be able to fit multiple
> >> windows side by side in a meaningful way. Also, I don't like having
> >> a shitload of emptiness on my screen, which is what happens when some
> >> lines are longer and you want to see it all. I strongly believe that
> >> the 80 column rule/recommendation is still as valid as it ever was.
> >> It's just hard to read longish lines; there's a reason newspapers
> >> columns are quite narrow...
> >>
> >> Same comment for the envelope-detector (3/18).
> >>
> >> You will probably never look at these files again, but *I* might have
> >> to revisit them for one reason or another, and these long lines will
> >> annoy me when that happens.
> >
> > Initially I posted it with 80-characters wrap. Then I received a comment
> > - better to stick to the new 100, as checkpatch accepts it.
> >
> > Now you write, better to go back to 80.
> >
> > Maybe then someone else will write to me, better to go to 100.
> >
> > And another person will reply, no, coding style still mentions 80, so
> > keep it at 80.
> >
> > Sure guys, please first decide which one you prefer, then I will wrap it
> > accordingly. :)
> >
> > Otherwise I will just jump from one to another depending on one person's
> > personal preference.
> >
> > If there is no consensus among discussing people, I find this 100 line
> > more readable, already got review, checkpatch accepts it so if subsystem
> > maintainer likes it, I prefer to leave it like this.
>
> I'm not impressed by that argument. For the files I have mentioned, it
> does not matter very much to me if you and some random person think that
> 100 columns might *slightly* improve readability.
>
> Quoting coding-style
>
>   Statements longer than 80 columns should be broken into sensible chunks,
>   unless exceeding 80 columns significantly increases readability and does
>   not hide information.
>
> Notice that word? *significantly*

Notice also checkpatch change...

First of all, I don't have a preference over wrapping here. As I said,
I sent v1 with 80 and got a response to change it to 100. You want me
basically to bounce from A to B to A to B.

> Why do I even have to speak up about this? WTF?

Because we all share here our ideas...

> For the patches that touch files that I originally wrote [1], my
> preference should be clear by now.

I understood your preference. There is nothing unclear here. Other
person had different preference. I told you my arguments that it is
not reasonable to jump A->B->A->B just because each person has a
different view. At the end it's the subsystem maintainer's decision as
he wants to keep his subsystem clean.

Best regards,
Krzysztof

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
