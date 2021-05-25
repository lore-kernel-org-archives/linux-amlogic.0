Return-Path: <SRS0=3IHZ=KU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2B39C2B9F8
	for <linux-amlogic@archiver.kernel.org>; Tue, 25 May 2021 07:20:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 656EA61417
	for <linux-amlogic@archiver.kernel.org>; Tue, 25 May 2021 07:20:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 656EA61417
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=RqvOMppiCCqxjZAKdrOapUHjz3yRAzXIO3Wdhw3U4o0=; b=luE4AjtwLmwhNMcwbla0uIPKgt
	hMaK3IOAFzWXcwGzbsRwbmToSuO7VaFgYeuNEn8Tq4ICgPu+nekZcXQT/T6MrNoKkiWqqkSsYPPy6
	oS9qzF7o4FABgZDa0sOp+6lO0mg+MYZn5P7DWBfiHgsvmzAGb0M3ncq6dbeLE8jGf17YDK1/bCEy8
	hGv50njky+MhclT+xVQ2HMsEq7SpK3JHy+Wc2FS2B40sWU6ixHWH22XoWT7IjWzz4tp8movXeZAYm
	9jXCg/l7dv+syo74M33PTumRgi8hgYlSFStnqzaHfeulrnPCKXRaneEk2FHtyimxQieWpBjS+wb2o
	KUXmgcRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1llRM2-003pij-I2; Tue, 25 May 2021 07:19:54 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1llRLh-003pco-Se
 for linux-amlogic@lists.infradead.org; Tue, 25 May 2021 07:19:35 +0000
Received: by mail-wr1-x42f.google.com with SMTP id x7so11374310wrt.12
 for <linux-amlogic@lists.infradead.org>; Tue, 25 May 2021 00:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZIF5qbJq5dDbTJkMUZQx+e6A8wnJOGmQFFouRAB4vUQ=;
 b=fPjSmZYrxa3jhg9v7KNIkfBuVzdPafEjR4yuhdo77RlnRctzYGJt5CBXzx5hYkcHO9
 +CMaIU7LIfmqH14An0A6RaAiVtioTQmJbT7EyffFC4UxLJHd8XS8GjTN/u3nMXdjxgil
 0lZzznUMlpP62/bLpTGiqzgZQl3XuPkaV0y9raIQlp/TQGBLD4NHmPYLOa8BM8EY7nX0
 LM9a5w2sMcacBLh1494DbEnDpiQFcqj0PXgNSe2dPRNSLW76fijemgaFSRNVCDq5Tfhz
 esPfTKmkzyjZByxmueQFFKj2Jdrom6jAVECHL2y9ivpgV7SbPZ3JqV1ZdTZpWq1Vez//
 yRjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=ZIF5qbJq5dDbTJkMUZQx+e6A8wnJOGmQFFouRAB4vUQ=;
 b=NKupWcsG0n94Vpq/OzTPDVca6SeDyy912JS0ywNXqGeC00XGCksx/1ZLVYRuLZe+Ft
 vaR/L9jorcO62Zta3GK94F7qnDevaF2CZQX1EDwuXNVzj3+OS6dnce2Wq8OHxs3zzaL2
 syyOkAft2kfW4adfDLKTGEqqDUqnpGdUSt9qTSwvC47xSq9wC6uQML56OdqVA8r/NXsL
 AKse3FFm19zJkDSSu3rnZe9s8oC8GsFI9q0+zTmSsIWaZH+Zw4fv9M7zpsuOQDKIs5x5
 U2dK3EF7vG62DCuSD3blWbtMibX0NDR1TLOPU4kn5zpzWVmwnyiKCgz2UTowLN0kpd44
 afOg==
X-Gm-Message-State: AOAM533oBihQewuiuVyH6BK82c1/XBS6c66bqUZJQECSFJszl8vjfaNZ
 V56GlIjuxDqEmBfjbk7+mP+lMg==
X-Google-Smtp-Source: ABdhPJxrlnvAxMSl+3epwoB8HYZGMfsPWkE8KGVioeRDms8mbTXy66Ka0tFnT+1HbxZ+RQTVeY4fMg==
X-Received: by 2002:adf:db42:: with SMTP id f2mr25788089wrj.5.1621927171421;
 Tue, 25 May 2021 00:19:31 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:90c:e290:1062:9531:8150:c5f3?
 ([2a01:e0a:90c:e290:1062:9531:8150:c5f3])
 by smtp.gmail.com with ESMTPSA id u18sm2620660wmj.15.2021.05.25.00.19.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 May 2021 00:19:30 -0700 (PDT)
Subject: Re: [PATCH] drm/meson: fix shutdown crash when component not probed
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Stefan Agner <stefan@agner.ch>
References: <20210430082744.3638743-1-narmstrong@baylibre.com>
 <CAFBinCC0aaMUbBkJ4bjhFa0A+sZH1muyW6kqAQYfjjXOkrNPGg@mail.gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <6a350607-3ccf-1af0-be17-8a31cc937e57@baylibre.com>
Date: Tue, 25 May 2021 09:19:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFBinCC0aaMUbBkJ4bjhFa0A+sZH1muyW6kqAQYfjjXOkrNPGg@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210525_001934_012612_41F1FEF6 
X-CRM114-Status: GOOD (  27.07  )
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

Hi Martin,

On 20/05/2021 22:25, Martin Blumenstingl wrote:
> Hi Neil,
> 
> since this has not received any Reviewed-by yet I tried my best to
> review it myself
> 
> On Fri, Apr 30, 2021 at 10:28 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
> [...]
>> --- a/drivers/gpu/drm/meson/meson_drv.c
>> +++ b/drivers/gpu/drm/meson/meson_drv.c
>> @@ -485,11 +485,12 @@ static int meson_probe_remote(struct platform_device *pdev,
>>  static void meson_drv_shutdown(struct platform_device *pdev)
>>  {
>>         struct meson_drm *priv = dev_get_drvdata(&pdev->dev);
> this part made it hard for me because I was wondering where the
> matching dev_set_drvdata call is
> it turns out platform_set_drvdata is used instead, meaning for me it
> would have been easier to understand if platform_get_drvdata was used
> here
> that's however nothing which has changed with this patch

OK sure, indeed, but since it's the same... but yeah it may be an issue if platform_set_drvdata changes.

> 
>> -       struct drm_device *drm = priv->drm;
>>
>> -       DRM_DEBUG_DRIVER("\n");
>> -       drm_kms_helper_poll_fini(drm);
>> -       drm_atomic_helper_shutdown(drm);
>> +       if (!priv)
>> +               return;
>> +
>> +       drm_kms_helper_poll_fini(priv->drm);
>> +       drm_atomic_helper_shutdown(priv->drm);
>>  }
> then this part finally made sense to me (as non-drm person), as
> platform_set_drvdata comes near the end of meson_drv_bind_master (so
> any errors would cause the drvdata to be NULL).
> 
> with this I can also give me:
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> in addition to my:
> Tested-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Thanks !

> 
> Can you please queue this up for -fixes or do we need to ask someone to do it?

Yes, the drm-misc-next & drm-misc-fixes are aleays opened and merged each week in the corresponding drm-next and drm-fixes
branches, so we can push patches at anytime without thinking about the merge window (except drm-misc-fixes merged back with -rc1).

Neil

> 
> 
> Best regards,
> Martin
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
