Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46BB4C77B71
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Apr 2023 14:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4gajd3RtmopdK0nHKKzPAvS9pgfVccof+wnuSqpZGDY=; b=IFRaMmPYqQeDAW
	nK7ASflO7IKgvnbiT+8dEViLpxq8dIfMJGa/jdh3h34rkHcK+AcdQUi17v4zRdpQcqAdd6TC7mJRQ
	AFXTjbQvDKOQnkzwV5fQ1fp0+XKP8BjlHMc3z+t3Hfu1NBtTulVcG4APd9CyvaZl9ZGAPXWUHoyUN
	Hcoz3VNoK8eNBfvkHIrHYjoloU4r8Wx9oH1C204+9HTE6lRjzF2EoFJpC069VYwCOGtEt2jMvnXyO
	BcnIUC0jwGxUzo03/Qro1g7wjWSq7du775uz7GRi9B7OAQh7HpmHxHDWkkuyKt/ePFk3AKmnEoecz
	WeUngcTkuxj08IE9CjkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppsCd-00BDqG-2w;
	Fri, 21 Apr 2023 14:57:35 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppsCZ-00BDpK-2o;
	Fri, 21 Apr 2023 14:57:34 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id C7F805FD2F;
	Fri, 21 Apr 2023 17:57:24 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1682089044;
	bh=kXc8+eTLHxscDSs+Gq31+KDprqZ81SYjJ4bIrlQstqc=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	b=bdiL/Zv4uiUe4gALoedKo5VShEWwZB8fa72p4Cg8TkMFzg4tQUPQtpiTWVXFWYfNo
	 Ya5ic+IHfE/Q24a5IAsSRHXyrXzARRg3hV+dYRfp35pF82GfyXa1jxnoJJWJo5tk3P
	 5rjoyJQYaU0R0qBsJjo98l8fmdtyljnvxs7jrelvhOzQxcvZ1XALx+GsmRzyVGg3TF
	 hwaI0HFFOdq8efFlpv3FvfP4hMAshhT0OBrhcHBML5FOOXxAzrFZOXOzOHAUExW7+s
	 cuPMkSP4cgGVKInX9SfTMUfH93TWSyOd6SgJb581ORlGMdUpILOVT831ZBDl3TJ9yD
	 Rf4bViXE1Uzpg==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Fri, 21 Apr 2023 17:57:24 +0300 (MSK)
Date: Fri, 21 Apr 2023 17:57:23 +0300
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: Heiner Kallweit <hkallweit1@gmail.com>
CC: Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, Neil Armstrong
	<narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Uwe
 =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	"thierry.reding@gmail.com" <thierry.reding@gmail.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "open list:ARM/Amlogic Meson..."
	<linux-amlogic@lists.infradead.org>, <linux-pwm@vger.kernel.org>,
	<kernel@sberdevices.ru>
Subject: Re: [PATCH] pwm: meson: simplify calculation in meson_pwm_get_state
Message-ID: <20230421145723.oq7zqbhhz4fhkmyj@CAB-WSD-L081021>
References: <5a5920db-4c32-25e8-d1e3-bd2f724dd242@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5a5920db-4c32-25e8-d1e3-bd2f724dd242@gmail.com>
User-Agent: NeoMutt/20220415
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH02.sberdevices.ru (172.16.1.5) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/04/21 08:36:00 #21135550
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230421_075732_597726_864CF720 
X-CRM114-Status: GOOD (  22.87  )
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

Thank you for the patch! Please find my comments below.

On Wed, Apr 19, 2023 at 11:30:55PM +0200, Heiner Kallweit wrote:
> I don't see a reason why we should treat the case lo < hi that
> different and return 0 as period and duty_cycle. Let's handle it as
> normal use case and also remove the optimization for lo == 0.
> I think the improved readability is worth it.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Inside this patch, in my opinion, you have not only simplified and
optimized but have also modified the logic. It is important to provide
more details on this modification. Previously, in cases where
(channel->lo != 0) && (channel->lo < channel->hi), period and duty_cycle
were not calculated. However, in your patchset, duty_cycle and polarity
are calculated and returned to the caller in such cases.
Can you please share the details of why this is the right solution?
Also, please rephrase the commit message using 'modify' instead of
'simplify'.

> ---
>  drivers/pwm/pwm-meson.c | 14 ++------------
>  1 file changed, 2 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
> index 5732300eb..3865538dd 100644
> --- a/drivers/pwm/pwm-meson.c
> +++ b/drivers/pwm/pwm-meson.c
> @@ -351,18 +351,8 @@ static int meson_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
>  	channel->lo = FIELD_GET(PWM_LOW_MASK, value);
>  	channel->hi = FIELD_GET(PWM_HIGH_MASK, value);
>  
> -	if (channel->lo == 0) {
> -		state->period = meson_pwm_cnt_to_ns(chip, pwm, channel->hi);
> -		state->duty_cycle = state->period;
> -	} else if (channel->lo >= channel->hi) {
> -		state->period = meson_pwm_cnt_to_ns(chip, pwm,
> -						    channel->lo + channel->hi);
> -		state->duty_cycle = meson_pwm_cnt_to_ns(chip, pwm,
> -							channel->hi);
> -	} else {
> -		state->period = 0;
> -		state->duty_cycle = 0;
> -	}
> +	state->period = meson_pwm_cnt_to_ns(chip, pwm, channel->lo + channel->hi);
> +	state->duty_cycle = meson_pwm_cnt_to_ns(chip, pwm, channel->hi);
>  
>  	state->polarity = PWM_POLARITY_NORMAL;
>  
> -- 
> 2.40.0
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

-- 
Thank you,
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
