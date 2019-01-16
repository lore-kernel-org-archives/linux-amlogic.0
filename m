Return-Path: <SRS0=5vFS=PY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 067D1C43444
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Jan 2019 21:29:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6F7920675
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Jan 2019 21:29:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ESLQzta2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C6F7920675
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K3Gi0/Np+iMc7Nf2zuW+Y2veDrRaiw0Aexl+/XhsJFk=; b=ESLQzta2/GR6xN
	W9R2srRsSTo6yRE0nYJi6B1VcpZ0YGshmPKqr3dk3aYiIxJCZPmPEpaNQDznSQ1ZGHhF95oFTCn4h
	wrzmBrv/+OfGNhDTfzJc+JIEEzSikF1s0Q4hpbaITYyyDDkWD8NLMrTL6lzQ9MKj+09tDEsam13vS
	PIWYa1W/f7jhCBEp7KhjP9WE05YeYqZrSlLVx5a3MjV3O6J2Ev+sk5gZBGb1tdsn9k1x4E+N+q/bK
	WUuQaxAOgDvipGPnJgtJJ9GZobdAE1dkRwWf3mKHNiHQgqyelcULv6J6m+c1Nd/PdBXVOCQ3XTPxL
	A3DJMfCmRb/p62vkIlXw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gjski-0004Sp-Kw; Wed, 16 Jan 2019 21:29:36 +0000
Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gjskd-0004R8-Sk; Wed, 16 Jan 2019 21:29:34 +0000
Received: by mail.bootlin.com (Postfix, from userid 110)
 id 05F3B207AC; Wed, 16 Jan 2019 22:29:26 +0100 (CET)
Received: from localhost (lfbn-lyo-1-59-119.w86-202.abo.wanadoo.fr
 [86.202.150.119])
 by mail.bootlin.com (Postfix) with ESMTPSA id CFEB0206A6;
 Wed, 16 Jan 2019 22:29:25 +0100 (CET)
Date: Wed, 16 Jan 2019 22:29:26 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v5 2/2] rtc: support for the Amlogic Meson RTC
Message-ID: <20190116212926.GG2627@piout.net>
References: <20181202220847.24364-1-martin.blumenstingl@googlemail.com>
 <20181202220847.24364-3-martin.blumenstingl@googlemail.com>
 <85aa8e12-0bca-6432-e1a8-0faceff1dd5e@codethink.co.uk>
 <CAFBinCBDUxTc+ofCYm-zEeiFdU90U6DQOkX4B659q=MvRK64fg@mail.gmail.com>
 <CAFBinCAY7+-zA5-hY6oXmFz2i8aj9wFJsb-HBbKt_Swn9BtMMg@mail.gmail.com>
 <CAFBinCCKeb+wGJ4h_PfsT-Ms8AtLmNSwStTpeMqA3shkySjGkg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFBinCCKeb+wGJ4h_PfsT-Ms8AtLmNSwStTpeMqA3shkySjGkg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190116_132932_081205_37D510D1 
X-CRM114-Status: GOOD (  18.06  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-rtc@vger.kernel.org, a.zummo@towertech.it, ccaione@baylibre.com,
 linux-kernel@vger.kernel.org, ben.dooks@codethink.co.uk,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 12/01/2019 13:52:00+0100, Martin Blumenstingl wrote:
> Hi Ben,
> 
> On Tue, Dec 18, 2018 at 12:48 AM Martin Blumenstingl
> <martin.blumenstingl@googlemail.com> wrote:
> >
> > Hi Ben,
> >
> > On Wed, Dec 5, 2018 at 11:15 PM Martin Blumenstingl
> > <martin.blumenstingl@googlemail.com> wrote:
> > [...]
> > > > > Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> > > > > [resurrected Ben's patches after 2 years]
> > > > > Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> > > >
> > > > Just checking if the change of author is deliberate?
> > > > not sure how to do >1 author on patches like this.
> > > I changed the author on purpose after seeing how much I changed
> > > (compared to your v4). this is also why I added you to the CC list
> > > however, I left in your copyright (just like you kept Carlo's
> > > copyright note) and MODULE_AUTHOR
> > please let me know:
> > 1. whether you want to be the author of the patch or if you're fine
> > with my name in there
> > 2. if you are fine with both of us being listed as Signed-off-by or if
> > you want me to switch to Co-authored-by
> > 3. about any other concerns you have
> >
> > I would like to update this patch next weekend so it can be reviewed
> > (and merged once all is fine) for v4.22
> gentle ping on this one now that the holiday season is over.
> 

I would think you can resend as they are. Or, you could resend v4 from
Ben and then a patch with your modifications.


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
