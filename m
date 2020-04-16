Return-Path: <SRS0=I4qu=6A=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50F22C2BA19
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Apr 2020 03:23:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 285C42072D
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Apr 2020 03:23:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qI1wgwTO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 285C42072D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amlogic.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7QRlU81rkj2F3vgd8P5BQaTiyjh5yPuVPWrl2+yMGsE=; b=qI1wgwTOrP3bxV36CaQVjWgqI
	CHOr/nHhGOD6W6UgdGWqQow1VAqvzJwLf3Pk3SnG9727Apxn21ETlj8hYTPGgrokCNGK0hmsIWbI2
	QfjjgiDIsL1PEHq2/WoKuGsjEv95IuM35d1akaYpDokUw9TvccJBAGv4Iphy5a/tElGWn9jza6Qoq
	zZds4BKWXdM4Lg5F4gfxCrKvXKYK/6ZuC1nlpHBqPb3d16KniPUzmuZdqs4U5sFJ/oo51VkoVMPm/
	KRnYBoTsIjl4b7xeYQp/VxkETPUdVj2AxvBnYDkoMV/dAcwPaLgmmKplhWfOODYthSiJQeKCYp4Ro
	YGmzTUAbA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jOv7H-0003Xv-Ri; Thu, 16 Apr 2020 03:23:03 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jOv7G-0003WU-1o; Thu, 16 Apr 2020 03:23:03 +0000
Received: from [10.28.39.241] (10.28.39.241) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server id 15.1.1591.10; Thu, 16 Apr 2020
 11:23:40 +0800
Subject: Re: [PATCH v2 0/2] Add a watchdog driver that uses ARM Secure Monitor
 Calls.
To: Julius Werner <jwerner@chromium.org>
References: <20200403052900.258855-1-evanbenn@chromium.org>
 <CAKz_xw0gV+w_gMkLfB4qUBdULLfFoiv1TBWp9_PHy33wP_XWyA@mail.gmail.com>
 <890948ef-7276-fdae-d270-eb30eff3eab2@amlogic.com>
 <243e107c-35c1-2d14-5285-c9e13744963c@amlogic.com>
 <CAODwPW9RSB37+4EJ2QXAwz=ShFB23L1GKC2mLYE5L5JuQR2tPw@mail.gmail.com>
From: Xingyu Chen <xingyu.chen@amlogic.com>
Message-ID: <ea5ae44f-8b63-d34d-b313-c8deeafd86e1@amlogic.com>
Date: Thu, 16 Apr 2020 11:23:39 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAODwPW9RSB37+4EJ2QXAwz=ShFB23L1GKC2mLYE5L5JuQR2tPw@mail.gmail.com>
Content-Language: en-GB
X-Originating-IP: [10.28.39.241]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200415_202302_092175_DFBAE3F5 
X-CRM114-Status: GOOD (  17.40  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Yonghui Yu <yonghui.yu@amlogic.com>, Leonard Crestez <leonard.crestez@nxp.com>,
 Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Anson Huang <Anson.Huang@nxp.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Valentin Schneider <valentin.schneider@arm.com>,
 Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
 LINUX-WATCHDOG <linux-watchdog@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, "moderated
 list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, Jianxin Pan <jianxin.pan@amlogic.com>,
 Evan Benn <evanbenn@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Olof Johansson <olof@lixom.net>, Shawn Guo <shawnguo@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,Julius

On 2020/4/16 6:29, Julius Werner wrote:
>> In addition, It looks more reasonable to use the "msec" as the unit of
>> timeout parameter for the ATF fw interface with SMCWD_SET_TIMEOUT:
>>
>> - The fw interface will compatible with the uboot generic watchdog
>> interface at [0], and there is no need to convert timeout from msec
>> to sec.
> 
> I think we're trying hard to keep this compatible to a Trusted
> Firmware counterpart that we have already shipped, so we would prefer
> to keep it at seconds if possible. That's what the Linux watchdog core
> uses as well after all, so it just seems natural. I don't really see
> how what U-Boot does would have anything to do with this.

If the uboot introduces a smcwd driver, and it maybe work like this:

static const struct wdt_ops XXX_wdt_ops = {
	.start = XXX_wdt_start,
	...
}

static int XXX_wdt_start(struct udevice *dev, u64 ms, ulong flags) {
	timeout =  ms / 1000;  //convert timeout from msec to sec.
	smcwd_call(SMCWD_SET_TIMEOUT, timeout, NULL);
	smcwd_call(SMCWD_ENABLE, 0, NULL);
}

Best Regards
> 
>> - Some vendor's watchdog may be not support the "wdt_trigger_reset"
>> reset operation, but they can use the method below to reset the system
>> by the watchdog right now.
>>
>> watchdog_set_time(1);  //1ms
>> watchdog_enable();
> 
> They can still do that but they should do that on the Trusted Firmware
> side. Emulating a missing reset functionality should be handled by the
> hardware abstraction layer (in this case Trusted Firmware), not at the
> Linux API level. So Linux would still send a PSCI_SYSTEM_RESET SMC,
> but then Trusted Firmware can choose to implement that by setting the
> watchdog to the smallest possible timeout (which it can because it's
> accessing it directly, not through this SMC interface) and letting it
> expire.
> 
> .
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
