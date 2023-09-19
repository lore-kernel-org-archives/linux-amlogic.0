Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE012CD54AB
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 Sep 2023 09:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0DsR2XkB617qW+4ov19Nphd4iZEJ9cF4ycrIPhxkdRE=; b=ezCXIu7jdKwfqj
	HUQZR/PN/C80kVi0V9ZghIls+WfnJUrDBNa1pZO+d94qGTQFZAJVnExQFwH1GRCQO/ZeMPnbnlCyU
	uoRl8ZW2vgJvdW/MaYmQyiZvSBrfZklFDoL8b8jSu93i7XCZJ0XO/E9ifnrM+0GvS1qgYarCKih/H
	RucgomuNfW5XSx+fhroNmgNGl83bofhiHSyYTTEOFt3XThfrhPAD1L/kzrC7x2VCPbN8QCHoexFh2
	knIaX3bN5qyo7fVHmWd1AeWnmtFnJqR3Z/mXAF0OK9r4CsYo2M+DpGM0vTGythjO+zdgvOrU0Hh20
	jE1LXEFtlh90VH1Kl19A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiXRl-00HZ0f-25;
	Tue, 19 Sep 2023 09:55:09 +0000
Received: from mgamail.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiXRj-00HYzJ-0d;
	Tue, 19 Sep 2023 09:55:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695117307; x=1726653307;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=VE2rjU6vKS7B5FcRe/RnrC2e6YXvyOnWP8lQUDgIgR0=;
  b=X4jp3l+ZruwwgOtci38Y+IJVj4C02uZF9CNMeYViHYxwpkjJ7iMBUhSR
   b7kyolBTwDQtsCf8bhENfTfd+XyMtAuFX0HxYlRs9jZotw1RIxMoP684T
   II5B3/MzXXfOpXNO3jTMgV/DBajFnEY2ZeBblOwpZilSsNJw6URxiKXj6
   iRoJ/6aysKELBfWZmyWKHMDPW63xpNcppNYuNSd8PPdhVeMgrjEhhk8qe
   nbMQyOtciGZl0qbC406f03F+vQP9KdMYezd0NSHvUgvCIi5FplU6PfKap
   4aNW8fbeZ+nnv+POPjtu1JzQg8Vb+6ooQkr+JBL8HSj20bZprvRhxhpSq
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="382651757"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; 
   d="scan'208";a="382651757"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 02:55:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="695850188"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; 
   d="scan'208";a="695850188"
Received: from tjquresh-mobl.ger.corp.intel.com (HELO localhost) ([10.252.37.227])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 02:55:00 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: neil.armstrong@linaro.org, dri-devel@lists.freedesktop.org
Cc: Neil Armstrong <narmstrong@baylibre.com>, Sam Ravnborg
 <sam@ravnborg.org>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH] drm/meson: fix memory leak on ->hpd_notify callback
In-Reply-To: <a4b4432b-fdde-4922-8d95-3697807eefdb@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230914131015.2472029-1-jani.nikula@intel.com>
 <a4b4432b-fdde-4922-8d95-3697807eefdb@linaro.org>
Date: Tue, 19 Sep 2023 12:54:58 +0300
Message-ID: <87msxitrm5.fsf@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_025507_293151_8F3B4CF7 
X-CRM114-Status: GOOD (  11.63  )
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

On Fri, 15 Sep 2023, Neil Armstrong <neil.armstrong@linaro.org> wrote:
> On 14/09/2023 15:10, Jani Nikula wrote:
>> The EDID returned by drm_bridge_get_edid() needs to be freed.
>> 
>> Fixes: 0af5e0b41110 ("drm/meson: encoder_hdmi: switch to bridge DRM_BRIDGE_ATTACH_NO_CONNECTOR")
>> Cc: Neil Armstrong <narmstrong@baylibre.com>
>> Cc: Sam Ravnborg <sam@ravnborg.org>
>> Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>> Cc: Neil Armstrong <neil.armstrong@linaro.org>
>> Cc: Kevin Hilman <khilman@baylibre.com>
>> Cc: Jerome Brunet <jbrunet@baylibre.com>
>> Cc: dri-devel@lists.freedesktop.org
>> Cc: linux-amlogic@lists.infradead.org
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: <stable@vger.kernel.org> # v5.17+
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> 
>> ---
>> 
>> UNTESTED
>> ---
>>   drivers/gpu/drm/meson/meson_encoder_hdmi.c | 2 ++
>>   1 file changed, 2 insertions(+)
>> 
>> diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
>> index 9913971fa5d2..25ea76558690 100644
>> --- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
>> +++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
>> @@ -334,6 +334,8 @@ static void meson_encoder_hdmi_hpd_notify(struct drm_bridge *bridge,
>>   			return;
>>   
>>   		cec_notifier_set_phys_addr_from_edid(encoder_hdmi->cec_notifier, edid);
>> +
>> +		kfree(edid);
>>   	} else
>>   		cec_notifier_phys_addr_invalidate(encoder_hdmi->cec_notifier);
>>   }
>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks. I don't seem to have a toolchain to get this to build... would
you mind applying this, please?

BR,
Jani.


-- 
Jani Nikula, Intel

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
