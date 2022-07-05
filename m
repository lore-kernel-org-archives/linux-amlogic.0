Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61E2EC43334
	for <linux-amlogic@archiver.kernel.org>; Tue,  5 Jul 2022 19:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z1ZRChQTsjmKolfin0MTodtVu0m8+DCWyctba8ElX9Y=; b=34A3TBq3KKUsc4
	B5DZYoVJGdFSulRACXMdoGNIPYq3qVvjuI2smgvkFJQ+DgPCbrUKtAVo7nKzlEuEHKGCge8NaZ2e5
	uQ/IXz0bUfR9eFDAIOihcC24HaclSXH8RFdhBVPR0E5w7StiIRMoKPrGcTN7Kc1dZq4ozuWGHkmv+
	1b1Ek1/DfrE14esJ7Iz7AK05r/v9u86b06lHJXA39DNK+5kXGuDsRef5eVfqmwmgA7hKwOmEAxhaS
	7OUCI051+ts5k25MSt+Ou1tgF61xMKQBofdV19m87kuQJuCJBEkR4qvsYPtL7ID2mPe0bWZB7wmZW
	JZJ9j0M4mYM3lRekI2QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8oZX-002SQi-2G; Tue, 05 Jul 2022 19:50:59 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8oZJ-002SMd-VK
	for linux-amlogic@lists.infradead.org; Tue, 05 Jul 2022 19:50:48 +0000
Received: by mail-wr1-x433.google.com with SMTP id r14so13233130wrg.1
        for <linux-amlogic@lists.infradead.org>; Tue, 05 Jul 2022 12:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=references:user-agent:from:to:cc:subject:date:in-reply-to
         :message-id:mime-version;
        bh=r8/0ZA0cdDqN2NnSWqxUYORUadal9PFtP6t/aV1KcUw=;
        b=QDyNEjwt8jCOFKmVmOz51PmC22Xtmo4y6ANbnIbf7vTmALffsQFEn3b0SfY95Xs6XY
         StEcZLt7rPwuOuNu4U8kcY/e7iSq/jvOPH3To1xBijA2ePnM1WXKcF+f/Cm12kNxpchC
         aLVMEF8udPULxRIOGsi07WkD/2Htb141j7fZ5gby5z4X1iiSneWcZ+057VyMUw+kozy7
         hiQNo+L/4RDHocqVaKuHpGlsHHb191B+CxsJ733h/TbzapMBV7kY5HtZBx92nasY7rlh
         xhiSz0tRf/gSME/U95Nhnojf40K857J1RCdqoVLKx66X1YElZcMANtv3kAmRsOgbGinh
         oJKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
         :in-reply-to:message-id:mime-version;
        bh=r8/0ZA0cdDqN2NnSWqxUYORUadal9PFtP6t/aV1KcUw=;
        b=X5li5le6PPNa48pjdmVsRnPaszatANV79MiLDBHCQD+ofzxjsLH2G61Kz51oVfQyBS
         lnsZuX7gmWtiZL+JfB1lQbETxo5i2y0lf/I0hIlSl4X0QagMfOf7LQjxZA+LAVWrA8LR
         UTXckElQfaN7lQG8RjsLQ3AN/OOJRvshghmH0Fki38pTzNEXB/a0cj0hBUDeKBqQvP08
         FFmB3UJhGY1o+5U1ThQKPS3TpI8xHrO6ZeNHSuuVkipmNBFmvFrArGhONAyDLy13J8OA
         kVnhy9FAP8UgiuzTkTMQcKMR7g4x0shr8uVErz8BC6FbcIQY5A2jdo8dOxavA8ySKZ+l
         SGyQ==
X-Gm-Message-State: AJIora+/xoveeZuF6E3/IuosbxrqHu2OkVoG78r0doL08bW0rpfHoWA4
	21355068P+mWCrLMOE76Cd1hmw==
X-Google-Smtp-Source: AGRyM1t4VJeJWG18aGWqK1uBLyW34gcIgRkYi+KE9OO5+cMEcmfCc/8n7ObhkC/951z3k5iY2UhS5A==
X-Received: by 2002:a5d:66c1:0:b0:21d:6c98:7aa4 with SMTP id k1-20020a5d66c1000000b0021d6c987aa4mr9956115wrw.136.1657050642786;
        Tue, 05 Jul 2022 12:50:42 -0700 (PDT)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
        by smtp.gmail.com with ESMTPSA id c21-20020a05600c0a5500b0039c4d022a44sm24170705wmq.1.2022.07.05.12.50.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 12:50:42 -0700 (PDT)
