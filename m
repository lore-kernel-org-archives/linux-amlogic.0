Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA021C4332F
	for <linux-amlogic@archiver.kernel.org>; Wed,  9 Nov 2022 06:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/+iNPPvdNYxGQNchPVlvpHUSqPGgoRYEP4KSrfkxJE4=; b=xLCkF6X4atIGeE
	HGHyQ3A6mb90wiEPB9DExDV6kf/7maIdx3LrhO40pBYgoOkiir6RTzO+brv9f2E9ha0FHwQqJXMw+
	Z83Qpbcb6z/xyjTifAfdQfPUquAmYJm9ZVIUq7FMK3AgwQ9XdONTe4PLQ9+tXPLp02y0H66+SZcU2
	TlREYRTTUJr0V3VBke5TBfinhEyGcBl9rK9kXMD634fIr65MWPLW9n2wcT1KV4xFV86qyinvaIMqu
	PPiy3pQaUZcsgVAzA6fP7fJwwQITqluc0vx7FNhUyxY2CO5fLk8ATgkk56wpTCATFN4V65IfD4HuT
	ZPfq9IqwPudINC+AzQPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osem0-00BIVL-Cx; Wed, 09 Nov 2022 06:41:20 +0000
Received: from msg-2.mailo.com ([213.182.54.12])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oselx-00BISE-Ru; Wed, 09 Nov 2022 06:41:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1667976048; bh=s2xnc8dtE9RdQHld1qiAbNnZOdtNe2s+3N0KAhbpfss=;
	h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To;
	b=ndkZyXusVJy9VW0jXi8vkuuV13fsCt/56qU728chMOc2JpCE9kTefADbxnUar/XZm
	 57OMxk53j5ZQRPy0AU3esFAWUQt9a6H3neQoMExVrjFBs7oy9uf/3PvLMLckzXPBP6
	 onkglGt2BakIfxgSo1wNSLgj/CmT09/K+yQFVt6k=
Received: by b-5.in.mailobj.net [192.168.90.15] with ESMTP
	via ip-206.mailobj.net [213.182.55.206]
	Wed,  9 Nov 2022 07:40:48 +0100 (CET)
X-EA-Auth: F61TFAW5EIxTOLGMc0AqWx1vFt0VZ8WWn5l9nu0xUmZiOFCbHY9NJ+7ODh/iOVr28E2+bZFRA3PVvl3YE6fgdY81AlgJbShA
Date: Wed, 9 Nov 2022 12:10:37 +0530
From: Deepak R Varma <drv@mailo.com>
To: Andrew Lunn <andrew@lunn.ch>
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
Message-ID: <Y2tLZaPSUT45TF4f@qemulion>
References: <Y2eSCZJNWn6DzCUu@qemulion>
 <48f4bda9-b5e3-9649-aab9-b529889bf110@linaro.org>
 <Y2oO7fU4whKr+3hb@kadam>
 <Y2q7tFF7YeX16H20@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y2q7tFF7YeX16H20@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_224118_057239_665BD4F0 
X-CRM114-Status: GOOD (  15.26  )
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

On Tue, Nov 08, 2022 at 09:27:32PM +0100, Andrew Lunn wrote:
> On Tue, Nov 08, 2022 at 11:10:21AM +0300, Dan Carpenter wrote:
>
> I cannot say anything about the media subsystem, but for networking
> patches, i will be much more willing to help somebody going from
> Outreach to being a full kernel developers if they decide to take on
> something more than just some Coccinelle changes. If it looks like you
> have the hardware and want to make it better, have a vision where the
> driver should go, then you are likely to get more help from me. So if
> media drivers are what you interested in, go buy some hardware which
> uses one of the drivers in staging, look at the TODO file, and submit
> bigger patches than just -1 to -ENOMEM.

Hello Andrew,
Thank you so much for your kind advice and willingness to help a newbie
become a valued kernel developer. I am committed to acquire necessary
knowledge and skills to contribute more than current cleanup and minor
correction patches. I am sure that the upcoming Coccinelle based project
work [if I am shortlisted] will be much more complex and meaningful.

I will explore the staging directory to identify a hardware I can afford.
I would welcome suggestion on a driver that is not much expensive and
complex to start with. Anything for the networking subsystem???

Thank you once again!
./drv

>
>      Andrew
>



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
