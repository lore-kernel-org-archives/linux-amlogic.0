Return-Path: <SRS0=oQoi=CE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A015C433DF
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 Aug 2020 15:57:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 668D12078D
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 Aug 2020 15:57:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CkUQ5q2G"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 668D12078D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=R7EEei61lhgzOmUDdQ2d0DfBnJRLpLNscTzKnzCLgBs=; b=CkUQ5q2G9hPeCnexhkF0z5hNc
	6/jSQJ/82yhSTTS1nE1DrZK7Rq3S3GgkpLZADTp6bOwK3l3nf/ounWyOqpQ49Vr3PiUkfzl87JQQt
	Mu8b8Ia/QQvZmijc2W5IAr4BUGcn8EL7Jj2fIUf1nGowIHovpsm4LOG8LdEiyK88MTO9ry1OKiiBG
	ayGvoQLJgV1LKii7DRP+GkCXIPUBjzZ2TUFCmqzwivh4On1F1bZsr4YJlp8DW4qDyaUrI30cMuTpY
	ZpW5FzxplqGNkE2KDw0FmKXif58AKgOzoljSUl+/SRqG6eZfhHDa5p7p/hA4yQf49dKdSv1oIpDsS
	oEn4jOuAQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAxnr-0007m3-CN; Wed, 26 Aug 2020 15:57:35 +0000
Received: from mail-ej1-f68.google.com ([209.85.218.68])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAxnl-0007kh-5P; Wed, 26 Aug 2020 15:57:29 +0000
Received: by mail-ej1-f68.google.com with SMTP id e23so2799701ejb.4;
 Wed, 26 Aug 2020 08:57:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=45MPvxSTPW26+XDfgYCIUeSzgGp+rsYJNL1Xl/Rrc7s=;
 b=tOTyC2BS5vVgjkmGst/uBjgkYzl81cRH8obAsTVH37vjl+oqCA1HzHi2KbWMqqvPv/
 5jrc8UnFNSDTMGQbL4Mut09lZEkwnmNF2BgWKzA6oPI/Q5ZbHs53peQ8HAyFIKl7p0Ia
 2DBdCXV0D8L4xXNgSlIHgk4gXNv/lI/aCbYBtckVZGVtJTk7NJPe4dhsWjq+h3B7DV1e
 AbFke10Xq0hN+Igt4DmlLL6HBcfeL9EHkK37HQ1c76jpGSn6Vk99G7eHPVISyBjUSyIO
 um9ixaWOD8DrPvy5OPy0t/yyyFDCOSM1g5gDz4X4oE70Le3hxNv5LsW3lSHAkdB0jFhC
 iG9w==
X-Gm-Message-State: AOAM530M5IpdqXw/a7n76tVFybjsWCPbmRp8m4/igNyPsr5cGnE3LyLS
 R67XGHmr+TBCrnP7RiXR+Uk=
X-Google-Smtp-Source: ABdhPJwogQw5qIsL7Fpbti7NmegdVYPyyDOLGY4F/NiL6nihkqrZkmsf+wLzabOVGtOxQ+zQF8NZAA==
X-Received: by 2002:a17:906:1404:: with SMTP id
 p4mr16196580ejc.256.1598457446440; 
 Wed, 26 Aug 2020 08:57:26 -0700 (PDT)
Received: from kozik-lap ([194.230.155.216])
 by smtp.googlemail.com with ESMTPSA id v17sm2590422eju.22.2020.08.26.08.57.24
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 26 Aug 2020 08:57:25 -0700 (PDT)
Date: Wed, 26 Aug 2020 17:57:23 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tomasz Duszynski <tomasz.duszynski@octakon.com>
Subject: Re: [PATCH 11/16] iio: chemical: scd30: Simplify with dev_err_probe()
Message-ID: <20200826155723.GA31748@kozik-lap>
References: <20200826145153.10444-1-krzk@kernel.org>
 <20200826145153.10444-11-krzk@kernel.org>
 <20200826153434.GA7468@arch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200826153434.GA7468@arch>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200826_115729_238958_6A440E4F 
X-CRM114-Status: GOOD (  21.92  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Jonathan Bakker <xc-racer2@live.ca>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 linux-samsung-soc@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
 Marek Vasut <marek.vasut@gmail.com>, Kukjin Kim <kgene@kernel.org>,
 Alexandru Ardelean <alexandru.ardelean@analog.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Lars-Peter Clausen <lars@metafoo.de>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Beniamin Bia <beniamin.bia@analog.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Hartmut Knaack <knaack.h@gmx.de>,
 Peter Rosin <peda@axentia.se>, Jonathan Cameron <jic23@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, Aug 26, 2020 at 05:34:34PM +0200, Tomasz Duszynski wrote:
> On Wed, Aug 26, 2020 at 04:51:48PM +0200, Krzysztof Kozlowski wrote:
> > Common pattern of handling deferred probe can be simplified with
> > dev_err_probe().  Less code and also it prints the error value.
> >
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > ---
> >  drivers/iio/chemical/scd30_core.c | 10 +++-------
> >  1 file changed, 3 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/iio/chemical/scd30_core.c b/drivers/iio/chemical/scd30_core.c
> > index eac76972f83e..92358797796d 100644
> > --- a/drivers/iio/chemical/scd30_core.c
> > +++ b/drivers/iio/chemical/scd30_core.c
> > @@ -705,13 +705,9 @@ int scd30_probe(struct device *dev, int irq, const char *name, void *priv,
> >  	indio_dev->available_scan_masks = scd30_scan_masks;
> >
> >  	state->vdd = devm_regulator_get(dev, "vdd");
> > -	if (IS_ERR(state->vdd)) {
> > -		if (PTR_ERR(state->vdd) == -EPROBE_DEFER)
> > -			return -EPROBE_DEFER;
> > -
> > -		dev_err(dev, "failed to get regulator\n");
> > -		return PTR_ERR(state->vdd);
> > -	}
> > +	if (IS_ERR(state->vdd))
> > +		return dev_err_probe(dev, PTR_ERR(state->vdd),
> > +				     "failed to get regulator\n");
> 
> I'd say that removing like break would slightly improve readability.
> Besides, staying within 100 columns seems socially acceptable now.
> Otherwise,
> 
> Acked-by: Tomasz Duszynski <tomasz.duszynski@octakon.com>

Indeed. Although 80 is still mentioned as preferred (in commit bdc48fa11
and in coding style) but here having longer line would be better.

I guess this could be fixed up easily when applying but if resend is
wanted, let me know.

Best regards,
Krzysztof

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
