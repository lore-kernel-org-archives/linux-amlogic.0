Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7026C001DF
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Jul 2023 12:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eJpD06SCwPtx2TZNUGnurSykqP9fH9JYeHmAeNxUfFY=; b=rFd2QxgXdZgaUE
	p3VdZIua0I4G054vAUL2J+SY+5+fIQ6Y9SSBx1sqxrJdGfQ23/yjAP3VtVA+lbaqo9qUi6LTGZo33
	wHXOw6741p4BFgeaCgrTufmqBBWOMHOf+hHNfsCkpBNPi3JJYBP9SBjVutpwLNDOta2wLIYs1sP83
	WAdWvsDTAbeyOKPl7OdTyAknFHqoG5IPCgG5BV4ieG8IYIa9Vrbf9cDbqgDHCMVbLbRODwwP71jMg
	hnAxbi2XtU37mHtuwXyWljF7A8cg8bcbsEAdEz+KgjY5OiBNqbfBcx0Htil72hnv25Hxg4qOh8iDY
	SZhERTSO8q1QdSNRjFwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJvBo-003Bmz-2H;
	Thu, 13 Jul 2023 12:12:56 +0000
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJvBk-003BiT-10;
	Thu, 13 Jul 2023 12:12:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689250372; x=1720786372;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XQH1AoepLMoGdYMD+9N7gm+ToR09aJBn096cGLdxFIY=;
  b=YqIYIImF8LUmxVlgBLVQkwtGVq47vEd6MwDGxS5R6c2yciD+FcR25cEO
   E2TLUwOsazjeNe7q3y4dnCkaRmbPQBDwO3LjSXIhat87fHpSVy9n4vWeo
   gw17A/Fn833+ByLkODXdkbXAbQLfDQOM/1e8cJgtpgaOUWR4k2eonmkoY
   +szLf6xP1OnfeudBn3G1Dq2IlW2ESPD4vonJToitN3ol85QiERIuKg8fZ
   VU29jn0ldGozJXauCIwhxcTjjcXBeUtwJinDh4hqpfUW3Sns3+ZLkI/rh
   Xr2lSw8OAeq10GCR/DwXzSqSechjk8OQmJSDBg4iQRWhcHcIeo5hjActR
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="428914955"
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="428914955"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2023 05:12:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="968596930"
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="968596930"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga006.fm.intel.com with ESMTP; 13 Jul 2023 05:12:44 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qJvBb-002ONc-02;
	Thu, 13 Jul 2023 15:12:43 +0300
Date: Thu, 13 Jul 2023 15:12:42 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: George Stark <gnstark@sberdevices.ru>
Cc: jic23@kernel.org, lars@metafoo.de, neil.armstrong@linaro.org,
	khilman@baylibre.com, jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com, nuno.sa@analog.com,
	linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
	kernel@sberdevices.ru
Subject: Re: [PATCH v6 0/6] meson saradc: add iio channels to read channel 7
 mux inputs
Message-ID: <ZK/qOi67aacfMcl8@smile.fi.intel.com>
References: <20230712231157.261245-1-gnstark@sberdevices.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230712231157.261245-1-gnstark@sberdevices.ru>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_051252_393262_54E859D2 
X-CRM114-Status: UNSURE (   5.94  )
X-CRM114-Notice: Please train this message.
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

On Thu, Jul 13, 2023 at 02:10:41AM +0300, George Stark wrote:

> v5->v6:

We haven't settled down the things in v5, hence NAK to v6, sorry.
You have to pay respect to people who invested time in your work.
I hope you are going to answer to my questions and depending on
that we may see v7 in a better shape.

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
