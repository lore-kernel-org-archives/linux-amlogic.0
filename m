Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 543CAC433EF
	for <linux-amlogic@archiver.kernel.org>; Tue,  5 Jul 2022 14:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YaLOyY5TV0164lQChG55gI1Qc+NF66q3aIbpcMaVe0E=; b=qiBkUPnwnCtjTx
	qYqg3qcp4C7Th03lKjM6q6RKv74k6stO1Bnuz8L0c+moelvjGKlDKBPdJlbfP8FyPZMPgCKVBhmMP
	1odASUZktuVOUe4zjBORIqOZTdqrMhV6ysk9lWWsCuAV3dezeyNz6GWp+o3WhrFBB40KzXR7BJPQu
	UbIWIwgXSc+csXUGgTbb8/uhQUNRQ9K9m39NruM6I5SW/JGzyTcRrWQBW6gmTUBX9SlVnjblZu9FS
	FXd+X8AmyQALmHSc8jxp1f85G8oMsa/PjI6ELWEcBH9f4qugC46i/60+3o7mltjtRPPT9JTjDF7/Z
	mbKcynzx1dzjDuko2kcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8jiz-000taW-MI; Tue, 05 Jul 2022 14:40:25 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8jie-000tPu-Ls
	for linux-amlogic@lists.infradead.org; Tue, 05 Jul 2022 14:40:07 +0000
Received: by mail-wr1-x42b.google.com with SMTP id o4so17888701wrh.3
        for <linux-amlogic@lists.infradead.org>; Tue, 05 Jul 2022 07:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=G+gm8hbgYAdy1B/RsK8Rmpw4XNewna1FlG8XZxsx5wg=;
        b=SNm4JJdVDuionLBY9g2YaG7c58bAq1IqZGYfxtQejR+q9qQy56Ihdys+1uANIlNnpO
         uPFScLMgu9QnUYIra/zTFW7YcREmzGkfcyvDnieEvEgiFIyLtrFmBSgFM/LiGygynOMF
         gOJbTIGC7M2NtuxEplS7z24+tkExxnrI+MlzGtXPCo06awO9VUbIVX1QxApu68eF4c1w
         e2vmu5n3zwW8XZbrVQ7iNPUrFzQQEShm5s7vbg0DPWKCP+Mt+PtRyd1hbq/UWjE181Lr
         yG2LAWhFjpELNfMXvn+0NyDibPESwSjt1fUxKlEWkMboYjo/+S5psS/5H/nfhoSvHFzw
         pzeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=G+gm8hbgYAdy1B/RsK8Rmpw4XNewna1FlG8XZxsx5wg=;
        b=f/KqcCYYR/jhcT0Zs/rzXsVzy8n4zA5x5n3NtY/ptDAVRJek/DxaJNfGBp14+a/6xP
         ZnFqWL0CkGfkTPc54yiay0qf9w2yY1lJgzD9uL5Yt/Zlpw8K/uCpeoZ/BZZ6zg69MBLq
         cEpkSQFpXibh9Jpspsl3Q8FYnfLyXZBF/M7gZLBlMtJ+6OMKMYmCFlAZOaVDK27c5CCd
         w6j5uhPk8v43BpFTOXinhuZxMSulNaWhx6byg5nSMyQncpjswd3veqWnUTertIZK2fRs
         HCk+dSiSoF9IjAuBTizRYGuN+3HRHWVlSta9v9iF4dHBmqaPP5Ube6QYVXUmdMhb3lYT
         XKgA==
X-Gm-Message-State: AJIora9XEdBbEbc8tiqLA9oU6M9H9mRfQNbKG3JJlLbLbh8TktQlM1AG
	z+Ol3yl0/bGa3n5HskkoHeFUMw==
X-Google-Smtp-Source: AGRyM1vYaCJFbX/quJl74Iitkw8Y5M5ouj3I04kVpLciSnjrMyI4w/5rUY92GK5isUWTQSUVnGcznw==
X-Received: by 2002:adf:db12:0:b0:21b:970b:e882 with SMTP id s18-20020adfdb12000000b0021b970be882mr33503539wri.6.1657032000721;
        Tue, 05 Jul 2022 07:40:00 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:3c4f:78be:dc90:14f9? ([2001:861:44c0:66c0:3c4f:78be:dc90:14f9])
        by smtp.gmail.com with ESMTPSA id c8-20020a7bc848000000b0039c457cea21sm22409891wml.34.2022.07.05.07.39.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Jul 2022 07:40:00 -0700 (PDT)
Message-ID: <f756b2d5-56e7-6e52-2739-eca4bb33508b@baylibre.com>
Date: Tue, 5 Jul 2022 16:39:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v1] watchdog: meson: keep running if already active
Content-Language: en-US
To: Philippe Boos <pboos@baylibre.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>
Cc: Kevin Hilman <khilman@baylibre.com>, Jerome Brunet
 <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-watchdog@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220705142444.17063-1-pboos@baylibre.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220705142444.17063-1-pboos@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_074004_999638_6EA034D9 
X-CRM114-Status: GOOD (  21.79  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

On 05/07/2022 16:24, Philippe Boos wrote:
> If the watchdog is already running (e.g.: started by bootloader) then
> the kernel driver should keep the watchdog active but the amlogic driver
> turns it off.
> 
> Let the driver fix the clock rate then restart the watchdog if it was
> previously active.
> 
> Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

Please drop this review tag since it was done off-list

> Signed-off-by: Philippe Boos <pboos@baylibre.com>
> ---
>   drivers/watchdog/meson_gxbb_wdt.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/watchdog/meson_gxbb_wdt.c b/drivers/watchdog/meson_gxbb_wdt.c
> index 5a9ca10fbcfa..8c2c6f7f3bb5 100644
> --- a/drivers/watchdog/meson_gxbb_wdt.c
> +++ b/drivers/watchdog/meson_gxbb_wdt.c
> @@ -146,6 +146,7 @@ static int meson_gxbb_wdt_probe(struct platform_device *pdev)
>   	struct device *dev = &pdev->dev;
>   	struct meson_gxbb_wdt *data;
>   	int ret;
> +	u32 regval;
>   
>   	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
>   	if (!data)
> @@ -177,6 +178,8 @@ static int meson_gxbb_wdt_probe(struct platform_device *pdev)
>   	data->wdt_dev.timeout = DEFAULT_TIMEOUT;
>   	watchdog_set_drvdata(&data->wdt_dev, data);
>   
> +	regval = readl(data->reg_base + GXBB_WDT_CTRL_REG); > +
>   	/* Setup with 1ms timebase */
>   	writel(((clk_get_rate(data->clk) / 1000) & GXBB_WDT_CTRL_DIV_MASK) |
>   		GXBB_WDT_CTRL_EE_RESET |
> @@ -186,6 +189,13 @@ static int meson_gxbb_wdt_probe(struct platform_device *pdev)
>   
>   	meson_gxbb_wdt_set_timeout(&data->wdt_dev, data->wdt_dev.timeout);
>   
> +	if ((regval & GXBB_WDT_CTRL_EN) != 0) {
> +		ret = meson_gxbb_wdt_start(&data->wdt_dev);
> +		if (ret)
> +			return ret;
> +		set_bit(WDOG_HW_RUNNING, &data->wdt_dev.status);
> +	}
> +
>   	watchdog_stop_on_reboot(&data->wdt_dev);
>   	return devm_watchdog_register_device(dev, &data->wdt_dev);
>   }

I think it would be much claner to leave the watchdog enabled, and get the parameters
from the registers and update the wdt_dev accordingly.

Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
