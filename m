Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A6A2C77B75
	for <linux-amlogic@archiver.kernel.org>; Fri, 19 May 2023 15:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=COfod1R4ex6KV/7ZVn50IuN92D3/bBuDHlmsg8bts3A=; b=dDEDjlKdInFfVk
	or33oeofWI5OfgiFwo1sWa51Xfii6ORaOPB3pkTQBXvogWA6u7qGYiytxTKG4wL+Lnvjukds0DTur
	wAh3Cy+ABjdJrQTMNBRuDbtjS3cMhov70TAmXeS4f88DhI2yy3RRTqKcw5LkyDRYawzWzKRjpjNkV
	YXNkxRrnkJrrd1A86fvbcwjvtiyi6RooIOZjzRYJeOqseQf3jhNpm/0EX3p0FBCiQof2V4ttQF6j1
	gjRBQsoojKuyRR/dnm4v49Ovr4KcMJGNJidolVDSIIduDp1Dlxsaw0keUhPyWLtjdWbpW3GZNc6us
	9XYJA5XvQ9x8OrkDdlBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q023o-00GbQC-0x;
	Fri, 19 May 2023 15:30:28 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q023k-00GbPW-0v;
	Fri, 19 May 2023 15:30:26 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 5841160C02;
	Fri, 19 May 2023 18:30:20 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1684510220;
	bh=FM3XQHIvBazKOyaGIdvJJG1Xxh1oXLVwed2SJetAZxw=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version;
	b=pEaO+8yICfGZmQX/lwpykshREOEuufR8DVfW0SBCUDgTAF6+85lk5jIaLZw/U4y6M
	 Br+q8AqWpOJi+wftmaXAlks/81gExyaIOLTEb0OZkV2QsgcBw0DNQ26lj1N9BFy6JO
	 KHy4AaWIfPxJM1AqTkq7IfarKLANFn4WPYtgOMofcB8TZJNBSJm5Fa338I4ygN++mD
	 E712LcV8XxKZ8LhEemqd8UOJ+fvtxAqnK5/0ERV4stJ04S8CzAeNy7icGZ/sgkPAQd
	 KbUp8M2baTeSe5sXq4wLE89CeJpDf59mNO3839x3yxQe2lcds/OB7oG3Y4kL97B4ni
	 pcNbfggQ/2WUQ==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Fri, 19 May 2023 18:30:19 +0300 (MSK)
From: Dmitry Rokosov <DDRokosov@sberdevices.ru>
To: Heiner Kallweit <hkallweit1@gmail.com>
CC: Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, Neil Armstrong
	<narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
	=?iso-8859-1?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	"thierry.reding@gmail.com" <thierry.reding@gmail.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "open list:ARM/Amlogic Meson..."
	<linux-amlogic@lists.infradead.org>, "linux-pwm@vger.kernel.org"
	<linux-pwm@vger.kernel.org>, "rockosov@gmail.com" <rockosov@gmail.com>,
	kernel <kernel@sberdevices.ru>
Subject: Re: [PATCH v4 4/4] pwm: meson: make full use of common clock
 framework
Thread-Topic: [PATCH v4 4/4] pwm: meson: make full use of common clock
 framework
Thread-Index: AQHZimbR5zQfWI/tB0mpsvpAczxBaA==
Date: Fri, 19 May 2023 15:30:19 +0000
Message-ID: <tyuyderm7i6otsgrntw2wj4k4ii5xwp2vngfa76eaguki7yuqa@322cjuotnr6q>
References: <9faca2e6-b7a1-4748-7eb0-48f8064e323e@gmail.com>
 <cb79d313-c7a2-42e9-639a-63cb5366521a@gmail.com>
In-Reply-To: <cb79d313-c7a2-42e9-639a-63cb5366521a@gmail.com>
Accept-Language: ru-RU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.0.24]
Content-ID: <1463AB5D3BAB0D44817600A52E19179A@sberdevices.ru>
MIME-Version: 1.0
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/05/19 11:16:00 #21342682
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230519_083024_695000_D8CA48C0 
X-CRM114-Status: GOOD (  30.93  )
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

