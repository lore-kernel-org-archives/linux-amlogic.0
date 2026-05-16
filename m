Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7342CD4851
	for <linux-amlogic@archiver.kernel.org>; Sat, 16 May 2026 19:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DDaivvdV6OWxBQad222eFZCKFJcz8Jh5msNqBc6Olf0=; b=HBQTy0Z2PNoO0L
	bbQYOfn+6d1mSA0+8ZWPwPBfpda9RMFTlWgT1HZc4cjYbVIg/Ygti9VD5S48gW2rgYVzX20lsaRa5
	q3wqzCLjGINMz+G7Kn6TGe+IIEdPdhhjh1opQu9KxF8SJXdMYwhl2U2Tx7kV8jP2Wt5gwSkFYzfH/
	ufBWXIVoUbKVa/T+YvzZmlJjDWjlKuZwOMxualUTIIzS0h5cfx7iV4RPc9uuFqwYXFHWAqDRnG9OV
	FvrFjEBGTs87LUdaL6j/oKpQD16ezoPoc1TgXfLTMdc0LKmdtqLcCnxKHkkS0TzKlWc7pzyG+P/tO
	Tr+WO7mAFFi9OquizAjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOL7F-0000000BQ1X-48w7;
	Sat, 16 May 2026 19:56:05 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOL7C-0000000BPz8-3XOU
	for linux-amlogic@lists.infradead.org;
	Sat, 16 May 2026 19:56:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1778961341;
 bh=7KwXbsoQkt5g3Yq+y4zPwYLzcJYd55j756I8OfP4haw=;
 b=m2kPke8l5Eqc/a7eWSK1ADZc/qi+2wGdwDYFdX8BjQPv4K3/T5eoStEqHUOLiZJ7FvkfdKSyy
 Ls0CqMOAW4Ms+ORKvEcKaBSMPjNTrE2ia8DV/Z8XljnehSCmQBMie1/dssyPDLcXmO1IawFqRbq
 kkLaure1cWqFeTohL/JSO9alTVYH1si81QHDvztTaIYvu7MQenhoJ8Npm1E5P/p46LkjkY5zzh/
 CsFfY1w7KsmN2C/D5z5CYD4cnrXVBMVFV70Sz3CADmRPHLrxkQPBJ2C92zaLhkLPmBvEeSsSBF7
 f2zUV3NSXUEu1Jz5OGRnDCnwTbVzGuoRQx/d/JrpuO5w==
X-Forward-Email-ID: 6a08cbb4c8d8ef6421a41898
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 2.8.12
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <bd537b77-405e-480e-8056-6516505ff4da@kwiboo.se>
Date: Sat, 16 May 2026 21:55:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 19/22] drm: bridge: dw_hdmi: Rework HDP and RXSENSE
 interrupt handling
To: sashiko-reviews@lists.linux.dev
Cc: neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org,
 imx@lists.linux.dev, linux-sunxi@lists.linux.dev, Frank.Li@kernel.org
References: <20260516183838.2024991-20-jonas@kwiboo.se>
 <20260516194314.4211FC19425@smtp.kernel.org>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20260516194314.4211FC19425@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260516_125604_159653_B45BC316 
X-CRM114-Status: GOOD (  24.78  )
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

