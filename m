Return-Path: <SRS0=ycqe=ON=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D3B6C04EB9
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Dec 2018 02:04:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 106922081C
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Dec 2018 02:04:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="u/grzNV2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 106922081C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amlogic.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=W/lfs2VnsaI9AGiEfTeqFFOCaLeP6eEizQLGw4ncVRc=; b=u/grzNV2Dn1hcOaYy60QHGj4E
	EoWGYweqt//aEBdqt/xtoG5wNlSoSWkjoutJPBT/2ASGh7BGdF5er+t1K7spfOESyPeAIIkkr61UV
	SJhKVsg/usVHQw90XD5QEGr5qnrST+jBgX2+8ZP5klFIYtp5mC30tYhw5tCMBy2ZMt+AgDUzfFK5C
	cxgxSnAU2Uph5gx+bI/nl8myYxg+HuwgzFEdK5wH3Kjxmj6MQB2FswYWDsElJD71qCYqTC5mV2/fZ
	9px1042dJgr/FZnb0cLnzIuyW4sGPfRN+HvFn1INHos2a/AU5aBQt7vMibSNj6Yq3rZVCn3cwXuCP
	bmt1zmxbg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gU04z-00029R-Do; Tue, 04 Dec 2018 02:04:53 +0000
Received: from mail-sz2.amlogic.com ([211.162.65.114])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gU04w-00028r-GL; Tue, 04 Dec 2018 02:04:51 +0000
Received: from [10.28.18.81] (10.28.18.81) by mail-sz2.amlogic.com
 (10.28.11.6) with Microsoft SMTP Server (TLS) id 15.0.1320.4; Tue, 4 Dec 2018
 10:05:00 +0800
Subject: Re: [PATCH] pinctrl: meson: fix G12A ao pull registers base address
To: Neil Armstrong <narmstrong@baylibre.com>, <linus.walleij@linaro.org>,
 <linux-gpio@vger.kernel.org>
References: <20181203030533.10989-1-xingyu.chen@amlogic.com>
 <a240773f-7b05-d950-e5e9-23d7983c7f35@baylibre.com>
From: Xingyu Chen <xingyu.chen@amlogic.com>
Message-ID: <b3ccafc4-0bd2-273b-b0b2-96bbdeb9ee1b@amlogic.com>
Date: Tue, 4 Dec 2018 10:05:00 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.2
MIME-Version: 1.0
In-Reply-To: <a240773f-7b05-d950-e5e9-23d7983c7f35@baylibre.com>
Content-Language: en-GB
X-Originating-IP: [10.28.18.81]
X-ClientProxiedBy: mail-sz2.amlogic.com (10.28.11.6) To mail-sz2.amlogic.com
 (10.28.11.6)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181203_180450_552278_7AA6F7D6 
X-CRM114-Status: GOOD (  16.87  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: robh@kernel.org, jianxin.pan@amlogic.com,
 martin.blumenstingl@googlemail.com, khilman@baylibre.com,
 linux-kernel@vger.kernel.org, carlo@caione.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 jbrunet@baylibre.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org



On 2018/12/3 18:27, Neil Armstrong wrote:
> Hi Xingyu,
> 
> 
> On 03/12/2018 04:05, Xingyu Chen wrote:
>> Since Meson G12A SoC, Introduce new ao registers AO_RTI_PULL_UP_EN_REG
>> and AO_GPIO_O.
>>
>> These bits of controlling output level are remapped to the new register
>> AO_GPIO_O, and the AO_GPIO_O_EN_N support only controlling output enable.
>>
>> These bits of controlling pull enable are remapped to the new register
>> AO_RTI_PULL_UP_EN_REG, and the AO_RTI_PULL_UP_REG support only controlling
>> pull type(up/down).
>>
>> The new layout of ao gpio/pull registers is as follows:
>> - AO_GPIO_O_EN_N        [offset: 0x9 << 2]
>> - AO_GPIO_I             [offset: 0xa << 2]
>> - AO_RTI_PULL_UP_REG    [offset: 0xb << 2]
>> - AO_RTI_PULL_UP_EN_REG [offset: 0xc << 2]
>> - AO_GPIO_O             [offset: 0xd << 2]
>>
>>  From above, we can see ao GPIO registers region has been separated by the
>> ao pull registers. In order to ensure the continuity of the region on
>> software, the ao GPIO and ao pull registers use the same base address, but
>> can be identified by the offset.
>>
>> Fixes: 29ae0952e85f ("pinctrl: meson-g12a: add pinctrl driver support")
>> Signed-off-by: Xingyu Chen <xingyu.chen@amlogic.com>
>> Signed-off-by: Jianxin Pan <jianxin.pan@amlogic.com>
>> ---
>>   drivers/pinctrl/meson/pinctrl-meson.c | 22 ++++++++++++----------
>>   1 file changed, 12 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
>> index 53d449076dee..7ff40cd7a0cb 100644
>> --- a/drivers/pinctrl/meson/pinctrl-meson.c
>> +++ b/drivers/pinctrl/meson/pinctrl-meson.c
>> @@ -31,6 +31,9 @@
>>    * In some cases the register ranges for pull enable and pull
>>    * direction are the same and thus there are only 3 register ranges.
>>    *
>> + * Since Meson G12A SoC, the ao register ranges for gpio, pull enable
>> + * and pull direction are the same, so there are only 2 register ranges.
>> + *
>>    * For the pull and GPIO configuration every bank uses a contiguous
>>    * set of bits in the register sets described above; the same register
>>    * can be shared by more banks with different offsets.
>> @@ -487,23 +490,22 @@ static int meson_pinctrl_parse_dt(struct meson_pinctrl *pc,
>>   		return PTR_ERR(pc->reg_mux);
>>   	}
>>   
>> -	pc->reg_pull = meson_map_resource(pc, gpio_np, "pull");
>> -	if (IS_ERR(pc->reg_pull)) {
>> -		dev_err(pc->dev, "pull registers not found\n");
>> -		return PTR_ERR(pc->reg_pull);
>> +	pc->reg_gpio = meson_map_resource(pc, gpio_np, "gpio");
>> +	if (IS_ERR(pc->reg_gpio)) {
>> +		dev_err(pc->dev, "gpio registers not found\n");
>> +		return PTR_ERR(pc->reg_gpio);
>>   	}
>>   
>> +	pc->reg_pull = meson_map_resource(pc, gpio_np, "pull");
>> +	/* Use gpio region if pull one is not present */
>> +	if (IS_ERR(pc->reg_pull))
>> +		pc->reg_pull = pc->reg_gpio;
>> +
>>   	pc->reg_pullen = meson_map_resource(pc, gpio_np, "pull-enable");
>>   	/* Use pull region if pull-enable one is not present */
>>   	if (IS_ERR(pc->reg_pullen))
>>   		pc->reg_pullen = pc->reg_pull;
>>   
>> -	pc->reg_gpio = meson_map_resource(pc, gpio_np, "gpio");
>> -	if (IS_ERR(pc->reg_gpio)) {
>> -		dev_err(pc->dev, "gpio registers not found\n");
>> -		return PTR_ERR(pc->reg_gpio);
>> -	}
>> -
>>   	return 0;
>>   }
>>   
>>
> Doesn't it need an update of the bindings ?
> 
> Neil
> 
Thanks, I will update it in next patch
> .
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
