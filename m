Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF6D4C001B0
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Aug 2023 07:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v9AkuSN+yjBe1rJT7sg6Fm7boEpAcuC4InpZU8uguq4=; b=CxzCOmpf9qudcLMFWTT9OwSV5K
	Rg1DZkBDlTrVz2/N3ybvP04MVsXRPzzmnTSsStLB3d+Eroi4ygaO/FC7xD1ec8zRa76xll91QwNf+
	zF1xMKIHhRTw66jcKYNLt+eUlGB9iz6yrD2ey9B+4rUu5cL5kQbJFyKUMiclLKfSKQnuI0xaqFlIU
	sTBKEpcYLDDNMw2T84UgSJ5iWZJ1HOGGj6M4+nbsbF1SnUNMsoGZ/Vy3FqCR+NCl1RXYQD6ekei/9
	+zjx9tsg/p5mVuxbXsCK79L89l7ZixiWOHVdgN9dqYep9CAxhJ00R5TBHlmDVogaaHDIVmPk9wE2d
	UAYxOYZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVSDJ-00GOdq-1A;
	Mon, 14 Aug 2023 07:42:09 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVSDG-00GOcM-2n
	for linux-amlogic@lists.infradead.org;
	Mon, 14 Aug 2023 07:42:08 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-3fe1a17f983so36195605e9.3
        for <linux-amlogic@lists.infradead.org>; Mon, 14 Aug 2023 00:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691998916; x=1692603716;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BBL9irmWHTMujcW4M1YOlLfxnMuczJQ+8mOVXEk0MVk=;
        b=P1iq/wXbOo9batstDzGV9YJzd+25bRwaiWK6awDIC0BZVCTq6Ne82lsk/7vIeDXZA+
         1vDti1FRtCZExgKWGz5fFWlczEQwtema0pHr1L2vCySRLS9DIEwvoRGPs2CmakOLi0JC
         Gl5AMM894PvoEEcRkVbJfplm/NQfo/LMYT7kFUMlwFcsifvJc9bdbDqb/I1eWNA38fyu
         4wu7ZmrvPaoUMEc9o//9Pnavsn8iuX0WDtqufc2T/T3y3YBQPNddnP6yQwdGMpVpyc9N
         56ooqAUo7xmTVH1gRb0RX1AGItygrf1MvFO3w7bzVJAE4UHzAe/CZbq1t8w60wiF46g+
         v7mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691998916; x=1692603716;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BBL9irmWHTMujcW4M1YOlLfxnMuczJQ+8mOVXEk0MVk=;
        b=ddgR5XR2iSzfvUb4Mq8U681VNo7IhiDdKS6owRrurCEb/m/9zUQK4ujvnxcqQ3FJiC
         DHvOS9pIKOCo9XmB45gnLrbWmGGca9RFXZKjpFQW1FZgFKwLbgho2kOe7iQKslEw6VHf
         Jo1QkrXzRtbd20qgptJ4fVRAvEKaeVl/VBJZoJOVcIjuMTGLl2iNDsFQb1ntr41stVO2
         s8Kfq9s+f0hkSB0AUy1pdGiCCxMfpYegWmwDflfh0NQarshSBdfxYmzg23wNpX3ALhoe
         VTCa8SpZypYVoFGWFjf60ScXHNnh0cmDb0SUoX735VoWhj2+ogIS8SUnLdviM5gbV+EI
         TrlQ==
X-Gm-Message-State: AOJu0YzdfSGJOLa7ZFR2lq6uEPD8MvoLSklU5rHLdL+AaRAkQdgHEsfn
	jX+5GFaTH8x7TjvOPuaC+nbQiQ==
X-Google-Smtp-Source: AGHT+IFIrpJ3pZKR98GY/ZQMj9zHd+SKgxbbYpqvJsQjOEPPpk3/oxMFBr9duPkiu1pVrX0yA9+2uA==
X-Received: by 2002:a7b:ce05:0:b0:3fb:ffa8:6d78 with SMTP id m5-20020a7bce05000000b003fbffa86d78mr6531169wmc.36.1691998915875;
        Mon, 14 Aug 2023 00:41:55 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:a3d8:b217:d82c:9bc0? ([2a01:e0a:982:cbb0:a3d8:b217:d82c:9bc0])
        by smtp.gmail.com with ESMTPSA id z15-20020a1c4c0f000000b003fc0505be19sm13452478wmf.37.2023.08.14.00.41.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Aug 2023 00:41:55 -0700 (PDT)
Message-ID: <4de07b08-5eda-86d7-8925-f2fadbfca407@linaro.org>
Date: Mon, 14 Aug 2023 09:41:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2] usb: dwc3: meson-g12a: do post init to fix broken usb
 after resumption
Content-Language: en-US
To: Luke Lu <luke.lu@libre.computer>, linux-usb@vger.kernel.org,
 linux-amlogic@lists.infradead.org
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Da Xue <da@libre.computer>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20230809212911.18903-1-luke.lu@libre.computer>
Organization: Linaro Developer Services
In-Reply-To: <20230809212911.18903-1-luke.lu@libre.computer>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230814_004206_903218_1FFE274F 
X-CRM114-Status: GOOD (  19.11  )
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 09/08/2023 23:29, Luke Lu wrote:
> Device connected to usb otg port of GXL-based boards can not be
> recognised after resumption, doesn't recover even if disconnect and
> reconnect the device. dmesg shows it disconnects during resumption.
> 
> [   41.492911] usb 1-2: USB disconnect, device number 3
> [   41.499346] usb 1-2: unregistering device
> [   41.511939] usb 1-2: unregistering interface 1-2:1.0
> 
> Calling usb_post_init() will fix this issue, and it's tested and
> verified on libretech's aml-s905x-cc board.
> 
> Cc: stable@vger.kernel.org # v5.8+
> Fixes: c99993376f72 ("usb: dwc3: Add Amlogic G12A DWC3 glue")
> Signed-off-by: Luke Lu <luke.lu@libre.computer>
> 
> ---
> Note here, the commmit of Fixes tag is the first patch which bring
> suspend/resume function, so let's use it as the fix tag.
> 
> As commit 5b0ba0caaf3a: (usb: dwc3: meson-g12a: refactor usb init)"
> introduced the use_post_init() function, and this patch will explicitly
> depend on it, so let's set kernel version higher or equal to v5.8.
> 
> Changes since v1:
>   - add Fixes tag and Cc stable tree
> ---
>   drivers/usb/dwc3/dwc3-meson-g12a.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/usb/dwc3/dwc3-meson-g12a.c b/drivers/usb/dwc3/dwc3-meson-g12a.c
> index e99c7489dba0..2c07c038b584 100644
> --- a/drivers/usb/dwc3/dwc3-meson-g12a.c
> +++ b/drivers/usb/dwc3/dwc3-meson-g12a.c
> @@ -926,6 +926,12 @@ static int __maybe_unused dwc3_meson_g12a_resume(struct device *dev)
>   			return ret;
>   	}
>   
> +	if (priv->drvdata->usb_post_init) {
> +		ret = priv->drvdata->usb_post_init(priv);
> +		if (ret)
> +			return ret;
> +	}
> +
>   	return 0;
>   }
>   

Acked-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
