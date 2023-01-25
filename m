Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE277C54E94
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Jan 2023 14:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kE+BdbRt9eG07HhA2OqgVsOXNKkuCp/odpIkuacwuMg=; b=SJGdmrlR+arLG7
	7jtaiqxUZfFixGvMB3veAjKWyGoxCp8ricBVpwEPCKH3gbc+aEdye/3EvyQuqySBqOkWoBwmr4nb/
	x1nSLhfzG2uYvmxKUK86h54xVD0uUERIYAGNRbPYNepPZLfBKzrldBii5KUwCU1VkeeQTbZqO0G0n
	r4IbjR8NNrvGB3VcCCLg0bG9CINyupxpPMdReSdGBMZskT4maGC+wiGS9bHU4bAsnHfuqoi58WQFR
	KwOxJXmZB79Rx9RcLG213GIzg7YJpd8S3/tNzBSEyWe0ZFnR791EziiuXAM3m2QVPH0BXV0fFW6Ly
	mZ5+77Kp7tZ0/Yt4k6ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKgz5-007dCy-M5; Wed, 25 Jan 2023 14:42:43 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKgyT-007cup-PT
	for linux-amlogic@lists.infradead.org; Wed, 25 Jan 2023 14:42:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id F1068B81991;
	Wed, 25 Jan 2023 14:42:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45026C4339B;
	Wed, 25 Jan 2023 14:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1674657722;
	bh=w9FBjb85BiwRRmIPsmabTgMwsz3xWAmj58207LG6kQw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Zzc63OiZX6tETdrObDbD3067lwC4d6Lf7DkBalD77S+JKWNUYwuHGd8SmDxqNIXAu
	 iO6FHkjxLQqb80+IoJP55IRC3hi+SveUroH2Oxmp5kUi6I2i0BLu3g81gp2FqR2ZZ+
	 CW25H2ZYxHv6/o8bxGOti0JYF+L5pXlH42Wkumdk=
Date: Wed, 25 Jan 2023 15:42:00 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Anand Moon <linux.amoon@gmail.com>
Cc: linux-amlogic@lists.infradead.org
Subject: Re: [PATCH RESEND linux-next v4.1 0/4] Used onboard HUB to reset and
 add power to hub
Message-ID: <Y9E/uOK6AtFYGmar@kroah.com>
References: <20230125143404.1424-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230125143404.1424-1-linux.amoon@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_064206_060993_CEF982D4 
X-CRM114-Status: GOOD (  10.95  )
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

On Wed, Jan 25, 2023 at 02:33:59PM +0000, Anand Moon wrote:
> Amlogic board use gpio-hog to reset the USB hub.
> so using onboard hub we could reset the USB hub and
> also enable power to the USB hub.
> 
> v4: rebased on linux-next
>     Fixed some small changes like the subject.
>     Dropped the merge patches.

What is "4.1" for a patch version?  That's not how we number things...

confused,

greg k-h

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
