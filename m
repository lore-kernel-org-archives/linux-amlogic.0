Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F39B5C001B0
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 Jul 2023 15:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gpCW00Fo/Z5WeYpAV5Csc6JaCoYqnVZjYV/JwG5KCuY=; b=1iMZT1d/kfiftf
	bLu4PvDqEAcaOV5xJGwIFnf2p9WuPP/S38s6sG8rFQBeS+t22XE97vknSFvJOEijHh1xe+AAayD7g
	CWIC6fXxoVu5pOBaJOKwD5PUn/GXAkmm+u1V2wGrWAlVawUR1CK2S2ooXB/3UqrGMaMzFGqwsNaOP
	OVcvmx2OJNtAeFBgALiIXkOmQG66cEXP3O2su1izbuvcAY3QjR9zzB1aunuRn9wL1tcu5HyHs6Vlc
	IeMEoBvxDFwY+/jPvzdaYkvfNRToFy8HBAnRV6McbLqd2XACYB9p02n7XizjZvt7s0yfma2VnLxpG
	4/4vDe/e+CAU8q74tT0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNxHf-004i3K-39;
	Mon, 24 Jul 2023 15:15:39 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNxHc-004hzy-06
	for linux-amlogic@lists.infradead.org;
	Mon, 24 Jul 2023 15:15:38 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 5AD04100004;
	Mon, 24 Jul 2023 18:15:20 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 5AD04100004
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1690211720;
	bh=t+ihf9IMsbedjxs/BkN0GdWeQdzNWJp78yHtqmUhcHQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=RIJw/Fi80876mMUYG9e8wL8sn+yl4ecQ4lCluiBV3cVb8buZB08iRLFTfHNyGFj46
	 cXSQlyZD7A+Np5nuEucob3U/Llogz5UMuaQUoMM6V84nE8jIYIyPb6gszys5xbk+U9
	 Hund9lJ6HXQXfLGl3PnB1Q/OuxypHOy03nOjd1AHzIWP9ZvZkExZ4IAZ99XOdxbo2j
	 75Jyp55DOANqzh+1Kr24hulgDNG66ayqkO2oF62ZwXLYRUrkpwSk48PjOJY4Djl5jw
	 NnNSvLpJthRNHYDjBsve7gzCvZedwAuWQN83z0oamxRHEyfqn0o3YxHp2xKgCj0n9d
	 iLFU/GgfYyJNg==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Mon, 24 Jul 2023 18:15:20 +0300 (MSK)
Received: from [192.168.1.146] (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Mon, 24 Jul 2023 18:14:26 +0300
Message-ID: <45116f61-6ee7-919c-7c99-704a5b274df8@sberdevices.ru>
Date: Mon, 24 Jul 2023 18:15:14 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 2/2] spi: amlogic-spifc-a1: add support for
 max_speed_hz
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
CC: Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong
	<neil.armstrong@linaro.org>, Andy Shevchenko <andy.shevchenko@gmail.com>,
	<linux-spi@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <kernel@sberdevices.ru>
References: <20230706110331.19794-1-mmkurbanov@sberdevices.ru>
 <20230706110331.19794-3-mmkurbanov@sberdevices.ru>
 <1jlefm6h8g.fsf@starbuckisacylon.baylibre.com>
 <5dc58681-d89f-8a8d-4da5-ccfa142fa15a@sberdevices.ru>
 <c118f69d-db32-4544-83d5-14de089d5b51@sirena.org.uk>
From: Martin Kurbanov <mmkurbanov@sberdevices.ru>
In-Reply-To: <c118f69d-db32-4544-83d5-14de089d5b51@sirena.org.uk>
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 178796 [Jul 22 2023]
X-KSMG-AntiSpam-Version: 5.9.59.0
X-KSMG-AntiSpam-Envelope-From: MMKurbanov@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 525 525 723604743bfbdb7e16728748c3fa45e9eba05f7d, {Tracking_from_domain_doesnt_match_to}, 100.64.160.123:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;sberdevices.ru:5.0.1,7.1.1;127.0.0.199:7.1.2;p-i-exch-sc-m01.sberdevices.ru:5.0.1,7.1.1, FromAlignment: s, {Tracking_white_helo}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/07/23 08:49:00 #21663637
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_081536_551312_ACA1352C 
X-CRM114-Status: GOOD (  14.57  )
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



On 20.07.2023 18:46, Mark Brown wrote:
> On Thu, Jul 20, 2023 at 06:41:11PM +0300, Martin Kurbanov wrote:
>> On 11.07.2023 10:25, Jerome Brunet wrote:
> 
>>>> +	ret = clk_set_rate(spifc->clk, freq);
>>>> +	if (ret)
>>>> +		return ret;
> 
>>>> +	spifc->curr_speed_hz = freq;
> 
>>> There is no guarantee that clk_set_rate() has set the rate you have
>>> requested, at least not precisely. You should call clk_get_rate() here.
> 
>> Are you referring to a situation where there is a change in the rate due
>> to a request from another client, such as a sibling driver with the same
>> parent clock?
> 
> The clock may simply not be able to generate exactly the rate you
> requested, the rate will be rounded to some value that the clock can
> actually generate.

Yes, I understand the situation. However, I am comparing it with the
requested frequency rather than the actual one that has been set.
Therefore, I asked Jerome for clarification regarding whether the
frequency can be changed by another client (driver). Maybe, it's better
to remove this condition at all? CCF has a cached rate value and doesn't
run 'set' operation if it's not needed.

-- 
Best Regards,
Martin Kurbanov

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
