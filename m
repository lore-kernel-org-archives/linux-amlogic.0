Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB310C43334
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 Jun 2022 16:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AZDJBqwGfn1qNUu/Bx5V4xKirjtkdPaks41yP1h//EI=; b=cqDSWiF3/+ZxWF
	SUby/c5OJE+2V84p1JfQ+2EQB20xhwPexCQ+HbbVGx2Nb7bRvyefSZgyCiaYKoqjP0hgo+I5iJ17p
	jrfxTFctq6V9nY/HLD5nCdziYalxsDBpWq2upRfTh7O64wsXGfZVGaN37HgTVk/bkD8eblRHpr/5A
	HNUIYgnom39JyunK6VPlAxr6rCu48IbFjzk0HCWFDRUd2SGEuHhnrGjPK/uQYpRWExZ3xekXz+DPt
	il7lkXyLPFKArx8QKUn+u6W8j8sIbsmIgMxg98ZaPFOnkIFbwzu0IxPKC5AIJCz5a6/FToTHN19GV
	sUuVjPG0vVvudaSWK9MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nx9sD-0087IG-Dz; Fri, 03 Jun 2022 16:10:05 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nx9sB-0087Gt-0I; Fri, 03 Jun 2022 16:10:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 296916191F;
	Fri,  3 Jun 2022 16:09:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7D5CC385A9;
	Fri,  3 Jun 2022 16:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654272593;
	bh=ktWgG1/7y93sK7zzHW+CpS8gPfNRHYR0DXoQkI/lC3Y=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=t3cO7fofzPVq+NXJhff0m7x9HkyS8/55HU7dxXhlawdtoB57uEar4v/WBKUpn8unf
	 NIEKTi5yAER/6a2O1S+aVKpChPHbnDo/CmX9sUpwPOx4QvHvdL8GSQP+qRSzGRoZk4
	 icd1w14DGrz7R0MBJO7y9ncf08XOdZ+NyODKnrUyni61QKNvQ31eMlOgLyjT5ZOugZ
	 fhpgnlx0Y7vOXV5YIDh9XiLUcw77DBJDflNYCl6IvzygDT+ngCGlzkd7sLWuIL2UH3
	 pt1aMCE188Mc9QTyG5bViSUZsQ20gq46+3KWviT/nRUYyJV07hizrMo8jSRKk4bcFO
	 kCW1sKSp8jaYw==
Date: Fri, 3 Jun 2022 17:18:52 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, linux-iio
 <linux-iio@vger.kernel.org>, linux-arm Mailing List
 <linux-arm-kernel@lists.infradead.org>, linux-amlogic
 <linux-amlogic@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH v2 3/3] iio: adc: meson_saradc: Use temporary variable
 for struct device
Message-ID: <20220603171852.1f4c727f@jic23-huawei>
In-Reply-To: <CAHp75VcSFr+E7_woyw6jx7e9wCeFUUouV_7xJXYO26_y6=fwTQ@mail.gmail.com>
References: <20220602114241.12601-1-andriy.shevchenko@linux.intel.com>
	<20220602114241.12601-3-andriy.shevchenko@linux.intel.com>
	<ad3af033-97f1-3aad-d082-c6ed56185b59@metafoo.de>
	<CAHp75VcSFr+E7_woyw6jx7e9wCeFUUouV_7xJXYO26_y6=fwTQ@mail.gmail.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220603_091003_135324_E8F25F66 
X-CRM114-Status: GOOD (  22.77  )
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

On Thu, 2 Jun 2022 15:45:27 +0200
Andy Shevchenko <andy.shevchenko@gmail.com> wrote:

> On Thu, Jun 2, 2022 at 2:08 PM Lars-Peter Clausen <lars@metafoo.de> wrote:
> > On 6/2/22 13:42, Andy Shevchenko wrote:  
> 
> ...
> 
> > > -     priv->adc_clk = devm_clk_register(&indio_dev->dev, &priv->clk_gate.hw);
> > > +     priv->adc_clk = devm_clk_register(idev, &priv->clk_gate.hw);  
> >
> > You are not changing anything here.  
> 
> The scope of patch is supposed not to change the current behaviour :-)
> 
> > But we shouldn't be devm'ing on the
> > IIO device. It will get freed eventually, but only when the last
> > reference to the iio device has been dropped, which might be long after
> > the platform device has been removed. devm'ing should happen on the
> > platform_device's device. Might be worth fixing.  
> 
> Thanks for confirming my suspicions (as I mentioned to Martin, using
> an IIO device there feels wrong).
> I will add another patch to v3.
> 

I thought that the iio_dev ends up holding a reference to the platform
device dev so the parent would only be released if the child had already been,
but I may well be wrong on that. 

Either way I don't mind it being tidied up.

Jonathan



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
