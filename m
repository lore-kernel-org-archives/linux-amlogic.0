Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD496C3DA4B
	for <linux-amlogic@archiver.kernel.org>; Mon, 15 Jul 2024 22:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tkyFBF35cdmpRGuPXfOkXLmwsNQyzAe3GPnjWfkeR0s=; b=GS3QtTOXGYX6Y0
	gUTCkuhzhWpvrS3O5drAcgsM0prZdiDb6XgpBF+hApWQ4v8sLP5u4+S1gz00073o+3Q1ybKEYDe2C
	SztL6tHI8o4zGqGqwB5cWjQS9+QAS0cddrW2DW4QvPxSTw6LssbdfGc6P97fJ1KqV5xwHSVC4WAEq
	a3BBj+3hjqmiltbU9r6sMlNalcZTFZG3KA5nO0JOcT3/p5ye+HWUhDdUO2ic7xpgMTkctwI61ECtC
	bXux3zNgernoEcK7x07Dsnx8yQhHlaH7Vwu3HiJLUv8wzf4V/TMrZpgmVaVcaFXto1DtZEfVhfqBR
	WsgXhh0zcHMfWWMQ8zVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTUSx-00000008cjr-2m2a;
	Mon, 15 Jul 2024 22:46:43 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTUSt-00000008ciR-1fOm
	for linux-amlogic@lists.infradead.org;
	Mon, 15 Jul 2024 22:46:42 +0000
Received: from p-infra-ksmg-sc-msk01.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id DA91B100006;
	Tue, 16 Jul 2024 01:46:26 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru DA91B100006
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1721083586;
	bh=1JJIEhrCtyAs2dCw9KVsU1KYY5XyTbExctYubMHysNk=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=HJAh5Y2ux5AR0Am+g2l1lpDcNUNFWH0TyqKuunqfgVPwJU8N70jP8dpxi4oj8/R7M
	 m/8SYYBxH6+HSeb1H8xcldxkqKLF22likxwo+kGx+rE/feZV0df8cqAt0gTVCj7Ny8
	 X+0Qt0wUFgPTSaiL2FwLTPohAifKXxVxLbza6Mg1upbOENeri7So2r7AvJiiJljZ8y
	 8eeOrvvu+Sn5ofQmmwz/l7GTXFl/nxorjVrNsI7RXmQ7ynB/KnrL0kkDUDpOhyARtk
	 n4xFzEpnrN0ZnjGJ+2whdfilCAOwDLEHK+9XMPqmHRpR8b0AFMkDdOGnJcmfBSu6b/
	 EQpTILOn5brRg==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Tue, 16 Jul 2024 01:46:26 +0300 (MSK)
Received: from [172.28.128.6] (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 16 Jul 2024 01:46:26 +0300
Message-ID: <51f8fff1-30e7-456c-918b-c63603d7c159@salutedevices.com>
Date: Tue, 16 Jul 2024 01:45:17 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] reset: amlogic: move audio reset drivers out of CCF
To: Jerome Brunet <jbrunet@baylibre.com>, Philipp Zabel
	<p.zabel@pengutronix.de>, Stephen Boyd <sboyd@kernel.org>, Neil Armstrong
	<neil.armstrong@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<linux-clk@vger.kernel.org>
References: <20240710162526.2341399-1-jbrunet@baylibre.com>
Content-Language: en-US
From: Jan Dakinevich <jan.dakinevich@salutedevices.com>
In-Reply-To: <20240710162526.2341399-1-jbrunet@baylibre.com>
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 186528 [Jul 16 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: YVDakinevich@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 24 0.3.24 186c4d603b899ccfd4883d230c53f273b80e467f, {Tracking_smtp_not_equal_from}, {Tracking_uf_ne_domains}, {Tracking_from_domain_doesnt_match_to}, d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;smtp.sberdevices.ru:5.0.1,7.1.1;100.64.160.123:7.1.2;127.0.0.199:7.1.2;salutedevices.com:7.1.1;lore.kernel.org:7.1.1;sberdevices.ru:5.0.1,7.1.1, FromAlignment: n, {Tracking_smtp_domain_mismatch}, {Tracking_smtp_domain_2level_mismatch}, {Tracking_white_helo}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2024/07/15 22:06:00
X-KSMG-LinksScanning: Clean, bases: 2024/07/15 22:06:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/07/15 21:24:00 #26011023
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240715_154639_982784_EFC7317C 
X-CRM114-Status: GOOD (  17.27  )
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

Jerome, I have tested the series on SM1 SoC (Amlogic AC200 ref board).
As far as I can tell, it works as it should


On 7/10/24 19:25, Jerome Brunet wrote:
> This patchset follows the discussion about having reset driver in the
> clock tree [1]. Ideally those should reside in the reset part of tree.
> 
> Also the code of the amlogic reset driver is very similar between the 2
> trees and could use the same driver code.
> 
> This patchset moves the reset driver of audio clock controller of the
> g12 and sm1 SoC family to the reset tree, using the auxiliary bus.
> 
> The infrastructure put in place is meant to be generic enough so we may
> eventually also move the reset drivers in the meson8b and aoclk clock
> controllers.
> 
> Change since RFC [2]:
>  * Move the aux registration helper out of clock too.
> 
> [1] https://lore.kernel.org/linux-clk/e3a85852b911fdf16dd9ae158f42b3ef.sboyd@kernel.org
> [2] https://lore.kernel.org/linux-clk/20240516150842.705844-1-jbrunet@baylibre.com
> 
> Jerome Brunet (8):
>   reset: amlogic: convert driver to regmap
>   reset: amlogic: add driver parameters
>   reset: amlogic: split the device and platform probe
>   reset: amlogic: use reset number instead of register count
>   reset: amlogic: add reset status support
>   reset: amlogic: add toggle reset support
>   reset: amlogic: add auxiliary reset driver support
>   clk: amlogic: axg-audio: use the auxiliary reset driver
> 
>  drivers/clk/meson/Kconfig                   |   1 +
>  drivers/clk/meson/axg-audio.c               | 109 +-------
>  drivers/reset/Kconfig                       |   1 +
>  drivers/reset/reset-meson.c                 | 285 ++++++++++++++++----
>  include/soc/amlogic/meson-auxiliary-reset.h |  23 ++
>  5 files changed, 271 insertions(+), 148 deletions(-)
>  create mode 100644 include/soc/amlogic/meson-auxiliary-reset.h
> 

-- 
Best regards
Jan Dakinevich

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
