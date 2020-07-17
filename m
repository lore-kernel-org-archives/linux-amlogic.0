Return-Path: <SRS0=P5SD=A4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF65EC433E8
	for <linux-amlogic@archiver.kernel.org>; Fri, 17 Jul 2020 01:49:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DFFB2070E
	for <linux-amlogic@archiver.kernel.org>; Fri, 17 Jul 2020 01:49:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BaiEujvQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9DFFB2070E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9HBPWbHHhMhM69zM9eFxeOKKqkW/NmLqrLQelPFIODY=; b=BaiEujvQpVIG9XMNksduAYS7c
	WeSmUJnEPdxAZH4lUyecwBuPEWgoUg5qPC5VsZtfOAwK4quhADBFPj/ReI09KwWThFdAqsFn/zS2Q
	N3rgJvyJ7qb7gT0p1Jhvj66lY340xa4Pq/0zvqd7Sa5uA0a7EoN7uoQW1FVwHVtXYxMrn9K32ssFd
	LFZPA2Uk7Q/MXVJMAx2oxx/qYzvsHWk12j1J8HpGh3X2Sl9liqI8T15bggW5HolbEjjbX3FNXRC4k
	YidJ0jMp+ZZeDhnpUO/+JHlgsIfo7HLoeO5xkGsneWBvhg4tSM5YBrTF2U/TL5awz89/HhGeHfkz7
	BH+aN+eaQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jwFVB-0003gO-67; Fri, 17 Jul 2020 01:49:29 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jwFV6-0003bL-Dq; Fri, 17 Jul 2020 01:49:26 +0000
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 6E78924D9B1F4BEE533D;
 Fri, 17 Jul 2020 09:49:20 +0800 (CST)
Received: from [10.174.179.105] (10.174.179.105) by smtp.huawei.com
 (10.3.19.210) with Microsoft SMTP Server (TLS) id 14.3.487.0; Fri, 17 Jul
 2020 09:49:15 +0800
Subject: Re: [PATCH] ASoC: meson: add the missed kfree() for
 axg_card_add_tdm_loopback
To: Jerome Brunet <jbrunet@baylibre.com>, <lgirdwood@gmail.com>,
 <broonie@kernel.org>, <perex@perex.cz>, <tiwai@suse.com>,
 <khilman@baylibre.com>, <kuninori.morimoto.gx@renesas.com>
References: <20200716132558.33932-1-jingxiangfeng@huawei.com>
 <1jzh7zegfw.fsf@starbuckisacylon.baylibre.com>
From: Jing Xiangfeng <jingxiangfeng@huawei.com>
Message-ID: <5F11039A.7040308@huawei.com>
Date: Fri, 17 Jul 2020 09:49:14 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:38.0) Gecko/20100101
 Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <1jzh7zegfw.fsf@starbuckisacylon.baylibre.com>
X-Originating-IP: [10.174.179.105]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200716_214924_738963_43D4DF3F 
X-CRM114-Status: GOOD (  11.39  )
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
Cc: linux-amlogic@lists.infradead.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org



On 2020/7/16 21:29, Jerome Brunet wrote:
>
> On Thu 16 Jul 2020 at 15:25, Jing Xiangfeng <jingxiangfeng@huawei.com> wrote:
>
>> axg_card_add_tdm_loopback() misses to call kfree() in an error path. Add
>> the missed function call to fix it.
>>
>> Fixes: c84836d7f650 ("ASoC: meson: axg-card: use modern dai_link style")
>> Signed-off-by: Jing Xiangfeng <jingxiangfeng@huawei.com>
>
> Thanks for fixing this.
> Maybe it would be better to use the devm_ variant for the name instead ?

Ok, I'll send a v2 with this change.

Thanks for your review.
>
>> ---
>>   sound/soc/meson/axg-card.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/sound/soc/meson/axg-card.c b/sound/soc/meson/axg-card.c
>> index 89f7f64747cd..6eac22ba8b99 100644
>> --- a/sound/soc/meson/axg-card.c
>> +++ b/sound/soc/meson/axg-card.c
>> @@ -121,8 +121,10 @@ static int axg_card_add_tdm_loopback(struct snd_soc_card *card,
>>   		return -ENOMEM;
>>
>>   	dlc = devm_kzalloc(card->dev, 2 * sizeof(*dlc), GFP_KERNEL);
>> -	if (!dlc)
>> +	if (!dlc) {
>> +		kfree(lb->name);
>>   		return -ENOMEM;
>> +	}
>>
>>   	lb->cpus = &dlc[0];
>>   	lb->codecs = &dlc[1];
>
> .
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
