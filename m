Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55B67C00A5A
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Jan 2023 02:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FFnv6eG6z/q7By1v8Rw2yLPxLzS81HDDuhrYyFq1LyQ=; b=dzXDj7+O7arWKN
	ObcJZizI5sU+UDkhwNyj2lIcFK7MZRfKwx8/yY528u20tN48quhDIw4ioMuu+GfgJLQCZcDPJ4o5S
	0tdXz2w+Fq3EK1D0W9giH1sIuVqVADikgEECHGF//n8C9ATzxWaWdMuV8pcawbYJjeKDLVD1riFml
	CTp0iSNT/Z5NEjQtwoOpyTCnntU3aeXod1CeXLHe/hfDsUI6Ubq9ZgF+RbfScPI8MlafgsYhiaVmy
	JaKOf63BLIYhZEZSrxF34aGGO8c8R0Kev1LMhRZB6pMAbdnqzmjopdl3T8Sb6Qwl5iOGCDSeuxx19
	cjNwQlL4AJlN1rb7pXlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHydB-00GdY9-VV; Wed, 18 Jan 2023 02:56:53 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHyd9-00GdWd-N7
	for linux-amlogic@lists.infradead.org; Wed, 18 Jan 2023 02:56:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=25llEiYeDS/QkPpInqQXQmxNNvjZJPqsVG0/iQjVy2c=; b=sFON5SBnkYjGqFHr3tGGBRHRrT
	o7Q3m3i9vijRANE8wAKTsMZ5jBcGKPPhpBILFKq0tRkjK1pEfNd20NLBG79ARJztRjlV8Cfc6RAfv
	YFm6zf6kZx0inmW2pb9Auwp28JuVG88YOrmGMDgJAICg7gWy/bdEPqBfPegqlYUYGJiI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1pHycq-002ODH-Bb; Wed, 18 Jan 2023 03:56:32 +0100
Date: Wed, 18 Jan 2023 03:56:32 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Simon Horman <simon.horman@corigine.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, netdev@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	linux-amlogic@lists.infradead.org,
	Kevin Hilman <khilman@baylibre.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Da Xue <da@lessconfused.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 2/2] net: mdio: add amlogic gxl mdio mux support
Message-ID: <Y8df4LRfPN34lvP8@lunn.ch>
References: <20230116091637.272923-1-jbrunet@baylibre.com>
 <20230116091637.272923-3-jbrunet@baylibre.com>
 <Y8U+1ta6bmt86htm@corigine.com>
 <1jk01mhaeg.fsf@starbuckisacylon.baylibre.com>
 <Y8VWWP53ZysENI7/@corigine.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y8VWWP53ZysENI7/@corigine.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230117_185651_773606_A7E1D489 
X-CRM114-Status: GOOD (  11.90  )
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

> > >> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> > >> +	if (!priv)
> > >> +		return -ENOMEM;
> > >
> > > nit: may be it is nicer to use dev_err_probe() here for consistency.
> > 
> > That was on purpose. I only use the `dev_err_probe()` when the probe may
> > defer, which I don't expect here.
> > 
> > I don't mind changing if you prefer it this way.
> 
> I have no strong opinion on this :)

dev_err_probe() does not apply here, because devm_kzalloc does not
return an error code. Hence it cannot be EPROBE_DEFFER, which is what
dev_err_probe() is looking for.

       Andrew

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
