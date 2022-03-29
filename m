Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57CD7C433EF
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Mar 2022 12:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AC+F+TJ1fZeC8xOimjHhv5fqew8CEmFK+IMc8wEx09g=; b=UmBmnYz61fkXJl
	FZGfc8kptT6oSaCt+eSzY2FkyrmPil5N6qc50K5sJVmUkGgObY4uIHRHs55duqrZf+LgOWVuZj8kW
	pXvwQ3AIia1VYhfa0YjEBWp/TQovRfAxJ+aORQIEGl5oKI//P1xYJ6ol/U+f5KLqlaeuXCmzRutQU
	CaFvLSenNKnYH8/RlKyGTqpyGy4RoZDyMwbd4XONplaRLuleWob6HRMTTsDHCbuEQKSr3ayzRfbfL
	FLXkY2L+5rIvRXB21fL2AfhqZPmLWT2h/xf1cGu7yW49hMkEHDgzYawOwfuYzHQqNrzsT0MgyBGW7
	Ua3szQUo9rrnSWFd3SYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZAvJ-00CBPq-9W; Tue, 29 Mar 2022 12:26:09 +0000
Received: from mga03.intel.com ([134.134.136.65])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZAv3-00CBKS-9w; Tue, 29 Mar 2022 12:25:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648556753; x=1680092753;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=B4gfQZ727rl7OXibsvWflHV4WHOqBqSX/MZ7Umzjj+U=;
 b=UHl5mw7u0HaxZSczwUgIOUYYXigdjqpCCnL1ZEff+fl/4RCip9x/SP/g
 xH0GmxfI03R6PM9lXf8IaQ5loQA13D/XvqixL70OxP0bNtFaor2vnnxU3
 LzU8vsUOmtpcVINBdiLSWant8dqoEyUUCoLy+ZyjpEhOU7GRABw3k3+Co
 gI17XjM85p3lIOOpu/7O+EKOGhAuZqC/frg2tS1UeH0YwC//ViDxZWPJK
 Fa5CFQCdqKkDX6EPox0Sn3GN61Vwnvj9aYcyAS8+C2MjvJVlI6Qg0xkoD
 XjJ6OZpJmDYG5oQG1daSPbrKzdLumtwStp+jQalTHbmPF1WFBqJwogRr9 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10300"; a="259208404"
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; d="scan'208";a="259208404"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2022 05:25:51 -0700
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; d="scan'208";a="518900483"
Received: from smile.fi.intel.com ([10.237.72.59])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2022 05:25:46 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1nZAuN-008jlQ-PL; Tue, 29 Mar 2022 15:25:11 +0300
Date: Tue, 29 Mar 2022 15:25:11 +0300
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
Message-ID: <YkL6p89LpPS4kLHo@smile.fi.intel.com>
References: <20220325200338.54270-1-andriy.shevchenko@linux.intel.com>
 <20220325200338.54270-2-andriy.shevchenko@linux.intel.com>
 <ca54534d-9752-44fc-7341-a8b45e1a00d7@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ca54534d-9752-44fc-7341-a8b45e1a00d7@foss.st.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220329_052553_430487_64B3A0C4 
X-CRM114-Status: UNSURE (   9.97  )
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

On Tue, Mar 29, 2022 at 02:07:01PM +0200, Fabien DESSENNE wrote:
> Hi Andy
> 
> Thank you for your the clarification.

> Reviewed-by: Fabien Dessenne <fabien.dessenne@foss.st.com>

Thanks!

In v2 I'm going to add another patch and the first (against gpiolib) will be
split to two. This patch will be almost unchanged: I've decided to rename
gpiochip_count() to gpiochip_node_count(), otherwise it's the same. So, I'll
keep your tag.

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
