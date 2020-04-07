Return-Path: <SRS0=8sL1=5X=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AFD4C2BA1A
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Apr 2020 01:24:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B8CC206B8
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Apr 2020 01:24:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GfAw749D";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="tAKGwHIO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B8CC206B8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5qwiVBkQwf/2pBaagVMmcKHyNhTuejPUrdXjvHwYTGg=; b=GfAw749D4NaQPfU/OAi4VMd61
	kOGTaslUfzGBzleCqkVGefSue0c0Wy5w/7fN7CYXnEwoqNbeSHAvV2uMAmSGzGh5XwIyiiVIM5xOX
	Qai+4m7v0mSHg3AVRTwdYkrPOCpr4G7XzM5gmKa4f/FgrXyKqB7+KJ5MwgvurgUblZHy6PlTLjWQy
	dCNnx6/spjs2pcRb4Gete2mjRHNn3xkHt74ZVpQ2pzw8OS0T0Z0DCTCxHlmbGGUPcSEMRr2q+Cpv7
	qI2my0rI0o8OtN+1NK2l0gHqhEdCLkQAOYHonMldGv77NK+oXVQAsDSqXganw73EfFm8L7lBKf965
	1C8WTlk4Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jLcy7-0006H6-9b; Tue, 07 Apr 2020 01:23:59 +0000
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jLcy1-000692-1X
 for linux-amlogic@lists.infradead.org; Tue, 07 Apr 2020 01:23:57 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1586222635; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=zdX68qj/o0fSAH+5oQViA8gUPvw2DqLvpBIUgqP4Kj4=;
 b=tAKGwHIO3zRy2GO8DMMw2AM5LbNtbQRTgLn2mc6YA7cHoxpJOc4Cu5nv3wXAOa384wd8V63l
 KoBCC7a5Ics88yQUZpyrppRNByGr9+rJy38CyjIY5FJSZ8QyPIbtG7ryjB0wZxjlfnlttAP/
 TsyWSOuLvtQNIWC1TrFjpuqJvkw=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyJjNDljMyIsICJsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e8bd61f.7f1ccf77f490-smtp-out-n03;
 Tue, 07 Apr 2020 01:23:43 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 802B6C44793; Tue,  7 Apr 2020 01:23:41 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id C2238C433F2;
 Tue,  7 Apr 2020 01:23:39 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 06 Apr 2020 18:23:39 -0700
From: abhinavk@codeaurora.org
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH v2 03/17] drm: Nuke mode->vrefresh
In-Reply-To: <87tv1xko9l.fsf@intel.com>
References: <20200403204008.14864-1-ville.syrjala@linux.intel.com>
 <20200403204008.14864-4-ville.syrjala@linux.intel.com>
 <5d677ff317089267407609a1faa64b13@codeaurora.org> <87tv1xko9l.fsf@intel.com>
Message-ID: <db6db406ab0c1378fdac427d9112cf97@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200406_182355_962952_C4C0E0E2 
X-CRM114-Status: GOOD (  18.65  )
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
 =?UTF-8?Q?Gu?= =?UTF-8?Q?ido_G=C3=BCnther?= <agx@sigxcpu.org>,
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
 Ville Syrjala <ville.syrjala@linux.intel.com>, nganji@quicinc.com,
 linux-amlogic@lists.infradead.org, Vincent Abriou <vincent.abriou@st.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Purism Kernel Team <kernel@puri.sm>,
 jeykumar@quicinc.com, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Icenowy Zheng <icenowy@aosc.io>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Jani

On 2020-04-06 01:32, Jani Nikula wrote:
> On Fri, 03 Apr 2020, abhinavk@codeaurora.org wrote:
>> On 2020-04-03 13:39, Ville Syrjala wrote:
>>> diff --git a/drivers/gpu/drm/drm_modes.c 
>>> b/drivers/gpu/drm/drm_modes.c
>>> index fec1c33b3045..e3d5f011f7bd 100644
>>> --- a/drivers/gpu/drm/drm_modes.c
>>> +++ b/drivers/gpu/drm/drm_modes.c
>>> @@ -759,9 +759,7 @@ int drm_mode_vrefresh(const struct 
>>> drm_display_mode
>>> *mode)
>>>  {
>>>  	int refresh = 0;
>>> 
>>> -	if (mode->vrefresh > 0)
>>> -		refresh = mode->vrefresh;
>> 
>> The mode->vrefresh has been replaced with calling this API in all its
>> usages.
>> However in this API, the above if statement was returning the vrefresh
>> if it was already
>> set. mode->clock is holding the pixel clock . So this will not cause 
>> any
>> issues in non-compressed cases.
>> In case of compression like DSC, the pixel
>> clock will be different based on the compression ratio hence the
>> mode->clock will change but fps will not.
>> So we did have usages in our downstream driver where we would use this
>> API and the refresh rate
>> returned will be the mode->vrefresh which did not change but after 
>> this
>> change for those cases it will end up returning the refresh rate
>> calculated using mode->clock which will result in a different value 
>> now.
>> So is the recommendation that even in the case of compression
>> mode->clock should always hold
>> uncompressed pixel clock value because with this part of the change we
>> will now get a different value when we call this API.
> 
> Yes. The mode remains the same regardless of compression, and
> compression is just an implementation detail of the transport.
> 
> You may need to maintain separate "physical port clock" and "logical
> port clock" for DSC, where the latter is a function of the former and
> the DSC parameters. And then you can see if your logical port clock
> provides enough bandwidth for your mode. But this is up to your driver
> and encoder implementation.
> 
> BR,
> Jani.

Thanks for the information. We will make changes to our driver to 
accommodate the changes in the
drm_mode_vrefresh API.

Thanks

Abhinav

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
