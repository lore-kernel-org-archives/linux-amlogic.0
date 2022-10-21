Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 069CEC433FE
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Oct 2022 15:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xZhTRx0CLkprTABLrV/OWTHEB1XKwuImcDdjuq9oQdU=; b=wplwXsEY1JZ6yYdA4zzJyqFodH
	EJWHgEfB29uoGuhWFCYDPrvGlN/s901XVAMWUePSQyaNoGKbHIfwamYo6GuE8D655nhAN98bvyh2l
	4NyfNtafmJ/CkZ3FFqoxcVwy8z8HLuZ6zRYg77ksPrxDVbt2aVLcPVVWLyBvIg4IXhICIQuKkgbVY
	6yITSXKuuU/y5++CXi5CEa27/nR59sqss7bB9OoBwWb2KV+bbY/x+3Uz9ITlJVWqIZyKUxRg5zU4B
	DDd5TaCz4GrEGkwghbGoNoDcUsspQ3yTfSV3gTF7ka90KTb8DjqIkRkSyrfWMXGEvwvGc1WwphLBA
	lFFkGJgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oltxc-008gY2-Uv; Fri, 21 Oct 2022 15:29:24 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oltxa-008gWk-4q
	for linux-amlogic@lists.infradead.org; Fri, 21 Oct 2022 15:29:23 +0000
Received: by mail-wm1-x32d.google.com with SMTP id o20-20020a05600c4fd400b003b4a516c479so2244313wmq.1
        for <linux-amlogic@lists.infradead.org>; Fri, 21 Oct 2022 08:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VjZxqVwknh6rTHyizGvNMyan0rBuejjdovMyQ+KXz6Q=;
        b=PfPlpxaVD69iC/kMSPtqV9m9Du/JKNf7gFs5X95GrddDoi1ivdQq87vRJFCdd0tIfe
         sVLYLMgrAJivtuNepJjbZ9Kv2Y7qDv1O9aNJkguzTr71vYgfiokWBGqfIrpQOlZ+rBXN
         2j1SjU2b4QmBF4AYzpwJ2kPxQXtba+pevjuJFsjQMs/XUKcm82ZDo7Kf4hknClSlAhHW
         c1ClsChKLy2T7AP/QqyslmZFoI7DHKpGl3loWynWDI7ViI7tpRsH4sjT7cgGJAJ7QDwz
         YKqhaXvdcYV0zSEw28FabJn7IFk9Vy3cVWANB55q8PsvgF+tgLBN4WQSWET8xUuhb0kD
         QGOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VjZxqVwknh6rTHyizGvNMyan0rBuejjdovMyQ+KXz6Q=;
        b=pY4xAt3BuxcqL3LFnJM6j+mcyWJ7CuB304mw/jgXQOlbpZOeIJITJKQT0NhNUlDBNw
         J4iCiQr37TqaI/GM7qUlUe94zPCOvS9uWPCE162xa9uSK3ZnqTwSRwXWPfy58nMJzouv
         v5k7rUXCajFjQ7nkKr395ifSm7fCd6mYCPtv1lI+IRzu17ckv9k6azNIARAXMmkniWx2
         HaJVaHFl8zqz1GwWoxZXXX7fCzQQdckN8F5LjZqeuKUaczXAyL4FjIRpXh8ZGwwEyx9D
         +1qRD0F9d2N2h4BJi1n7dkSW5Ofdvx/x+epem7NIcPC4BIPvJIrjCUat6nxxNzsK+xyd
         Kuvw==
X-Gm-Message-State: ACrzQf1/Gvh7pmZWukpDDvvj6UY4TefOMw1istsC3D22FhKlAsoI7mq5
	2HaWL7h35z8mpP6BthbwZiGmEg==
X-Google-Smtp-Source: AMsMyM4hXGO9U8al2JzyTEC39tKZD6qIgNLNXyIQi+DLXxN292zU+X+E3Bq7kmxXYB+Xrq4wIyj8gg==
X-Received: by 2002:a05:600c:1614:b0:3c6:ca05:3e02 with SMTP id m20-20020a05600c161400b003c6ca053e02mr35430814wmn.116.1666366158507;
        Fri, 21 Oct 2022 08:29:18 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:8104:adb4:5d77:2050? ([2a01:e0a:982:cbb0:8104:adb4:5d77:2050])
        by smtp.gmail.com with ESMTPSA id b21-20020a05600c4e1500b003a83ca67f73sm3060390wmq.3.2022.10.21.08.29.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Oct 2022 08:29:18 -0700 (PDT)
