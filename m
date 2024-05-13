Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A549DC25B74
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 May 2024 18:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vIOy3ab8oMvumzswdy+j3xEiR4kjfwnKFQTlLk+LlyY=; b=s/22i8rVQl5+Rd
	efCD/QWM2B0NMqt7RA6uvYAuY6hxkLfcUaZfXPqotfavY4joUXjYHGdXc1xqrM9a4PmIFTsd8tWwY
	8HwVceibB+m3KEXSHhtCGZao/woLTuwlRaTQ3HARwYFOx7StJycAKF12yucc4fJGgrQQhYgDnuQm+
	FaHSBumwMVOeWu+wkXNicU4UULNQfPEXgyZvFMxTin7zk6Vz6+GRgNbLTMoLxdTdt3jK8LA2Ti4sn
	/T8GkYCURbgA9nlBNVyRK9MnPsEnbEt5y8lPE2AtueMMP68kiRSWYcquJHLsQ2V2gUAF0g6xEcCQa
	XylLWkMIUItVNkeNYznQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6aRL-0000000Ds2E-1aom;
	Mon, 13 May 2024 18:30:23 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6aRH-0000000Ds0v-1AH0;
	Mon, 13 May 2024 18:30:22 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 29E4510000F;
	Mon, 13 May 2024 21:30:13 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 29E4510000F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1715625013;
	bh=MSCcfNbXWZaqZvB3X6GEwhWjmXjAmNyUMbI+WpgElwY=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:From;
	b=IGyvOIy9SYouzwG+kAf3q6T1b8wbTz8TTr2Cfx5P4miFmZKykKjTBtblkWilS3cOI
	 ZaUFxM4aIOhikj9T486T2Tuya1L3mIehaLwtMsPhd/gukFAiVPwpRiczI6lBHxq79D
	 OupNDiBwBbN20hqrp7FNptmussy1wFDaGsgWbsHmRvVcON61blhWVxCA8fJOhxT2cR
	 ZKfExdYYmdAzngdzYnI79O+7FoslbC3q7IfP5EhK6YRdKbo0JiTTlmyXj8fKpCitiC
	 bFD8upMp/Jcd7FAur51hqHJCfpulz4jYdY6CR6p6zIlcUJ7VpE9xDN3j/ZAuszCOXR
	 EJwW7+EPflM8A==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Mon, 13 May 2024 21:30:12 +0300 (MSK)
Received: from localhost (100.64.160.123) by p-i-exch-sc-m02.sberdevices.ru
 (172.16.192.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 13 May
 2024 21:30:12 +0300
Date: Mon, 13 May 2024 21:30:12 +0300
From: Dmitry Rokosov <ddrokosov@salutedevices.com>
To: Conor Dooley <conor@kernel.org>
CC: <neil.armstrong@linaro.org>, <jbrunet@baylibre.com>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <khilman@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <jian.hu@amlogic.com>,
	<kernel@sberdevices.ru>, <rockosov@gmail.com>,
	<linux-amlogic@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 2/7] dt-bindings: clock: meson: a1: pll: introduce new
 syspll bindings
Message-ID: <20240513183012.652mwhivasqihiqc@CAB-WSD-L081021>
References: <20240510090933.19464-1-ddrokosov@salutedevices.com>
 <20240510090933.19464-3-ddrokosov@salutedevices.com>
 <20240511-secret-barcode-e25c722ddf1d@spud>
 <20240513091735.l3uewwzfrdd6qwbl@CAB-WSD-L081021>
 <20240513-epic-magnifier-8dd83db81c4c@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240513-epic-magnifier-8dd83db81c4c@spud>
User-Agent: NeoMutt/20220415
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 185196 [May 13 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: ddrokosov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 20 0.3.20 743589a8af6ec90b529f2124c2bbfc3ce1d2f20f, {Track_E25351}, {Tracking_from_domain_doesnt_match_to}, 100.64.160.123:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;smtp.sberdevices.ru:7.1.1,5.0.1;salutedevices.com:7.1.1, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/05/13 16:04:00 #25186646
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240513_113020_021689_0A2847C4 
X-CRM114-Status: GOOD (  25.32  )
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

On Mon, May 13, 2024 at 04:48:33PM +0100, Conor Dooley wrote:
> On Mon, May 13, 2024 at 12:18:02PM +0300, Dmitry Rokosov wrote:
> > Hello Conor,
> > 
> > Thank you for quick review!
> > 
> > On Sat, May 11, 2024 at 02:08:03PM +0100, Conor Dooley wrote:
> > > On Fri, May 10, 2024 at 12:08:54PM +0300, Dmitry Rokosov wrote:
> > > > The 'syspll' PLL is a general-purpose PLL designed specifically for the
> > > > CPU clock. It is capable of producing output frequencies within the
> > > > range of 768MHz to 1536MHz.
> > > > 
> > > > The clock source sys_pll_div16, being one of the GEN clock parents,
> > > > plays a crucial role and cannot be tagged as "optional". Unfortunately,
> > > > it was not implemented earlier due to the cpu clock ctrl driver's
> > > > pending status on the TODO list.
> > > 
> > > It's fine to not mark it optional in the binding, but it should be
> > > optional in the driver as otherwise backwards compatibility will be
> > > broken. Given this is an integral clock driver, sounds like it would
> > > quite likely break booting on these devices if the driver doesn't treat
> > > syspll_in as optional.
> > > A lesson perhaps in describing the hardware entirely, even if the
> > > drivers don't make use of all the information yet?
> > 
> > Yes, it's definitely the right lesson for me. However, without syspll or
> > syspll_in, we cannot utilize CPU power management at all.
> 
> That's the status-quo, right? The incorrect dts would continue to not
> support CPU power management and the new one with the correct description
> would?

Hmmm, correct. Okay, I see, I will support sys_pll as optional
connection :)

-- 
Thank you,
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
