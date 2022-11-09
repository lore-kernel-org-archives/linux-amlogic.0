Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01090C4332F
	for <linux-amlogic@archiver.kernel.org>; Wed,  9 Nov 2022 13:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v0Sd1P9/k9aExHdv1if2ATdbV05uH6VmUutEgSGcAIg=; b=A9NHDbyoxCLJXm
	xvkcF3fEFrqG+i6PJ9KPNSSEmR48ugU1DxI5pCZ1YTkWLK01WrWJ59d3g9xYcQHzxI+knBUQJEHZ1
	ctQZMHgqqH3GkzojWMD1STpZCvDgOKPxwtpzd0qlRI/zBqvxnD9zPzH1ABPKNb/in9UIACRwkt45K
	AXeMl8q/sW8Ti0jFe8W/F4NsTS6v8/qfI5gcBx3eU4CRzULUYWJlzQF/lk0S2jH4v2sB88xWT3MeB
	MKMBvsrzjwFg/N7/+X9ij1ClltP3mezKcSXPNzMrqy6rWk4SQzaAeWAoKLUPbPN7LQiCuznZmJTaR
	KOqxTqeqNFmAjMXyJVYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oslTE-00Dx5e-EA; Wed, 09 Nov 2022 13:50:24 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oslTB-00Dx0o-VH; Wed, 09 Nov 2022 13:50:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=VpdNtU3cb37xXzV9sTyynd43haU0/uQaTTIosl+w+Vs=; b=o5dKZ60fvsHa/8H7A+lpjtUyi8
	O3+p9tUG4t4U8Cc/NAJF2UWn3hI4268wI8/fJP3UseE23YJLdfZ6id+pAiS3c5rzuZ+ZqrLUq+klV
	xy+EzrlJROMxf/eEUI+JTzy59HIBzFjx/NnLbb1Wl3zywEHm2jaorffCXvfKu9UHEZ/w=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1oslSJ-001v3D-Fu; Wed, 09 Nov 2022 14:49:27 +0100
Date: Wed, 9 Nov 2022 14:49:27 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Deepak R Varma <drv@mailo.com>
Cc: Dan Carpenter <error27@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: patches for staging:media drivers
Message-ID: <Y2uv56k515cKTXU4@lunn.ch>
References: <Y2eSCZJNWn6DzCUu@qemulion>
 <48f4bda9-b5e3-9649-aab9-b529889bf110@linaro.org>
 <Y2oO7fU4whKr+3hb@kadam>
 <Y2q7tFF7YeX16H20@lunn.ch>
 <Y2tLZaPSUT45TF4f@qemulion>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y2tLZaPSUT45TF4f@qemulion>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221109_055022_017654_8703E3F9 
X-CRM114-Status: GOOD (  21.57  )
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

On Wed, Nov 09, 2022 at 12:10:37PM +0530, Deepak R Varma wrote:
> On Tue, Nov 08, 2022 at 09:27:32PM +0100, Andrew Lunn wrote:
> > On Tue, Nov 08, 2022 at 11:10:21AM +0300, Dan Carpenter wrote:
> >
> > I cannot say anything about the media subsystem, but for networking
> > patches, i will be much more willing to help somebody going from
> > Outreach to being a full kernel developers if they decide to take on
> > something more than just some Coccinelle changes. If it looks like you
> > have the hardware and want to make it better, have a vision where the
> > driver should go, then you are likely to get more help from me. So if
> > media drivers are what you interested in, go buy some hardware which
> > uses one of the drivers in staging, look at the TODO file, and submit
> > bigger patches than just -1 to -ENOMEM.
> 
> Hello Andrew,
> Thank you so much for your kind advice and willingness to help a newbie
> become a valued kernel developer. I am committed to acquire necessary
> knowledge and skills to contribute more than current cleanup and minor
> correction patches. I am sure that the upcoming Coccinelle based project
> work [if I am shortlisted] will be much more complex and meaningful.
> 
> I will explore the staging directory to identify a hardware I can afford.
> I would welcome suggestion on a driver that is not much expensive and
> complex to start with. Anything for the networking subsystem???

Staging drivers for network tend to be USB dongles for WiFi. Some of
those drivers need throwing away and starting again, others need less
work. If you are interested in that, i would suggest asking on
linux-wireless@vger.kernel.org.

Another option might be pi433? The problem with that is, i don't know
how it fits into the rest of the network stack? Could it maybe fit
under ieee802154? Or is it just unique and needs to do its own thing?

      Andrew

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
