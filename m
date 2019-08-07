Return-Path: <SRS0=W+6h=WD=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 365C4C32751
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Aug 2019 16:11:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0956F2229C
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Aug 2019 16:11:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AlSosZtd";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="gFKlDB2I"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0956F2229C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pGHkl40SUlA6ArXXDmh3AeCpZVRnyWmbZ8JXQidCYSU=; b=AlSosZtdgQclBu
	MnD/qSmRSx8PqD9O02bL7Lq93g2KkQDbsDl+61zjDAy+mqGzHFL0CzK3WY3YvF8J2uVZhOzg9ITLt
	paBnVE54V59Dg1zA+7TRvDb4lFl7HEZaHAgEFz/j66vcJQ3I7kWy/Kkuw6Lu83ckKpR8ZFFvhDjIs
	w55KMClOzuRVKgupsoOeO+N8DNWU1l8T72AT6TbFD1e7VWm4uANyHz8ryRX59sjfx8e+QP96wz5Ml
	hLEzFNSAuE4B2li/it9c40jp2ZSE08vNNh2zkVCCrYA+Mc2lOdQdzG5nTiX6RZUgxSeFCmWD8VMsL
	OCaDuqS2hUUZLBZ5B+Ow==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hvOWh-0008WC-0y; Wed, 07 Aug 2019 16:10:59 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hvOWc-0008VN-Ot
 for linux-amlogic@lists.infradead.org; Wed, 07 Aug 2019 16:10:58 +0000
Received: by mail-wm1-x343.google.com with SMTP id s3so607966wms.2
 for <linux-amlogic@lists.infradead.org>; Wed, 07 Aug 2019 09:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=hlSWtDwSPE4Pmk3/sDtCGZsiLitnnV87ZRM8NGe3v3M=;
 b=gFKlDB2ITdLj68HNtJKA2pzG2/Sim66z+OkDewePPW0xFca+Yj18mNmLivQa1a2pf+
 47Hk5UfXXtSgliEy6sngG2otKJhcNGuFPjitwUhLB5HcRRLrQvjWQmmHzRRN0bD5MeDt
 5sP9oBoqmwhChotBfZ6QMi4hR4qt3TdUWAIRnpNdnGNW4rOYlpQ68ChOTdVOSM6qBAPc
 K6ax84orouPXP0Mr6Vhuqu6MEgqtnLXP+HVFGHevRd6Pe7miu7tsagEVCZ1Xo/a+sgkg
 7lj0GSylVy8BfjNg++PxZ8ebOq0wedQqb+MkhALM1YPg5Vihk/dyMY/UY4fqCLXyGH8t
 X+Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=hlSWtDwSPE4Pmk3/sDtCGZsiLitnnV87ZRM8NGe3v3M=;
 b=CiNo6X5HvnMOPl1M3+cbLtnM5rBhGEN1gx86s02Zrilw9Km49mHyX7tz6HbzkZiDv7
 b4ZyIeRnOwzbV/lCrBkDLX/WDG+tMWA0xTOuzu/1/VFsnIjZ3rJi9o9L+FC+Q6M6GJid
 fUrdTKBH+Gpfs/Jnz73L1IJp68zgZ1RLtquKRCN4MTkBmqQhKohzcK6vsPVY6NetLWkF
 NCL/OPH2UoPxnsimTo7IOBtnHhWqUkougaGSoYdEyEktDegXI9zm5zQ9xoNAjcDo7l1n
 d98u3HDXzahzOVGHSY1rMSP32T71XwaYRjr8zEBrz3ez2w3/bAiHEU5n3ZmAuA9jzng8
 7T3Q==
X-Gm-Message-State: APjAAAVkAXmrapGC8sVVnnvu0/21C2TfZgpkyv0vftkrnDiJ9A41WCSR
 mxMNJRMmiXqQvKVLSOH2wkzEZr+0hME=
X-Google-Smtp-Source: APXvYqynud8VhJ6A2hlYKAMd6gZnDv/ct0dk8RTh9P8YL0GThFsRGcFMNp8+zILRF+Zn5Y5aHxQP0w==
X-Received: by 2002:a1c:3d82:: with SMTP id k124mr669567wma.17.1565194247593; 
 Wed, 07 Aug 2019 09:10:47 -0700 (PDT)
Received: from localhost (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id g19sm161684633wrb.52.2019.08.07.09.10.46
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 07 Aug 2019 09:10:46 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jonas Karlman <jonas@kwiboo.se>, Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 8/8] drm/bridge: dw-hdmi-i2s: add .get_eld support
In-Reply-To: <HE1PR06MB40117A899E057B36BE461B8EACD40@HE1PR06MB4011.eurprd06.prod.outlook.com>
References: <20190805134102.24173-1-jbrunet@baylibre.com>
 <20190805134102.24173-9-jbrunet@baylibre.com>
 <HE1PR06MB40117A899E057B36BE461B8EACD40@HE1PR06MB4011.eurprd06.prod.outlook.com>
