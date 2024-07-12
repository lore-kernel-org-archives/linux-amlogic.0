Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B7C7C3DA45
	for <linux-amlogic@archiver.kernel.org>; Fri, 12 Jul 2024 15:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zg417YX6kH3gUmjeKGDvuroIvgb0dAsobS6iN0Q+o28=; b=ItgQtUUgMkIDbl
	5XSnJkIZvvY5Xs0n2W44UpMSxXIUxi37drKoGZFSz7iscBV/eEP3ZqN5ZocYSmucjVD8coMG/sQ5/
	vqIfR7/m8kW8lU+X7qhvyBmRlP7vbvGuRtybCUr0eq1uZwbup0pQOTZqn18E49AsNQ7GP9zdK2uWn
	+f4yREvUZVnubwdC71XyWVCKQUOP+OP6CdQoFyTb4O3bom2Cen85kTSt64BfhaLQevszhTbJGZuc9
	9A45giRBpZmyP8+HcD8zaZWfayEPbcXrT4v/OnJHydUgRDf+gDbbTTDdbkFr1RhjBbv749/sujLHK
	C7n/cBjUvbaIbSy4frfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSHws-00000000TVZ-3fic;
	Fri, 12 Jul 2024 15:12:38 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSHwo-00000000TUd-45DT;
	Fri, 12 Jul 2024 15:12:37 +0000
Received: from p-infra-ksmg-sc-msk01.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 34EE5100005;
	Fri, 12 Jul 2024 18:12:27 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 34EE5100005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1720797147;
	bh=+oxJwwvIdh6XFlSXZQ495IyXoY1J3oreqmYkj7vcugo=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=KjJOdeOG76Q/rAZsj2JmvtveqrzZacRH75soOoKP2TSZ+DHiWb9SHcY4EluR+zotX
	 b992bisjVeImpjzb2Bya0dNgU3Y9vLS0TAcTMxFGhH5GccKeaxZ7LMU/d5phZBa/Cd
	 hYirI3PI4Xu7JXf16ceezKUWz+TczVobknnKK9qqWKxkcgUzGOdTPJFanlSpi2lLK4
	 x935kV7C8zJvnvWsx67rC5/nZ2QXV8XL36fBDhhHjpZH2iZzJmCDdPkRFSlkK30+at
	 Cv+sSaMTp4wzqiW0TmqtWmhsEVbAVTOODkqHrmPYEEOwoP2t54KmIBwPqXqBZo8j/e
	 m1MLz3d9wGMKg==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Fri, 12 Jul 2024 18:12:27 +0300 (MSK)
Received: from [172.28.64.36] (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 12 Jul 2024 18:12:26 +0300
Message-ID: <55f73e79-2d21-48ba-8486-26ee168c7bc3@salutedevices.com>
Date: Fri, 12 Jul 2024 18:12:26 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] dt-bindings: pwm: amlogic: Add new bindings for
 meson A1 PWM
To: Rob Herring <robh@kernel.org>, <conor+dt@kernel.org>
CC: <ukleinek@kernel.org>, <krzk+dt@kernel.org>, <neil.armstrong@linaro.org>,
	<khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <hkallweit1@gmail.com>,
	<linux-pwm@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-amlogic@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <kernel@salutedevices.com>, Dmitry Rokosov
	<ddrokosov@salutedevices.com>
References: <20240710234116.2370655-1-gnstark@salutedevices.com>
 <20240710234116.2370655-3-gnstark@salutedevices.com>
 <20240712125219.GA472311-robh@kernel.org>
Content-Language: en-US
From: George Stark <gnstark@salutedevices.com>
In-Reply-To: <20240712125219.GA472311-robh@kernel.org>
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 186493 [Jul 12 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: gnstark@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 24 0.3.24 186c4d603b899ccfd4883d230c53f273b80e467f, {Tracking_arrow_text}, {Tracking_from_domain_doesnt_match_to}, smtp.sberdevices.ru:7.1.1,5.0.1;100.64.160.123:7.1.2;salutedevices.com:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/07/12 14:32:00 #25964803
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240712_081235_714343_307FE201 
X-CRM114-Status: GOOD (  14.09  )
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

Hello Rob, Conor

On 7/12/24 15:52, Rob Herring wrote:
> On Thu, Jul 11, 2024 at 02:41:15AM +0300, George Stark wrote:
>> The chip has 3 dual-channel PWM modules PWM_AB, PWM_CD, PWM_EF.
>>
>> Signed-off-by: George Stark <gnstark@salutedevices.com>
>> Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
> 
> Missing ack from Conor. When you submit new versions, it is your
> responsibility to add tags.

I had Conor's ack in my mind but his response was related to the
squashed patch (a1 compatible + power domains) and the current patch was
a bit different that's why I didn't dare to add the ack.

Conor, do you mind if I resend this patch (and may be [PATCH v4 1/3])
with your ack?

> 
>> ---
>>   .../devicetree/bindings/pwm/pwm-amlogic.yaml       | 14 ++++++++++++++
>>   1 file changed, 14 insertions(+)

-- 
Best regards
George

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
