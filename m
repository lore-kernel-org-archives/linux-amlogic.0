Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F889C7EE23
	for <linux-amlogic@archiver.kernel.org>; Sun, 28 May 2023 10:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NGvSTwZzqLEleMb3MENJ83PAF8EHIIy5zjnW/L+2zz0=; b=Nz+iT0d6YZXl4j
	ZJhHHS1shQO3f8uhxoC3p5VviPoO/zGJSZef3zOfwOXFRlLDlGpIFqUH+9KKv65ohHCDoEfLjHkTe
	b/c6h1faNjfAImeIUA3FlkKk91wCehTosfs21UYJw53PR9orNEyW2b6VHK3h1X2UeWlcvO8YErna7
	pLj1bAGMoGHSL4ajMeU8x1k/o/xr3Nb/Ge/cJcOPgQ3bpSAuwxBazLvg4uD+ltewqpJHQ/4KVJuhZ
	O5fbBpl6DiyLtYnd4MBtRad7flNW/KgBsEJvFf09nCb+P1HIpmLwtQCL0WX77qWXuEOhf0U2bHZ3A
	cZK7p4Kwt3qWcgY6dIqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3E3g-007UJ8-08;
	Sun, 28 May 2023 10:55:32 +0000
Received: from mga12.intel.com ([192.55.52.136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3E3b-007UII-39;
	Sun, 28 May 2023 10:55:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685271327; x=1716807327;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7eBapmwuatu6STYCyR03YSp8av2m5gocW5nmyIw8UN4=;
  b=MkLAA19tQguLWfm3OL8TULjst3lFcrhC1I/gIw96fHtx7iaacpvLrWMM
   4KMwJYtq3d33+Aewzkzak3xSnOgZu2j0p9HkBQ8D2liZgxCbn0eJAiSLk
   TeXFrBTo34ZnOSBUX/1MCWwVz9utqKqdzHq15Xz4MRtvPcVJbHg0SD+d2
   dUuLXeQKGi7v/B1VU53GZ/PUroYU33GrENPfjgUzXxNdtqXyMP1z3U5lY
   ZgsoPE1pLfE7T00ckHpYB/Jzkc6r6iKf9lWCV7YMtRlOdWTPbKUUMO/78
   7G+Gm4KnuVv9ktWU3L+esL+gUKC9NO+h3RrNKDp4flbKZjddY+Wst1Aa0
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10723"; a="334128153"
X-IronPort-AV: E=Sophos;i="6.00,198,1681196400"; 
   d="scan'208";a="334128153"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2023 03:55:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10723"; a="656162961"
X-IronPort-AV: E=Sophos;i="6.00,198,1681196400"; 
   d="scan'208";a="656162961"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga003.jf.intel.com with ESMTP; 28 May 2023 03:55:22 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1q3E3U-000Jjw-1S;
	Sun, 28 May 2023 13:55:20 +0300
Date: Sun, 28 May 2023 13:55:20 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: George Stark <gnstark@sberdevices.ru>
Cc: jic23@kernel.org, lars@metafoo.de, neil.armstrong@linaro.org,
	khilman@baylibre.com, jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com, nuno.sa@analog.com,
	linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
	kernel@sberdevices.ru
Subject: Re: [PATCH v2] meson saradc: add iio device attrib to switch channel
 7 mux
Message-ID: <ZHMzGHsGEylDdgg7@smile.fi.intel.com>
References: <20230527214854.126517-1-gnstark@sberdevices.ru>
 <ZHMxDHPBWQOJSuaZ@smile.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZHMxDHPBWQOJSuaZ@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230528_035528_035124_BCBC5CB8 
X-CRM114-Status: UNSURE (   9.77  )
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

On Sun, May 28, 2023 at 01:46:37PM +0300, Andy Shevchenko wrote:
> On Sun, May 28, 2023 at 12:48:54AM +0300, George Stark wrote:

...

> > +static const char * const chan7_vol[] = {
> > +	"gnd",
> > +	"vdd/4",
> > +	"vdd/2",
> > +	"vdd*3/4",
> > +	"vdd",
> > +	"ch7_input",
> > +};

One more thing to discuss (Jonathan, what's your opinion?) I think the
following easier to understand and has less problematic characters in the names
(in case of sysfs direct use from shelll):

static const char * const chan7_vol[] = {
	"gnd", // alternatively GND
	"0.25vdd", // alternatively 0.25_vdd, 0.25Vdd, 0.25_Vdd
	"0.5vdd",
	"0.75vdd",
	"vdd", // Vdd
	"ch7_input",
};

That said, my personal preference:

static const char * const chan7_vol[] = {
	"GND",
	"0.25Vdd",
	"0.5Vdd",
	"0.75Vdd",
	"Vdd",
	"ch7_input",
};

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