Date: Wed, 07 Aug 2019 18:10:45 +0200
Message-ID: <1jy305negq.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190807_091056_336953_466064EF 
X-CRM114-Status: GOOD (  20.57  )
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
Cc: Kevin Hilman <khilman@baylibre.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed 07 Aug 2019 at 14:57, Jonas Karlman <jonas@kwiboo.se> wrote:

> On 2019-08-05 15:41, Jerome Brunet wrote:
>> Provide the eld to the generic hdmi-codec driver.
>> This will let the driver enforce the maximum channel number and set the
>> channel allocation depending on the hdmi sink.
>>
>> Cc: Jonas Karlman <jonas@kwiboo.se>
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> ---
>>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-audio.h     |  1 +
>>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c | 10 ++++++++++
>>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c           |  1 +
>>  3 files changed, 12 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-audio.h b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-audio.h
>> index 63b5756f463b..cb07dc0da5a7 100644
>> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-audio.h
>> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-audio.h
>> @@ -14,6 +14,7 @@ struct dw_hdmi_audio_data {
>>  
>>  struct dw_hdmi_i2s_audio_data {
>>  	struct dw_hdmi *hdmi;
>> +	u8 *eld;
>>  
>>  	void (*write)(struct dw_hdmi *hdmi, u8 val, int offset);
>>  	u8 (*read)(struct dw_hdmi *hdmi, int offset);
>> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
>> index b8ece9c1ba2c..14d499b344c0 100644
>> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
>> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
>> @@ -121,6 +121,15 @@ static void dw_hdmi_i2s_audio_shutdown(struct device *dev, void *data)
>>  	dw_hdmi_audio_disable(hdmi);
>>  }
>>  
>> +static int dw_hdmi_i2s_get_eld(struct device *dev, void *data, uint8_t *buf,
>> +			       size_t len)
>> +{
>> +	struct dw_hdmi_i2s_audio_data *audio = data;
>> +
>> +	memcpy(buf, audio->eld, min(sizeof(audio->eld), len));
>
> Above sizeof does not work as intended, sizeof(audio->eld) is probably the size of a pointer and not MAX_ELD_BYTES (128),
> resulting in only part of the ELD gets copied to buf.

Silly ... thanks for pointing this out. I'll respin

>
>
> Thanks for reworking dw-hdmi multi channel lpcm support!, this works on Rockchip for most parts.
> Without the [1] patch (reset cts+n after clock is enabled) audio sometime stay silent when switching between e.g. 2ch 44.1khz and 6ch 48khz tracks.
> It is not fully clear to me why reset cts+n helps, if that have
> negative affects on other platforms or if there is another way to
> solve loosing audio.

I did not see that issue my self but I guess could propose this change ?

>
> I also have a small issue with the channel allocation being selected by hdmi-codec, my soundbar reports LPCM 6.1ch instead of LPCM 7.1ch when I play a 7.1ch speaker test clip.
> I have a hdmi-codec patch to fix selection of channel allocation in
> queue.

Yes, I know there is still a few problems around that and stale eld.
But those problem are not really coming from the i2s interface of the
dw-hdmi itself and should be dealt with separatly.

This is just the beginning ;)

>
>
> For patch 1-7:
>
> Reviewed-by: Jonas Karlman <jonas@kwiboo.se>
>
>
> [1] https://github.com/Kwiboo/linux-rockchip/commit/c0839e874f843ad173ddde958303d6878394ef92
>
> Regards,
> Jonas
>
>> +	return 0;
>> +}
>> +
>>  static int dw_hdmi_i2s_get_dai_id(struct snd_soc_component *component,
>>  				  struct device_node *endpoint)
>>  {
>> @@ -144,6 +153,7 @@ static int dw_hdmi_i2s_get_dai_id(struct snd_soc_component *component,
>>  static struct hdmi_codec_ops dw_hdmi_i2s_ops = {
>>  	.hw_params	= dw_hdmi_i2s_hw_params,
>>  	.audio_shutdown	= dw_hdmi_i2s_audio_shutdown,
>> +	.get_eld	= dw_hdmi_i2s_get_eld,
>>  	.get_dai_id	= dw_hdmi_i2s_get_dai_id,
>>  };
>>  
>> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> index bed4bb017afd..8df69c9dbfad 100644
>> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> @@ -2797,6 +2797,7 @@ __dw_hdmi_probe(struct platform_device *pdev,
>>  		struct dw_hdmi_i2s_audio_data audio;
>>  
>>  		audio.hdmi	= hdmi;
>> +		audio.eld	= hdmi->connector.eld;
>>  		audio.write	= hdmi_writeb;
>>  		audio.read	= hdmi_readb;
>>  		hdmi->enable_audio = dw_hdmi_i2s_audio_enable;

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
