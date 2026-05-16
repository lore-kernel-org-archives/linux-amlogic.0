Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0A3ACD4851
	for <linux-amlogic@archiver.kernel.org>; Sat, 16 May 2026 20:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l2KfVf9zVOqB+clDBcfvWye2TLivfuRVGm0enKnXj3U=; b=kJxHl+hw0h/kPi
	ufgYNbFP+cIV/ySSRPHFufyKndpFbcP/P39RUk5qTiedU3d7jPANUmJ3uA7oMUbwh/9Q3T6sl5idR
	GwoxdBJlACC58OjXYMArsV+y1hzxVWJDlhpYVKotBYGUQoNaarl0z6hQma7I6BGGdblY8TLklrTgc
	hj6tvLwYGgQaCuQ3DphJ1os5oLYFe20f2FVb8yhNIIQAWQjxMUrmiD8zgZUtA5+gahqcolVEwG5qO
	jsN7WQKmKI6+xdkLHlop0CwQjkbcE+mpiQxEJVX1SwA0TF/KtdEj77Q1sIR8Mo8Ml4lm//f81vYZQ
	Sfzfob2CB6wc50Sfar5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOLMJ-0000000BRCY-0OXt;
	Sat, 16 May 2026 20:11:39 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOLMH-0000000BRC4-0kws
	for linux-amlogic@lists.infradead.org;
	Sat, 16 May 2026 20:11:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1778962296;
 bh=vlHCAIotM5Ww/YlAnImpQ9bOoYRl3nXprmzP151Dkbk=;
 b=a+cin9tKT3iPwr5LVVo50rAEnNDa8hutJbPKcdZ4zOZuGAb+DlUmiZmu6xZpjMLlab6q2OuSg
 qtFeDGaq3UaH5I/Spc8RdUlVLkAjjtuPYdEvy3mBr6RaXekeuNfim4ifEM6FDqgBmVNtLHyVaha
 AGvE3Fg9sAPpoeKN89ugHQy6c0XTaQMRM8CYgRt1klrqlMGRuXPrcIde3r7S5F9rfituddAh2/n
 iYOiBKO4zU/mz/z530S7q9GO59rC5aOzuslA7xXP4v09Giz9Vk1Q0Me4+sWRW7LBYKRErJplz1Y
 hXEgqMCAn1JsM0Y/B1AE+iObHvWnjyhkU3i4Z4Orwhqw==
X-Forward-Email-ID: 6a08cce65c12e46019b2272e
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 2.8.12
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <2ff890b4-ee97-467d-ba27-a3471861ef48@kwiboo.se>
Date: Sat, 16 May 2026 22:00:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 17/22] drm: bridge: dw_hdmi: Drop call to
 drm_bridge_hpd_notify()
To: sashiko-reviews@lists.linux.dev
Cc: neil.armstrong@linaro.org, linux-sunxi@lists.linux.dev,
 linux-amlogic@lists.infradead.org, Frank.Li@kernel.org, imx@lists.linux.dev
References: <20260516183838.2024991-18-jonas@kwiboo.se>
 <20260516195224.9E2CBC19425@smtp.kernel.org>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20260516195224.9E2CBC19425@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260516_131137_310578_211CD707 
X-CRM114-Status: GOOD (  19.71  )
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

On 5/16/2026 9:52 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Removing drm_bridge_hpd_notify() violates the DRM bridge API contract and causes hotplug events to be permanently lost during system suspend.
> --
> 
> commit 6b3491e39082015ab62431ea0c93c74c9344b995
> Author: Jonas Karlman <jonas@kwiboo.se>
> 
> drm: bridge: dw_hdmi: Drop call to drm_bridge_hpd_notify()
> 
> This commit removes the drm_bridge_hpd_notify() call from the dw_hdmi IRQ
> handler, relying instead only on drm_helper_hpd_irq_event() to avoid sending
> duplicate hotplug uevents to userspace.
> 
>> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> index e9c4e24c090ca..6cc7b2a860bd8 100644
>> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> @@ -3101,10 +3101,8 @@ static irqreturn_t dw_hdmi_irq(int irq, void *dev_id)
>>  			status == connector_status_connected ?
>>  			"plugin" : "plugout");
>>  
>> -		if (hdmi->bridge.dev) {
>> +		if (hdmi->bridge.dev)
>>  			drm_helper_hpd_irq_event(hdmi->bridge.dev);
>> -			drm_bridge_hpd_notify(&hdmi->bridge, status);
>> -		}
>>  	}
> 
> Will removing drm_bridge_hpd_notify() cause hotplug events to be permanently
> lost if they occur during system suspend?

No, drm_mode_config_helper_resume() is called at resume.

> Since the driver advertises DRM_BRIDGE_OP_HPD, does the DRM bridge API
> contract still require it to call drm_bridge_hpd_notify() to properly
> propagate hotplug events to the rest of the bridge chain?

No, hpd_notify() funcs are still called from bridge connector detect().

> Looking at drm_helper_hpd_irq_event(), it aborts early if polling is
> disabled:
> 
> drivers/gpu/drm/drm_probe_helper.c:drm_helper_hpd_irq_event() {
> 	struct drm_connector *connector, *first_changed_connector = NULL;
> 	struct drm_connector_list_iter conn_iter;
> 	int changed = 0;
> 
> 	if (!dev->mode_config.poll_enabled)
> 		return false;
> ...
> }
> 
> During system suspend, drm_kms_helper_poll_disable() sets poll_enabled
> to false. If an HPD interrupt fires while the system is suspended, won't
> drm_helper_hpd_irq_event() silently drop the event without updating the
> connector status or scheduling any deferred work?

No, drm_mode_config_helper_suspend/resume() will call hpd_enable/disable()
to signal when the connector/bridge should start listening for HPD. I.e.
not during suspend.

> Furthermore, when the system resumes, output_poll_execute() explicitly skips
> connectors that use the DRM_CONNECTOR_POLL_HPD flag, and the dw_hdmi resume
> handler does not appear to manually trigger a hotplug event check.
> 
> Could this result in the system being completely unaware of any display
> connections or disconnections that happened while suspended, at least until
> a manual reprobe is forced by userspace?

No, drm_mode_config_helper_resume() is called at resume.

Regards,
Jonas

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
