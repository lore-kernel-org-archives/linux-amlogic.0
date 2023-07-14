Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86102EB64DA
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Jul 2023 07:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YX+2ojcMmQi2SwspbL40wSSFq9FfwkJ1YKR87qiv7tk=; b=zaYlPZblEH+TFp
	ZlbyFFGcv7No4j/92kLNzSFc0NamSXspOSFVBvocjXjRI4M57tBbUsCG6ywm/9xnkftSs1vDtibSi
	RxS4kcd/Qwwqcrtq+5JAyUqqXSZecC9e46zfumPc/CJHBNT3NF2NhXDDq4iyXahC5cunIpsXi3Ano
	37ZToR6vNaxyNRjHVV5oXS5ICuD5qDmHfIaRlvTh7nL7YmCjK7Qos2aogrt0NK+MP0uKdJry9LzEE
	M51pStNOV/v7vvGRO1wyyLovybeJ1CoBpttoNZYIX5qPn7VpVMDYXKnPCgZB6LvTV+uC84E0z24Ln
	Rls2VKGojSRHim/5T34w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKDVZ-005MB2-0L;
	Fri, 14 Jul 2023 07:46:33 +0000
Received: from mga07.intel.com ([134.134.136.100])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKDVV-005M9S-2p;
	Fri, 14 Jul 2023 07:46:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689320789; x=1720856789;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CHvxp8kAGhqGFyc+K55VoEx9FObk2JSKYuF9UANj9Z0=;
  b=l9NuDEd0yNCWEj6G7fRcnY8M+NzPTLKv/xhivMLNxE6aS7RdcHPZpiHj
   ja6WTlqxfCvyXHN5IagUBfAFEX/eiK4nA/9xMO0c4O1VXw2jWs1XO/nde
   4M/HnZjycv5MVIGRUp/hwNcez3dTPjUo+awfPWStF9mDCagVnXycnM7/Y
   5IlnE9HmxtVKNDIdJs9T2xkzvIks/yVSnoRhDw8tbQRqiZSEYpI0NXlo0
   blBdaJNS41dou1JsZyIQTfBLKaWSXTvZlJdEbp9GxKI6htHRVqQ1nHORv
   jQm+oyKPgONYm+Bb/O2bepmHzmP3VgnW6uqyu83QH1cahf0KxVQ517Y9E
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="431586953"
X-IronPort-AV: E=Sophos;i="6.01,204,1684825200"; 
   d="scan'208";a="431586953"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2023 00:46:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="968908750"
X-IronPort-AV: E=Sophos;i="6.01,204,1684825200"; 
   d="scan'208";a="968908750"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga006.fm.intel.com with ESMTP; 14 Jul 2023 00:46:05 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qKDV5-002aw9-0P;
	Fri, 14 Jul 2023 10:46:03 +0300
Date: Fri, 14 Jul 2023 10:46:02 +0300
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
Message-ID: <ZLD9OooZZ1FZg/SL@smile.fi.intel.com>
References: <20230711200141.239025-1-gnstark@sberdevices.ru>
 <ZK7GCAgA1gljrxyl@smile.fi.intel.com>
 <fe1b4eb7-e137-fe43-44cb-8de597fe00e4@sberdevices.ru>
 <ZK/pNQcT6CrZWIzM@smile.fi.intel.com>
 <df30fcca-8f7e-bfb2-be92-0eb76726d3e7@sberdevices.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <df30fcca-8f7e-bfb2-be92-0eb76726d3e7@sberdevices.ru>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230714_004629_964004_0D924FA6 
X-CRM114-Status: GOOD (  17.51  )
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

On Fri, Jul 14, 2023 at 02:11:19AM +0300, George Stark wrote:
> On 7/13/23 15:08, Andy Shevchenko wrote:
> > On Thu, Jul 13, 2023 at 02:04:05AM +0300, George Stark wrote:
> > > On 7/12/23 18:26, Andy Shevchenko wrote:
> > > > On Tue, Jul 11, 2023 at 11:00:16PM +0300, George Stark wrote:
> > > > 
> > > > I gave you a tag, any reason why you haven't applied it to your patches?
> > > 
> > > if you're talking about patch 6 commit message - yes, I missed the last line
> > > in your letter, I'll fix it.
> > 
> > I believe I answered to the cover letter [1], which means that it applies to
> > the entire series. If you don't include tag of the reviewer(s) who spent time
> > on your code, you have to well justify WHY you did so.
> > 
> > [1]: https://lore.kernel.org/lkml/ZKvQaoFxO5gpAFdM@smile.fi.intel.com/
> 
> Hello Andy
> 
> I think I've understood at last what you meant by "not applied tag". I'm not
> experienced kernel contributor yet and believed that RvBs and Acks are added
> by one who merges patches or by some kind of magic :)

If you (not a maintainer) respin the series, it's your responsibility to add /
drop / update tags. And hence to explain any modifications to that.

> Of course I'll add the tag, I missed it not on purpose.
> Thank you very much for help and your work for the common good.

No problem, as I said, I'm in favour of your good contribution,
just some processing issues which can be easily fixed.

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
