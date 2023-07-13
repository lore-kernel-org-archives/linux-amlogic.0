Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFDC0EB64DD
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Jul 2023 12:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IMHa/Bh0Kkuxa06Rev16TA+aIHTyli5z8bVz5W+vGbk=; b=VP0yIT1CaaxjiE
	RUrjHrTMqiShcbSEuSXTr0YBGWaFWJdKPl5gp/Kto+tamHV+dw3qvnHF3+B5/AzlivvCFLuoj5cs8
	s+chkyViHWogrrgQao2CQD2UYNGVVZD6HfsywnNvP/EOiPGXy5Gl3rtfDOkKp+Pbm1lga/NHprl7n
	EdwhRtv/5nEeUVg0RAM7037Xn7OW61AWHOZhulOLRrxXUhMbVi52niXYh6nz1DZpTTJ2J18lvjoaT
	G/ryY+iJnBlYpMRWvWLgH2WxEwL3ZbeB6DyyTtTWGLpDOSqJrg8gkKQDYz3VUQRaKdls0B0wUcaXi
	mKhdWR5qXVdD53pNtoBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJv8F-003BHJ-13;
	Thu, 13 Jul 2023 12:09:15 +0000
Received: from mga12.intel.com ([192.55.52.136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJv88-003BFL-1j;
	Thu, 13 Jul 2023 12:09:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689250148; x=1720786148;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Bb0TagrB9pGtt34RXfKQh8x3qUDQ2DG/XKEjSn6IR8U=;
  b=cTLVkOUpC9kBwLs5sTzgSH3FUIkmQnu577T1/dOvHTKd5Qjjm1mXb8cj
   21CQybLWS4fbwD+2teUpyYqOMYSLOks/042c3QhrERaVerjrSHg3+M1eU
   w8lc50GT7pc+h9jBlFDMJ7sVCA9zPHS2v1yL79BNy6N1pe6LTooxIjTAh
   IjnZoYCXC6yJtvFCwez9AoncIOJ9et3/3XrZvLZbIqwU+awoF225zkikX
   TUEsIQo/26DU17bSpWdoL5h8MFC9/AF4Ri9Q1G4U3L+fR50cx4r5BZoRW
   vvOcZAi9phGnl/omaMhPUwKOjHRNr+mimyzdCj9+7SRo52na141/vCSfb
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="344758537"
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="344758537"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2023 05:08:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="787418770"
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="787418770"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga008.fm.intel.com with ESMTP; 13 Jul 2023 05:08:23 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qJv7N-002OKz-0v;
	Thu, 13 Jul 2023 15:08:21 +0300
Date: Thu, 13 Jul 2023 15:08:21 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: George Stark <gnstark@sberdevices.ru>
Cc: jic23@kernel.org, lars@metafoo.de, neil.armstrong@linaro.org,
	khilman@baylibre.com, jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com, nuno.sa@analog.com,
	linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
	kernel@sberdevices.ru
Subject: Re: [PATCH v5 0/6] iio: adc: meson: add iio channels to read channel
 7 mux inputs
Message-ID: <ZK/pNQcT6CrZWIzM@smile.fi.intel.com>
References: <20230711200141.239025-1-gnstark@sberdevices.ru>
 <ZK7GCAgA1gljrxyl@smile.fi.intel.com>
 <fe1b4eb7-e137-fe43-44cb-8de597fe00e4@sberdevices.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fe1b4eb7-e137-fe43-44cb-8de597fe00e4@sberdevices.ru>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_050909_023757_1CAA1225 
X-CRM114-Status: GOOD (  10.13  )
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

On Thu, Jul 13, 2023 at 02:04:05AM +0300, George Stark wrote:
> Hello Andy
> 
> On 7/12/23 18:26, Andy Shevchenko wrote:
> > On Tue, Jul 11, 2023 at 11:00:16PM +0300, George Stark wrote:
> > > Changelog:
> > 
> > I gave you a tag, any reason why you haven't applied it to your patches?
> 
> if you're talking about patch 6 commit message - yes, I missed the last line
> in your letter, I'll fix it.

I believe I answered to the cover letter [1], which means that it applies to
the entire series. If you don't include tag of the reviewer(s) who spent time
on your code, you have to well justify WHY you did so.

[1]: https://lore.kernel.org/lkml/ZKvQaoFxO5gpAFdM@smile.fi.intel.com/

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
