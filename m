Return-Path: <SRS0=5/HF=WK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0B7BC433FF
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 Aug 2019 13:05:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7449620679
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 Aug 2019 13:05:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HdcNpiUJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="nbpRDK49"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7449620679
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HCHAJ7ac4J/PGUzv4j3RQry4Q0rrBxI0CdO4g9IO1DA=; b=HdcNpiUJMiFrIS
	1q+eX/b/fW1ngU2vsWhviHHbm0PustDoQCxzzAx6ShFenofpatZl0e4JF2ambcYG7NJYTOxwowUxy
	dcJ55xEW3EmLdzgb+xhpodnWTAXAqfDdl8exRYrBeRMn177gAwihcY2GUyhkpdf5MVkHXZ75mFJsN
	W978zawAuswAf5E8tLHhArDAxug/X061ld2mwCHZPBUsuLEGmZK82QNgM77RzemAlUDW9UkgFjpWA
	vkOkx7JgJn7vm5zSbZm2f5jAxsyanJNMx4qXqa7792g3txb51JjQQ7prBGAuJI2xxJGG7QCNqadOT
	+afdBpvpnCi/LBAI8oqg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hxsy0-0004Bh-Ku; Wed, 14 Aug 2019 13:05:28 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hxsxx-0004B3-8k
 for linux-amlogic@lists.infradead.org; Wed, 14 Aug 2019 13:05:27 +0000
Received: by mail-wm1-x342.google.com with SMTP id v15so4551724wml.0
 for <linux-amlogic@lists.infradead.org>; Wed, 14 Aug 2019 06:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=M+bsaaj2Ga3pu54AXXWmjUL9rt0aOPiQ8+nmUAYP/oo=;
 b=nbpRDK49g152oiOfCiNOvpc8Xyb0NVveg6zO5IZoCXWTGnhF5WyPC2EVBHrvcNUByM
 YVhSlop3nu73jfRhhMVu6+GjpXV3j1gHmSp56U3D/SOUIp/sc3lAEpwSLaHNmFPyFYys
 /yUStabo0PVcdc4lOmVC/ven7/oueuzNavKNn/mTHeglf2eV+DAcmz72gUAvKxhEnB1l
 +1ZCQVH3TqlR00l//I33lZ48X2k6FoiK+c7DRumRF+jkEGa9LGJphD6fZ45Yj5fM+HjP
 Ndy0AleDsJiEZGc6B1TEgbyvqkm2vNCxlHjLlu+iDhOFtDDpI9xVwbR5CUg3T+YFsYef
 Yqqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=M+bsaaj2Ga3pu54AXXWmjUL9rt0aOPiQ8+nmUAYP/oo=;
 b=TLOsIWV7YHMOCLe+YurrtCn4jygLhp6B56fZn/cqMAXfsXr7TaZs8mvjb6vT5oWdte
 15IhRdJZReTt5KEzQAC477i8ymVV6w/iqd9hDVXVriVooEC4dzLQmgiNp7RAPeaBfG1w
 SsCEfwqAxhGeq3qP2YKkxOpN4QtW6qxudSiI5Zv4aVAiEqsWgbrYK2PKndOwlUvURRwB
 TWXie3hBpaMByoKckDUpwI3ZLkj8gXdspajs3Fw9LtKFNmS6e934K0aAsPNiqXPgySoR
 8d6pe7mRQj/nFEiw5fCaswTflu6h42FeD+M3bXEJqMw1kUNr/wJo9uZpaOw1VClSgVYQ
 96fw==
X-Gm-Message-State: APjAAAX90nt1cY+AvYyXEl6qVechgd35eKFmPnN8sv36DosbHcaWGeud
 HG+bUcu88NRKAQKa5d2oyAeF9d787CXUGA==
X-Google-Smtp-Source: APXvYqy10CnrbQvDKrugAMRXObfhKdfwxrWL6zxEBkTn3rd9eMZZ4hUmo/ZW5cI89g0Uhn0JznfpUg==
X-Received: by 2002:a1c:3945:: with SMTP id g66mr8117096wma.139.1565787923452; 
 Wed, 14 Aug 2019 06:05:23 -0700 (PDT)
Received: from [192.168.1.62] (176-150-251-154.abo.bbox.fr. [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id
 x20sm242194564wrg.10.2019.08.14.06.05.21
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 14 Aug 2019 06:05:22 -0700 (PDT)
Subject: Re: [RESEND PATCH v2 8/8] drm/bridge: dw-hdmi-i2s: add .get_eld
 support
To: Jonas Karlman <jonas@kwiboo.se>, Jerome Brunet <jbrunet@baylibre.com>,
 Andrzej Hajda <a.hajda@samsung.com>
References: <20190812120726.1528-9-jbrunet@baylibre.com>
 <20190812125016.20169-1-jbrunet@baylibre.com>
 <HE1PR06MB401112DA555C49332C968D50ACAD0@HE1PR06MB4011.eurprd06.prod.outlook.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <54dc4ee1-3e1c-8393-e90d-aef0f5a07eeb@baylibre.com>
Date: Wed, 14 Aug 2019 15:05:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <HE1PR06MB401112DA555C49332C968D50ACAD0@HE1PR06MB4011.eurprd06.prod.outlook.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190814_060525_384869_1B51B570 
X-CRM114-Status: GOOD (  17.88  )
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

On 14/08/2019 12:08, Jonas Karlman wrote:
> On 2019-08-12 14:50, Jerome Brunet wrote:
>> Provide the eld to the generic hdmi-codec driver.
>> This will let the driver enforce the maximum channel number and set the
>> channel allocation depending on the hdmi sink.
>>
>> Cc: Jonas Karlman <jonas@kwiboo.se>
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> 
> Tested on Rockchip RK3288/RK3328 devices, full ELD is now available to userspace.
> Please note that the r-b line in patch 2 is mixed in middle of commit message.
> 
> Reviewed-by: Jonas Karlman <jonas@kwiboo.se>
> 
> Regards,
> Jonas
> 
>> ---
>>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-audio.h     |  1 +
>>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c | 11 +++++++++++
>>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c           |  1 +
>>  3 files changed, 13 insertions(+)
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
>> index b8ece9c1ba2c..1d15cf9b6821 100644
>> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
>> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
>> @@ -10,6 +10,7 @@
>>  #include <linux/module.h>
>>  
>>  #include <drm/bridge/dw_hdmi.h>
>> +#include <drm/drm_crtc.h>
>>  
>>  #include <sound/hdmi-codec.h>
>>  
>> @@ -121,6 +122,15 @@ static void dw_hdmi_i2s_audio_shutdown(struct device *dev, void *data)
>>  	dw_hdmi_audio_disable(hdmi);
>>  }
>>  
>> +static int dw_hdmi_i2s_get_eld(struct device *dev, void *data, uint8_t *buf,
>> +			       size_t len)
>> +{
>> +	struct dw_hdmi_i2s_audio_data *audio = data;
>> +
>> +	memcpy(buf, audio->eld, min_t(size_t, MAX_ELD_BYTES, len));
>> +	return 0;
>> +}
>> +
>>  static int dw_hdmi_i2s_get_dai_id(struct snd_soc_component *component,
>>  				  struct device_node *endpoint)
>>  {
>> @@ -144,6 +154,7 @@ static int dw_hdmi_i2s_get_dai_id(struct snd_soc_component *component,
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
> 

Applying the whole serie, with this resent patch 8 and the patch 2 commit log
fixed to drm-misc-next.

Thanks,

Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
