Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E09BEEB64D9
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Jul 2023 09:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ixFDKRye6KhGqxKBIdPoG69MptvtXNFO84FGhyONSIw=; b=Rsh07FqExRxQWi
	KXPnyRW7/5YhoTk45Lrh+1uaSI7xU48XK/C1Ysh6ec46qF6R1A6GsrNtGHS/B09f8m9mGqf2/m6nE
	CQWyQgabo0j29EtWuYd4w61WpzXMcO9yEFesraonL43mIJ0gJQkuqLzS6PcyKiZdwlh9DbMF0Wepz
	QUMGo8M9bmGLKf+O1CscWyguXOEcu0y03P6by5HOJbYj3XjVAuY3m8nQ04xzeI+qSraOR5IgjyCwW
	YlmmcQsO1lFblABrG86q36KjKPbFesO7N7eEViOyYq9FtSBbBx1oEJ3NclRX1Yu7AEjhCIDO41yYM
	Q42gOGYy1YIV5hCi0sIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qInH2-00B1o4-0u;
	Mon, 10 Jul 2023 09:33:40 +0000
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qInGz-00B1lw-0f;
	Mon, 10 Jul 2023 09:33:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688981617; x=1720517617;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GW+b4HfFoMEuN/QF1SrX4sd509xB7kt59hdOjhlP1FA=;
  b=cKSCVWAyK3vTrYZQOBA/wGlKtpjKO5Z8u89r5z5yfvhI0Et9tPKxzTrb
   Z+NiMHPy6UK/ajfHQp1XF9GI55c6dtjwLblKF/JfUxw29p+VSM08GODyz
   cXkVLM4ll8jCAqVLxe/0WeXi/9SnpZyHUeY0k/3Fxk9JsJ6IDL/9ad/qO
   srJm+JtftS80S/hBMe7uQR5w2BP7kpkfEVQM9tc2+DJk8YUgt9KdtZMCk
   mSbrnD2qJ2lkbruKbO3+lwS9KkZKJLBMbJpXaM5KGo1VMT/N7rrNYXkXG
   Bc1w5RdddXRvNJ2uWe4qu3NkP5RBUQpmmkNaA1DN/UxCBwF7VFdk8YE50
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="427991700"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="427991700"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2023 02:33:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="810753577"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="810753577"
Received: from smile.fi.intel.com ([10.237.72.54])
  by FMSMGA003.fm.intel.com with ESMTP; 10 Jul 2023 02:33:32 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qInGt-001Vxx-0L;
	Mon, 10 Jul 2023 12:33:31 +0300
Date: Mon, 10 Jul 2023 12:33:30 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: George Stark <gnstark@sberdevices.ru>, lars@metafoo.de,
	neil.armstrong@linaro.org, khilman@baylibre.com,
	jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
	nuno.sa@analog.com, linux-iio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org, kernel@sberdevices.ru
Subject: Re: [PATCH v4 0/6] iio: adc: meson: add iio channels to read channel
 7 mux inputs
Message-ID: <ZKvQaoFxO5gpAFdM@smile.fi.intel.com>
References: <20230707153322.114302-1-gnstark@sberdevices.ru>
 <20230708170410.0885b8e4@jic23-huawei>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230708170410.0885b8e4@jic23-huawei>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_023337_280509_A43A3A3B 
X-CRM114-Status: GOOD (  10.72  )
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

On Sat, Jul 08, 2023 at 05:04:10PM +0100, Jonathan Cameron wrote:
> On Fri, 7 Jul 2023 18:27:37 +0300
> George Stark <gnstark@sberdevices.ru> wrote:
> 
> > From: George Stark <GNStark@sberdevices.ru>
> 
> 
> All looks fine to me.  However, given earlier versions had various other reviewers
> I'd like to leave it on list a little longer.

Code wise
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

The commit messages have to be improved, but hey, I'm not a native speaker, so
I assume that Jonathan can help me with that and correct me if required :-)

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
