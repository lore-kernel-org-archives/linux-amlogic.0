Return-Path: <SRS0=/4qX=OK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E6A7C433F5
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Sep 2021 12:23:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B07D660F58
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Sep 2021 12:23:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B07D660F58
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=MpGCvR6pRxAQ9cUJcM+pbWgKLFb+qK2jEq+KkYhhbgY=; b=D8q1/mpDA74LORbL7aFJOkmV6P
	oNxSS25u2aVOTLrgyMhIbvzrhA0Mx3WRPjdNQegeQdUoZg4CLOpF5BlCsvNjwewyJ1+iagomqu1BL
	5bMrFzmbbIIbm5e7aieSriiXB5BiaIAEFJj01tXTTr4O0qF0emt4E5B7u/NzVMkypVWJ/WJAO3XrI
	fDIBHzI3e5Q+wsASgpX58Nn8+ejKbWmgpmFz5jpPJEib1IXcWxlcWXzK8bOiqGXzSGOY2DP0hQ77K
	ATUkb33DHohigcqTIEuigJDl/ioqjVKtIMJ/AejHnextNeswCyB/Afb9Zl+9WTbJDEmQYPwz+i2+A
	qgl2uN9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSIK2-001WwX-7i; Mon, 20 Sep 2021 12:22:58 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSIJn-001WrP-Gj
 for linux-amlogic@lists.infradead.org; Mon, 20 Sep 2021 12:22:45 +0000
Received: by mail-wr1-x430.google.com with SMTP id w29so29099817wra.8
 for <linux-amlogic@lists.infradead.org>; Mon, 20 Sep 2021 05:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tCMyAI4JO6VKkU7AmoNIAzglb9xaZgl9kmlNL3VEvL4=;
 b=JZQ2+zI+W0SL7cwiKWYbsuiuWplyCzFrYondKJhbn30f0ST4w3KQPKCOEdfN2X7qL/
 e4Hf5Vp6LoppSpnYVor+/hGghyQHmG3ZsUR/ZkmnRXReGgnd/kbYeYCMGt1miVcU5f3G
 eNrhTmqpmBt7jczLwm/DagTdp961iGwu1mGwr07e26mO2nxiv9gSoHKsqNmjtJHR0HcX
 hI7cPlwBB2bo6KeAzNOUNVycXeEL2/Q1YCKti0uiy/CKnOWe/u0dsztQYYvqJgGdIRbD
 CvhkmLu1/MZ9EDXANpLWWBXiXKRFLqRL7fo7MybclREbWmfjsU5fKJc/MxS7ek7iq0wc
 7WCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=tCMyAI4JO6VKkU7AmoNIAzglb9xaZgl9kmlNL3VEvL4=;
 b=6NGUVKLemHLOqsnFdk3rVgfUX5JsqfgyxZ7xsavaqZrci4Sm3dO4P+mhoEV9TpI8C1
 OzTm9Clc9tXqchYFhnbSr87gEWkZ+ITm7cVpnTUKeweVbzueIbLgxRNi0H6aNLZz3c+u
 tOSVMngS9zwozfIRZ+zK+5NO2VkRrEd8yPz/U0PoznxarfUCjIB6katJd1F4vQy0VLDz
 XsL+iMKKRMH+C7X+ojLYzFk6Q47C5z2vcx5nRxRTC9cPzQoK1cF4SZegIlZjUq99b9PC
 uSa3VLaFgpCFHAt3+pia9jVCWvYM1ZIwXjJv3JpiBxzRcueAvcKfKPFczsTGuvWP4zRW
 6W2A==
X-Gm-Message-State: AOAM532GXwqWhMz2KCQ1Xq1QkszQUj2J/8No1d7moE3bV7hHGCKN36WI
 f1S9rh1wmZb7/STJZ1XbCvknN3BMl/4sYrxD
X-Google-Smtp-Source: ABdhPJwghoiUF31ZcV1Our+qvNK3DzJ3CUzQX74ij+vo4OEmaDXRO6ym4AzRjtnXIVr8AS5Bn9Zzhw==
X-Received: by 2002:a05:600c:17d1:: with SMTP id
 y17mr29272700wmo.135.1632140561722; 
 Mon, 20 Sep 2021 05:22:41 -0700 (PDT)
Received: from ?IPv6:2001:861:44c0:66c0:aa8a:ef22:59c5:1bf3?
 ([2001:861:44c0:66c0:aa8a:ef22:59c5:1bf3])
 by smtp.gmail.com with ESMTPSA id a72sm19889422wme.5.2021.09.20.05.22.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 05:22:41 -0700 (PDT)
Subject: Re: [PATCH 2/9] firmware: meson: simplify getting .driver_data
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
References: <20210920090522.23784-1-wsa+renesas@sang-engineering.com>
 <20210920090522.23784-3-wsa+renesas@sang-engineering.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <ad855cb8-0ed4-4e42-7434-2073855249fa@baylibre.com>
Date: Mon, 20 Sep 2021 14:22:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210920090522.23784-3-wsa+renesas@sang-engineering.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210920_052243_622638_F917C82F 
X-CRM114-Status: GOOD (  16.26  )
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

On 20/09/2021 11:05, Wolfram Sang wrote:
> We should get 'driver_data' from 'struct device' directly. Going via
> platform_device is an unneeded step back and forth.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> Build tested only. buildbot is happy.
> 
>  drivers/firmware/meson/meson_sm.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/firmware/meson/meson_sm.c b/drivers/firmware/meson/meson_sm.c
> index 77aa5c6398aa..714016e3aab3 100644
> --- a/drivers/firmware/meson/meson_sm.c
> +++ b/drivers/firmware/meson/meson_sm.c
> @@ -240,12 +240,11 @@ EXPORT_SYMBOL_GPL(meson_sm_get);
>  static ssize_t serial_show(struct device *dev, struct device_attribute *attr,
>  			 char *buf)
>  {
> -	struct platform_device *pdev = to_platform_device(dev);
>  	struct meson_sm_firmware *fw;
>  	uint8_t *id_buf;
>  	int ret;
>  
> -	fw = platform_get_drvdata(pdev);
> +	fw = dev_get_drvdata(dev);
>  
>  	id_buf = kmalloc(SM_CHIP_ID_LENGTH, GFP_KERNEL);
>  	if (!id_buf)
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
