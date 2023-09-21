Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53F70E70703
	for <linux-amlogic@archiver.kernel.org>; Thu, 21 Sep 2023 10:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zB48clyq1YIyGTmQ2TKeJFyWpY/MmRsonnTWu61cfsc=; b=mCeFDf2+silpEt
	ILWUGcoOupLoNI2gmURpunJIymrQpQYJcJfk5sWcJ4WHgDxXaNYs4ibKfvR7zsruor2BduZH29iix
	d50DZWZHY/w79cpySG1i9KHnhO99DJvSFtRMCVIhLAuJ8uH4LVS0T3apI8VmHs3g7XW8dtEAtepVZ
	I7RwkKnITq1HuJZPPoemEPMm3qAl2CYfxDRz63eEl+hV0SkfgOFASegkW8d1x8gst4FQlawFEN4oF
	9Tic1nLiyJQbwCo3fB/+/dUn6009z26tZLDsZI8yvjsbupGaxtR8r/H1Ti7N5BP1N30JePwtSRNg4
	eUGAa2eLCnWVZc44M8nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjGU3-005f4S-1Q;
	Thu, 21 Sep 2023 10:00:31 +0000
Received: from mgamail.intel.com ([192.55.52.151])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjGTz-005f3B-28;
	Thu, 21 Sep 2023 10:00:28 +0000
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="360722531"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; 
   d="scan'208";a="360722531"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2023 03:00:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="994018928"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; 
   d="scan'208";a="994018928"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2023 03:00:22 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC0)
	(envelope-from <andy@kernel.org>)
	id 1qjGTr-0000000GrBd-111u;
	Thu, 21 Sep 2023 13:00:19 +0300
Date: Thu, 21 Sep 2023 13:00:18 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Huqiang Qin <huqiang.qin@amlogic.com>
Cc: linus.walleij@linaro.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	neil.armstrong@linaro.org, khilman@baylibre.com,
	jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
	brgl@bgdev.pl, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 2/3] pinctrl: Add driver support for Amlogic T7 SoCs
Message-ID: <ZQwUMqPG2Z+Y/FTF@smile.fi.intel.com>
References: <20230921083407.1167510-2-huqiang.qin@amlogic.com>
 <20230921083407.1167510-4-huqiang.qin@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230921083407.1167510-4-huqiang.qin@amlogic.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_030027_711720_215D3437 
X-CRM114-Status: UNSURE (   8.96  )
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

On Thu, Sep 21, 2023 at 04:34:07PM +0800, Huqiang Qin wrote:
> Add a new pinctrl driver for Amlogic T7 SoCs which share
> the same register layout as the previous Amlogic S4.

...

> +static const char * const uart_ao_a_groups[] = {
> +	"uart_ao_a_rx_c", "uart_ao_a_tx_c", "uart_ao_a_tx_w2",
> +	"uart_ao_a_rx_w3", "uart_ao_a_tx_w6", "uart_ao_a_rx_w7",
> +	"uart_ao_a_tx_w10", "uart_ao_a_rx_w11", "uart_ao_a_tx_d0",
> +	"uart_ao_a_rx_d1",

> +

Redundant blank line.

> +};

With that fixed,
Reviewed-by: Andy Shevchenko <andy@kernel.org>

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
