Return-Path: <SRS0=s/CZ=5W=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E6EBC2BA18
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Apr 2020 08:33:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1DE31206F5
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Apr 2020 08:33:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gAln0FxY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1DE31206F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qaH9JDdKEw9uD21ZG/Aiu31bDy9I0jCEvLRZ5yhF6zI=; b=gAln0FxYhqLfR1
	03csi5aGkM9RNvNmWyVeny086cxFiFAW56Xe/rMxbnNaSuyEoPtWbd0hCTCjkArgBCaJ1r7aRjksX
	G0uaIUZZ54nvWEyGea/uVtmQtngEq6GS1unJ//K/SN4Hg9hayuivckmR+A6kcS3hxZYB5AiXD1lM/
	zijsAqbPpb9rAcVszRCabYKYACdJn4EA+Li+ZwE0vmxpE68MkXjvB5BEfQ41WkLuQKJxBNCD2gjNE
	tfPwqXntNyJEahsWsdTifXp+LhXxwnsmH+E826K/3hFFvWe+8nSDqZS+s1r7DiAAKLHXxPyt+7CJJ
	OVDzkSY6K/723hhe35Ww==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jLNBe-0006kl-ES; Mon, 06 Apr 2020 08:32:54 +0000
Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jLNBc-0006kQ-8Z
 for linux-amlogic@lists.infradead.org; Mon, 06 Apr 2020 08:32:53 +0000
IronPort-SDR: DHRnwz9g2VVM7pjFgyyqKpYdtonLSVvtmtzKToeoRBwBnzgGA/J08dL/YE5hFMH4qwAqyz9pmo
 vyUMboNRQGsw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2020 01:32:51 -0700
IronPort-SDR: xU6jgijA9eoJCsmfR0qbFbTkab9P66OIRSvk1kwD3zEsucMmbumlsuKGXaJsmIsTqjTTeslfCL
 1akuhsVMbVwA==
X-IronPort-AV: E=Sophos;i="5.72,350,1580803200"; d="scan'208";a="424285937"
Received: from maytarsh-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.249.38.121])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2020 01:32:41 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: abhinavk@codeaurora.org, Ville Syrjala <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v2 03/17] drm: Nuke mode->vrefresh
In-Reply-To: <5d677ff317089267407609a1faa64b13@codeaurora.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200403204008.14864-1-ville.syrjala@linux.intel.com>
 <20200403204008.14864-4-ville.syrjala@linux.intel.com>
 <5d677ff317089267407609a1faa64b13@codeaurora.org>
Date: Mon, 06 Apr 2020 11:32:38 +0300
Message-ID: <87tv1xko9l.fsf@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200406_013252_350219_44083E8E 
X-CRM114-Status: GOOD (  16.03  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Neil Armstrong <narmstrong@baylibre.com>, nouveau@lists.freedesktop.org,
 Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, aravindh@quicinc.com,
 Emil Velikov <emil.velikov@collabora.com>,
 Thomas Hellstrom <thellstrom@vmware.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>, Stefan Mavrodiev <stefan@olimex.com>,
 Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Robert Chiras <robert.chiras@nxp.com>,
 pdhaval@quicinc.com, Ben Skeggs <bskeggs@redhat.com>,
 Jonas Karlman <jonas@kwiboo.se>, intel-gfx@lists.freedesktop.org,
 nganji@quicinc.com, linux-amlogic@lists.infradead.org,
 Vincent Abriou <vincent.abriou@st.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Purism Kernel Team <kernel@puri.sm>,
 jeykumar@quicinc.com, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, 03 Apr 2020, abhinavk@codeaurora.org wrote:
> On 2020-04-03 13:39, Ville Syrjala wrote:
>> diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
>> index fec1c33b3045..e3d5f011f7bd 100644
>> --- a/drivers/gpu/drm/drm_modes.c
>> +++ b/drivers/gpu/drm/drm_modes.c
>> @@ -759,9 +759,7 @@ int drm_mode_vrefresh(const struct drm_display_mode 
>> *mode)
>>  {
>>  	int refresh = 0;
>> 
>> -	if (mode->vrefresh > 0)
>> -		refresh = mode->vrefresh;
>
> The mode->vrefresh has been replaced with calling this API in all its 
> usages.
> However in this API, the above if statement was returning the vrefresh 
> if it was already
> set. mode->clock is holding the pixel clock . So this will not cause any 
> issues in non-compressed cases.
> In case of compression like DSC, the pixel
> clock will be different based on the compression ratio hence the 
> mode->clock will change but fps will not.
> So we did have usages in our downstream driver where we would use this 
> API and the refresh rate
> returned will be the mode->vrefresh which did not change but after this 
> change for those cases it will end up returning the refresh rate 
> calculated using mode->clock which will result in a different value now.
> So is the recommendation that even in the case of compression 
> mode->clock should always hold
> uncompressed pixel clock value because with this part of the change we 
> will now get a different value when we call this API.

Yes. The mode remains the same regardless of compression, and
compression is just an implementation detail of the transport.

You may need to maintain separate "physical port clock" and "logical
port clock" for DSC, where the latter is a function of the former and
the DSC parameters. And then you can see if your logical port clock
provides enough bandwidth for your mode. But this is up to your driver
and encoder implementation.

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
