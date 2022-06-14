Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37472C43334
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 Jun 2022 10:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7pC0nWosJRND+UfJ2zAJoRmRiIuZAcn1JIo6cM1BIDg=; b=lPqab+Af2DnINC
	9xwRvtooOK0RabM/4h8GEJYavCFF8ZNLVHM5t0drgjmqEKzQ5rkFTbqvraAfan0qtmqbkURIBjADx
	0AaKZRP9juqGXPYBmsnnSO66Ytw/na8rAtw1A8mswBsKr66LMlynMDUJEU57LipGJEwvbaeU2UVo4
	mPlg15rVx36s8XIVB0h8hdlgSeG8a9FZJwZD1fWlQMCYd9n2zetiOWdGXRwWzXCKs51QIJTFclcGk
	SzkdHxXwcLtpTfzImELWAA1LKFivfbF56zZL+zuGAJzcwluW/yRuGkDBw2P2WuZmsI4G2M/kYyv49
	bAvxuFo32M89/Cy5gnDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o13XJ-008x8E-Pk; Tue, 14 Jun 2022 10:12:37 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o13XH-008x7Z-2G; Tue, 14 Jun 2022 10:12:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C6A9760AEB;
	Tue, 14 Jun 2022 10:12:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C89FC3411B;
	Tue, 14 Jun 2022 10:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655201553;
	bh=OU/NN+viO7AEHR96HAV2XGs7BeFoWc8CIQP0hQgj6vU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=N0h9lZRJmQuixNqG6kalxSCRX53PXSuiPfVYsOlhI8XrzjFCEBMrsy427hsL/bzUa
	 nM/e5pkmu6fOdd7zZJTwHbjipGLTPtj191vmJi/3aFaGrbPAzTwxyKm2iRCLcIU4P5
	 0W1UPsirm5b3jLJLQB5nO2oAe2mFBBx/Uxy+Ut72hOrEDS0zluBfBV10ussQJFdX5k
	 YC3oJC7l13zFtvUvhHcc7y9kQbsx+etzhD9zmWelnUdASAmKnOL5nRgoZOVWi7V8El
	 Oa7P6VbFTmnCbRdpuHJEMoV3JbqmnxOFqlImK18KaWBdDghwG+7RM7Azl4aKS0gGky
	 1GJdoKQuuR7Rw==
Date: Tue, 14 Jun 2022 11:21:42 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, Lars-Peter
 Clausen <lars@metafoo.de>, Neil Armstrong <narmstrong@baylibre.com>, Kevin
 Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v3 1/6] iio: adc: meson_saradc: Don't attach managed
 resource to IIO device object
Message-ID: <20220614112142.3eb70a8d@jic23-huawei>
In-Reply-To: <Ypo80/NpWLLP43jm@smile.fi.intel.com>
References: <20220603100004.70336-1-andriy.shevchenko@linux.intel.com>
	<20220603170612.561edfbf@jic23-huawei>
	<20220603172307.5d2f3c52@jic23-huawei>
	<20220603172920.3239bbd6@jic23-huawei>
	<Ypo80/NpWLLP43jm@smile.fi.intel.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220614_031235_189918_B20C089F 
X-CRM114-Status: GOOD (  20.24  )
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

On Fri, 3 Jun 2022 19:54:43 +0300
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> On Fri, Jun 03, 2022 at 05:29:20PM +0100, Jonathan Cameron wrote:
> > On Fri, 3 Jun 2022 17:23:07 +0100
> > Jonathan Cameron <jic23@kernel.org> wrote:  
> 
> ...
> 
> > Andy, put a cover letter on these larger series - if nothing else it gives
> > somewhere convenient for people to give tags for the whole series, or 
> > maintainer to say what they are doing with it.  
> 
> I'll try to remember this. The series was started from only a couple of patches
> and grew to this big, and I forgot to add a cover letter when it seems not
> anymore obvious what has been done.
> 
> > Anyhow, I'm fine with the series, but will leave it on list for a while
> > longer, particularly to get patch 6 some eyes + testing.
> > 
> > Currently I plan to drop the fixes tag from this first patch, but I'm prepared
> > to be convinced it's a bug fix rather than a consistency cleanup.  
> 
> Fine with me, thanks!
> 
Applied to the togreg branch of iio.git and pushed out as testing for all the normal
reasons.

Thanks,

Jonathan


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
