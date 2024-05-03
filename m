Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0D6AC4345F
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 May 2024 07:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NSRcOauYDcblQrk2b1yiS/c4iswQAiXn3gewjBFZC18=; b=G9DUAuk5InLXdY
	Fg9aUIRwniP/2sAfHDVXa5jcXy5B4OGd5UBtCs1exF6JCevZyNOKjAFJykZLSz4cq5+9GIpipXL7E
	bL9WvUPJIw3kOAguSFZKusexkU05HuX0gHYDDR7k2thwnKICZR5di097cgoRHcfvJympJjdrdtLzi
	HggwU4lKqdbFBbBBL8CBHeaSq4QGV+TBVIh+IgNfKyFwA3FztuBV6JhPwb/JGXoo77/XqsJNOZC9h
	N27bP4AqmLhC+qQO8wj8AkUV+39fsOXEzUq5CA6huGEoKk2JGA25skvOD3iSgF2DrP/oZHUt2MuFs
	B+/ZFBE9uivw6411uJwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2njB-0000000FXYy-0soi;
	Fri, 03 May 2024 07:53:09 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2nj6-0000000FXXU-421J;
	Fri, 03 May 2024 07:53:07 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 314C012000C;
	Fri,  3 May 2024 10:52:56 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 314C012000C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1714722776;
	bh=vPYAXAEpU06TIJUWj2rEgevmEmcxPqtBx4Bo9O+8NsY=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:From;
	b=fpFYMV31LZZ4ynG08Pe03cA8a9KzeMzVOBBPvA7yhE4GkpadK25lCQuKD2i2VquMz
	 Yz2DhND7KNfEk2+ltk4DG2n5sHRn/ShXRUyQBX5z9Vtq/SzCVzCDXnu9WFmmsJPx48
	 8HvcyN8as4yWi9tBk9eSuA3QviSdPYK2y5i8T9XOvrLluchZWqS3KvWT8nEmmMbGKI
	 tbTiIsbUOP7BUvWAOvkkDjZapdbfl2s/lJPO9H7UBpNw9HFaXqduhJbwm6j/zoYJxD
	 82MWVXvE5/336Red8Oe25+0pqPkLKRhcuELTb2VJ0iOdTsbKXVG3CxND1nltay1lBr
	 /xQsNWMXw7uwA==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Fri,  3 May 2024 10:52:55 +0300 (MSK)
Received: from localhost (100.64.160.123) by p-i-exch-sc-m02.sberdevices.ru
 (172.16.192.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 3 May
 2024 10:52:55 +0300
Date: Fri, 3 May 2024 10:52:55 +0300
From: Dmitry Rokosov <ddrokosov@salutedevices.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
CC: <neil.armstrong@linaro.org>, <jbrunet@baylibre.com>,
	<mturquette@baylibre.com>, <khilman@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <glaroque@baylibre.com>,
	<rafael@kernel.org>, <rui.zhang@intel.com>, <lukasz.luba@arm.com>,
	<robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<conor+dt@kernel.org>, <kernel@salutedevices.com>, <rockosov@gmail.com>,
	<linux-amlogic@lists.infradead.org>, <linux-pm@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 0/2] thermal: amlogic: introduce A1 SoC family Thermal
 Sensor controller
Message-ID: <20240503075221.suupx27777tvhdvu@CAB-WSD-L081021>
References: <20240328191322.17551-1-ddrokosov@salutedevices.com>
 <38ba3618-2a67-4e21-b08d-7e382411e51a@linaro.org>
 <20240417084007.uzg2uc7gwb6mi7bi@CAB-WSD-L081021>
 <20240426073106.3yl2dplvauper3lg@CAB-WSD-L081021>
 <35c9dbe9-9166-4358-bfa9-99f205acd8de@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <35c9dbe9-9166-4358-bfa9-99f205acd8de@linaro.org>
User-Agent: NeoMutt/20220415
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 185030 [May 03 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: ddrokosov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 19 0.3.19 07c7fa124d1a1dc9662cdc5aace418c06ae99d2b, {Tracking_uf_ne_domains}, {Track_E25351}, {Tracking_from_domain_doesnt_match_to}, d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;salutedevices.com:7.1.1;git.kernel.org:7.1.1;127.0.0.199:7.1.2;smtp.sberdevices.ru:5.0.1,7.1.1;100.64.160.123:7.1.2, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2024/05/03 06:33:00
X-KSMG-LinksScanning: Clean, bases: 2024/05/03 06:33:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/05/03 04:34:00 #25076274
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240503_005305_707644_4A71CF9C 
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hello Daniel,

On Fri, Apr 26, 2024 at 09:57:29AM +0200, Daniel Lezcano wrote:
> 
> Hi Dmitry,
> 
> On 26/04/2024 09:31, Dmitry Rokosov wrote:
> > Hello Neil,
> > 
> > I hope you're doing well. I was wondering if you could assist me with
> > below problem.
> > 
> > I'm a bit confused about which kernel repository the series was applied
> > to. I asked Daniel about it, but unfortunately, I didn't receive any
> > feedback from him. Could you provide some clarification on this matter?
> > 
> > Thank you in advance for your help.
> 
> I was OoO the last two weeks.
> 
> Your series is in my tree [1], which is pulled automatically by the linux-pm
> tree in its bleeding-edge branch.
> 
> Today, this branch will move to the linux-next branch [2] which will also be
> pulled by the linux-pm/next branch automatically.
> 
> Hope that helps and sorry for the delay to answer
> 
>   -- Daniel
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/thermal/linux.git/log/?h=thermal/bleeding-edge
> 
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/thermal/linux.git/log/?h=thermal/linux-next

Thanks a lot for the update! Now I see the patches in the above repos.

-- 
Thank you,
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
