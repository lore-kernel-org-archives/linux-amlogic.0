Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C280C433F5
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 May 2022 13:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W4x2FcO52H8qDcxvyl9BclqJ9Ysuyit7EW2wxKlUPDo=; b=if0Umt71xpXaHl
	ghX4CbuyjHAsfXI/s058VVRMCPqL+w+/TD9epPmrUhpiW6hbYbA5OD/PFZFcFQ7ZmLgrpkcFwBCJc
	v7FZIfeew+KTDhQXagW8hQa3DaulXn4eIqPoEI/C0/7xoSh2sDvgQYjZ9xD64zpCM6oBmgD8Q0Bij
	jwQbY+7pGJLhSADhoaswbc6LqQxvWXm2XTqEJCCFV+s2vM/86UtBed9+sYTNGyQveh1uyQbA9TrGV
	zHE6cSfL7tS7j4kORObcyqcxHVIp44a7IEZQEIblcddYA4UNGOTug+iQ6RHdULlZAFSRNgeVT/NYv
	oXPDLfqNCG7JdIsc2KFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmbMB-00Fzfw-Ao; Thu, 05 May 2022 13:17:23 +0000
Received: from mga07.intel.com ([134.134.136.100])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmbM0-00Fzd5-5l; Thu, 05 May 2022 13:17:13 +0000
X-IronPort-AV: E=McAfee;i="6400,9594,10338"; a="331090683"
X-IronPort-AV: E=Sophos;i="5.91,201,1647327600"; d="scan'208";a="331090683"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2022 06:17:08 -0700
X-IronPort-AV: E=Sophos;i="5.91,201,1647327600"; d="scan'208";a="654216218"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2022 06:17:05 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andy.shevchenko@gmail.com>) id 1nmbLp-00CI1C-TO;
 Thu, 05 May 2022 16:17:01 +0300
Date: Thu, 5 May 2022 16:17:01 +0300
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Neil Armstrong <narmstrong@baylibre.com>,
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
Subject: Re: [PATCH v5 1/6] gpiolib: Introduce a helper to get first GPIO
 controller node
Message-ID: <YnPOTTRhzM5O7OlD@smile.fi.intel.com>
References: <20220414190242.22178-1-andriy.shevchenko@linux.intel.com>
 <20220414190242.22178-2-andriy.shevchenko@linux.intel.com>
 <CAMRc=MfE0othcfwETf13_K3sOLKmUGwCnjapzVjLMk1cD+ihVQ@mail.gmail.com>
 <CAHp75VcpZPB12Y4FVN4h9RdkvYQfELtbRnd08FfPpG1cJG-99g@mail.gmail.com>
 <CAMRc=Mef77ejvzx2Pg1P_xzozxb1VjxGtArfvFdS=Cgq-8Mbwg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMRc=Mef77ejvzx2Pg1P_xzozxb1VjxGtArfvFdS=Cgq-8Mbwg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220505_061712_295719_A60CBC8A 
X-CRM114-Status: GOOD (  17.97  )
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

On Thu, May 05, 2022 at 03:05:52PM +0200, Bartosz Golaszewski wrote:
> On Tue, Apr 26, 2022 at 12:29 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Tue, Apr 26, 2022 at 12:27 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > > On Thu, Apr 14, 2022 at 9:02 PM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:

...

> > > Any chance you could name it get_first_gpiochip_node()? It's static so
> > > we don't have to worry about the prefix and it would make the purpose
> > > more clear.
> >
> > There are two things why I prefer it as is:
> > 1) it's static inline, so it's part of (internal) but still exported API;
> > 2) it's already in my for-next branch which I would like not to
> > rebase, until it's a really serious issue.
> >
> > That said, if you still insist I can rename it.
> 
> No that's fine and I also pulled that into my tree.

Thank you!

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
