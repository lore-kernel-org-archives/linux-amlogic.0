Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B459CD4F3C
	for <linux-amlogic@archiver.kernel.org>; Sat, 16 May 2026 19:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=95n5qDzhi512awQzZzTG9FC/2wYeeumApDAwUoxVpBY=; b=w5pV7y358CScap
	CJ42VAc/QtJcCIjl2d0AXnOY/PwWZ2WQRoxqLtNXHC1W51nqcHBoL4dt2Z2ow0ZCXZGzIomyqzZ5m
	bea4ZfMdEjTFofzlKoudwJXHcq2A3ORnfU+Hq+drl/2JiJgU1tfCRuDJSE8RWQeiMJN4POTCYqXjx
	HaXxzPpQo+zY3YwFlLsyZi0L/LS1qpsGiX5Lzckf2mWC63FJ7nnb0F3izOWyVDcxGhhGrUe0vZUQG
	hdVTiPbpER0wz1AZXTpCflkjO6PRRagpl2vtJCxQu1pgsR+AskgyxmEJutD7gRKT886cyyyA3gVaG
	EZTkIKmIDdSTuWwDPC6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOKvV-0000000BOsa-3p7O;
	Sat, 16 May 2026 19:43:57 +0000
Received: from smtp.forwardemail.net ([121.127.44.66])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOKvT-0000000BOrA-0ABF
	for linux-amlogic@lists.infradead.org;
	Sat, 16 May 2026 19:43:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1778960630;
 bh=qdqxexX5mOstRuzAbF9sWFbFUGmWoYy5Hp06rH3GWRM=;
 b=IyWxBLmW8qiyRIgExaV/e17LWhpZuwIjSTf5uDYbdwc6fTElq+ww/5dBDON8ctQVKmyh0MYi+
 bWGUHBcnOw7ylpdXuD2Ks+18dXqJ854XTUibaKscNhmSUGmPLZ3iqfLg6348FfaiQILX7le3r//
 aEtkFu7l8cUVym2hR4WQHfPOUSJJMYkN6g+lc6AyuMRheydbS9qtfL+xKqVssa9xDrGua7U7Y+J
 mGeelP8Ja2UxYm9E2WPI4O2DdSoIN9YHnGVortXCFqmMoyY+twuu6tYVfuyhQkdZhdWzaG54Eju
 DBweNq5bHA8TQn2WPoNWg99tRk+LnAzAobpkEedBKG7Q==
X-Forward-Email-ID: 6a08c8e55c12e46019b2216b
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.66
X-Forward-Email-Version: 2.8.12
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <533dd01f-9516-4267-9376-1e5ba42ba124@kwiboo.se>
Date: Sat, 16 May 2026 21:43:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 13/22] drm: bridge: dw_hdmi: Use generic CEC notifier
 helpers
To: sashiko-reviews@lists.linux.dev
Cc: Frank.Li@kernel.org, linux-sunxi@lists.linux.dev, imx@lists.linux.dev,
 neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org
References: <20260516183838.2024991-14-jonas@kwiboo.se>
 <20260516192001.27E4EC19425@smtp.kernel.org>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20260516192001.27E4EC19425@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260516_124355_505227_3151695B 
X-CRM114-Status: GOOD (  19.34  )
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

On 5/16/2026 9:20 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Use-After-Free and Memory Leak in CEC notifier cleanup due to drmm and manual lifecycle mismatch
> --
> 
> commit eb59f6fe976b03aa5f719b79a28355b27f403bfe
> Author: Jonas Karlman <jonas@kwiboo.se>
> Subject: drm: bridge: dw_hdmi: Use generic CEC notifier helpers
> 
> This commit replaces open-coded CEC notifier handling with generic CEC
> helpers using drmm_connector_hdmi_cec_notifier_register. It also removes
> the manual notifier unregistration from dw_hdmi_connector_destroy.
> 
>> The drmm release action for the generic CEC notifier should run just
>> before dw_hdmi_connector_destroy(), closely matching the lifetime of
>> the replaced CEC notifier and the connector.
> 
> Is this lifecycle assumption accurate for drivers that do not use drmm
> for mode config?

Yes, drm_mode_config_init() was converted to call its drmm_ variant in
v5.8-rc1, with commit c3b790ea07a1 ("drm: Manage drm_mode_config_init
with drmm_"). Effectively meaning that all drm drivers use drmm for mode
config.

>> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> [ ... ]
>> @@ -2547,9 +2543,6 @@ static void dw_hdmi_connector_destroy(struct drm_connector *connector)
>>  {
>>  	struct dw_hdmi *hdmi = container_of(connector, struct dw_hdmi, connector);
>>  
>> -	cec_notifier_conn_unregister(hdmi->cec_notifier);
>> -	hdmi->cec_notifier = NULL;
>> -
>>  	drm_connector_cleanup(connector);
>>  	drm_bridge_put(&hdmi->bridge);
>>  }
> 
> Since drm_connector_cleanup() zeroes the connector memory, and
> drm_bridge_put() can drop the final reference to the bridge (which frees
> the dw_hdmi structure and its embedded connector), could this lead to a
> use-after-free?

It should not, destroy() is the last call made for the connector, and
the drm_bridge_put() is here to ensure that the struct dw_hdmi is still
around when drm_connector_cleanup() is called, to avoid a use-after-free.

> If a user-space application holds an open file descriptor to the DRM device
> during driver unbind, the DRM device remains alive. The deferred drmm
> release action will only execute later when the file descriptor is closed
> and the DRM device's refcount drops to zero.
> 
> When the drmm action eventually runs, it will dereference the freed
> connector pointer.
> 
> Additionally, because drm_connector_cleanup() executes
> memset(connector, 0, sizeof(*connector)), won't connector->cec.data become
> NULL? This would cause the delayed drmm release action to silently skip
> unregistration, leaking the cec_notifier object.

It should not, drmm release actions are called in reverse order, and
drmm_connector_hdmi_cec_notifier_register() is called last, meaning its
release action should be called before drm_mode_config_cleanup() is
called by the the release action for drmm_mode_config_init().

Regards,
Jonas

> [ ... ]
>> @@ -2609,15 +2600,8 @@ static int dw_hdmi_connector_create(struct dw_hdmi *hdmi)
> [ ... ]
>> -	notifier = cec_notifier_conn_register(hdmi->dev, NULL, &conn_info);
>> -	if (!notifier)
>> -		return -ENOMEM;
>> -
>> -	hdmi->cec_notifier = notifier;
>> -
>> -	return 0;
>> +	return drmm_connector_hdmi_cec_notifier_register(connector, NULL,
>> +							 hdmi->dev);
>>  }
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
