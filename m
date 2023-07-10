Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6480EB64D9
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Jul 2023 09:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DG4nYojLhuHOoFAI0GFigkGOt4A09AVHMv4n9UbJ+cY=; b=itQZtd9nqX93Ll
	EyQQ8qlFHiLVei+F8bLC8opc1FJodKqkyFqBhn8/lJ1/Y2WtRjlpTOZu7mBGSO4LK2+hOQJsNTBsD
	gi1fz9xXdmcgOms3XKrtP6NmCZTbWVll96CzGom5YyFbs14PWX3jpLsVdCU+0diYlA1S/RbvHAx86
	NISTvS961lq+/W3WqYb/bCJ8/Y7//h+nLBSRbv52zCEm4QiKKX2bBJvLyo5qfHI2F3rTjSr9ejgFm
	hNGmK2Sg4+ad/vrwoP3LOOUl0oMhnkEVwywC5dueRabp3lgwPUXNa/PzqdOoBpj4PoSMKKBb3NR1j
	z4Z0zA9g6gakokhoR6Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qInFr-00B19w-22;
	Mon, 10 Jul 2023 09:32:27 +0000
Received: from mga01.intel.com ([192.55.52.88])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qInFo-00B180-0Y;
	Mon, 10 Jul 2023 09:32:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688981544; x=1720517544;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ToE9U1OfjykExkygbmbaQkioLW5ROLoBvtmYdNCPghI=;
  b=Fj97Oyj0WiIDngfw6seQoZDVDmtkS4lY1KxACkjCVypmi+BE4jC3R85/
   OjdYsPfpbow+3PQ/WM66+Egnz/OQx/dhFNBAFRezGxxWJ+nKbPrFcSDPP
   ZZTODO5DDaWaLcuuSypYIbKFczx19Dua09QGVPvsQJNZWa+NcGUeEcmWW
   f2Qce27RNb3uRnwfdbRQ2rgjyx5cD6wvMg6VBqKUM8CeD+h8UWOmlXqeO
   q/G6NR93MVQrlBkgZ82oXUVeACaB0ZTQLxo6hVXFssjealDMlmkySKjK9
   W5ZkJhPca8kyWU7YEHZFU/HWPTQXMWk8TZDUhTrRya8Jju0D026Of9oKl
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="395079687"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="395079687"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2023 02:32:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="755937676"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="755937676"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga001.jf.intel.com with ESMTP; 10 Jul 2023 02:32:19 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qInFi-001VwO-08;
	Mon, 10 Jul 2023 12:32:18 +0300
Date: Mon, 10 Jul 2023 12:32:17 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: George Stark <gnstark@sberdevices.ru>
Cc: jic23@kernel.org, lars@metafoo.de, neil.armstrong@linaro.org,
	khilman@baylibre.com, jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com, nuno.sa@analog.com,
	linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
	kernel@sberdevices.ru
Subject: Re: [PATCH v4 6/6] iio: adc: meson: support reading from channel 7
 mux inputs
Message-ID: <ZKvQIWCc3vMoA80N@smile.fi.intel.com>
References: <20230707153322.114302-1-gnstark@sberdevices.ru>
 <20230707153322.114302-7-gnstark@sberdevices.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230707153322.114302-7-gnstark@sberdevices.ru>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_023224_229932_4733B615 
X-CRM114-Status: GOOD (  10.16  )
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

On Fri, Jul 07, 2023 at 06:27:43PM +0300, George Stark wrote:
> Add iio channel for every channel 7 mux input.

IIO

"...for each muxed input of the channel 7."

> Meson saradc channel 7 is connected to a mux that can switch channel
> input to well-known sources like Vdd, GND and several Vdd dividers.

Make this sentence to be the first in the commit message.

"can switch input" (again, avoid tautology).

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
