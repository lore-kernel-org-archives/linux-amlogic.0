Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F515C433F5
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Mar 2022 11:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gzwE3HFoBNQlL9zzv1FCdkjH9RJyq6Hu7yYp4A/KDQs=; b=enWckNOZWXsSOI
	5m04Xco2DPjlqDPHbKFLtXMuLboUDxa+QVBa1K3sYt/0jpVIgJb0u1J380uFnn6v76+85Is/tSozW
	h7IU0EumDajtL7020quCUctCnqO1IeV57qUOL6Cwgup5GVHmCauDCSnDi8uM1q/NAH5KURPlHy8Jg
	fJL3qVul67B5Y5M2Jp0LuP+opgqpzjOghCIiGykASi0ueX5PIrIxRnSH+lE5jdlCKyrYxulL1nE0N
	Xz5Vn8SDJuHZ7iQuS3hAQlJPOVqgO6SoMWiPmqrQRJlW6ZrqF96G3LMnhKLrj6b9/7O+PoT5SG2Xl
	KtAyxqpDhWRwLgc07llQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZ9oW-00Bwk9-6p; Tue, 29 Mar 2022 11:15:04 +0000
Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZ9oG-00Bwcp-Ei; Tue, 29 Mar 2022 11:14:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648552488; x=1680088488;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=WW7g88rQ37IyUYcFgRuJ0tHqtRy6l/Sd1url/SgYtxc=;
 b=kvXUGNxZmjieinCdH/uxgmKVPiXUW3F3fsyRCfwCcYwPZvymkmiAqEjM
 ksGzejmgxl94kySCaJgzsJyswU8sxyzMJhx9DsGS/IMbXsp8PrQ+G7Ae4
 OXIPQSQME0Mt55GVu026QDg7S1JNTBpYk9b0HQUNgv+z/TLicB5Fmzshy
 tpN51qqqXmAtxlQD9cgDo+0srP/rVOrcYrRP9lngTH5LnYh0W4KtTA8cb
 XSBqhms3cyLDGzdjuVdF5ls6ppG6GrNvAZmAc6RXBqEF4Riog2S5XKNUO
 8wQQfENaMM8BsscA3v1QSubHVVSkSdUXStWW8z25GfZ1SXwj6KdIxATj0 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10300"; a="259410043"
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; d="scan'208";a="259410043"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2022 04:14:46 -0700
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; d="scan'208";a="787559197"
Received: from smile.fi.intel.com ([10.237.72.59])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2022 04:14:41 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1nZ9nb-008hp9-9H; Tue, 29 Mar 2022 14:14:07 +0300
Date: Tue, 29 Mar 2022 14:14:07 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Fabien DESSENNE <fabien.dessenne@foss.st.com>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Linus Walleij <linus.walleij@linaro.org>,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Andrew Lunn <andrew@lunn.ch>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v1 2/5] pinctrl: stm32: Replace custom code by
 gpiochip_count() call
Message-ID: <YkLp//IFvgohHycw@smile.fi.intel.com>
References: <20220325200338.54270-1-andriy.shevchenko@linux.intel.com>
 <20220325200338.54270-2-andriy.shevchenko@linux.intel.com>
 <44057328-2454-4f4d-cc90-b0ca35ba1e5a@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <44057328-2454-4f4d-cc90-b0ca35ba1e5a@foss.st.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220329_041448_548207_04C6DD98 
X-CRM114-Status: UNSURE (   9.85  )
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

On Tue, Mar 29, 2022 at 09:59:32AM +0200, Fabien DESSENNE wrote:
> On 25/03/2022 21:03, Andy Shevchenko wrote:

Thanks for review, my answers below.

> > -	for_each_available_child_of_node(np, child)
> 
> Here we look for "available" child, while the new generic helper
> gpiochip_count() looks for any child, available or not.
> Would it be possible to hav gpiochip_count() looking for available child as
> well?

It's done already that way. The fwnode loop is done against available children.

> It looks like there is '_available_' version of
> 'device_for_each_child_node', maybe this shall be added too.

No need.

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
