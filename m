Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B859C433F5
	for <linux-amlogic@archiver.kernel.org>; Wed,  1 Jun 2022 10:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Eg/Ae7mT9QKMzdTIY2MmXyy10VVthM+af0BMFPvehVE=; b=ZiY4mtAeCtzWbs
	PyPE/G5IqNIyB7EUrQppc0dZ6spSSi0oqUmzMCWhkqVHEb6zVvghJyYurbSaLIXCQ1Rjsvz6IZioE
	KEtOZ4AOukvcwf/v9r8+wx+ohe9CVzmEAc6Q6sWt7qL74D8W57FmeWZ4OOh/wjmadZl5+K7uw3uSS
	wzu8Tcs+cJdo74bMaabcxTxBUf3iqM14kOOGkMXVszNF8qpi+PaQvzqQJG670DQ3pO0FF0ngu5Ngz
	mWjmD+vnQ9tcsUcX0XiZTQfOd8c5Y2faxTsx48ULLsOdmbU4dSlGXeN6+e5yw5UFqtnzlJtY14cgT
	4hDFabXLmdi7xxerUA1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwLhL-00FLgU-1V; Wed, 01 Jun 2022 10:35:31 +0000
Received: from mga17.intel.com ([192.55.52.151])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwLcr-00FJZx-N0; Wed, 01 Jun 2022 10:30:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654079453; x=1685615453;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qD5rv9i5Du7irA/swnuN3jwbdILA1dofh7zhQ5sAHp8=;
  b=GDmkFpwOm67tjM8n28StNVm6x6vprCMpZeaCIHgwR8mJU7ezet7GcjkD
   YVdHAxeaGUSMhYCcMRFPW0TEvFYCm11InDQFztNUpBWA17vdEHQF/eBX3
   zJ0YAsQe67KM6Wa5TEev9Q9ozesadN54lwK1Q5Y0EZQNAxI/yWTb6X+xn
   bslHc0O+p0oiL/xzAwY8FAj6ycyyrs0g+ywh8QkcHXYKvnvtF1cKcxIot
   iHKSNiZC6n8hbsacwqglCGPZfRdmDKeiERhEgwbiuyhGWy+hAsbSFbyJX
   7xhVMKsT+U8NfzLWbtGAsNrn7MSqEQ3ffnFnt6sx0wJs6b/dv3OTfajJ/
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10364"; a="256021895"
X-IronPort-AV: E=Sophos;i="5.91,268,1647327600"; 
   d="scan'208";a="256021895"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2022 03:30:37 -0700
X-IronPort-AV: E=Sophos;i="5.91,268,1647327600"; 
   d="scan'208";a="530002767"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2022 03:30:34 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1nwLcV-000QYP-MW;
	Wed, 01 Jun 2022 13:30:31 +0300
Date: Wed, 1 Jun 2022 13:30:31 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Neil Armstrong <narmstrong@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH v1 3/3] iio: adc: meson_saradc: Use temporary variable
 for struct device
Message-ID: <Ypc/x2G+jgHvBjLY@smile.fi.intel.com>
References: <20220531211842.71998-1-andriy.shevchenko@linux.intel.com>
 <20220531211842.71998-3-andriy.shevchenko@linux.intel.com>
 <CAFBinCDf4UfEPFV4_Qf3m16DE-NzNUk_ZVcHZhgxVvn_pokdgw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFBinCDf4UfEPFV4_Qf3m16DE-NzNUk_ZVcHZhgxVvn_pokdgw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_033053_816251_79563AA8 
X-CRM114-Status: GOOD (  18.82  )
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

On Tue, May 31, 2022 at 11:47:50PM +0200, Martin Blumenstingl wrote:
> On Tue, May 31, 2022 at 11:18 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> [...]
> > @@ -650,11 +648,12 @@ static int meson_sar_adc_clk_init(struct iio_dev *indio_dev,
> >                                   void __iomem *base)
> >  {
> >         struct meson_sar_adc_priv *priv = iio_priv(indio_dev);
> > +       struct device *idev = &indio_dev->dev;
> > +       struct device *dev = dev->parent;
> It looks like this should read:
>     struct device *dev = idev->parent;

Oops, indeed.

> That said, I think this kind of typo is very easy with the current
> naming schema.
> It's been a while since I looked at other drivers but maybe the IIO
> maintainers have some recommendations for us (which would apply to
> multiple IIO drivers, not just meson_saradc).
> For example: I am not sure if iio_{err,warn} functions (which take a
> struct iio_dev pointer) have been proposed/discussed before. I think
> they could be useful for other drivers as well.

Looking deeper into this example, I think the IIO dev usage might be wrong
in the first place, but since there are managed resources attached, I dunno
if it's the way to go. Let's wait for maintainers to chime in.


-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
