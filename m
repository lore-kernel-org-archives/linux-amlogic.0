Return-Path: <SRS0=N8xU=EC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A93BC4363A
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Oct 2020 10:58:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 895972224E
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Oct 2020 10:58:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hqYB6QvM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 895972224E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3N2fDD5J7IXnr3bmQe5UI5xi0nPVjcELgeSKsylMjzE=; b=hqYB6QvMltHMyno9O8mVpDiDZS
	kUuhfjhcmEVm5C96e5mAIUCAAePv+M7drdZ7vXp2sSnRO1h0C91DYzHwvKqwxdhsF/C7UlCBLh7EI
	hFSRCOizfCSEH6kK94db6xvCOT9k2HzB4DVtdw90lEI/jspJaXghaQMmGqkQiRTjAPo7gCD9Jcw4G
	ZFo+bgHb7ckw424HPgGjcevuvQ/7r19rSKbFM0TgzKfKIBojYUirVYZPrwLzAe8EibezQ8dm4lNrq
	w41eoFaeTpx9QA3ZdQ7ZZh6yoHU41LQ3gjLw08Md1b6RfvRHf5XjY80ESttxNMfMLwsGUYNBkFNQa
	gun89Teg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXMgF-0005cz-GA; Tue, 27 Oct 2020 10:58:19 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXMgD-0005cS-DR
 for linux-amlogic@lists.infradead.org; Tue, 27 Oct 2020 10:58:18 +0000
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <a.fatoum@pengutronix.de>)
 id 1kXMg7-00046a-Qk; Tue, 27 Oct 2020 11:58:11 +0100
Subject: Re: [Linux-stm32] [PATCH v7 10/12] ARM: dts: stm32: Fix schema
 warnings for pwm-leds
To: Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Alexander Dahl <ada@thorsis.com>, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-leds@vger.kernel.org
References: <20201005203451.9985-1-post@lespocky.de>
 <20201005203451.9985-11-post@lespocky.de>
 <b387bda8-3643-1d27-4996-2aa4dc94d69f@pengutronix.de>
 <20201027100536.cpfizc67gwrolp2z@falbala.internal.home.lespocky.de>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Message-ID: <f6ed201d-51b6-f278-7a95-3e3e49dc19ee@pengutronix.de>
Date: Tue, 27 Oct 2020 11:58:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201027100536.cpfizc67gwrolp2z@falbala.internal.home.lespocky.de>
Content-Language: en-US
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201027_065817_487768_F6E1260A 
X-CRM114-Status: GOOD (  17.72  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hello,

On 10/27/20 11:05 AM, Alexander Dahl wrote:
> Hello Ahmad,
> 
> thanks for your feedback, comments below.
> 

>>> -	led-rgb {
>>> +	led-controller-2 {
>>
>> Is a single RGB LED really a controller?
> 
> I just followed the recommendations by Rob here.

Do you happen to know if the new multicolor LED support could be used here?

I find it unfortunate that the device tree loses information relevant to humans
to adhere to a fixed nomenclature. Apparently led-controller isn't even codified
in the YAML binding (It's just in the examples). If you respin, please add a
comment that this is a single RGB led. I'd prefer to keep the information
in the DTB as well though.



> 
>>>  		compatible = "pwm-leds";
>>>  
>>> -		led-red {
>>> +		led-2 {
>>
>> Shouldn't this have been led-1 as well or is the numbering "global" ?
> 
> Also good question. This numbering is for dts only, it usually does
> not correspond with LEDs on the board, so it could be numbered per
> led-controller as well?

I'd prefer that it starts by 1. That way it's aligned with PWM channel
ID.

Thanks for fixing the dtschema warnings by the way!

Cheers,
Ahmad

> 
> Greets
> Alex
> 
>>
>>>  			label = "mc1:red:rgb";
>>>  			pwms = <&leds_pwm 1 1000000 0>;
>>>  			max-brightness = <255>;
>>>  			active-low;
>>>  		};
>>>  
>>> -		led-green {
>>> +		led-3 {
>>>  			label = "mc1:green:rgb";
>>>  			pwms = <&leds_pwm 2 1000000 0>;
>>>  			max-brightness = <255>;
>>>  			active-low;
>>>  		};
>>>  
>>> -		led-blue {
>>> +		led-4 {
>>>  			label = "mc1:blue:rgb";
>>>  			pwms = <&leds_pwm 3 1000000 0>;
>>>  			max-brightness = <255>;
>>>
>>
>> -- 
>> Pengutronix e.K.                           |                             |
>> Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
>> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
>> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
