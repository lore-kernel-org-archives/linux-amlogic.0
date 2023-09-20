Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1418DC04AA7
	for <linux-amlogic@archiver.kernel.org>; Wed, 20 Sep 2023 16:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8GeRho74fsP46j34GORDwNK/zrPWNs4Mwm0NCth5JNo=; b=sQGRphtDY0D6x8
	cvZwG7QAeRUuIU7ZdGJIsk6tFreT3H56nP7utxAvv7xKnBQ8r6WGsBajvUqgIAE1bx6VXN6Vr3nWp
	ZVsVJas10gCBitkMNWRPdmoxUUlCHO0p3KsYFha04Ol3E9Q1Ku7mTckG5lFVBLnNme4p52MrCPT4B
	2Ggxi2/qQye2L3SOLOmtZJlrB8o4LF5M54pHtJAAQGgVa/UJqZfcq+SLyMkmMG0scdYbgwLG4UbmH
	LOGINUug8BzAxxnRbWOJFcVwVaRh1R+3gkKZjBFKv3FgQJpV2yS3a07OF3wWW2LeKGqwmDtZ7ObYP
	7XlL9CGuMH24XC05b/Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qj06k-003dUW-1J;
	Wed, 20 Sep 2023 16:31:22 +0000
Received: from mgamail.intel.com ([134.134.136.20])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qj06g-003dTz-0Q;
	Wed, 20 Sep 2023 16:31:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695227478; x=1726763478;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=GoHDfxWmP1TTPAGMIxLhDm5KqXyo4RRgetunfbLJ/do=;
  b=aXHfW3gdCnauRzevI38RR82H8eILBjTQSWWOp51rrs3o52xFrsgq/Je0
   aGCPcvMtyT7n3iveGQEX6/fZizs1LS7uxrlzFBDohD3YxWhltAgEeVOBV
   Ua+V212qKpGDHBHK1PY3OODjXngmAfuNvJox94itMHVgchaIVXWPQ+3Ez
   lIfBMdzT2X59f9CPZIJEBVBGGS08+ydIRbNdNBBAnlL7+St1WCnFy57c6
   tn+tyRZpwPLgV3UtwK2okLQHEgy90ckv9+tFVNF0Xle6zGmIND9CtsreA
   QI2znEphdG+01qc0deMhBum4lKhe453B3gfqZz+ZrWbHwSEAS6KFS0nEK
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="370584600"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; 
   d="scan'208";a="370584600"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2023 09:31:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="816969030"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; 
   d="scan'208";a="816969030"
Received: from ptelkov-mobl2.ccr.corp.intel.com (HELO localhost) ([10.252.38.103])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2023 09:31:05 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, dri-devel@lists.freedesktop.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org, Neil
 Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/meson: fix memory leak on ->hpd_notify callback
In-Reply-To: <169521759637.2169873.6598076316992605754.b4-ty@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230914131015.2472029-1-jani.nikula@intel.com>
 <169521759637.2169873.6598076316992605754.b4-ty@linaro.org>
Date: Wed, 20 Sep 2023 19:31:03 +0300
Message-ID: <87msxgrem0.fsf@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_093118_247983_2A38CDB1 
X-CRM114-Status: UNSURE (   9.23  )
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

On Wed, 20 Sep 2023, Neil Armstrong <neil.armstrong@linaro.org> wrote:
> Hi,
>
> On Thu, 14 Sep 2023 16:10:15 +0300, Jani Nikula wrote:
>> The EDID returned by drm_bridge_get_edid() needs to be freed.
>> 
>> 
>
> Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-fixes)
>
> [1/1] drm/meson: fix memory leak on ->hpd_notify callback
>       https://cgit.freedesktop.org/drm/drm-misc/commit/?id=099f0af9d98231bb74956ce92508e87cbcb896be

Thanks,
Jani.


-- 
Jani Nikula, Intel

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
