Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CBB0C433F5
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 May 2022 13:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aq/LCJUw5N+JYJZRaICaxPm4WGxxfpZ+2jmaNKW8z20=; b=MRagFMoRJ/dZRV
	Zv1DsXWNnDjXLpJlIsxsI5MgHqLWZw9WWBYMMfLinz+Ryz9ijSbLXLLXdsZy1GPL0Y5hbQsdt4Lrs
	gzE1PFQxafgU75bd+ahG8mV/emW6H/n6EKmFaSapoETS8TQoEH6m6B43vf5QZZ2lNbbN/iVJ5BMmV
	ubU5o6udAXPoSvlcIAQLqwRkIP+OBOBSpiEvsxtyok/eZI8N9ttnHySVYDQHVJfqpq58cvc5sYVox
	ID6Bhz85+zzLVbhYWsIxOa32OnN3IbtZ653i/5USRtkQVlQJZGE6uzHDBFMEbmEpEf+e4z+rDQb3R
	ANQ7WytoUlav48PwpBlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmbBb-00FxRq-57; Thu, 05 May 2022 13:06:27 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmbBN-00FxJe-QA
 for linux-amlogic@lists.infradead.org; Thu, 05 May 2022 13:06:15 +0000
Received: by mail-ed1-x531.google.com with SMTP id a21so5148903edb.1
 for <linux-amlogic@lists.infradead.org>; Thu, 05 May 2022 06:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mL7w0UMKorZQ2g0L1DfCw6LR3UMP76ttTU+pAi6oLp8=;
 b=thkq/Oe9nJNhuWKKyXJioTRuksejdS4P/kXbCrE43AhgzOgACtL3WlfvieNBmQqQ+G
 MffenwvYyEE/lyM6o5nlmL6cqoqXf2JLlV9Pqf59ZwhnlRsg0EEZAaaBRwGtqynW9/3D
 7nIMP/GeOSzcRkEGfmLrPzxr2OcLJtnZshwKErO0/B8ah6A/IhRVB6dZWKeScY8dMPNX
 1zRNKzTFQ3NxyxG0Zh62W3IcJeUkNoLDAuqfKXM0K2J815M+nocKNHapidlHY7FPLyw5
 7z83NA03x9UBBjVvstLDBu+6qQ3ESO9XqXHwoTHF7FFaDJCJY/e8q6BySCbLEWHt85VA
 eiBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mL7w0UMKorZQ2g0L1DfCw6LR3UMP76ttTU+pAi6oLp8=;
 b=G0xurOepQjx6Jw0rtkdJv3m00tlNjQ734VN4q87gfW+3yL0zx9lxHg8R5mzsuhn37e
 PrP3RZGr+ZQpArgrZKPRtfSQjGZUlojnjJI1XegEU5Nh1pMsimq/NDa5lFwkREClqXuX
 NgE15rGuf3/k883vjnrvJi1AmzAe3LYXdBWju09jVFETFhUM5r3T3j6ia5yx2dyuGa4L
 Xl+2RtU/asvLT0SRSWAsscCMVCRmQ7Zqrh84kxBt3BwGUYPbCipW6zzZ++fgImNJa8vY
 rCZNbER5c15b+tBal7fTs9QTKYwFv8GkmjcZzLqUxmJJ4Aoki92ojXCQVZuBOEBYnpKk
 wjyg==
X-Gm-Message-State: AOAM531ONfxAfILgBVvkN4w3xciRtQDdKBGaXYtqXw2joIU7wEbF44Jd
 sTUnKEZsr9+dOChZlqeMxTXOwp4d4KLB0vtEyiKaTA==
X-Google-Smtp-Source: ABdhPJxr7BHz9MN/SywvgtY21Ie07p3CIeurjYtmb7zi7rCM463OgbWz+0yWrSPh0S+WrcPNGwAj+sr6dUi1BvovgpY=
X-Received: by 2002:a05:6402:5286:b0:425:f0fb:5d23 with SMTP id
 en6-20020a056402528600b00425f0fb5d23mr29314171edb.243.1651755963620; Thu, 05
 May 2022 06:06:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220414190242.22178-1-andriy.shevchenko@linux.intel.com>
 <20220414190242.22178-2-andriy.shevchenko@linux.intel.com>
 <CAMRc=MfE0othcfwETf13_K3sOLKmUGwCnjapzVjLMk1cD+ihVQ@mail.gmail.com>
 <CAHp75VcpZPB12Y4FVN4h9RdkvYQfELtbRnd08FfPpG1cJG-99g@mail.gmail.com>
In-Reply-To: <CAHp75VcpZPB12Y4FVN4h9RdkvYQfELtbRnd08FfPpG1cJG-99g@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 5 May 2022 15:05:52 +0200
Message-ID: <CAMRc=Mef77ejvzx2Pg1P_xzozxb1VjxGtArfvFdS=Cgq-8Mbwg@mail.gmail.com>
Subject: Re: [PATCH v5 1/6] gpiolib: Introduce a helper to get first GPIO
 controller node
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Neil Armstrong <narmstrong@baylibre.com>, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-amlogic <linux-amlogic@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220505_060613_871008_59E07812 
X-CRM114-Status: GOOD (  19.08  )
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

On Tue, Apr 26, 2022 at 12:29 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Tue, Apr 26, 2022 at 12:27 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> >
> > On Thu, Apr 14, 2022 at 9:02 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > >
> > > Introduce a helper to get first GPIO controller node which drivers
> > > may want to use.
>
> > > +static inline struct fwnode_handle *gpiochip_node_get_first(struct device *dev)
> > > +{
> > > +       struct fwnode_handle *fwnode;
> > > +
> > > +       for_each_gpiochip_node(dev, fwnode)
> > > +               return fwnode;
> > > +
> > > +       return NULL;
> > > +}
> > > +
> > >  #endif /* __LINUX_GPIO_DRIVER_H */
> > > --
> > > 2.35.1
> > >
> >
> > Any chance you could name it get_first_gpiochip_node()? It's static so
> > we don't have to worry about the prefix and it would make the purpose
> > more clear.
>
> There are two things why I prefer it as is:
> 1) it's static inline, so it's part of (internal) but still exported API;
> 2) it's already in my for-next branch which I would like not to
> rebase, until it's a really serious issue.
>
> That said, if you still insist I can rename it.

No that's fine and I also pulled that into my tree.

Bart

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