Message-ID: <00d90039-c38a-ad8a-80a1-5a654a528756@linaro.org>
Date: Fri, 21 Oct 2022 17:29:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 1/4] gpu: drm: meson: Use devm_regulator_*get_enable*()
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss
 <robert.foss@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-hwmon@vger.kernel.org
References: <cover.1666357434.git.mazziesaccount@gmail.com>
 <c14058c4b7018556a78455ffef484a7ebe4d8ea2.1666357434.git.mazziesaccount@gmail.com>
 <Y1K0h4De8UsZJE7W@pendragon.ideasonboard.com>
Organization: Linaro Developer Services
In-Reply-To: <Y1K0h4De8UsZJE7W@pendragon.ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221021_082922_230112_CC482389 
X-CRM114-Status: GOOD (  19.93  )
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

On 21/10/2022 17:02, Laurent Pinchart wrote:
> Hi Matti,
> 
> On Fri, Oct 21, 2022 at 04:18:01PM +0300, Matti Vaittinen wrote:
>> Simplify using the devm_regulator_get_enable_optional(). Also drop the
>> seemingly unused struct member 'hdmi_supply'.
>>
>> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
>>
>> ---
>> v3 => v4:
>> - split meson part to own patch
>>
>> RFCv1 => v2:
>> - Change also sii902x to use devm_regulator_bulk_get_enable()
>>
>> Please note - this is only compile-tested due to the lack of HW. Careful
>> review and testing is _highly_ appreciated.
>> ---
>>   drivers/gpu/drm/meson/meson_dw_hdmi.c | 23 +++--------------------
>>   1 file changed, 3 insertions(+), 20 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
>> index 5cd2b2ebbbd3..7642f740272b 100644
>> --- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
>> +++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
>> @@ -140,7 +140,6 @@ struct meson_dw_hdmi {
>>   	struct reset_control *hdmitx_apb;
>>   	struct reset_control *hdmitx_ctrl;
>>   	struct reset_control *hdmitx_phy;
>> -	struct regulator *hdmi_supply;
>>   	u32 irq_stat;
>>   	struct dw_hdmi *hdmi;
>>   	struct drm_bridge *bridge;
>> @@ -665,11 +664,6 @@ static void meson_dw_hdmi_init(struct meson_dw_hdmi *meson_dw_hdmi)
>>   
>>   }
>>   
>> -static void meson_disable_regulator(void *data)
>> -{
>> -	regulator_disable(data);
>> -}
>> -
>>   static void meson_disable_clk(void *data)
>>   {
>>   	clk_disable_unprepare(data);
>> @@ -723,20 +717,9 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
>>   	meson_dw_hdmi->data = match;
>>   	dw_plat_data = &meson_dw_hdmi->dw_plat_data;
>>   
>> -	meson_dw_hdmi->hdmi_supply = devm_regulator_get_optional(dev, "hdmi");
>> -	if (IS_ERR(meson_dw_hdmi->hdmi_supply)) {
>> -		if (PTR_ERR(meson_dw_hdmi->hdmi_supply) == -EPROBE_DEFER)
>> -			return -EPROBE_DEFER;
>> -		meson_dw_hdmi->hdmi_supply = NULL;
>> -	} else {
>> -		ret = regulator_enable(meson_dw_hdmi->hdmi_supply);
>> -		if (ret)
>> -			return ret;
>> -		ret = devm_add_action_or_reset(dev, meson_disable_regulator,
>> -					       meson_dw_hdmi->hdmi_supply);
>> -		if (ret)
>> -			return ret;
>> -	}
>> +	ret = devm_regulator_get_enable_optional(dev, "hdmi");
>> +	if (ret != -ENODEV)
>> +		return ret;
> 
> As noted in the review of the series that introduced
> devm_regulator_get_enable_optional(), the right thing to do is to
> implement runtime PM in this driver to avoid wasting power.

While I agree, it's not really the same level of effort as this patch
should be functionally equivalent.

> 
>>   
>>   	meson_dw_hdmi->hdmitx_apb = devm_reset_control_get_exclusive(dev,
>>   						"hdmitx_apb");
> 

Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
