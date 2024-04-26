Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4CA4C04FFE
	for <linux-amlogic@archiver.kernel.org>; Fri, 26 Apr 2024 07:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F0R9pqlA+AeEn4E7ymzKY+0zwvq8o2NEVdt5MM30DSA=; b=TBZCMQy8IIpNwQ
	pG66qiJuwdd+ZCQ+gVO7l9QPi5sjK599deowDjcw7WLB85oB/8uu/aFdw/pa/E0WY2oXP8wcU8dxY
	UxEh46XWzxwhWGp5PuI35y5RXlMm5bxjn1KR8QoJbOgC/1Ay9XgoZanUnugwIoa4BNWZjWC71IZpU
	pSFJ0uVCgnnDCcsRPyblquCaFYwSoMqmgg787CGKbaU1pR2qdNYyN3Og7RuwQyWV1w7h9s9KXtuZZ
	azJHJ/CeY9SwHvtxfmm3Ov97Hehk/VawwdMZDxXX1X0qmvLNmo1kgPHvARUlSP4Crf0TV/5+17kSb
	qFEqbnWqotJJGYF/ZEhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0G3L-0000000BTID-2iJV;
	Fri, 26 Apr 2024 07:31:27 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0G3G-0000000BTGU-2LPd;
	Fri, 26 Apr 2024 07:31:25 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 6A933100003;
	Fri, 26 Apr 2024 10:31:07 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 6A933100003
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1714116667;
	bh=1oOjBRwahzipflI9HVMGrMYwyUxQIzND3/Gm6BB3fCE=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:From;
	b=VZNS7CzH0eVFZrgEc/d7px8hOqwLpYdDOuDyBpOsR0Ps9I+KgQGbqColp8rLO1rI8
	 BDrTaXF7mVomrXocSLkhnAWJtvCe2+aN4J/ToGC+nGQiWn2pbQQsFUBXZWlW9ufdYx
	 zQhqSPDpuTgmyixpLHfcikym+cYsjWl+Xwa7zeKaStj9Tfy/FjXbBATI8Zrll2002r
	 HsDDMt1lz0P64YymnTbVhDpYW4Wm0BiJXBYtPRJWwi0FkBHDlAGqTaxicXNZPq0/WH
	 Lk1+p5dWeEzxZ4mTwU3XYt4n2LHk+njJ8AeJF1JefqhAPtB29xpLrhVzRxaSE07Zjh
	 Pe6PQpvnIv3Ag==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Fri, 26 Apr 2024 10:31:07 +0300 (MSK)
Received: from localhost (100.64.160.123) by p-i-exch-sc-m02.sberdevices.ru
 (172.16.192.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 26 Apr
 2024 10:31:07 +0300
Date: Fri, 26 Apr 2024 10:31:06 +0300
From: Dmitry Rokosov <ddrokosov@salutedevices.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, <neil.armstrong@linaro.org>
CC: <jbrunet@baylibre.com>, <mturquette@baylibre.com>, <khilman@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <glaroque@baylibre.com>,
	<rafael@kernel.org>, <rui.zhang@intel.com>, <lukasz.luba@arm.com>,
	<robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<conor+dt@kernel.org>, <kernel@salutedevices.com>, <rockosov@gmail.com>,
	<linux-amlogic@lists.infradead.org>, <linux-pm@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 0/2] thermal: amlogic: introduce A1 SoC family Thermal
 Sensor controller
Message-ID: <20240426073106.3yl2dplvauper3lg@CAB-WSD-L081021>
References: <20240328191322.17551-1-ddrokosov@salutedevices.com>
 <38ba3618-2a67-4e21-b08d-7e382411e51a@linaro.org>
 <20240417084007.uzg2uc7gwb6mi7bi@CAB-WSD-L081021>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240417084007.uzg2uc7gwb6mi7bi@CAB-WSD-L081021>
User-Agent: NeoMutt/20220415
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 184944 [Apr 26 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: ddrokosov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 18 0.3.18 b9d6ada76958f07c6a68617a7ac8df800bc4166c, {Track_E25351}, {Tracking_from_domain_doesnt_match_to}, 100.64.160.123:7.1.2;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;salutedevices.com:7.1.1;smtp.sberdevices.ru:5.0.1,7.1.1, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/04/26 01:49:00 #24972266
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_003123_310082_CBB5FFAA 
X-CRM114-Status: GOOD (  22.09  )
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

Hello Neil,

I hope you're doing well. I was wondering if you could assist me with
below problem.

I'm a bit confused about which kernel repository the series was applied
to. I asked Daniel about it, but unfortunately, I didn't receive any
feedback from him. Could you provide some clarification on this matter?

Thank you in advance for your help.

On Wed, Apr 17, 2024 at 11:40:07AM +0300, Dmitry Rokosov wrote:
> Hello Daniel,
> 
> Could you please let me know in which repository you have applied this
> change? I am trying to cherry-pick the original applied commit and apply
> it to our internal mainline branch instead of the internal commit.
> However, I am unable to find the applied series in any of the
> repositories on git.kernel.org.
> 
> On Thu, Apr 04, 2024 at 02:23:21PM +0200, Daniel Lezcano wrote:
> > On 28/03/2024 20:13, Dmitry Rokosov wrote:
> > > It is primarily based on the G12A thermal controller, with only a slight
> > > variation in the offset value of the efuse parameters. Therefore, this
> > > patch series provides appropriate platform data and dt-bindings to
> > > ensure proper support.
> > 
> > 
> > Applied, thanks
> 

-- 
Thank you,
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