On 5/16/2026 9:43 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Clearing the W1C HPD interrupt after reading the live status and setting the new polarity creates a race condition that can permanently break hotplug detection.
> --
> 
> commit 40973548d3ce7bfe1722c0d53b828f8ef0ca4d81
> Author: Jonas Karlman <jonas@kwiboo.se>
> 
> drm: bridge: dw_hdmi: Rework HDP and RXSENSE interrupt handling
> 
> This commit removes RXSENSE handling to simplify the HPD interrupt
> handling, depending instead on a delayed work to detect connection
> status or EDID changes. It also ensures the initial HPD interrupt
> polarity is based on the current HPD status.
> 
>> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> index 300dac4a6c358..39e94d22249b2 100644
>> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> 
> [ ... ]
> 
>> @@ -3060,78 +3011,29 @@ static irqreturn_t dw_hdmi_hardirq(int irq, void *dev_id)
>>  
>>  static irqreturn_t dw_hdmi_irq(int irq, void *dev_id)
>>  {
>>  	struct dw_hdmi *hdmi = dev_id;
>> -	u8 intr_stat, phy_int_pol, phy_pol_mask, phy_stat;
>> -	enum drm_connector_status status = connector_status_unknown;
>> -
>> -	intr_stat = hdmi_readb(hdmi, HDMI_IH_PHY_STAT0);
>> -	phy_int_pol = hdmi_readb(hdmi, HDMI_PHY_POL0);
>> -	phy_stat = hdmi_readb(hdmi, HDMI_PHY_STAT0);
>> -
>> -	phy_pol_mask = 0;
>> -	if (intr_stat & HDMI_IH_PHY_STAT0_HPD)
>> -		phy_pol_mask |= HDMI_PHY_HPD;
>> -	if (intr_stat & HDMI_IH_PHY_STAT0_RX_SENSE0)
>> -		phy_pol_mask |= HDMI_PHY_RX_SENSE0;
>> -	if (intr_stat & HDMI_IH_PHY_STAT0_RX_SENSE1)
>> -		phy_pol_mask |= HDMI_PHY_RX_SENSE1;
>> -	if (intr_stat & HDMI_IH_PHY_STAT0_RX_SENSE2)
>> -		phy_pol_mask |= HDMI_PHY_RX_SENSE2;
>> -	if (intr_stat & HDMI_IH_PHY_STAT0_RX_SENSE3)
>> -		phy_pol_mask |= HDMI_PHY_RX_SENSE3;
>> -
>> -	if (phy_pol_mask)
>> -		hdmi_modb(hdmi, ~phy_int_pol, phy_pol_mask, HDMI_PHY_POL0);
>> +	u8 intr_stat;
>>  
>>  	/*
>> -	 * RX sense tells us whether the TDMS transmitters are detecting
>> -	 * load - in other words, there's something listening on the
>> -	 * other end of the link.  Use this to decide whether we should
>> -	 * power on the phy as HPD may be toggled by the sink to merely
>> -	 * ask the source to re-read the EDID.
>> +	 * Interrupt generation is accomplished in the following way:
>> +	 *   interrupt = (mask == 0) && (polarity == status)
>> +	 * All interrupts are forwarded to the Interrupt Handler sticky bit
>> +	 * register ih_phy_stat0 and muted using the register ih_mute_phy_stat0.
>>  	 */
>> -	if (intr_stat &
>> -	    (HDMI_IH_PHY_STAT0_RX_SENSE | HDMI_IH_PHY_STAT0_HPD)) {
>> -		dw_hdmi_setup_rx_sense(hdmi,
>> -				       phy_stat & HDMI_PHY_HPD,
>> -				       phy_stat & HDMI_PHY_RX_SENSE);
>> -
>> -		if ((intr_stat & HDMI_IH_PHY_STAT0_HPD) &&
>> -		    (phy_stat & HDMI_PHY_HPD))
>> -			status = connector_status_connected;
>> +	intr_stat = hdmi_readb(hdmi, HDMI_IH_PHY_STAT0);
>> +	if (intr_stat & HDMI_IH_PHY_STAT0_HPD) {
>> +		enum drm_connector_status status;
>>  
>> -		if (!(phy_stat & (HDMI_PHY_HPD | HDMI_PHY_RX_SENSE)))
>> -			status = connector_status_disconnected;
>> -	}
>> +		/* Set HPD interrupt polarity based on current HPD status. */
>> +		status = dw_hdmi_phy_read_hpd(hdmi, hdmi->phy.data);
>> +		hdmi_modb(hdmi, status == connector_status_connected ?
>> +			  0 : HDMI_PHY_HPD, HDMI_PHY_HPD, HDMI_PHY_POL0);
>>  
>> -	if (status != connector_status_unknown) {
>>  		dev_dbg(hdmi->dev, "EVENT=%s\n",
>>  			status == connector_status_connected ?
>>  			"plugin" : "plugout");
>> @@ -3141,8 +3043,7 @@ static irqreturn_t dw_hdmi_irq(int irq, void *dev_id)
>>  	}
>>  
>>  	hdmi_writeb(hdmi, intr_stat, HDMI_IH_PHY_STAT0);
> 
> Can this sequence create a race condition that breaks hotplug detection?
> 
> If the HPD line toggles (for example, due to contact bounce) after
> dw_hdmi_phy_read_hpd() but before this final hdmi_writeb(), the hardware
> could generate a new interrupt and set the sticky bit again.
> 
> Since the final hdmi_writeb() writes the original intr_stat (which has the
> HPD bit set) back to the register, and the register is write-1-to-clear, it
> will clear this newly generated interrupt.

No, the sticky bit is muted, meaning that no interrupt should be generated
until this run has completed, the sticky bit is cleared and then unmuted.

Regards,
Jonas

> This could leave the driver and hardware out of sync, with the hardware
> waiting for a polarity transition that has already occurred, causing all
> future plug/unplug events to be ignored.
> 
> Should the interrupt status be cleared before reading the live state and
> updating the polarity to close this race window?
> 
>> -	hdmi_writeb(hdmi, ~(HDMI_IH_PHY_STAT0_HPD | HDMI_IH_PHY_STAT0_RX_SENSE),
>> -		    HDMI_IH_MUTE_PHY_STAT0);
>> +	hdmi_writeb(hdmi, ~HDMI_IH_PHY_STAT0_HPD, HDMI_IH_MUTE_PHY_STAT0);
>>  
>>  	return IRQ_HANDLED;
>>  }
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
