Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1259BC43334
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Jun 2022 10:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b4jHhLck5mY122RE3m2pXw2UoV1XJqVyB3IrRxgFpOc=; b=47pOvqyaj8SAoE
	6d16TgPOsqrEz9c9qt2nIx6UQV2rUEyfcmUn834v/5oDnw5ZzI0QaUNtYdx9e7epyEOMXrOgEX50q
	33RpOHWYMkv1yomKgcZToi1F/ymuCXF7XipCKvPEob9JwrkEGgAZopvY1st0vllez3K4/+AvVnVEX
	g2sp7NlrvG/3uwpfVrcjlBpQYzdFaqqoAH7hRzV4wVB8U2RASXqSXNX9I9MR4GtMEnIllR0YhQqrp
	pmAJqSH4OKeNVyM7vXVfxoS9mNAQ9u0ycgoGfP5Uxkf/LV84GZScMszWcoJnS+S3CItpI+1njR+HE
	tNMAl9QP44Nf1eGbJQYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ny9nE-000gii-KI; Mon, 06 Jun 2022 10:17:04 +0000
Received: from mga09.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ny9hG-000e3g-AQ; Mon, 06 Jun 2022 10:10:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654510254; x=1686046254;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gZSzdjIX2BvSWabQuJE5Re9N3GWxjm5jrXSz5gYEGxg=;
  b=d30HzJDlbaozIqwhgtkhipEF1LyN1WEzhc6rlnKuvoV5kjlAn3MI4pTY
   OrnUGned3o1M8XxwGe/1KdzOnjM+0Qh6InIzfErjIRR+ZPYK0GFgH5dNE
   V4pnqp49n9r5UK+cu5vlNuuRZqdYNISJpob+xjOuT6JB08q0dzPtC8f9k
   SHrVGnZBvIdVa+mWFXTl2edY6QJa3ZHyJOTYhbDP0c+rSl9liQeqFS5Ut
   EhdFT+u+wI7gEIL7JUqJeROP8C8al5PMr/8wcRa0+VvZeQ/MrmTeWhfi2
   W8pUVygOPrjG6Z2sOIX5Ty09KdKXdJPiKwwVNZW+px709fkJRgItpwsc8
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10369"; a="276590021"
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600"; 
   d="scan'208";a="276590021"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2022 03:10:51 -0700
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600"; 
   d="scan'208";a="722737822"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2022 03:10:48 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1ny9h7-000UXR-Gu;
	Mon, 06 Jun 2022 13:10:45 +0300
Date: Mon, 6 Jun 2022 13:10:45 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Neil Armstrong <narmstrong@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [RFC PATCH v3 6/6] iio: adc: meson_saradc: Use
 regmap_read_poll_timeout() for busy wait
Message-ID: <Yp3SpRIUFBBbNOQn@smile.fi.intel.com>
References: <20220603100004.70336-1-andriy.shevchenko@linux.intel.com>
 <20220603100004.70336-6-andriy.shevchenko@linux.intel.com>
 <CAFBinCD1cn19uf0pyUF-Af7_thP81Ehih+X4F9+rO8tzeUm+Ow@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFBinCD1cn19uf0pyUF-Af7_thP81Ehih+X4F9+rO8tzeUm+Ow@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220606_031054_469167_11C177B5 
X-CRM114-Status: GOOD (  12.50  )
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

On Sun, Jun 05, 2022 at 11:59:53PM +0200, Martin Blumenstingl wrote:
> On Fri, Jun 3, 2022 at 12:00 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > Simplify busy wait stages by using regmap_read_poll_timeout().
> >
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> 
> > v3: new patch, but RFC, not always the read_poll_timeout() can be used, would
> >     be nice to have it tested.
> and also:
> Tested-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com> # GXM VIM2

Thanks for testing!

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
