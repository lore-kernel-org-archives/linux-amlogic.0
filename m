Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1F91EB64DC
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Jul 2023 10:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n/eQ1B9bPdtPrbU9mda6Mcob9AXSbzdRkG+cb0T4tzk=; b=L0tLsf67SgRTqN
	xXLhmv330b3BG1Gcj5ESKr9zUGyk64hDJSJv6gjwaNmJT4COcnK1HsO4jhVX1ZgggNECn2W82L2K6
	G0k0v4Rne2uB4iremRxNWqHih++mdoESZCoWI3hXEaC7uA1JlBLKQQHT4FWEjISlJ/zVXgF7pnRCz
	/uBCRvoYV/bK0d1Px15NWlhlMXBrrJHPBLHLAYQm/MRuSoIiVc1D0lBhJryohFcPEoqxOrLaEjcVh
	rXRcTgr0iVLuJhTfOxqj+4G2LlADwq6c8J9VTmnmNj1fKC9WhM3TQP4klIhoktMiKYasUpJZWNcw9
	uIRm9UxeNBGWQKvlLFWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLL3Z-003iQS-2Z;
	Mon, 17 Jul 2023 10:02:17 +0000
Received: from mga04.intel.com ([192.55.52.120])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLL2b-003iA3-0U;
	Mon, 17 Jul 2023 10:01:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689588077; x=1721124077;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JMM3xupH1hI/uzcIq/Bseq5hzkwtbNzgO0JZ+lTjb3Y=;
  b=aEctZuzbR6wLF60QKi8irPWYBDvNCRpkHkoqd/zXnoinmh2yAOfjnOME
   T/+5SMx5yUjuc2SthMfyJ9o/paahL24UWOih4gWLEb2geGRPnM4KjZwzD
   enU3aKZgVJAtjT1GiesjKA5WnD6pRUNLRAyW2JN0eZjcTsZtFCOTNGc1B
   wxB1uQsw3CzWEqyfIVaEQt1XjHKwc2yVABc5f85P1UpznpSYUVlNqxL5a
   vMiFAo/Kh3/T3/6ysjNJBrvEYgZ1mKguUq5pALYAQ/WpV3G8oRg2kQ+Jn
   0hSCvXgERjglu6XtDdDD6kHp/ZNiq1TkvzpMarWUe6d88Pu1FnQ2QzMAZ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10773"; a="364767203"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="364767203"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2023 03:01:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10773"; a="673491098"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="673491098"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga003.jf.intel.com with ESMTP; 17 Jul 2023 03:01:12 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qLL2T-008WsP-2y;
	Mon, 17 Jul 2023 13:01:09 +0300
Date: Mon, 17 Jul 2023 13:01:09 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: George Stark <gnstark@sberdevices.ru>
Cc: Jonathan Cameron <jic23@kernel.org>, lars@metafoo.de,
	neil.armstrong@linaro.org, khilman@baylibre.com,
	jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
	nuno.sa@analog.com, linux-iio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org, kernel@sberdevices.ru
Subject: Re: [PATCH v1 0/3] iio: adc: meson: tune init sequence
Message-ID: <ZLURZWPkmP6aKDOZ@smile.fi.intel.com>
References: <20230715110654.6035-1-gnstark@sberdevices.ru>
 <20230716171134.43d05c45@jic23-huawei>
 <a172c764-1eef-835f-f237-8f78b4c6e877@sberdevices.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a172c764-1eef-835f-f237-8f78b4c6e877@sberdevices.ru>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230717_030117_223771_5A8746E2 
X-CRM114-Status: GOOD (  11.54  )
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

On Mon, Jul 17, 2023 at 12:41:29PM +0300, George Stark wrote:
> On 7/16/23 19:11, Jonathan Cameron wrote:
> > On Sat, 15 Jul 2023 14:05:57 +0300
> > George Stark <gnstark@sberdevices.ru> wrote:

...

> > These look fine to me, but I'd like them to sit on list a little while
> > on off chance anyone else has feedback on them.
> 
> I understand. I'd resend the patches in a week or more if there's no
> feedback.

There is no need to resend as long as they are available via lore.kernel.org
mail archives.

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
