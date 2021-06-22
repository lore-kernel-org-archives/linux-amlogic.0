Return-Path: <SRS0=yQOf=LQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E55E1C2B9F4
	for <linux-amlogic@archiver.kernel.org>; Tue, 22 Jun 2021 12:44:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9FF6260FF2
	for <linux-amlogic@archiver.kernel.org>; Tue, 22 Jun 2021 12:44:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9FF6260FF2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=UMCCi6O3u40rJSqUriSfEFdbIxKW1XRs78jFBqhL1K4=; b=GYAcNJSB18iKKdHmdLbi44xBtN
	ESbmq//GC5iVMuyU7Md0DcesX2gTKjUJlxNNeM9UshJSnne9g/RdDlQCBsfPHmry2KAHCsnKS1L/j
	1iKYUhcEVEmQXA/jCyWfmJNtm6aczgzRncHX5eDAk/8Q8AqdF5Nrt1P9hdqJvPrlXyn0W2oC7pD1v
	w8WMGgjXXTGnrLox9sEpyUcZliWSQvNDzJnTCZ1jUD/3XPr0B6wCxLEnPQ/PRfc2kWMVeTHM02NNP
	2N+V2AMjl+z90IssTOitaz+mPJbf90I4Gyfy1fIA6PfSAb4PvuTjacS2TgG3NsjcmM7b7mhPh4wsL
	4HIkZvXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvfl5-007CeP-Px; Tue, 22 Jun 2021 12:44:03 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvfkr-007CZz-0v
 for linux-amlogic@lists.infradead.org; Tue, 22 Jun 2021 12:43:51 +0000
Received: by mail-wm1-x331.google.com with SMTP id
 h21-20020a1ccc150000b02901d4d33c5ca0so2166764wmb.3
 for <linux-amlogic@lists.infradead.org>; Tue, 22 Jun 2021 05:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IWa3yvDMZC05F09Gb0TJwUqbgaqCJLtXoPOpUHqNy40=;
 b=HIImoI6qMkUOuMDOIfq/jhmSoNcFXAmToJNHbsufhKclBs5xgHEnnOOELPRwTvhbOD
 VGcrS0iSnncjUBPRUPCzW8VXUVo3VPyeqQH2WcXv7uWsaHfjt6DBXYXVlky5ME0XbhiW
 paEkYrxZk094FkBS2Wqkc5US86GnxzUJaj8wr0ATVa6Gc1wgC1wjisOCaIBdIeKFhaDW
 h+d6BeC4Ebo+XqYmQGQ5FyayvodsGiLbwrtOb3Nl5VB/jFq5R2FjJxWYCIQLzd3VrRK6
 FdZuOINbex9KtjIegfbcb3xW5hzoSHANtmujLhsTdltypEBwM5MqocIBRSvPTszZiqyo
 kExw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=IWa3yvDMZC05F09Gb0TJwUqbgaqCJLtXoPOpUHqNy40=;
 b=M474AqmOU0rwhIHFMc62mEHANKOPhcNrhIUpWbY3nH5aCZy3eMCgJpzUtXHdNwqfSE
 wcdkPhmbgECRJkO9k3iGW2bbFtxyxR9AWcFsVDdjhu3gWWjSm9FgTrzN6mNXst70MAVW
 n0Cm7rrx2TBcAOk1/cZytP7ksaEAk7qvpzv9TyrHp0Cq01FfH1S6hKNco0Df+OwEgv/X
 vbw9lkDAo8bJ7abZMDniDGGMVwzcWnrvjFcTPUNmK8xtEQ/gZWJcIVeHT92uhyYEoIe3
 m91e3bNEYhPTlbTSfDR+6ejRTE/ZOrsff5fCQ3Sid2D0EBODD//0JCSJ0EXbF0jchjhs
 s5dw==
X-Gm-Message-State: AOAM5329ER0Mqf6BIweyLEZ4uhCBL5OR7K+JiFww0wrLtHcTM47Gbdiw
 L0pofngpuw6jlVYz4zvaVXZlSg==
X-Google-Smtp-Source: ABdhPJy5rQuRGuARhz/vMpwS+ZMRIV5SVmAckD49snpPgMD2hPstEquQIk0YQn0Zld5AvrodGx2snQ==
X-Received: by 2002:a7b:cb1a:: with SMTP id u26mr4283571wmj.125.1624365827472; 
 Tue, 22 Jun 2021 05:43:47 -0700 (PDT)
Received: from ?IPv6:2001:861:44c0:66c0:b049:62d0:2ee2:34f7?
 ([2001:861:44c0:66c0:b049:62d0:2ee2:34f7])
 by smtp.gmail.com with ESMTPSA id s16sm9517373wrm.36.2021.06.22.05.43.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jun 2021 05:43:47 -0700 (PDT)
