Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 067C4EB64DD
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Jul 2023 10:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x43sv7xCLjX8K10A8ioveQ+EVokxBX4VYD9G1efmFII=; b=C3Sf1rOMaSB2NB
	2tlKPjgQ3bk9H8/wyK5fptzjGd4S8bOTV3C+RpKfd/IjQR+yBsQ7K+F1zBjrj3orhq3RIv54e099k
	xrJV+aJ4HT4qUYYOHWuqyMhzavySWnR42VlIdYNvQd2HpXqinhv8k59XloPkd8IsfGio6i0X98aAi
	5h6q4AqOFqMnCbJBbtVqzt4Znbl7/UFvAoG+XNPVRUxjTd2ymfAVNZekoj8TsbSddRDgziGIj0tOh
	t/n/gtlDSWOOod9ExHfJmd0RunAgHCqDcgi1Lw/LDYCzBYVTJx1mJagAya0n5HEC6toMQTkBLMh/Q
	YipUhifJiJfDUwjOsUyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMnc9-00DobH-0Q;
	Fri, 21 Jul 2023 10:44:01 +0000
Received: from mga14.intel.com ([192.55.52.115])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMnc6-00DoZE-0n;
	Fri, 21 Jul 2023 10:43:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689936238; x=1721472238;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=k8dWWqAowhw8YU6X5EPvPOwZl5ALbJM2FyF0JGRJ1m0=;
  b=d8pHS+G6jwM64WaWHUw1aKa4gsDg2fQZnbP1f6pcRJdYjsPcqpH49KAK
   3dh6yVyhI2jTzDh7OuBwNrqsJs+YlPa8RORumVBtg9xfDs3HdhgnUkb1U
   pM5lO4EoKbPYgZBd0/EJdY4/Y/WHJHpbBtqMje+WSK8B085mPDLHYz8oT
   langdzf6FciT+BGDSoVsVVaMLcPgdBHajHEAkFAV1OAR9uq0Lvm2B+S0b
   17izS9Lb3k1Xzh/LPWmC8YskkNKzpLR9OfLNJOxJyFt1ICY/cHzjFq3oe
   20z5uDAQvx77A11dWs3XMHf9m+Ulp3wBAXMgHmEWfDnO5zGq84DI8RdjZ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="367032478"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; 
   d="scan'208";a="367032478"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2023 03:43:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="838511489"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; 
   d="scan'208";a="838511489"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP; 21 Jul 2023 03:43:53 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qMnbz-000aE3-0v;
	Fri, 21 Jul 2023 13:43:51 +0300
Date: Fri, 21 Jul 2023 13:43:51 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: George Stark <gnstark@sberdevices.ru>
Cc: jic23@kernel.org, lars@metafoo.de, neil.armstrong@linaro.org,
	khilman@baylibre.com, jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com, nuno.sa@analog.com,
	linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
	kernel@sberdevices.ru
Subject: Re: [PATCH v2 2/2] iio: adc: meson: improve error logging at probe
 stage
Message-ID: <ZLphZzO20QW+t1m/@smile.fi.intel.com>
References: <20230721102413.255726-1-gnstark@sberdevices.ru>
 <20230721102413.255726-3-gnstark@sberdevices.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230721102413.255726-3-gnstark@sberdevices.ru>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_034358_359168_19AC5365 
X-CRM114-Status: UNSURE (   8.30  )
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

On Fri, Jul 21, 2023 at 01:23:09PM +0300, George Stark wrote:
> Add log messages for errors that may occur at probe stage

the probe

stage.

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
