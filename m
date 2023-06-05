Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DB7CC7EE2A
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Jun 2023 07:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4IcJKBfqfaOgTs/kSpYOAL4zZblUjeH1gj8tdbKG+sc=; b=PaGfI9eeTqGTm/
	PjaCj0D73AvHFqFU2cA4A0q3o2DdUFhDWJ0KFObUMepBq//VidoqzVWV9DvjXhqRIE47sof8+g6P3
	nc+Bt0e5mLjxJxJD1aR6Hx5QP5/4mBLVCJsxdZ5WMMhUcFPiO3yws1kG0flJi8AcaIiEgjm1gFOk/
	FiYx2NW3WsWsGG9djmRfNrXqrO0DR4ZOuWNts3oCa9rZJ8ECu62fhD1jZTNIBGEnMunIBAeZRLeRV
	B+X48RZg6vmzoVs2rIcpPT1x7/h0buOa664iCPLEQcsMCttXweCqFwpOQ6+WCjj7T3X8Xcq+a+pl/
	CIHeoBE0+dPzKcSahuNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q64RC-00EWL0-2V;
	Mon, 05 Jun 2023 07:15:34 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q64R9-00EWJU-1i;
	Mon, 05 Jun 2023 07:15:33 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 6AB235FD15;
	Mon,  5 Jun 2023 10:15:25 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1685949325;
	bh=90SqCFueETbn6QtgfnNvoKqDRDdO5vsmVtd1isEyw1s=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	b=otdrzu2Cj3M3qp/s9Um/15X1vMoT3/iSXKdEvCYUqRvTqI3PFPts5reMsTYQ9N+Q4
	 T/SyS/gyp5K2MnVz32iWqsW+Z6gla/2oLoZKbk942iXH7HrFybB8P55iwuWSVt3LD4
	 luvKpki5t5Ufikqr16gRj3XbyamywuLOK1KGVVe14UpqhdWR0K/kDte9mA1LWUByJP
	 hRItvErnfdm6dsRG+jlfIrbIQOSBSIC0Gdqa4SSUXLatqCxcXRc6IzyyDpuwTnZVux
	 3cgDdH+4NP7EZg2Ir7xEG1IiHHpU77YLf0LI21TBaFW8G/zeyzf//X5/WHJKhhlN3t
	 hggtgsSf5hotw==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Mon,  5 Jun 2023 10:15:24 +0300 (MSK)
Message-ID: <ed8f95d2-ef62-d91a-618c-402ba1c9d09f@sberdevices.ru>
Date: Mon, 5 Jun 2023 10:11:09 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH] pwm: meson: compute cnt register value in proper way
Content-Language: en-US
To: Heiner Kallweit <hkallweit1@gmail.com>
CC: "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
	"linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
	"u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>,
	"neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
	"martin.blumenstingl@googlemail.com" <martin.blumenstingl@googlemail.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-amlogic@lists.infradead.org"
	<linux-amlogic@lists.infradead.org>, kernel <kernel@sberdevices.ru>, Dmitry
 Rokosov <DDRokosov@sberdevices.ru>, "jbrunet@baylibre.com"
	<jbrunet@baylibre.com>, "khilman@baylibre.com" <khilman@baylibre.com>
References: <20230602103211.2199283-1-gnstark@sberdevices.ru>
 <bf2d2814-5881-0f42-8b62-89c043b66e22@gmail.com>
From: George Stark <gnstark@sberdevices.ru>
In-Reply-To: <bf2d2814-5881-0f42-8b62-89c043b66e22@gmail.com>
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/06/05 04:52:00 #21434197
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_001531_936501_11233D43 
X-CRM114-Status: GOOD (  16.34  )
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

On 6/2/23 23:52, Heiner Kallweit wrote:
> On 02.06.2023 12:32, George Stark wrote:
>> According to the datasheet, the PWM high and low clock count values
>> should be set to at least one. Therefore, setting the clock count
>> register to 0 actually means 1 clock count.
>>
>> Signed-off-by: George Stark <GNStark@sberdevices.ru>
>> Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
>> ---
>> This patch is based on currently unmerged patch by Heiner Kallweit
>> https://lore.kernel.org/linux-amlogic/23fe625e-dc23-4db8-3dce-83167cd3b206@gmail.com
>> ---
>> diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
>> index 834acd7..57e7d9c 100644
>> --- a/drivers/pwm/pwm-meson.c
>> +++ b/drivers/pwm/pwm-meson.c
>> @@ -206,6 +206,11 @@
>>   		channel->pre_div = pre_div;
>>   		channel->hi = duty_cnt;
>>   		channel->lo = cnt - duty_cnt;
>> +
>> +		if (channel->hi)
>> +			channel->hi--;
>> +		if (channel->lo)
>> +			channel->lo--;
Hello Heiner

Thanks for review
> I'm not sure whether we should do this. duty_cnt and cnt are results
> of an integer division and therefore potentially rounded down.
> The chip-internal increment may help to compensate such rounding
> errors, so to say. With the proposed change we may end up with the
> effective period being shorter than the requested one.
Although chip-internal increment sometimes may help accidentally
there are cases when the increment ruins precise calculation in 
unexpected way.

Here's our experience on meson a113l (meson-a1) with pwm driver based on 
ccf:
we need to get pwm period as close as possible to 32768hz.
config pwm to period 1/32768 = 30517ns, duty 15258n
How driver calculates hi\lo regs:
rate = NSEC_PER_SEC * 0xffff / 30517 = ~2147Mhz
rate = clk_round_rate(rate) clk_round_rate selects fastest parent clock 
which is 64Mhz in our case then calculating hi\lo at last: period= 
mul_u64_u64_div_u64(rate, state->period, NSEC_PER_SEC); // 1953
duty= mul_u64_u64_div_u64(rate, state->duty_cycle, NSEC_PER_SEC); // 976
channel->hi= duty;
channel->lo= period- duty;
with the internal increment we'll have real output (1953-976 + 1 + 976 + 
1) * 1 / 64Mhz = 32736.57Hz but we should have (1953-976 + 976) * 1 / 
64Mhz = 32770.09Hz
| And IIRC this should not happen.
Could you please explain why or point out doc/description where it's stated?
If so we can add explicit check to prevent such a case
>>   	}
>>   
>>   	return 0;
>> @@ -340,7 +345,8 @@
>>   	channel->lo = FIELD_GET(PWM_LOW_MASK, value);
>>   	channel->hi = FIELD_GET(PWM_HIGH_MASK, value);
>>   
>> -	state->period = meson_pwm_cnt_to_ns(chip, pwm, channel->lo + channel->hi);
>> +	state->period = meson_pwm_cnt_to_ns(chip, pwm,
>> +					    channel->lo + 1 + channel->hi + 1);
>>   	state->duty_cycle = meson_pwm_cnt_to_ns(chip, pwm, channel->hi);
>>   
> Doesn't channel->hi have to be incremented here too?
Yes, lost the line. I'll fix it

Best regards
George
>>   	return 0;
>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
