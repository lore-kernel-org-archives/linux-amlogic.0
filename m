Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43402ECAAA1
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 Aug 2022 07:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0Yf3Ux/6HXeQZ1VvfiUxmpit6HuaU/9brt90twuh9HI=; b=US9s0sKNs7g2d2
	5JoTLqH/CW1EHsUkSmnLW1mJiLKJo7Dqv84eS8nj6ig45VL0/Jx0mahIXrGmgO8v0GIa//y2MK05m
	bTS9EfZYA3GWkZK2fibEz6Tv6bqITFfzBHmIOQm/TzZdOCeDC1bbK+0nQkO9h2rEAt+7hmvZLoY7v
	3y+vylUDgb8OFv6L7wYnixj+SeFJmLusf4GEzRDmCy/4nO0x5dv3/Qyn0lcwvNnZjWXzfYhCVmUTB
	lmIsuXWIm3sgBHFW5t6wRoa/A52dMjYDwooGOzirD8BR+2FhnFaskLB7DxYTlhijYeFsnskys63r6
	+yjysqK4RqJj9y7wexdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSvJX-00Ees6-Kp; Tue, 30 Aug 2022 07:05:35 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSvJ9-00EehA-QS; Tue, 30 Aug 2022 07:05:17 +0000
Received: by mail-lf1-x12e.google.com with SMTP id w8so5206290lft.12;
        Tue, 30 Aug 2022 00:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=JVbQO8NaIJX9r2XXsX5JS1XPjDhaNVf/tZE3BTjyue8=;
        b=aUvfBo7ge5wrT9PVdRa7n4WKc+KjoguCB0VGM5ArOYeVSOAtCGAZEIhVT1HktOBuXs
         xVuo8JAqwWgOvbrNiXwuPoqNnTLm8bwbpdzBVdW1XBIGIvvAobm/5fUU1DaMZxhXYMt5
         q9PRCAd0ycNSdCJ0SF3wM/sC/4Jv2wRlE5fJwmrsyHasgMrFm8hXCsm1aD90A+iBSqdp
         JGIlgxplMRXcg90us2nijNq9XvpwRKJHtXnnWe7UD0HWPdTTVSw6af7IiSvj3TkZZcSl
         I+qsTHUM5mofnppLxCg0Ch2lFK2+Sdu+1LslDLVXb/wyNEtQEALA7Ff4s3cbJgr4Eyrt
         eXOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=JVbQO8NaIJX9r2XXsX5JS1XPjDhaNVf/tZE3BTjyue8=;
        b=1tmIfD7wF002ZvJm31IrXqLKEtgrP7H3Uh5D9q50RBildx/i5wVh3/M04K6tAO843I
         N3Rw882kX994mGkYCSGcmyV8Udvpf9uHDYAAsD88PO7qsapajSkrF243rxMr8Hl5g+gA
         dv8OalY7yTZiF44e37VgLChiszGbZ6ZhnEnf35WWJrGu15YtcXfpsQQk7N+e/jpDNguy
         W8dKlgBHV2IpFF86QEcySi5FDDyN04GtXG5gDu7J4w5rxlIAFX5iflb9r0ei/ClMnsSy
         tvnvkEXcCulsAIoYs0lYUT/yLwAsdpAfr9LExVmXkZpBT+Lszg+Ip+9t7mtBFrYD7gwo
         C6FQ==
X-Gm-Message-State: ACgBeo2dXEEedk0PkWLWMtMclVUe364ZJ6QkkGLWblvI9Q5SiYryDgaZ
	IxyjdEczhY1r98XopzlQetU=
X-Google-Smtp-Source: AA6agR5cFuxjTSbp2ILQnRmRzNd5Pjxhu1SWu2c7J9+e7QO7+oxCtHIczngbO2Ls5GyWNgJnT/iQrA==
X-Received: by 2002:ac2:58d5:0:b0:48b:3a88:641 with SMTP id u21-20020ac258d5000000b0048b3a880641mr6784864lfo.421.1661843106574;
        Tue, 30 Aug 2022 00:05:06 -0700 (PDT)
Received: from ?IPV6:2001:14ba:16f3:4a00::1? (dc75zzyyyyyyyyyyyyyyt-3.rev.dnainternet.fi. [2001:14ba:16f3:4a00::1])
        by smtp.gmail.com with ESMTPSA id m20-20020a056512359400b00492d1eb41dfsm1506038lfr.240.2022.08.30.00.05.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Aug 2022 00:05:05 -0700 (PDT)
Message-ID: <b5116f19-4b00-1717-a7ff-eac988bde4a4@gmail.com>
Date: Tue, 30 Aug 2022 10:04:58 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v3 03/14] gpu: drm: simplify drivers using
 devm_regulator_*get_enable*()