References: <20220705142444.17063-1-pboos@baylibre.com>
 <f756b2d5-56e7-6e52-2739-eca4bb33508b@baylibre.com>
User-agent: mu4e 1.8.2; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: Philippe Boos <pboos@baylibre.com>, Wim Van Sebroeck
 <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Kevin Hilman
 <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-watchdog@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] watchdog: meson: keep running if already active
Date: Tue, 05 Jul 2022 21:29:35 +0200
In-reply-to: <f756b2d5-56e7-6e52-2739-eca4bb33508b@baylibre.com>
Message-ID: <1jmtdnwd7y.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_125046_286323_963ED11B 
X-CRM114-Status: GOOD (  26.88  )
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


On Tue 05 Jul 2022 at 16:39, Neil Armstrong <narmstrong@baylibre.com> wrote:

> Hi,
>
> On 05/07/2022 16:24, Philippe Boos wrote:
>> If the watchdog is already running (e.g.: started by bootloader) then
>> the kernel driver should keep the watchdog active but the amlogic driver
>> turns it off.
>> Let the driver fix the clock rate then restart the watchdog if it was
>> previously active.
>> Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
>
> Please drop this review tag since it was done off-list

Indeed a review was done off-list.

Reviewed-by says a review has been done. I was not aware this applied to
public reviews only. I probably missed that, would you mind pointing me
to that rule please ?

>
>> Signed-off-by: Philippe Boos <pboos@baylibre.com>
>> ---
>>   drivers/watchdog/meson_gxbb_wdt.c | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>> diff --git a/drivers/watchdog/meson_gxbb_wdt.c
>> b/drivers/watchdog/meson_gxbb_wdt.c
>> index 5a9ca10fbcfa..8c2c6f7f3bb5 100644
>> --- a/drivers/watchdog/meson_gxbb_wdt.c
>> +++ b/drivers/watchdog/meson_gxbb_wdt.c
>> @@ -146,6 +146,7 @@ static int meson_gxbb_wdt_probe(struct platform_device *pdev)
>>   	struct device *dev = &pdev->dev;
>>   	struct meson_gxbb_wdt *data;
>>   	int ret;
>> +	u32 regval;
>>     	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
>>   	if (!data)
>> @@ -177,6 +178,8 @@ static int meson_gxbb_wdt_probe(struct platform_device *pdev)
>>   	data->wdt_dev.timeout = DEFAULT_TIMEOUT;
>>   	watchdog_set_drvdata(&data->wdt_dev, data);
>>   +	regval = readl(data->reg_base + GXBB_WDT_CTRL_REG); > +
>>   	/* Setup with 1ms timebase */
>>   	writel(((clk_get_rate(data->clk) / 1000) & GXBB_WDT_CTRL_DIV_MASK) |
>>   		GXBB_WDT_CTRL_EE_RESET |
>> @@ -186,6 +189,13 @@ static int meson_gxbb_wdt_probe(struct platform_device *pdev)
>>     	meson_gxbb_wdt_set_timeout(&data->wdt_dev, data->wdt_dev.timeout);
>>   +	if ((regval & GXBB_WDT_CTRL_EN) != 0) {
>> +		ret = meson_gxbb_wdt_start(&data->wdt_dev);
>> +		if (ret)
>> +			return ret;
>> +		set_bit(WDOG_HW_RUNNING, &data->wdt_dev.status);
>> +	}
>> +
>>   	watchdog_stop_on_reboot(&data->wdt_dev);
>>   	return devm_watchdog_register_device(dev, &data->wdt_dev);
>>   }
>
> I think it would be much claner to leave the watchdog enabled, and get the
> parameters
> from the registers and update the wdt_dev accordingly.

The problem is updating the time base (ie, the clock divider) while the
watchdog is running. We should not make an assumption about what the
bootloader is going to leave us.

It could be safe if we could update the divider, the timeout and ping
the watchdog with a single write. There is several registers for
that, so not possible. It is safer to update the divider with the
watchdog off.

There is indeed a small window of opportunity were a crash could happen
with the watchdog off. What is proposed here is progress compared to
what we have right now, which is waiting for userspace to come up to
start the watchdog again.

The only safe way to keep the watchdog on throughout is to keep whatever
time base was set by the bootloader. That means major rework since the whole
driver rely on a 1ms time base. I'm not sure re-using the bootloader
settings is such a great idea anyway. 

>
> Neil


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
