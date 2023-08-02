Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B1D1C001DE
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Aug 2023 07:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iX+xbMjnDyvFLar1ewidvR3H8uxv6VQOB23IZ8qPN6c=; b=p6tDNABpNS370j
	FCJyYzZQJUvNjf80usi+sLfnqtNZkggKT1BelO5XPQ4PM7tOZ5gyvSC4xFNwxpKishixGuPv3mK6F
	QOB461AULEiy1fmSQyo29GHQQk5YmkKCgwUU+KKhIcoi99ML677BhEoIiAdrQMdaXfDNOcHTMnwZ7
	VSSncicwXi/NtfCmFFwuOuNXyXFgnQhlX+4qeRhIHfErZdQ2MGdD9lK3XKFhAAh+mjCoNsADzHqaK
	OkxfyGLwbnCswfV/5ks0NOKkqjsRNu1X4RZtS6MaEyGuxBH1uhZT0wKh2oVxYb2/n56E0y4cvU5QE
	4UMywZ3TgJvo4XezPW6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qR6NZ-004G0C-2N;
	Wed, 02 Aug 2023 07:34:45 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qR6NV-004FxX-0F;
	Wed, 02 Aug 2023 07:34:43 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 23D05100020;
	Wed,  2 Aug 2023 10:34:26 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 23D05100020
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1690961666;
	bh=WEU63Mnt7xTNDDQGjM0C7uIxpJ9fktvAmk1Do9eEtOY=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:From;
	b=RPPs93NQIPNcaOI+7A6n755i37dFmijxDygr3TMHsVr5s5JVd+FMEOQ6IisJR+vf8
	 LM2VYm8c4ozNhSacvvhTV/D/A3yUQbHEB8gHWfseVM7tR3r/nh60AgaFXei+GAlKzI
	 7+S4sOnn3TmIHpFj5I1U23/VmA51zeWjw1coj6QNEzmwLFCFtJHLz9XmFPpUULfRlm
	 KKEfKXPDgaLZ7qdRMbSDuLcS9D+HhasNwxRqPmPk1mFNCszgvtDUCkL1A9obrk6L0t
	 UMcTexsG0OE/xG8nhkYV4CP62XRWGO8TqcGyPzV6RyNWirYvl1HfAceVAN90hSSKZa
	 iCQ/NMK4UIzLA==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Wed,  2 Aug 2023 10:34:26 +0300 (MSK)
Received: from localhost (100.64.160.123) by p-i-exch-sc-m01.sberdevices.ru
 (172.16.192.107) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Wed, 2 Aug
 2023 10:34:25 +0300
Date: Wed, 2 Aug 2023 10:34:25 +0300
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: Huqiang Qin <huqiang.qin@amlogic.com>
CC: <wim@linux-watchdog.org>, <linux@roeck-us.net>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
	<neil.armstrong@linaro.org>, <khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <linux-watchdog@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/4] watchdog: Add a new struct for Amlogic-GXBB driver
Message-ID: <20230802073425.urdu3xtoxm6ob3aa@CAB-WSD-L081021>
References: <20230726112146.1127145-1-huqiang.qin@amlogic.com>
 <20230726112146.1127145-3-huqiang.qin@amlogic.com>
 <20230728071558.xoa3sdku3zkuhtug@CAB-WSD-L081021>
 <01357346-59f3-5c5a-d456-8e64381fe611@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <01357346-59f3-5c5a-d456-8e64381fe611@amlogic.com>
User-Agent: NeoMutt/20220415
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 178796 [Jul 22 2023]
X-KSMG-AntiSpam-Version: 5.9.59.0
X-KSMG-AntiSpam-Envelope-From: DDRokosov@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 525 525 723604743bfbdb7e16728748c3fa45e9eba05f7d, {Track_E25351}, {Tracking_from_domain_doesnt_match_to}, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/07/23 08:49:00 #21663637
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_003441_499130_058E1B7F 
X-CRM114-Status: GOOD (  25.04  )
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

On Tue, Aug 01, 2023 at 08:51:30PM +0800, Huqiang Qin wrote:
> Hi Dmitry,
> 
> On 2023/7/28 15:15, Dmitry Rokosov wrote:
> > [ EXTERNAL EMAIL ]
> > 
> > Hello Huqiang,
> > 
> > Thank you for the patch series!
> > 
> > Please include a cover letter in future patch submissions if possible.
> > It will help to better understand the theme of the patch series and
> > group all patch sets together in one email thread.
> 
> Thank you for your suggestion. In fact, this patch series contains
> a cover letter. It may be due to network reasons that it was not
> sent to your mailbox correctly :)
> 

Ah, sorry, you are right... Now I see your cover letter on the
lore.kernel.org... My mail server makes a magic...

> ...
> >>  static int meson_gxbb_wdt_start(struct watchdog_device *wdt_dev)
> >>  {
> >>       struct meson_gxbb_wdt *data = watchdog_get_drvdata(wdt_dev);
> >> @@ -140,8 +143,12 @@ static const struct dev_pm_ops meson_gxbb_wdt_pm_ops = {
> >>       SET_SYSTEM_SLEEP_PM_OPS(meson_gxbb_wdt_suspend, meson_gxbb_wdt_resume)
> >>  };
> >>
> >> +static const struct wdt_params gxbb_params = {
> >> +     .rst_shift = 21,
> > 
> > Maybe it's better to declare rst with the BIT() macro already applied,
> > and use it in wdt_probe() as is. And name 'rst' without 'shift' is
> > looking more brief.
> 
> Okay, I will change it in the next version.
> 
> 
> Thanks
> 
> Best Regards,
> Huqiang Qin

-- 
Thank you,
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