Content-Language: en-US
To: Robert Foss <robert.foss@linaro.org>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <cover.1660934107.git.mazziesaccount@gmail.com>
 <3aacca7d9a0240d95dc3cf103d114b5c85392e71.1660934107.git.mazziesaccount@gmail.com>
 <CAG3jFyvQc4ZxEt8yRtiP6VAnurvfBdWzD7640DRXun+F7vDHog@mail.gmail.com>
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <CAG3jFyvQc4ZxEt8yRtiP6VAnurvfBdWzD7640DRXun+F7vDHog@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_000514_205799_F7ED0781 
X-CRM114-Status: GOOD (  22.98  )
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

On 8/29/22 17:25, Robert Foss wrote:

Thanks for the review Robert.

> Hi Matti,
> 
> On Fri, 19 Aug 2022 at 21:18, Matti Vaittinen <mazziesaccount@gmail.com> wrote:
>>
>> Simplify drivers using managed "regulator get and enable".
>>
>> meson:
>> Use the devm_regulator_get_enable_optional(). Also drop the seemingly
>> unused struct member 'hdmi_supply'.
>>
>> sii902x:
>> Simplify using devm_regulator_bulk_get_enable()
>>
>> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
>>
>> ---
>> v2 => v3:
>> No changes
>>
>> RFCv1 => v2:
>> - Change also sii902x to use devm_regulator_bulk_get_enable()
>>
>> Please note - this is only compile-tested due to the lack of HW. Careful
>> review and testing is _highly_ appreciated.
>> ---
>>   drivers/gpu/drm/bridge/sii902x.c      | 22 +++-------------------
>>   drivers/gpu/drm/meson/meson_dw_hdmi.c | 23 +++--------------------
>>   2 files changed, 6 insertions(+), 39 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
>> index 7ab38d734ad6..162f9c87eeb2 100644
>> --- a/drivers/gpu/drm/bridge/sii902x.c
>> +++ b/drivers/gpu/drm/bridge/sii902x.c
>> @@ -171,7 +171,6 @@ struct sii902x {
>>          struct drm_connector connector;
>>          struct gpio_desc *reset_gpio;
>>          struct i2c_mux_core *i2cmux;
>> -       struct regulator_bulk_data supplies[2];
>>          bool sink_is_hdmi;
>>          /*
>>           * Mutex protects audio and video functions from interfering
>> @@ -1072,6 +1071,7 @@ static int sii902x_probe(struct i2c_client *client,
>>          struct device *dev = &client->dev;
>>          struct device_node *endpoint;
>>          struct sii902x *sii902x;
>> +       static const char * const supplies[] = {"iovcc", "cvcc12"};
>>          int ret;
>>
>>          ret = i2c_check_functionality(client->adapter,
>> @@ -1122,27 +1122,13 @@ static int sii902x_probe(struct i2c_client *client,
>>
>>          mutex_init(&sii902x->mutex);
>>
>> -       sii902x->supplies[0].supply = "iovcc";
>> -       sii902x->supplies[1].supply = "cvcc12";
>> -       ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(sii902x->supplies),
>> -                                     sii902x->supplies);
>> -       if (ret < 0)
>> -               return ret;
>> -
>> -       ret = regulator_bulk_enable(ARRAY_SIZE(sii902x->supplies),
>> -                                   sii902x->supplies);
>> +       ret = devm_regulator_bulk_get_enable(dev, ARRAY_SIZE(supplies), supplies);
>>          if (ret < 0) {
>>                  dev_err_probe(dev, ret, "Failed to enable supplies");
>>                  return ret;
>>          }
>>
>> -       ret = sii902x_init(sii902x);
>> -       if (ret < 0) {
>> -               regulator_bulk_disable(ARRAY_SIZE(sii902x->supplies),
>> -                                      sii902x->supplies);
>> -       }
>> -
>> -       return ret;
>> +       return sii902x_init(sii902x);
>>   }
>>
>>   static int sii902x_remove(struct i2c_client *client)
>> @@ -1152,8 +1138,6 @@ static int sii902x_remove(struct i2c_client *client)
>>
>>          i2c_mux_del_adapters(sii902x->i2cmux);
>>          drm_bridge_remove(&sii902x->bridge);
>> -       regulator_bulk_disable(ARRAY_SIZE(sii902x->supplies),
>> -                              sii902x->supplies);
>>
>>          return 0;
>>   }
> 
> Ideally this patch would be split into two parts here, due to
> maintainership boundaries.

Ok. I will in any case respin this series when the dependency patches 
from Mark's tree have been merged to the -rc1. I can split this to 
patch/driver if it is preferred. I just though I'll decrease amount of 
mails by squashing these almost trivial changes.

> 
> For the sii902x part, please add my r-b.
> 
> Reviewed-by: Robert Foss <robert.foss@linaro.org>
Thanks.

Best Regards
  -- Matti

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

Discuss - Estimate - Plan - Report and finally accomplish this:
void do_work(int time) __attribute__ ((const));

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
