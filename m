Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17343EB64D9
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Jul 2023 15:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YVGGkSKVrqSA5wBRo0Aabm2p3thmJXPPYEwGnnn7OtI=; b=z4LPf5IBG4sGJr
	ArgpJUbqbj82gFYsQCey1Tb7bDMonl42T5xhPgUEUVImw2Z9Zsx1xTOjtEtJjDJXanm23DDZwJsV3
	sbbidUBCOodHxPoc1G8tTUnmTxYqv57baEDBHRdpRBVJCGEST2Ju1EypcRFCKYFsr0jks41Fg7YEF
	RdsDIhCwvCY8DE8X48y3rQGppiFqwadqOLDivoPwYsXDY4ezgL6B11RGy32e/hJLRVL4m+HsWokEn
	iiypMBm2Q19YmuaVSAaRdWyye99Y4s0dpH4xPQSIuTqqCC0GH4I8oVTvj+jv5hHhV3crRgb/idyRj
	IP2R6xnY4kUWtJT2+aQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJbjK-000Lce-2M;
	Wed, 12 Jul 2023 15:26:14 +0000
Received: from mga12.intel.com ([192.55.52.136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJbjH-000LbD-2U;
	Wed, 12 Jul 2023 15:26:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689175571; x=1720711571;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=opv4vWR11AnjxQzJ5kswyd24sS6ZcKGbyA2QSSHiKdI=;
  b=P+CXItIcykdL+3BMBKgCiOUb0iq3xCag1S6g3Z5gJLdCZWJWOZlezF8/
   0t6P9tDLHIetTZxGxDHUa1vQJVCjKoCzwC2zSdwz9UlzTVtNAOyZ/4jvy
   Ih2/sreAmCcqIxQnu0YPrLFmhZr4k/OHer7bnt6Whl1Senl8nc+zI0VI6
   lTgR1j/Au9KlsTO0mhnknXrmCznH80ggDe1hYCMXug01ElIsATOnsgSy8
   xJmGQR8z0jOhMUbQCX2g/+Y3J036jZDxKmh7wN02NYD9r2xKsbGyRXycy
   RQGaqH73TTdSAXhh/tuDAWnwtrMFaG3rgu6/PAaAP+yM26wiVcc3CnzEW
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="344519104"
X-IronPort-AV: E=Sophos;i="6.01,200,1684825200"; 
   d="scan'208";a="344519104"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2023 08:26:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="791662575"
X-IronPort-AV: E=Sophos;i="6.01,200,1684825200"; 
   d="scan'208";a="791662575"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga004.fm.intel.com with ESMTP; 12 Jul 2023 08:26:02 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qJbj6-002ADD-0r;
	Wed, 12 Jul 2023 18:26:00 +0300
Date: Wed, 12 Jul 2023 18:26:00 +0300
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
Message-ID: <ZK7GCAgA1gljrxyl@smile.fi.intel.com>
References: <20230711200141.239025-1-gnstark@sberdevices.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230711200141.239025-1-gnstark@sberdevices.ru>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_082611_839720_CFDAADFD 
X-CRM114-Status: UNSURE (   7.74  )
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

On Tue, Jul 11, 2023 at 11:00:16PM +0300, George Stark wrote:
> Changelog:

I gave you a tag, any reason why you haven't applied it to your patches?

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