Hello Heiner,

Thank you for the patch series!

I am currently working on the Amlogic A1 clock driver and other
peripheral devices, including PWM. During a discussion about the clock
driver with Martin Blumenstingl, we found an intersection between the
clock driver and your PWM CCF support patch series. Please see my
comments below.

On Thu, Apr 13, 2023 at 07:54:46AM +0200, Heiner Kallweit wrote:
> Newer versions of the PWM block use a core clock with external mux,
> divider, and gate. These components either don't exist any longer in
> the PWM block, or they are bypassed.
> To minimize needed changes for supporting the new version, the internal
> divider and gate should be handled by CCF too.
> 
> I didn't see a good way to split the patch, therefore it's somewhat
> bigger. What it does:
> 
> - The internal mux is handled by CCF already. Register also internal
>   divider and gate with CCF, so that we have one representation of the
>   input clock: [mux] parent of [divider] parent of [gate]
>   
> - Now that CCF selects an appropriate mux parent, we don't need the
>   DT-provided default parent any longer. Accordingly we can also omit
>   setting the mux parent directly in the driver.
>   
> - Instead of manually handling the pre-div divider value, let CCF
>   set the input clock. Targeted input clock frequency is
>   0xffff * 1/period for best precision.
>   
> - For the "inverted pwm disabled" scenario target an input clock
>   frequency of 1GHz. This ensures that the remaining low pulses
>   have minimum length.
> 
> I don't have hw with the old PWM block, therefore I couldn't test this
> patch. With the not yet included extension for the new PWM block
> (channel->clk coming directly from get_clk(external_clk)) I didn't
> notice any problem. My system uses PWM for the CPU voltage regulator
> and for the SDIO 32kHz clock.
> 
> Note: The clock gate in the old PWM block is permanently disabled.
> This seems to indicate that it's not used by the new PWM block.
> 
> Tested-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
> Changes to RFT/RFC version:
> - use parent_hws instead of parent_names for div/gate clock
> - use devm_clk_hw_register where the struct clk * returned by
>   devm_clk_register isn't needed
> 
> v2:
> - add patch 1
> - add patch 3
> - switch to using clk_parent_data in all relevant places
> v3:
> - add flag CLK_IGNORE_UNUSED
> v4:
> - remove variable tmp in meson_pwm_get_state
> - don't use deprecated function devm_clk_register

[...]

> @@ -166,7 +158,11 @@ static int meson_pwm_calc(struct meson_pwm *meson, struct pwm_device *pwm,
>  	if (state->polarity == PWM_POLARITY_INVERSED)
>  		duty = period - duty;
>  
> -	fin_freq = clk_get_rate(channel->clk);
> +	freq = div64_u64(NSEC_PER_SEC * (u64)0xffff, period);
> +	if (freq > ULONG_MAX)
> +		freq = ULONG_MAX;
> +
> +	fin_freq = clk_round_rate(channel->clk, freq);
>  	if (fin_freq == 0) {
>  		dev_err(meson->chip.dev, "invalid source clock frequency\n");
>  		return -EINVAL;

As mentioned previously, we have discussed one optimization for PWM
parent clock calculation. Many modern Amlogic SoCs include an RTC clock
within the clock tree. This clock provides a stable and efficient 32kHz
input for several clock objects that can be inherited through the muxes
from the RTC clock.

In short, we aim to use the RTC clock parent directly for PWM to
generate a 32kHz clock on the PWM lines. Martin has suggested one way to
do so, which is described in [0]. You can also refer to our IRC
discussion in [1].

I would appreciate your thoughts on this. Please let me know what you
think.

[...]

Links:
    [0] https://lore.kernel.org/all/CAFBinCCPf+asVakAxeBqV-jhsZp=i2zbShByTCXfYYAQ6cCnHg@mail.gmail.com/
    [1] https://libera.irclog.whitequark.org/linux-amlogic/2023-05-18

-- 
Thank you,
Dmitry
_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
