Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83C3FECAAA1
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Sep 2022 11:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2XpqLlCzSyMQu2sDVeFDACPi/UYoQE9gODrRiK8EkT0=; b=zljJ4BK4Y9qnpq
	1yF/UDlCIinVN0VKKIHAyiIlneZhxE/hGWfD1MwZE5Qnuctjta3kgBWsx81w1TMIGOPlB6ayG5CDn
	gbxoOzM9Sk/k+4jZpDqCMaaYxOtIHQyeWotltLL00ffuqztBBi2Pk7yQGrrw9BxH7n2/ZwrCX2A/R
	mIo7RdOBc9JNxiDj5cfqEFl4VBQand96GgEo6J6E7PcOtvNKRgzdUiqagN/P8UycRN7SWYXAE8AFw
	x0eJU4VH2aT+9ohTnQbhapxczrSi2HBl2pDaEYBrl/gT2xPjYvG7EyUVvkZTZo0iuhg0NbCi/gpDs
	pkMPrHJ5gKbyM58UP2+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVXAY-00D3hA-He; Tue, 06 Sep 2022 11:55:06 +0000
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVXAC-00D3aJ-Ib; Tue, 06 Sep 2022 11:54:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662465284; x=1694001284;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BglTHeEuNNVFp8jxILPr2zH0JGMkuFYyH3BFt9cHmlI=;
  b=dYUYbceGdhtcxM9+0ZMRP3Rs2ifp0kxyccyftquvjbAMm2iSQMPFLzpO
   T2J8kT7h82CuWeReMglKdaW3Bg875KQ87wMSmW0An/852/dvFVsmWNGDE
   6Brl3F5Dr3VR/0vkJhbqHkerAsL1LLP0YWeOe7GeBub+2MQkQ+INc1Tsy
   Q03olivImG6KEU6H4zL9W5amisNyL+tRjGuazKTcOncUvmZQX9ZENVBR4
   XfIuWMdPNKz/X/9V7IGxg7SGG0w5Z1zHdvUumjUegLXJ7ETVTDopPM+6L
   OXuulxGSK5WEzvT7NZXIKGhDqzQzx2WnVhFs9uwPDtBAqNpJZxVd2jHfG
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10461"; a="358288506"
X-IronPort-AV: E=Sophos;i="5.93,294,1654585200"; 
   d="scan'208";a="358288506"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2022 04:54:41 -0700
X-IronPort-AV: E=Sophos;i="5.93,294,1654585200"; 
   d="scan'208";a="565065780"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2022 04:54:37 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1oVX7x-0096Bf-0b;
	Tue, 06 Sep 2022 14:52:25 +0300
Date: Tue, 6 Sep 2022 14:52:24 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v1 1/1] pinctrl: meson: Switch to use fwnode instead of
 of_node
Message-ID: <Yxc0eAsFDA9AMHeI@smile.fi.intel.com>
References: <20220905180034.73132-1-andriy.shevchenko@linux.intel.com>
 <b0d45e18-c92d-d187-2eac-851d975fbb7e@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b0d45e18-c92d-d187-2eac-851d975fbb7e@baylibre.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220906_045454_491069_5FD0DA43 
X-CRM114-Status: UNSURE (   8.81  )
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

On Tue, Sep 06, 2022 at 11:07:07AM +0200, Neil Armstrong wrote:
> On 05/09/2022 20:00, Andy Shevchenko wrote:
> > GPIO library now accepts fwnode as a firmware node, so
> > switch the driver to use it.

...

> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

Thanks!

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
