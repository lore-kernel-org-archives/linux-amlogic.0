Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BF52EB64D7
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Jun 2023 14:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1IgLTAh8t/GvSMfHJmtVm5PbPd+r85unJNKrXvYlj8Y=; b=0ZdEVYU4BSB2Pu
	5F6otJKOt4FbKB52zi1cfdh6wTiRPmEL+unBsCJ2jq2CB/mOW3wbwNnyLNrJ5ETMvSzXOdIwMHqou
	V7dNngcFuUy8drbNM7bfV8ajzWG7zfaxo7WMpXw/7MhvZB5A/jhS5HJWMN5RlGD7X10N+PuZtmAK5
	3M6cNH+k3IwoUs2o+2JYBJdgVWF2dzgxxZNYOvsJWY6/nxveaLctrsPB14K21xfp/MpArqMT9aje/
	UFs6f6S7OrXaZAtjiLcIMDytZBhScoYFhyQRRH2r51ukqhf5kH7epXC1jcdoBjyWte7Pv9gYHpg5I
	i1mE5gu/M10CHHwrS76Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qByVe-00EllF-0e;
	Wed, 21 Jun 2023 14:08:34 +0000
Received: from mga03.intel.com ([134.134.136.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qByVb-00EliF-0k;
	Wed, 21 Jun 2023 14:08:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687356511; x=1718892511;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TZipVQx34qmoVG1MjtaxYWtXx0xWNWvBS+tqILr8eUs=;
  b=FMfycsPUx4PpgYK77c5X/uOqZSI47N3zLdXIYE+rkshbsPc6Z+hCnQBQ
   HJUStNbqT1LjZ5cPF2kIiA9l7vgG/UWV2LTRxBxPlM4wwirnmVLtdiGE3
   O4N/QsDa9t0opbvpJwz/jYET0GI/0M+MfYgzxqls/Bwu0WPAnwZcosHsF
   YyiZzLLWuNZE75g1yyV9NbRBAgbVst1m0hEwp0gRAlzLy2dHZ7BK6Wlb7
   y451mj6U8K6A5T8Xt99IrVpVWobo9ebTvvPg1xDJriflmpIL4pFoc66Fx
   Os33cupOyiPQ97hxtWxQkHyUZwIvjVGC1zYSKosXQA1aJZE5XkaWh1VRR
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="363603524"
X-IronPort-AV: E=Sophos;i="6.00,260,1681196400"; 
   d="scan'208";a="363603524"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2023 07:08:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="744185238"
X-IronPort-AV: E=Sophos;i="6.00,260,1681196400"; 
   d="scan'208";a="744185238"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga008.jf.intel.com with ESMTP; 21 Jun 2023 07:08:08 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qByVC-005Vvy-1J;
	Wed, 21 Jun 2023 17:08:06 +0300
Date: Wed, 21 Jun 2023 17:08:06 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: George Stark <gnstark@sberdevices.ru>
Cc: jic23@kernel.org, lars@metafoo.de, neil.armstrong@linaro.org,
	khilman@baylibre.com, jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com, nuno.sa@analog.com,
	linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
	kernel@sberdevices.ru
Subject: Re: [PATCH v1 2/3] meson saradc: add channel labels
Message-ID: <ZJMERuXDtKi4wjR/@smile.fi.intel.com>
References: <20230621062715.455652-1-gnstark@sberdevices.ru>
 <20230621062715.455652-3-gnstark@sberdevices.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230621062715.455652-3-gnstark@sberdevices.ru>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230621_070831_406603_3B7EA82E 
X-CRM114-Status: UNSURE (   6.71  )
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

On Wed, Jun 21, 2023 at 09:26:09AM +0300, George Stark wrote:
> patch adds channel attribute 'label' with channel name

Please update commit message in accordance with English grammar and
Submitting Patches document (e.g. imperative mode should be used).

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
