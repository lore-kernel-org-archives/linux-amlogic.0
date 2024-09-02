Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AF67CA0ED3
	for <linux-amlogic@archiver.kernel.org>; Mon,  2 Sep 2024 20:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C+JKgJz85fi4Zlo53A7v1G+jaCRcF2Aox3cmYDXOchw=; b=lYuc6IFdeyYv1/
	wrhl86w7SHnNZPfxaT/pdHj6kbKm3uYYvCZc+3f84Exdc8mrJd5+XCp3kiw96GgjAt/NImxrRSWcF
	wqCcl1eB0wxkv361TzDzsF1xccQb928bOeC9ZL+AM45lM2McZbJSnyNbDKsZ8RA2LSAAdxBFF11T3
	EwFj6i8GQMmrdGshavey+gmMQCyZPiGISwhJt1KQ429Gp6LsWLkyarhNtoJ2zTxhwDHZXh1GbCloF
	KZ49yJCjcWgpDxiSGSnoKkQME2SrZ78qy1NvfAXVD/AgH19JihaJO9Yy/N/TMcQoWpyqYKhZJZLtz
	Vs8wmRBN6r08lvbmJpvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slDWv-0000000FTzt-3rOG;
	Mon, 02 Sep 2024 20:20:05 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slDWr-0000000FTym-1nQL
	for linux-amlogic@lists.infradead.org;
	Mon, 02 Sep 2024 20:20:04 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1EF2C20004;
	Mon,  2 Sep 2024 20:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1725308396;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5LLNc9i9feX+98+maMNyDk10kJ8aqshRdCfXQ8V0pLQ=;
	b=eiNxWOC55M5AEZpFSO0e8abL2V1c2pzRlSTOUG4KQeaHLtV9KJF5Ei0vXoD9LYpnqFYL+u
	2EXwfinJDj27LsxrLtLnU8XiBb08C/AIaRW0ZKkpa+x1w/i+NTpg7Ry/nRUuxpGAtkcqWd
	i14o5IJ4sr/dgMdHexG0J7ZEhBibIUqmN6l5tH6SvdR15LA3HfNA8hnKjwfwHdIyPnMJRT
	uC+KbPv9sat1yNnFgMG1SBMhuhV0TBND9jd6+NlawQlE0YmV8gpMyR/9dKIz/ypmCU8CSr
	Y+DkoZK3DQEUDBg5+YdwAcyJsh2ATkjJVxrUJzw7JeRQYjjMJDl8ajVyr+VxYA==
Date: Mon, 2 Sep 2024 22:19:54 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Yiting Deng <yiting.deng@amlogic.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-amlogic@lists.infradead.org, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] rtc: support for the Amlogic on-chip RTC
Message-ID: <2024090220195462df6c95@mail.local>
References: <20240823-rtc-v1-0-6f70381da283@amlogic.com>
 <20240823-rtc-v1-2-6f70381da283@amlogic.com>
 <2024082609451907fd19e2@mail.local>
 <20ffd260-3c24-460f-bdbc-965573e110e3@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20ffd260-3c24-460f-bdbc-965573e110e3@amlogic.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240902_132002_571746_4843617F 
X-CRM114-Status: GOOD (  35.06  )
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

On 02/09/2024 16:14:45+0800, Xianwei Zhao wrote:
> Hi Alexandre,
>     Thanks for your reply.
> 
> On 2024/8/26 17:45, Alexandre Belloni wrote:
> > [ EXTERNAL EMAIL ]
> > 
> > On 23/08/2024 17:19:45+0800, Xianwei Zhao via B4 Relay wrote:
> > > From: Yiting Deng <yiting.deng@amlogic.com>
> > > 
> > > Support for the on-chip RTC found in some of Amlogic's SoCs such as the
> > > A113L2 and A113X2.
> > > 
> > > Signed-off-by: Yiting Deng <yiting.deng@amlogic.com>
> > > Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> > > ---
> > >   drivers/rtc/Kconfig       |  12 +
> > >   drivers/rtc/Makefile      |   1 +
> > >   drivers/rtc/rtc-amlogic.c | 589 ++++++++++++++++++++++++++++++++++++++++++++++
> > 
> > As pointed out, this is the third amlogic driver so the name of the file
> > must be more specific.
> > 
> 
> This RTC hardware includes a timing function and an alarm function.
> But the existing has only timing function, alarm function is using the
> system clock to implement a virtual alarm. And the relevant register access
> method is also different.
> 
> The "meson" string is meaningless, it just keeps going, and now the new
> hardware uses the normal naming.

The proper naming is then definitively not just amlogic, because in 5
year, you are going to say the exact same thing about this driver
"register access is different, this is for old SoCs, etc"

amlogc-a4 would be more appropriate.

> > > +             /* Enable RTC */
> > > +             regmap_write_bits(rtc->map, RTC_CTRL, RTC_ENABLE, RTC_ENABLE);
> > 
> >                  This must not be done at probe time, else you loose the
> >                  important information taht the time has never been set. Instead,
> >                  it should only be enabled on the first .set_time invocation do
> >                  you could now in .read_time that the time is currently invalid.
> > 
> There are some doubts about this place.
> 
> You mean that after the system is up, unless the time is set, it will fail
> to read the time at any time, and the alarm clock will also fail.
> In this case, the system must set a time.

Exactly, reading the time must not succeed if the time is known to be
bad.

> 
> When read time invlalid, system is will set time.
> This part of the logic I see the kernel part has not been implemented, so
> only the user application has been implemented. Whether this is reasonable,
> if not set time, you will never use RTC module.

This is not going to be implemented in the kernel. The kernel can't know
what is the proper time to set unless userspace tells it.

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
