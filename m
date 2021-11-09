Return-Path: <SRS0=Jxtm=P4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9B1EC433F5
	for <linux-amlogic@archiver.kernel.org>; Tue,  9 Nov 2021 15:30:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6DF3E611CA
	for <linux-amlogic@archiver.kernel.org>; Tue,  9 Nov 2021 15:30:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6DF3E611CA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fx/npVM7VR1xsRVVlkHQMigd1DgEHM2jy0CxAlQf6Yk=; b=MTQijzs7VAco4fy0JR0pNlfNbp
	wizpf2KmdqAaOkelilKjJfZfvbiUUbWi+rf/iPuMaaH9yZhsyVwPqIgvN3jVriEJEF0QaPb9JC328
	LMsUWPJiysqAz2OeAACsox6IzPVKbm+PIVg7hxeIsdQ1x9AbGMy+yxmNbTX2EN8fPNBlbIbi9a6ei
	6FYUjfmTUmXy2oAknyCwZWwNiGnOYr0+0rlTmExKYVf+GnR5QmdKjKvgqIX/f114GwAb8yYmiNIWF
	9gx7yz3txaNl2boSJIhG+PCcEAGki29bvh2pF2lsBTj0YUTb2Z/R7Q3TbU/yjhl8l83WnkfN6l+sp
	YFFXhmXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkT4t-002ZGC-0Y; Tue, 09 Nov 2021 15:30:27 +0000
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkT4p-002ZDI-V4; Tue, 09 Nov 2021 15:30:25 +0000
Received: by mail-ot1-x334.google.com with SMTP id
 h16-20020a9d7990000000b0055c7ae44dd2so15382885otm.10; 
 Tue, 09 Nov 2021 07:30:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0WsRLZzA+8WjebZk6MQ2yQcE7NyK/cID66AG50nvoVc=;
 b=A3ZlGo23Y03n58pNlCX3VHiJ9bXqoKSn3wUaTr67d7afWz8UbNpvScGMEqMCV7Jrc3
 ok3KIcMo7mXQa1KYm88SQyBLo0JasHLfF3gsxxPQzzGiFMQNeMcepBY/b1+ABOWJccMZ
 yEwJARs6Iw9+PC8vu3aYoO+PDoqfy4XmCnc+lQ8PxgEw3H1hTiS/eJkab3JtQ+Ge3okZ
 dxe8K3sEr4J/uAUbu89GY4vZmdJOM+d1QBM1CaGyNIUQTpx8XLeV/yGVbXj7gGLELnon
 w3CNPvIQ9gEWjQ823XGQR7SbNZ35FdiaGj3qk5jRITqIIFEcdRUPOnmr6Ee5UVVT296X
 Af2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0WsRLZzA+8WjebZk6MQ2yQcE7NyK/cID66AG50nvoVc=;
 b=xwY0vFIhJagTSdIDvoHPoHXDZDV5Wbuw8mbm+y6mkIR3OaJbvSCu+tf1Zr83R5spOd
 ntvXPuNtggiQwH0A+Uc7dxQqdpem4LccfwzhCu10mwZSC2oAdtaZSff6RYyeizEBVXlq
 BTE/ebvSgHhYPACE1PZYZpGw+WVQhZtJ4janeEY85tgiQSonFDvao+ocmmKxM1nhoyfV
 iE2A3+cfTCP76A7Dc83h2nVJOa8Hnhp0sjxfObErbwzzuw9VSWLME3z8GPJvVS8G0B1m
 lqZaHpiQCXfyjvxBvXuwPrZUYmOZtW1ujU/+o2YmonQHlyG2DoDQRqb7qj3N+foniSDK
 RSmQ==
X-Gm-Message-State: AOAM531ynOaAlhjcJPJDsovPOoiZ1slcgbY51k66TgXm+LVBRbtPrUbK
 CnuRBWSlI9qs0NdcJ9lScik=
X-Google-Smtp-Source: ABdhPJxpyLpi4skiHMAK0ayI3zl7zHHQ5Xt5N5DUoX1F1aZAsG4RL86djvldh6Ns7Zr1Ru4loTZMow==
X-Received: by 2002:a9d:2ab:: with SMTP id 40mr6894622otl.208.1636471811989;
 Tue, 09 Nov 2021 07:30:11 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 f12sm3292856ote.75.2021.11.09.07.30.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Nov 2021 07:30:07 -0800 (PST)
Subject: Re: [PATCH v4 3/3] watchdog: meson_gxbb_wdt: remove stop_on_reboot
To: Art Nikpal <email2tema@gmail.com>, Neil Armstrong <narmstrong@baylibre.com>
Cc: wim@linux-watchdog.org, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-watchdog@vger.kernel.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>, Artem Lapkin <art@khadas.com>,
 Nick Xie <nick@khadas.com>, Gouwa Wang <gouwa@khadas.com>
References: <20210730041355.2810397-1-art@khadas.com>
 <20210730041355.2810397-4-art@khadas.com>
 <CAKaHn9KxZDAHdKGZg3-Pi3jZO5E3knESHCFjgaV09u5QYe074A@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <24363743-48fb-c01f-eb5d-0cd486d099f7@roeck-us.net>
Date: Tue, 9 Nov 2021 07:30:04 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAKaHn9KxZDAHdKGZg3-Pi3jZO5E3knESHCFjgaV09u5QYe074A@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211109_073024_043795_5D6FA8A8 
X-CRM114-Status: GOOD (  20.66  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 11/8/21 11:59 PM, Art Nikpal wrote:
> hi Guenter Roeck
> why still not merged to upstream ?
> 

I had asked you to provide an updated description, without the "personal
opinion" part which does not belong into a commit log. The other two
patches wait for Wim to send them upstream.

Guenter


> On Fri, Jul 30, 2021 at 12:14 PM Artem Lapkin <email2tema@gmail.com> wrote:
>>
>> Remove watchdog_stop_on_reboot()
>>
>> Meson platform still have some hardware drivers problems for some
>> configurations which can freeze device on shutdown/reboot stage and i
>> think better to have reboot warranty by default.
>>
>> I feel that it is important to keep the watchdog running during the
>> reboot sequence, in the event that an abnormal driver freezes the reboot
>> process.
>>
>> This is my personal opinion and I hope the driver authors will agree
>> with my proposal, or just ignore this commit if not.
>>
>> https://lore.kernel.org/linux-watchdog/20210729072308.1908904-1-art@khadas.com/T/#t
>>
>> Signed-off-by: Artem Lapkin <art@khadas.com>
>> ---
>>   drivers/watchdog/meson_gxbb_wdt.c | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/drivers/watchdog/meson_gxbb_wdt.c b/drivers/watchdog/meson_gxbb_wdt.c
>> index 945f5e65db57..d3c9e2f6e63b 100644
>> --- a/drivers/watchdog/meson_gxbb_wdt.c
>> +++ b/drivers/watchdog/meson_gxbb_wdt.c
>> @@ -198,7 +198,6 @@ static int meson_gxbb_wdt_probe(struct platform_device *pdev)
>>
>>          meson_gxbb_wdt_set_timeout(&data->wdt_dev, data->wdt_dev.timeout);
>>
>> -       watchdog_stop_on_reboot(&data->wdt_dev);
>>          return devm_watchdog_register_device(dev, &data->wdt_dev);
>>   }
>>
>> --
>> 2.25.1
>>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
