Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D10F6CD4F3C
	for <linux-amlogic@archiver.kernel.org>; Sat, 16 May 2026 19:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E80HnWderDOCBtrhfTfDxWYYuw0W7Y+YQ1cPAxsHJMY=; b=vPnOPuXZoytbRh
	zmoZ3ocIvjx2aSZbpnFxyxvEdFirv45jc5W6fIXNH3p8Yrl4GKwv/TXk7q/fJrW7+Aw/MW/3hULy+
	ccO10PGqpj3JbH7nC14Kxh8knDafHDYsZ9IdE/8Ge3Ox8hRT3RJCtO16vpVW1wBXtLFiqqX8WHG70
	nxc+wRIrFtqGz8F2nXZUoPRtvTtYWFmMfqMoihGZOi/qlzH8+GSL6oCbPPCY0tBeVDf53QakEbCU/
	YE1PqpXUPC8RclPY2AxPzDzUuDruqqRKwdTqsT4XZRKfbVQ1OyNLxAck4Gw0JRYapfI7031wcOnkI
	wcBRi5NTLBGMvVo6ScHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOKRJ-0000000BL9F-1DyN;
	Sat, 16 May 2026 19:12:45 +0000
Received: from smtp.forwardemail.net ([121.127.44.66])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOKRE-0000000BL8F-13ca
	for linux-amlogic@lists.infradead.org;
	Sat, 16 May 2026 19:12:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1778958756;
 bh=YHX7S/DsNwm3hpSpTHdSzp6yqTOTSjeCJp/lmLO+M4A=;
 b=Vjdwry1HWRJxWagtQCUxn0mRzuJaAkMMa2PWMRa8u4FsfQ+6/CcjPXY8D8ovt/AeZRxDDW+4v
 YntlnYRCkL4pjt10mwYT2JGdOIuxfFRIXz+eFUrF7yz1PrqRTJGZWFpjRyKGxFjC7x5gTvwoKbp
 pP62y10ZgbrT0CsWkYJQ++E2VvzIVL9JYm0R8d1DZ4FIOWg+/flKsh5RH94n4a2zoiTOOAfBN2c
 tQZyW6b1NZKXV0Wz8d+SxfyprdOijrN9AHjNpC8XiXYXxNLHHZAAJu5FRqrvHz6C2DP813ysBqG
 UvD/hNBbQpmyope+HhRv+WPjEbBg0XGGcl/ls+QgqFfw==
X-Forward-Email-ID: 6a08c19e5c12e46019b1e950
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.66
X-Forward-Email-Version: 2.8.12
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <7122628f-a397-4407-86c7-a3612dc67cb4@kwiboo.se>
Date: Sat, 16 May 2026 21:12:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 09/22] drm: bridge: dw_hdmi: Invalidate CEC phys addr
 from connector detect
To: sashiko-reviews@lists.linux.dev
Cc: neil.armstrong@linaro.org, linux-sunxi@lists.linux.dev,
 imx@lists.linux.dev, linux-amlogic@lists.infradead.org, Frank.Li@kernel.org
References: <20260516183838.2024991-10-jonas@kwiboo.se>
 <20260516190705.AEFC3C19425@smtp.kernel.org>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20260516190705.AEFC3C19425@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260516_121242_740081_3F43F8B7 
X-CRM114-Status: GOOD (  19.60  )
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

On 5/16/2026 9:07 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Moving CEC physical address invalidation exclusively to dw_hdmi_connector_detect breaks CEC functionality when dw_hdmi operates purely as a DRM bridge.
> --
> 
> commit 05206110d2cbe02dc5e2cae3b6c3e7d2d8cdbe48
> Author: Jonas Karlman <jonas@kwiboo.se>
> Subject: drm: bridge: dw_hdmi: Invalidate CEC phys addr from connector detect
> 
> This commit delays the CEC physical address invalidation from the IRQ
> handler until the connector detect operation is called.
> 
>> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> index 5fd26ff8f55b4..aae1b890167b1 100644
>> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> @@ -2472,7 +2472,17 @@ dw_hdmi_connector_detect(struct drm_connector *connector, bool force)
>>  {
>>  	struct dw_hdmi *hdmi = container_of(connector, struct dw_hdmi,
>>  					     connector);
>> -	return dw_hdmi_detect(hdmi);
>> +	enum drm_connector_status status;
>> +
>> +	status = dw_hdmi_detect(hdmi);
>> +
>> +	if (status == connector_status_disconnected) {
>> +		mutex_lock(&hdmi->cec_notifier_mutex);
>> +		cec_notifier_phys_addr_invalidate(hdmi->cec_notifier);
>> +		mutex_unlock(&hdmi->cec_notifier_mutex);
>> +	}
>> +
>> +	return status;
>>  }
> 
> Does moving the invalidation exclusively to dw_hdmi_connector_detect break
> CEC functionality when the hardware operates purely as a DRM bridge?

No, hdmi->cec_notifier is going to be NULL when the hardware operates
purely as a DRM bridge, CEC notifier was only created for the dw-hdmi
connector prior to this series.

Regards,
Jonas

> Before this change, cec_notifier_phys_addr_invalidate was called directly
> from the hardware interrupt handler, guaranteeing execution on disconnect
> regardless of how the driver was configured.
> 
> In bridge-only mode, the connector is created externally and
> dw_hdmi_connector_detect is never executed. The DRM core or downstream
> component instead calls dw_hdmi_bridge_detect, which was not updated here
> to include the CEC invalidation logic. The CEC physical address might not
> be invalidated on unplug in bridge mode, which would be a regression.
> 
> I see this is addressed later in the series by commit 795c172faddab (drm:
> bridge: dw_hdmi: Update EDID and CEC phys addr in bridge detect()), but
> this intermediate patch appears to introduce a functional regression that
> might affect bisection.
> 
> [ ... ]
> 
>> @@ -3106,12 +3116,6 @@ static irqreturn_t dw_hdmi_irq(int irq, void *dev_id)
>>  				       phy_stat & HDMI_PHY_HPD,
>>  				       phy_stat & HDMI_PHY_RX_SENSE);
>>  
>> -		if ((phy_stat & (HDMI_PHY_RX_SENSE | HDMI_PHY_HPD)) == 0) {
>> -			mutex_lock(&hdmi->cec_notifier_mutex);
>> -			cec_notifier_phys_addr_invalidate(hdmi->cec_notifier);
>> -			mutex_unlock(&hdmi->cec_notifier_mutex);
>> -		}
>> -
>>  		if ((intr_stat & HDMI_IH_PHY_STAT0_HPD) &&
>>  		    (phy_stat & HDMI_PHY_HPD))
>>  			status = connector_status_connected;
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
