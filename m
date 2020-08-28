Return-Path: <SRS0=gNbl=CG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46722C433E2
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 Aug 2020 06:25:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0EFA320757
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 Aug 2020 06:25:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dsEvVafG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0EFA320757
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dwerVvt9oTeuL2wRF5Zg+5J1A432Eq4sSaxWGf8YDEo=; b=dsEvVafGnNJScMwknMevCh9NJ
	kwmLp9pH1dZvf5Z1Ax+mBMgBvhSuTILeF7tsPqH6nvaydHsoh6c722gJGQQm9SzA4h5DBOfvrTt/W
	QbGrnkLozClkqaisE/wdovMB67hmp58TNlZ+Yrc1Q9fTjOkY6FbDUUKB9KTockhtTAVldWw7lbT7B
	2p1tql3PZvYHq8C40fVRov+N8AKPRbAdwRKuFUs9xQ85aWIAc99rFXQ47MEX+U0uot8syE4sOEAWn
	9Vx+hgV/obI1W6z39BZPz+fXGtvEgAJQu3QjHXm6bWyaacQXpFqQ8yDenKqCkLAiVRkJSXJS0MSuB
	Xml5XUnWA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBXoi-0007D7-2J; Fri, 28 Aug 2020 06:24:52 +0000
Received: from mail-ed1-f65.google.com ([209.85.208.65])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBXoe-0007CK-2C; Fri, 28 Aug 2020 06:24:49 +0000
Received: by mail-ed1-f65.google.com with SMTP id v8so139490edl.7;
 Thu, 27 Aug 2020 23:24:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=p5CxlDCkzVcslzoI2Y1jCiSF6kba4WwnH5Gi/cefvyw=;
 b=pPhQoMmWefH5F+48Q7sWQtW2IQkwshxX+IGxvh2umdiiBS3MpBtEILN3pxXuh4mBwD
 7/CQavVzp3wxev20IFOr0CCEwPLj6bkkhbSxJUDeAlji+N54XvTTL6BsTnq89hKCqKnS
 9EmSE/8BO1lmErt0Y0shy9AMm54ghGnjcnDXJzPJdp74Bm+b+TChJ3Y/tPG6bEb1F1Qt
 FzRMthAfNRSRQA9qWTUcNtTKan8lYUJG5uoXGnxP2U+ZpOZMNKBL62Xfces7KEmzgDX+
 F3oKhecwH9ekMugjLbFsBYQ7wGK0NMMh+1xjeMbR5p6TaJwWcq1NEJja7XxStNKt9FSJ
 fcjQ==
X-Gm-Message-State: AOAM5319D/Zmbri6t6/bEHpRZen6ccSRBcFq0DOaGHxXc/SE3d7o9RUO
 OdzFl2Y0b4bzd38mAm7JU3U=
X-Google-Smtp-Source: ABdhPJxeW0KD9hKV2DDa/EdMjU+5aNFXnsb+vG7w/NJJBOIDbbnxf68rltSFEJDK0Zq+nf99uGbtHw==
X-Received: by 2002:a05:6402:2039:: with SMTP id
 ay25mr310806edb.87.1598595886637; 
 Thu, 27 Aug 2020 23:24:46 -0700 (PDT)
Received: from pi3 ([194.230.155.216])
 by smtp.googlemail.com with ESMTPSA id w20sm3809310ejc.77.2020.08.27.23.24.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2020 23:24:46 -0700 (PDT)
Date: Fri, 28 Aug 2020 08:24:43 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Peter Rosin <peda@axentia.se>
Subject: Re: [PATCH v2 09/18] iio: afe: iio-rescale: Simplify with
 dev_err_probe()
Message-ID: <20200828062443.GA17343@pi3>
References: <20200827192642.1725-1-krzk@kernel.org>
 <20200827192642.1725-9-krzk@kernel.org>
 <f4a5777e-fe85-9f3f-4818-f7539f223adc@axentia.se>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f4a5777e-fe85-9f3f-4818-f7539f223adc@axentia.se>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200828_022448_151868_C8E58A7A 
X-CRM114-Status: GOOD (  30.43  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-iio@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>,
 Tomasz Duszynski <tomasz.duszynski@octakon.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Kevin Hilman <khilman@baylibre.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Kukjin Kim <kgene@kernel.org>,
 Beniamin Bia <beniamin.bia@analog.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-samsung-soc@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Hartmut Knaack <knaack.h@gmx.de>,
 Jonathan Cameron <jic23@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, Aug 27, 2020 at 11:46:40PM +0200, Peter Rosin wrote:
> On 2020-08-27 21:26, Krzysztof Kozlowski wrote:
> > Common pattern of handling deferred probe can be simplified with
> > dev_err_probe().  Less code and also it prints the error value.
> > 
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > 
> > ---
> > 
> > Changes since v1:
> > 1. Wrap dev_err_probe() lines at 100 character
> > ---
> >  drivers/iio/afe/iio-rescale.c | 7 ++-----
> >  1 file changed, 2 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/iio/afe/iio-rescale.c b/drivers/iio/afe/iio-rescale.c
> > index 69c0f277ada0..8cd9645c50e8 100644
> > --- a/drivers/iio/afe/iio-rescale.c
> > +++ b/drivers/iio/afe/iio-rescale.c
> > @@ -276,11 +276,8 @@ static int rescale_probe(struct platform_device *pdev)
> >  	int ret;
> >  
> >  	source = devm_iio_channel_get(dev, NULL);
> > -	if (IS_ERR(source)) {
> > -		if (PTR_ERR(source) != -EPROBE_DEFER)
> > -			dev_err(dev, "failed to get source channel\n");
> > -		return PTR_ERR(source);
> > -	}
> > +	if (IS_ERR(source))
> > +		return dev_err_probe(dev, PTR_ERR(source), "failed to get source channel\n");
> 
> Hi!
> 
> Sorry to be a pain...but...
> 
> I'm not a huge fan of adding *one* odd line breaking the 80 column
> recommendation to any file. I like to be able to fit multiple
> windows side by side in a meaningful way. Also, I don't like having
> a shitload of emptiness on my screen, which is what happens when some
> lines are longer and you want to see it all. I strongly believe that
> the 80 column rule/recommendation is still as valid as it ever was.
> It's just hard to read longish lines; there's a reason newspapers
> columns are quite narrow...
> 
> Same comment for the envelope-detector (3/18).
> 
> You will probably never look at these files again, but *I* might have
> to revisit them for one reason or another, and these long lines will
> annoy me when that happens.

Initially I posted it with 80-characters wrap. Then I received a comment
- better to stick to the new 100, as checkpatch accepts it.

Now you write, better to go back to 80.

Maybe then someone else will write to me, better to go to 100.

And another person will reply, no, coding style still mentions 80, so
keep it at 80.

Sure guys, please first decide which one you prefer, then I will wrap it
accordingly. :)

Otherwise I will just jump from one to another depending on one person's
personal preference.

If there is no consensus among discussing people, I find this 100 line
more readable, already got review, checkpatch accepts it so if subsystem
maintainer likes it, I prefer to leave it like this.

> You did wrap the lines for dpot-dac (12/18) - which is excellent - but
> that makes me curious as to what the difference is?

Didn't fit into limit of 100.

Best regards,
Krzysztof



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
