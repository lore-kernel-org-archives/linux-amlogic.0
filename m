Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AA01CAC582
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Sep 2025 09:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pN+rtEGk2kVAhhwQYrqB+mjIaq16e3RNqJsXpQvSzNw=; b=SQCrLCY8mCXh7S
	u3WHZ+6gHl0KdbEd69UhDUTyMejww15q1tnXvVR8xFrz9FMebYwi9Gyp7WSoXWvUqghSW18ZNBTxe
	C1dAbbCRqkOdJTz6G9fH1yrfnXYkQ4TA51o0wE0NheReHN32QGXnsZvJ0MqkDQS9jO6FLlwszTIf1
	/18s2Fg7nSSmcMvLE2CS2G34uS2dfs+tLQeqFJx14nDQLHPhhCWnbJcy78KacqH9KCevQcFAHwmbb
	N9++573/lFBZu3PXSgzbtrxJCs3FpYeoOs1G7Y2js8LB/XIqxhZ8op29OJLRCU15abZ7TZp0PXoFV
	5vrpIra4XRbUz4jfK63w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvYEK-0000000G3Xf-2CT6;
	Mon, 08 Sep 2025 09:32:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvXPk-0000000Flhh-0vma
	for linux-amlogic@lists.infradead.org;
	Mon, 08 Sep 2025 08:39:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9880E436A9;
	Mon,  8 Sep 2025 08:39:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78167C4CEF1;
	Mon,  8 Sep 2025 08:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757320791;
	bh=KkCnrtHF6ChEI9N/28CbZ7v5UfJS88AZj6T3uigboOU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L7o0TxS5I0zZKoyfYdSdbEOiyt0P3N6e2YHCS/I7704BatJyVLRMLePl2ulakGvE4
	 SIDijrqrveHMSETYWINN7rcCxOiKNlyWnZnBNFHX8BCYjWx42vM+GUbQfTehVU0XaF
	 2a4vsKWlQpK1iwG1rQ4ZyzxdvxhlgtBk5U4B0wlD9dTy67UuqL8PlGG1ymOWdckjzH
	 oWDK6yryqdgyz28ZvNDOam9dJNgyhdATsywj5XMLlIGiD0Ova59W5wWM/71F5xGon2
	 FJkWNtxaCmbAYyZ18vqi8Pq3KwQhKpQXSXioL23OS+ZCG+pM4ZXbfahSG0aU7j6ppK
	 YsnmkcB/nA8UA==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1uvXPi-000000008N4-2AIF;
	Mon, 08 Sep 2025 10:39:51 +0200
Date: Mon, 8 Sep 2025 10:39:50 +0200
From: Johan Hovold <johan@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Carlo Caione <ccaione@baylibre.com>,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: firmware: meson-sm: fix compile-test default
Message-ID: <aL6WVp10hET2-fql@hovoldconsulting.com>
References: <20250725075429.10056-1-johan@kernel.org>
 <4eacd669-9967-4ad7-a3a6-d124477100fe@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4eacd669-9967-4ad7-a3a6-d124477100fe@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_013952_283948_74302C78 
X-CRM114-Status: GOOD (  15.87  )
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

Hi Neil,

On Mon, Jul 28, 2025 at 05:42:00PM +0200, Neil Armstrong wrote:
> On 25/07/2025 09:54, Johan Hovold wrote:
> > Enabling compile testing should not enable every individual driver (we
> > have "allyesconfig" for that).
> > 
> > Fixes: 4a434abc40d2 ("firmware: meson-sm: enable build as module")
> > Signed-off-by: Johan Hovold <johan@kernel.org>
> > ---
> >   drivers/firmware/meson/Kconfig | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/firmware/meson/Kconfig b/drivers/firmware/meson/Kconfig
> > index f2fdd3756648..179f5d46d8dd 100644
> > --- a/drivers/firmware/meson/Kconfig
> > +++ b/drivers/firmware/meson/Kconfig
> > @@ -5,7 +5,7 @@
> >   config MESON_SM
> >   	tristate "Amlogic Secure Monitor driver"
> >   	depends on ARCH_MESON || COMPILE_TEST
> > -	default y
> > +	default ARCH_MESON
> >   	depends on ARM64_4K_PAGES
> >   	help
> >   	  Say y here to enable the Amlogic secure monitor driver
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Could you pick this one up for 6.18 as well?

I noticed that there's a duplicate "firmware: " in Subject, perhaps you
can fix that up when applying?

Johan

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
