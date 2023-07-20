Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A586EEB64DA
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Jul 2023 15:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DBkjOgZnR7QbH/RWZN3XRtK9uC+kZpFt0ll9xfIzoTU=; b=a5JW2L1CLI6U+V
	q0BDKrx5OQZlWVbfKz0cxqx0QUCmq/w1enkAky/qZYfJve+DVv66aHY/T2NDAQeTgOx2XewR4BpEP
	iqfxaPLIaLxeztsMeVFpQq+Ua2JwpK24qa+QW1IS+3WKCyPi6BKOMzQzLBMtQXrlRGr1paglBNoxg
	fnfHLW1Fg/bl31XxCdz8kpJ8Re/8lM72MwOHojYMrcG5ERSYzWNepADsBm4WM2BgPVxKGdz7x9TTZ
	zddl+/1U256pkOPqGnSOgS0IRFdGF1jYSYhLr77quVuEMOjcrNVPLF0Xvk4r4vXNE9BflPSAVFIAl
	ivp9t0rN12uye7rY/N0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMVmw-00BZSA-2f;
	Thu, 20 Jul 2023 15:41:58 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMVms-00BZQp-2s
	for linux-amlogic@lists.infradead.org;
	Thu, 20 Jul 2023 15:41:57 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id D73AA100002;
	Thu, 20 Jul 2023 18:41:35 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru D73AA100002
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1689867695;
	bh=mMr9bRmI+ChimdsaHpu2eMgXK7jKeBapFRumhYLwrYU=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=pP4OgGFCCTXljtaxwkZrLonjlOWRPg4ehqSkOK1J9Q3u4bZERTBYnqmj+lFr0hl46
	 CPdNT8Vhb6JK9FEZDii/Gw3WK4pO5RPedSoDLomPo4tZPLNHJgqOQgXRsa5d7pYcW6
	 BylJFhwGD1rNeoes46cfQ+xali6wQ1NJhcKxAxzR7ZcvcUXvY9ZjJIDfGB0RLPY1j1
	 D1FXC/LRjiEtfQcCI2R3KvaX1X7ksNZ8IsyQ3W9PVs4gWXrsuWb7ynAZTGLqJa+qD6
	 QphgZNfnf2ziPIz4AEo4T0rzOw2itlpQJQjSI5Iaw3gPh+pFvbYelf3i8eTHGmUrpg
	 1YgmxaiQQC2Xg==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Thu, 20 Jul 2023 18:41:35 +0300 (MSK)
Received: from [192.168.1.146] (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Thu, 20 Jul 2023 18:41:35 +0300
Message-ID: <5dc58681-d89f-8a8d-4da5-ccfa142fa15a@sberdevices.ru>
Date: Thu, 20 Jul 2023 18:41:11 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 2/2] spi: amlogic-spifc-a1: add support for
 max_speed_hz
Content-Language: en-US
To: Jerome Brunet <jbrunet@baylibre.com>, Mark Brown <broonie@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>, Andy Shevchenko
	<andy.shevchenko@gmail.com>
CC: <linux-spi@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <kernel@sberdevices.ru>
References: <20230706110331.19794-1-mmkurbanov@sberdevices.ru>
 <20230706110331.19794-3-mmkurbanov@sberdevices.ru>
 <1jlefm6h8g.fsf@starbuckisacylon.baylibre.com>
From: Martin Kurbanov <mmkurbanov@sberdevices.ru>
In-Reply-To: <1jlefm6h8g.fsf@starbuckisacylon.baylibre.com>
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 178759 [Jul 20 2023]
X-KSMG-AntiSpam-Version: 5.9.59.0
X-KSMG-AntiSpam-Envelope-From: MMKurbanov@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 525 525 723604743bfbdb7e16728748c3fa45e9eba05f7d, {Tracking_arrow_text}, {Tracking_from_domain_doesnt_match_to}, 127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;sberdevices.ru:5.0.1,7.1.1;100.64.160.123:7.1.2;p-i-exch-sc-m01.sberdevices.ru:5.0.1,7.1.1, FromAlignment: s, {Tracking_white_helo}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/07/20 13:53:00 #21647430
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_084155_304021_38972B40 
X-CRM114-Status: GOOD (  12.72  )
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



On 11.07.2023 10:25, Jerome Brunet wrote:
>>  
>> +static int amlogic_spifc_a1_set_freq(struct amlogic_spifc_a1 *spifc, u32 freq)
>> +{
>> +	int ret;
>> +
>> +	if (freq == spifc->curr_speed_hz)
>> +		return 0;
>> +
>> +	ret = clk_set_rate(spifc->clk, freq);
>> +	if (ret)
>> +		return ret;
>> +
>> +	spifc->curr_speed_hz = freq;
> 
> There is no guarantee that clk_set_rate() has set the rate you have
> requested, at least not precisely. You should call clk_get_rate() here.
> 

Hello Jerome, thank you for the feedback.
Are you referring to a situation where there is a change in the rate due
to a request from another client, such as a sibling driver with the same
parent clock?

-- 
Best Regards,
Martin Kurbanov

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