Subject: Re: [PATCH] watchdog: meson_gxbb_wdt: improve
To: Art Nikpal <email2tema@gmail.com>
Cc: wim@linux-watchdog.org, linux@roeck-us.net,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-watchdog@vger.kernel.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 linux-kernel@vger.kernel.org, Artem Lapkin <art@khadas.com>,
 Nick Xie <nick@khadas.com>, Gouwa Wang <gouwa@khadas.com>
References: <20210622095639.1280774-1-art@khadas.com>
 <bfa12322-bc49-2337-2988-199e87e34b87@baylibre.com>
 <CAKaHn9JpH2Yh-1njO6jEnFeu-GMhbonftN=-VXdbvjdug16qHA@mail.gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <0d5e53b2-873e-0ffa-32eb-87e96b51e263@baylibre.com>
Date: Tue, 22 Jun 2021 14:43:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAKaHn9JpH2Yh-1njO6jEnFeu-GMhbonftN=-VXdbvjdug16qHA@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210622_054349_192491_182C5951 
X-CRM114-Status: GOOD (  17.73  )
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

Hi,

On 22/06/2021 13:53, Art Nikpal wrote:
>> Neil
>> Can you split the patch in 4 distinct changes ?
> 
> yes  no problem i can try to do it tomorrow !
> maybe somebody have other ideas, suggestion, comments ...

The changeset is clean, and overall I'm ok with the changes, but I'm pretty sure the wdt maintainers
will prefer separate changes in order to comment of each.
Neil

> 
> 
> On Tue, Jun 22, 2021 at 7:08 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>>
>> Hi Art,
>>
>> On 22/06/2021 11:56, Artem Lapkin wrote:
>>> Improve meson_gxbb_wdt watchdog driver
>>> 1) added module param timeout and nowayout same as other modules
>>> 2) print watchdog driver start status
>>> 3) add watchdog_stop_on_unregister
>>> 4) remove watchdog_stop_on_reboot ( still can be activated by
>>> watchdog.stop_on_reboot=1 ) i think this driver configuration more useful
>>> becouse we can get reboot waranty for abnormal situations on shutdown stage
>>
>> Can you split the patch in 4 distinct changes ?
>>
>> Neil
>>
>>>
>>> Signed-off-by: Artem Lapkin <art@khadas.com>
>>> ---
>>>  drivers/watchdog/meson_gxbb_wdt.c | 20 ++++++++++++++++++--
>>>  1 file changed, 18 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/watchdog/meson_gxbb_wdt.c b/drivers/watchdog/meson_gxbb_wdt.c
>>> index 5a9ca10fbcfa..15c889932c13 100644
>>> --- a/drivers/watchdog/meson_gxbb_wdt.c
>>> +++ b/drivers/watchdog/meson_gxbb_wdt.c
>>> @@ -35,6 +35,17 @@ struct meson_gxbb_wdt {
>>>       struct clk *clk;
>>>  };
>>>
>>> +static bool nowayout = WATCHDOG_NOWAYOUT;
>>> +static unsigned int timeout = DEFAULT_TIMEOUT;
>>> +
>>> +module_param(nowayout, bool, 0);
>>> +MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started default="
>>> +                     __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
>>> +
>>> +module_param(timeout, uint, 0);
>>> +MODULE_PARM_DESC(timeout, "Watchdog heartbeat in seconds="
>>> +                     __MODULE_STRING(DEFAULT_TIMEOUT) ")");
>>> +
>>>  static int meson_gxbb_wdt_start(struct watchdog_device *wdt_dev)
>>>  {
>>>       struct meson_gxbb_wdt *data = watchdog_get_drvdata(wdt_dev);
>>> @@ -174,7 +185,7 @@ static int meson_gxbb_wdt_probe(struct platform_device *pdev)
>>>       data->wdt_dev.ops = &meson_gxbb_wdt_ops;
>>>       data->wdt_dev.max_hw_heartbeat_ms = GXBB_WDT_TCNT_SETUP_MASK;
>>>       data->wdt_dev.min_timeout = 1;
>>> -     data->wdt_dev.timeout = DEFAULT_TIMEOUT;
>>> +     data->wdt_dev.timeout = timeout;
>>>       watchdog_set_drvdata(&data->wdt_dev, data);
>>>
>>>       /* Setup with 1ms timebase */
>>> @@ -186,7 +197,12 @@ static int meson_gxbb_wdt_probe(struct platform_device *pdev)
>>>
>>>       meson_gxbb_wdt_set_timeout(&data->wdt_dev, data->wdt_dev.timeout);
>>>
>>> -     watchdog_stop_on_reboot(&data->wdt_dev);
>>> +     watchdog_set_nowayout(&data->wdt_dev, nowayout);
>>> +     watchdog_stop_on_unregister(&data->wdt_dev);
>>> +
>>> +     dev_info(dev, "Watchdog enabled (timeout=%d sec, nowayout=%d)",
>>> +             data->wdt_dev.timeout, nowayout);
>>> +
>>>       return devm_watchdog_register_device(dev, &data->wdt_dev);
>>>  }
>>>
>>>
>>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
