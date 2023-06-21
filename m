Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 018B2EB64D8
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Jun 2023 14:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hL9t2f7bBpKOEGQaiuSclJ+vxTKAsrnwSmwPmtqaeaI=; b=fSWBsgSbAGbfLi
	jH4NzyAZOyQZeWO7YCJI1c4mbK0YxChvYnrM93HuJDOgKZlplIRLfixZ2DqARCBjQ8NGL5FwZMvAi
	EBPGIq5cBmjVGWxV/QspBtwTxPKJVhfZVsqHXcckOkzASeyFbbYNRoaQDYJQoEMk5XWX2hTNIvZp4
	95DV2IrtvIXn9iOvbTiAbe2bBarEt9kePtUuyXL/FbF2112ut26iXa9YKXERsguMr31WBMftoKKJD
	yXi1D6SlpGLqQfxNNOctlZhdUltTbPJNLHtEStetTV4K4v+PipmPBedRbHcCMTH5E2SVl/BRgttt5
	8V+wzgsMy6ghpMQEigwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qByXt-00EmQc-1Y;
	Wed, 21 Jun 2023 14:10:53 +0000
Received: from mga01.intel.com ([192.55.52.88])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qByXq-00EmNl-1f;
	Wed, 21 Jun 2023 14:10:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687356650; x=1718892650;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ouC2uUhcHNQmb+8A8CRknY0+a4vXftp/tDcG/6xIf3k=;
  b=kmMQS7Q9pNllfRZml4QbVGo3GyikOl8zt2ebX4lK6Tc33VeiChAIzb4I
   PKf2Gj6lH5vkh2K/qhO4lWZTqOpjro1lF4c37sBWa23ku95lSH75R5nHR
   4VH5vtgv9J2ULqxWhuJENmaIOzGloypHcviXVHaAXGA3hKmDVoJ27wtob
   ZRMIfYJ9Do3MYCJTYJib4XdeLDfvagMJYhFIlb09Nz4snOfLWwUJpIYn8
   1BWaZmEtchdvfuCdz2xAcr8Q2TPTWql7Mb58xSSZLGvVY5cVm/0yGPPCJ
   lxLzfzeJKfPU2KNc1/FVjcVl7cAOI+jtySMVhxvWjcJ0Yon7P9QX+Yg1u
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="389693884"
X-IronPort-AV: E=Sophos;i="6.00,260,1681196400"; 
   d="scan'208";a="389693884"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2023 07:10:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="691868682"
X-IronPort-AV: E=Sophos;i="6.00,260,1681196400"; 
   d="scan'208";a="691868682"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga006.jf.intel.com with ESMTP; 21 Jun 2023 07:10:41 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qByXf-005Vxe-2e;
	Wed, 21 Jun 2023 17:10:39 +0300
Date: Wed, 21 Jun 2023 17:10:39 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: George Stark <gnstark@sberdevices.ru>
Cc: jic23@kernel.org, lars@metafoo.de, neil.armstrong@linaro.org,
	khilman@baylibre.com, jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com, nuno.sa@analog.com,
	linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
	kernel@sberdevices.ru
Subject: Re: [PATCH v1 0/3] meson saradc: add iio channels to read channel 7
 mux inputs
Message-ID: <ZJME39cOHsKkJu2Y@smile.fi.intel.com>
References: <20230621062715.455652-1-gnstark@sberdevices.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230621062715.455652-1-gnstark@sberdevices.ru>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230621_071050_566516_972235C5 
X-CRM114-Status: GOOD (  12.21  )
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

On Wed, Jun 21, 2023 at 09:26:07AM +0300, George Stark wrote:
> From: George Stark <GNStark@sberdevices.ru>
> 
> In meson saradc channel7 is connected to muxer which allows to measure
> inner sources like Vdd, GND, several Vdd dividers. This patch series
> adds independent iio channel (with label) for every chan7 mux input.
> Mux switch is handled transparent for clients.
> This functionality can help debug\test\calibrate adc.
> This code is relevant for all supported amlogic soc families

Code wise looks good to me, some remarks about commit messages and comments.

> This patch series was created after discussion [1], [2]
> 
> [1] https://lore.kernel.org/lkml/20230524000111.14370-1-gnstark@sberdevices.ru/
> [2] https://lore.kernel.org/lkml/20230527214854.126517-1-gnstark@sberdevices.ru/

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
