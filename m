Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A3E5C38147
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Jan 2023 03:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y3yjH4Md12k1ElDPp1f9UTfHQf56X7F0EmSC0QUsSmc=; b=S7+n1LJtPi62nG
	Z5xk3DKPDRdcTQySSxMYrZUqK/XglgbNJg/u5AmvcnN09N2bk08BrYBcnAZ0xSmymrL8akM/DI+EK
	zO1ZhmI2jquZtTvgnN1lUHuAlo6EgyQwxMNQ7StndXz0xjfFIgpNsKjVHk0ylz+HA5WE4Q6BOMq5Z
	h0w0nA/xPw6/zVQK5W4zyW7uL+5prThxT4zy/JrGsm/UBFqUmp3WMR5Gg2A04mY7vuANIBBlv8LHr
	0gcf6lVxXsj2RidXgkjOdqFDpK++qyAT76Q/CNKGPXeOCW9ovQ6rGpuDJ5uAurVSzBg0s/a90i/H5
	7CvlDojIe8EGNVXmOk2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHyo9-00GeZt-EL; Wed, 18 Jan 2023 03:08:13 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHyo6-00GeZ8-LE
	for linux-amlogic@lists.infradead.org; Wed, 18 Jan 2023 03:08:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=iHV7CytWlRD3302v/1nhCK0cn5pj1iojKylILrpkF5w=; b=SJahukxj2tI8oL1m0fY0hxQpVM
	mi+h1t0LeaEEFYXe1wOVyClZxbfClPY4dRXyzJMpmNbJc7TW+pJdIEC3LXtoV3B/0Z9SXGivjqsxG
	aLFlmT9X/yakTMbl71PJu7Os+8xMygLek9F+Iy1APbt93OK+e5KNzLyMIAjP9Kz7q7KA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1pHyo4-002OGY-U5; Wed, 18 Jan 2023 04:08:08 +0100
Date: Wed, 18 Jan 2023 04:08:08 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
	linux-amlogic@lists.infradead.org,
	Kevin Hilman <khilman@baylibre.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Da Xue <da@lessconfused.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 0/2] net: mdio: add amlogic gxl mdio mux support
Message-ID: <Y8dimCI7ybeL09j0@lunn.ch>
References: <20230116091637.272923-1-jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230116091637.272923-1-jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230117_190810_715424_9B337D8E 
X-CRM114-Status: GOOD (  16.87  )
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

On Mon, Jan 16, 2023 at 10:16:34AM +0100, Jerome Brunet wrote:
> Add support for the MDIO multiplexer found in the Amlogic GXL SoC family.
> This multiplexer allows to choose between the external (SoC pins) MDIO bus,
> or the internal one leading to the integrated 10/100M PHY.
> 
> This multiplexer has been handled with the mdio-mux-mmioreg generic driver
> so far. When it was added, it was thought the logic was handled by a
> single register.
> 
> It turns out more than a single register need to be properly set.
> As long as the device is using the Amlogic vendor bootloader, or upstream
> u-boot with net support, it is working fine since the kernel is inheriting
> the bootloader settings. Without net support in the bootloader, this glue
> comes unset in the kernel and only the external path may operate properly.
> 
> With this driver (and the associated DT update), the kernel no longer relies
> on the bootloader to set things up, fixing the problem.

Ideally, you should also post an actual user of this driver, i.e. the
DT updates.

> This has been tested on the aml-s905x-cc (LePotato) for the internal path
> and the aml-s912-pc (Tartiflette) for the external path.

So these exist in mainline, which is enough for me.

   Andrew

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
