Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D147C07E8E
	for <linux-amlogic@archiver.kernel.org>; Wed, 24 Apr 2024 14:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KlV9SilYRJyyQaMMc8jWTdmUqvgR6RNwlqTHIqGEq0E=; b=cWISdnxxlEIWw5
	oT77L+5MoMtLyZZ3QANfXpPX+fsMLTOoIqxq5W/AIA7myG309ZzYDhXXfTNH3XDOl3kYDLZ7h907P
	R4Yh0pS8YrS+OZ4Xvhhz5JhjMyrzI9LOdsGOAin6iEc5EyecibQw4ievlHHdY8DAj35mAfeYBe03a
	aq+rQNB3OUUV1rZmvmcUMbCN2dPcJuHR0PFpbYMI+gwfspEIa3b66jH13vyoTBaxfcxrpR240eOPm
	jtCYxRwjxE/rJw8OcK6T861TTM4zfG5/VMIK4FO8NkiyXGJay8RiQspNKz8oMwZ3d7rhwJlBdn+Lc
	HUh2FcS7vwXKFRBNAHtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzdPP-00000004RW7-2tUG;
	Wed, 24 Apr 2024 14:15:39 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzdPF-00000004RQE-0y25;
	Wed, 24 Apr 2024 14:15:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713968129; x=1745504129;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gMosq5KDq4+veBQ/DQ6irfWO7y5x/xROAoojLy7Xjtg=;
  b=jFfpfZjCgEI5wAXz+ivarQQeU12E29U/SLcmqvs/9XZeiFTNlxMOW0yO
   jmhMUAYi+ebCHYs6TpwDkWRVRwnLISiSatSyygs3e7kTMbeUEVvu3DUVT
   H3uUU4luG4id4Njym1epJfcp55Ri6t29/PxrDOj3/t6K2A65dTf3QFYoZ
   dUIiasNVMsXQ1F404R4qMKgws9ouAVeRbZcSYItuDyS/NdbzOoliw/gK3
   fv9573eq30LMP3Ltg1VVzrMVN+8LcYi1XINj6//pvgyCa4faGsyJmfGAg
   HWQpmV7MZxINpj4gG6Hh8FrNYu223q53XG7s79M+GcdOUl/bOBldo9KYH
   A==;
X-CSE-ConnectionGUID: L5HmeWCfRYCKk51XAnFvnA==
X-CSE-MsgGUID: D7wCrzXwQnOLzrW7dqmjew==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="9452599"
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; 
   d="scan'208";a="9452599"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 07:15:25 -0700
X-CSE-ConnectionGUID: 1PwAzvoPSYuU9xCed7iHNw==
X-CSE-MsgGUID: H6Za2bLiQaqX+cjCsv32Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; 
   d="scan'208";a="29527516"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 07:15:18 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rzdOz-00000000ffl-36yR;
	Wed, 24 Apr 2024 17:15:13 +0300
Date: Wed, 24 Apr 2024 17:15:13 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-omap@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-amlogic@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Yue Wang <yue.wang@amlogic.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Xiaowei Song <songxiaowei@hisilicon.com>,
	Binghui Wang <wangbinghui@hisilicon.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Subject: Re: [PATCH v2 3/4] PCI: imx6: Convert to agnostic GPIO API
Message-ID: <ZikT8QczxkIXoOlc@smile.fi.intel.com>
References: <20240423172208.2723892-1-andriy.shevchenko@linux.intel.com>
 <20240423172208.2723892-4-andriy.shevchenko@linux.intel.com>
 <ZigSiCBIwoEIPYoG@lizhi-Precision-Tower-5810>
 <ZigUL7exXBSbWDIR@smile.fi.intel.com>
 <ZigXJJj4e+oaANAt@lizhi-Precision-Tower-5810>
 <ZigYqtyn4BTbWgRu@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZigYqtyn4BTbWgRu@lizhi-Precision-Tower-5810>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_071529_341336_0F68F9E7 
X-CRM114-Status: UNSURE (   6.94  )
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

On Tue, Apr 23, 2024 at 04:23:06PM -0400, Frank Li wrote:
> On Tue, Apr 23, 2024 at 04:16:36PM -0400, Frank Li wrote:

...


> Reviewed-by: Frank Li <Frank.Li@nxp.com>

Thank you!

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
