Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13188C0015E
	for <linux-amlogic@archiver.kernel.org>; Sat, 22 Jul 2023 16:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8+u4LzuCCUtOSo4fFhJPb/GqCZrEXB7cDRPx7CKUpqE=; b=rfFkofwfzGf8IM
	36gnjWaWvPpkvzKUf+F14h2vldolNqHCLpeWdC0Tn6t4O8kQAFm7KsjLReYXdcxxa/SmdidllPB5b
	A6dLmDdt511+sT36HUP0kyUaGyp7Gd4U+YT1x8XXHc9evuZzqqs5NZ2N9sI46TdZQoPWaPa6FWHG3
	ddiBoYQ8PFeW7B4iQ02/ETrrUAlJNrQp641xeKKcmFcDIkSRVI/mF1LFJ3iRCBuOi4MyJdqGD7ywf
	CGrtTpnRC3IMtrKZi3yWynlha6EZRA7eMOBHMalrk6iERGAMAB7WEed/WdU/nsIYE2Dz4ioXYGzBy
	UZT9zOMNs+mYs8Htx54w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNFwm-00H1QR-1d;
	Sat, 22 Jul 2023 16:59:12 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNFwk-00H1Px-1o;
	Sat, 22 Jul 2023 16:59:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 702EE60677;
	Sat, 22 Jul 2023 16:59:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EC52C433C8;
	Sat, 22 Jul 2023 16:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690045147;
	bh=Ij/rcsp5XlAxMerhVwPsIgVA3kkMS01caPTwvxw8uGQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Odo2jweh+cUBE0mbhrXwKnFNCjy3c5laBUNaawbmRe/fOxoaGoXTrNTse7XnCmddB
	 Eatr7NAcPkXii/qd8Si1FFx+cNzdjTYYfbMDJKskbzOqar3KgOm3hRbfj8FmQsTCtL
	 RRciAVIBqnMz9+1I6RifmFlbuw9/gwIqm2mcY8blmwbEbs9CNZbzKw1Uul2uMl0DU9
	 7PaLy2kmjX/K00aOjhlsRBJD5iwbx93ny+6pu/Zn8HKCL2lwGKGTMZRWq1dEODbGU/
	 uvLPLdeQTF8Dn9PNxrTg29fOYYWNqHP5Zxu7qnN/AVwIxS0z4/Udt0nFSvSaZGPgg6
	 ku3OI5qa+vQzQ==
Date: Sat, 22 Jul 2023 17:59:01 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, George Stark
 <gnstark@sberdevices.ru>, <lars@metafoo.de>, <neil.armstrong@linaro.org>,
 <khilman@baylibre.com>, <jbrunet@baylibre.com>,
 <martin.blumenstingl@googlemail.com>, <nuno.sa@analog.com>,
 <linux-iio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
 <kernel@sberdevices.ru>
Subject: Re: [PATCH v1 0/3] iio: adc: meson: tune init sequence
Message-ID: <20230722175901.16f47142@jic23-huawei>
In-Reply-To: <20230718104100.00007c0c@Huawei.com>
References: <20230715110654.6035-1-gnstark@sberdevices.ru>
	<20230716171134.43d05c45@jic23-huawei>
	<a172c764-1eef-835f-f237-8f78b4c6e877@sberdevices.ru>
	<ZLURZWPkmP6aKDOZ@smile.fi.intel.com>
	<20230718104100.00007c0c@Huawei.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230722_095910_664095_34F10B65 
X-CRM114-Status: GOOD (  14.63  )
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

On Tue, 18 Jul 2023 10:41:00 +0100
Jonathan Cameron <Jonathan.Cameron@Huawei.com> wrote:

> On Mon, 17 Jul 2023 13:01:09 +0300
> Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> 
> > On Mon, Jul 17, 2023 at 12:41:29PM +0300, George Stark wrote:  
> > > On 7/16/23 19:11, Jonathan Cameron wrote:    
> > > > On Sat, 15 Jul 2023 14:05:57 +0300
> > > > George Stark <gnstark@sberdevices.ru> wrote:    
> > 
> > ...
> >   
> > > > These look fine to me, but I'd like them to sit on list a little while
> > > > on off chance anyone else has feedback on them.    
> > > 
> > > I understand. I'd resend the patches in a week or more if there's no
> > > feedback.    
> > 
> > There is no need to resend as long as they are available via lore.kernel.org
> > mail archives.
> >   
> 
> FYI, I track using patchwork.kernel.org so rarely drop a patch set down the back of the
> sofa any more...
> 
> Jonathan

Long enough.  Applied to the togreg branch of iio.git and pushed out as testing
for 0-day to see if we missed anything.

Thanks,

Jonathan



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
