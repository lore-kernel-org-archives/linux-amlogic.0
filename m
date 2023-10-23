Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC2D4C25B46
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Oct 2023 19:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X0PWFu7xNfos5QtcUlwuBpgX4h6thvHltGyMgwnPsKw=; b=ftrXVmy4dgCCeW
	twrKf8arJYsaeeI89hsfUJW6KCWh9YB8/bPiBTJGgHQnPTrbqm8HZYw1VM5eGffGT3jee7pEfd2Qe
	b5VucyE3QWdRtfWGbSz3w8gQaTEhmY4VAvBUdtmAMGQLyzxp2jKSKRx0FhD5JuVRUpIK0WByoMhkm
	Rkgm8OCBLjCW5tqYTOFGMUz2DBpemE4+sMNA6hyekBfAp8jS+wHBfUAMn4vC4ykKmvWMiJ13fr0gR
	uoJyxvXckPd4CkuO5xjLmTsotxQtODuDrmNGcnZjEMr7az2XjSozpTkvVL/VKXAJ9lAvOZtjQqInM
	GaRmMsCHuogAMUUjvgKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qv0md-008Bz4-0N;
	Mon, 23 Oct 2023 19:40:15 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qv0mZ-008BwP-0q;
	Mon, 23 Oct 2023 19:40:14 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id AC12F100009;
	Mon, 23 Oct 2023 22:39:56 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru AC12F100009
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1698089996;
	bh=Hhd9o3DW9H02Ejo8WGubQDNC+sSIsjqhUPhxroLp0IQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=Qzlt0w7tTATPGsbMuBs4DaPGSRQmI03REzogB+ki/buGpx2PFXzNGpKqthBzXJXF/
	 shjiwowWttLUICQjG2Sx2B2mOiIn9LtVx3rs9HdmxuZgW4TP9o19dw0RSU7cuXcZSY
	 NqJDExsc0U5rC8EHjFTAlCF1B19hD5E6vTGOG5610j7F3cLiIg6/0W9WVwjld0E83C
	 mgqUmhrQpsd4p4ZZXCCSzg3eSGsYyWYNnffrx8/9BPijeegCItjGGUBL46za6l6se7
	 cAJmooNCJFccC31E7K0+GgAqNhgSxniWvmGBAM61tNIFZnit5UU4/cP3mQZ9ScmZ9t
	 D60edgYn72r+w==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Mon, 23 Oct 2023 22:39:54 +0300 (MSK)
Received: from [192.168.1.127] (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.37; Mon, 23 Oct 2023 22:39:54 +0300
Message-ID: <07f978ec-2f18-4079-afb1-4d37827806a3@salutedevices.com>
Date: Mon, 23 Oct 2023 22:40:15 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 RESEND] pwm: meson: add pwm support for S4
Content-Language: en-US
To: Yixun Lan <dlan@gentoo.org>, JunYi Zhao <junyi.zhao@amlogic.com>
CC: <thierry.reding@gmail.com>, <u.kleine-koenig@pengutronix.de>,
	<neil.armstrong@linaro.org>, <khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <linux-pwm@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20231016052457.1191838-1-junyi.zhao@amlogic.com>
 <20231016223749.GA7647@ofsar>
From: George Stark <gnstark@salutedevices.com>
In-Reply-To: <20231016223749.GA7647@ofsar>
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 180817 [Oct 23 2023]
X-KSMG-AntiSpam-Version: 6.0.0.2
X-KSMG-AntiSpam-Envelope-From: gnstark@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 542 542 3d23828e213bab96daa5e52f9cef518f74e40214, {Tracking_uf_ne_domains}, {Tracking_from_domain_doesnt_match_to}, salutedevices.com:7.1.1;lists.infradead.org:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;p-i-exch-sc-m01.sberdevices.ru:5.0.1,7.1.1;100.64.160.123:7.1.2, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2023/10/23 18:44:00
X-KSMG-LinksScanning: Clean, bases: 2023/10/23 18:45:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/10/23 18:09:00 #22267281
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_124011_653332_CD6EDD80 
X-CRM114-Status: GOOD (  17.94  )
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

