Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96A25EB64DA
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Jul 2023 23:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qpqq2aIsbq9HTAeFjOBOIyOdkNNpLGZlkHXKl+/RatE=; b=yg3+nYJigN/xFT
	pVbyE7k3XGXrnPxjlHCXEvPIlwN5YaYn1PU6uvoe4l4Z2DdCxtSxpNnS6bAlEbylRrIdRcLmXVA1U
	0Aq1KMMhYYUPS5ifRGB3zT+RwfGxWrTsSkr4PzS5A3rUmrBKSk22xvNPS9Spq/rD62FAP3Yu/z1Ex
	QqpQS6IihFnnSS5eptWz9Xm83VnaLHrqyjJqR8V/ULKrG+Ua8Y9mSp1cMeHW5k1N+qtVIx91qcQ4L
	61xa91+qzCKmcQuIQZxSFwjN58jUPoXUGDELoW4bq291eUDPA7cjBB3PuYcY4Yss0PKOfjFwh4hDu
	DccCXk8dufflH8/oHipw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJiwx-001SNA-0a;
	Wed, 12 Jul 2023 23:08:47 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJiwt-001SMN-10;
	Wed, 12 Jul 2023 23:08:45 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 53AB7100023;
	Thu, 13 Jul 2023 02:08:33 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 53AB7100023
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1689203313;
	bh=8YhIqzbp82hCTdWYj2xf4FxKf/T/SgzoaxwK8OPEkMA=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=MnVPiufIABcxhMOHl6F36H5xZFGYaTdCoVm2rsz1dVy+yRA5KizuSbOMb6fUN4Kub
	 PxPnnII9WEp0ECDNnI12nCsZR9YR0eBJj11dLJyuW5+nP2+QKBFvkZGDyfaqmga1IZ
	 Xv1xko+NDi2Kv4uDc9oaEk5GvS+4T5HZi3jDhO148QS5Rqo3UKXf2LBQKPOBzqW8a0
	 1zRxZlp5Y002AkvNZkpSKYO4NILsdGo3TaetsgBlTHLDCi8LnQqQi1Mwo6ooBj6Xc7
	 l9qbXKl+LpRokcdk0buzmappunt4zaLGxZSbAYd0YRxjp2O7miz34JEBFMHOmFkIHs
	 AmHw6KhT7Ac8Q==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Thu, 13 Jul 2023 02:08:33 +0300 (MSK)
Received: from [192.168.1.127] (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Thu, 13 Jul 2023 02:08:13 +0300
Message-ID: <fe1b4eb7-e137-fe43-44cb-8de597fe00e4@sberdevices.ru>
Date: Thu, 13 Jul 2023 02:04:05 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v5 0/6] iio: adc: meson: add iio channels to read channel
 7 mux inputs
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: <jic23@kernel.org>, <lars@metafoo.de>, <neil.armstrong@linaro.org>,
	<khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <nuno.sa@analog.com>,
	<linux-iio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<kernel@sberdevices.ru>
References: <20230711200141.239025-1-gnstark@sberdevices.ru>
 <ZK7GCAgA1gljrxyl@smile.fi.intel.com>
From: George Stark <gnstark@sberdevices.ru>
In-Reply-To: <ZK7GCAgA1gljrxyl@smile.fi.intel.com>
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 178587 [Jul 12 2023]
X-KSMG-AntiSpam-Version: 5.9.59.0
X-KSMG-AntiSpam-Envelope-From: GNStark@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 521 521 0c3391dd6036774f2e1052158c81e48587b96e95, {Tracking_arrow_text}, {Tracking_from_domain_doesnt_match_to}, p-i-exch-sc-m01.sberdevices.ru:7.1.1,5.0.1;sberdevices.ru:7.1.1,5.0.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;100.64.160.123:7.1.2, FromAlignment: s, {Tracking_white_helo}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/07/12 10:49:00 #21602221
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_160843_884177_5E6D5328 
X-CRM114-Status: UNSURE (   9.43  )
X-CRM114-Notice: Please train this message.
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

Hello Andy

On 7/12/23 18:26, Andy Shevchenko wrote:
> On Tue, Jul 11, 2023 at 11:00:16PM +0300, George Stark wrote:
>> Changelog:
> 
> I gave you a tag, any reason why you haven't applied it to your patches?

if you're talking about patch 6 commit message - yes, I missed the last 
line in your letter, I'll fix it.
  --
Best regards
George

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