Hello Yixun Lan

On 10/17/23 01:37, Yixun Lan wrote:
> Hi JunYi
> 
> On 13:24 Mon 16 Oct     , JunYi Zhao wrote:
>> From: "junyi.zhao" <junyi.zhao@amlogic.com>
>>
>> Support PWM for S4 soc.
>> Now the PWM clock input is done in independent CLKCTRL registers.
>> And no more in the PWM registers.
>> PWM needs to obtain an external clock source.
>>
>> Signed-off-by: junyi.zhao <junyi.zhao@amlogic.com>
>> ---
>> V2 -> V3:
>> Rebase and Review the latest upstream code again.
>> After reconstruction, stick to the previous code as much as possible.
>>   drivers/pwm/pwm-meson.c | 19 +++++++++++++++++++
>>   1 file changed, 19 insertions(+)
>>
>> diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
>> index 25519cddc2a9..fe9fd75747c4 100644
>> --- a/drivers/pwm/pwm-meson.c
>> +++ b/drivers/pwm/pwm-meson.c
>> @@ -99,6 +99,7 @@ struct meson_pwm_channel {
>>   struct meson_pwm_data {
>>   	const char * const *parent_names;
>>   	unsigned int num_parents;
>> +	unsigned int extern_clk;
>>   };
>>   
>>   struct meson_pwm {
>> @@ -396,6 +397,10 @@ static const struct meson_pwm_data pwm_g12a_ao_cd_data = {
>>   	.num_parents = ARRAY_SIZE(pwm_g12a_ao_cd_parent_names),
>>   };
>>   
>> +static const struct meson_pwm_data pwm_s4_data = {
>> +	.extern_clk = true,
>> +};
>> +
>>   static const struct of_device_id meson_pwm_matches[] = {
>>   	{
>>   		.compatible = "amlogic,meson8b-pwm",
>> @@ -429,6 +434,10 @@ static const struct of_device_id meson_pwm_matches[] = {
>>   		.compatible = "amlogic,meson-g12a-ao-pwm-cd",
>>   		.data = &pwm_g12a_ao_cd_data
>>   	},
>> +	{
>> +		.compatible = "amlogic,s4-pwm",
>> +		.data = &pwm_s4_data,
>> +	},
>>   	{},
>>   };
>>   MODULE_DEVICE_TABLE(of, meson_pwm_matches);
>> @@ -451,6 +460,16 @@ static int meson_pwm_init_channels(struct meson_pwm *meson)
>>   		struct clk_parent_data div_parent = {}, gate_parent = {};
>>   		struct clk_init_data init = {};
>>   
>> +		if (meson->data->extern_clk) {
>> +			snprintf(name, sizeof(name), "clkin%u", i);
>> +			channel->clk = devm_clk_get(dev, name);
> use devm_clk_get_optional() which would save you from introducing
> the 'extern_clk' variable

On S4 and other recent chips PWM clock resides in separate IP and it 
must be provided to driver in order to control PWM frequency. So this 
clock is not optional.

> 
>> +			if (IS_ERR(channel->clk)) {
>> +				dev_err(meson->chip.dev, "can't get device clock\n");
>> +				return PTR_ERR(channel->clk);
>> +			}
>> +			continue;
>> +		}
>> +
>>   		snprintf(name, sizeof(name), "%s#mux%u", dev_name(dev), i);
>>   
>>   		init.name = name;
>>
>> base-commit: 4d2c646ac07cf4a35ef1c4a935a1a4fd6c6b1a36
>> -- 
>> 2.41.0
>>
>>
>> _______________________________________________
>> linux-amlogic mailing list
>> linux-amlogic@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-amlogic
> 

-- 
Best regards
George

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
