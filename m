Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8B36C001DB
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Aug 2023 08:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D1rO4DDl5sbsd5LPNTOmvFabnzetV3aAQUpdWlAKsA0=; b=MD+oeCXonrFhRC/SQGJh0KGWeE
	8q3S8nhVf6YAtE5CCJB4LXa0WOn+ACP7/6Rkcn64OmKYIC1UmLBW0iK5eIoPG6cfNXZeZCrVwtofm
	jyPXYsjGCp09EqnEe0FYyFFaCcapUZjp9QNGO5Ao3ZW7zgAlxRNk3ELoCY7AUq6hROhTbkbnDQc57
	XevY8n4Q4AipVlLkJMy94z96J/A0fArHwFgvmIU4DNLIKm7YSMRteJo3a8OTiJC2eC9wSnyCyfny+
	feaxxPS/yX8lbwqquhCyOUjFnM2xf+1c7PCuynOKFcoBT92cHXkGtDY4VZ3sXJPexQpikgr3LiT6c
	VLgu5yYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRqPx-00Buen-1u;
	Fri, 04 Aug 2023 08:44:17 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRqPu-00Bue7-38
	for linux-amlogic@lists.infradead.org;
	Fri, 04 Aug 2023 08:44:16 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-31792ac0fefso1515046f8f.2
        for <linux-amlogic@lists.infradead.org>; Fri, 04 Aug 2023 01:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691138652; x=1691743452;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GIjNdj4JuQxUdzoSWDRGT3Y0i+UGrI7BPvjCgMi7Q1s=;
        b=KcjvaeW5ImhkBzfV1yluLkYW8Dk7LKT75FPdFHktnYNgFXQSkUD0Jj6ygSZvobSR93
         J776H1HwUFcdIJLoZUfDA1EWhCTDzMcx/vFOUcTu2JAByAgmfOHjkZkZWZX88JRU3eEb
         TybI7qGk5E8mNME6rDj1VsnzuxB8iMdgRzp4J88746zJBRsnR5E9LF9An9RMQsYefdHl
         SnSUux/latyvhc518U7V2SHydsHUaa934NvXfl857PoJG7xcVWXUUODcKqONTBxcTPLF
         61XJ6q7NAf41rSNk9AVJNCOLkXaKQlHyuU9eKyvC0DnQZr8w+37XjEGD2rEPIHtp9Pco
         QUlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691138652; x=1691743452;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GIjNdj4JuQxUdzoSWDRGT3Y0i+UGrI7BPvjCgMi7Q1s=;
        b=dGTs2ITpO2stv81RCGL3o7XwAuufS1jEDakU26I5tnA9DayXF5+PRTRdernkcwNjCJ
         zLCcVyW8+eBiOUBP0Hd88hX7iWPw1ODlLuJYoOFZ2rcrc7IJ2R5Z1yDGcGdGah5v7Zo3
         nbxmCFgaUZHm5DAe1IhcQDtAocHDUQBYkH+X3J3186ziH4TyG3ushYVBker8qUIP5iq1
         2GUkkzh0xcBFrvBjV7eIX0b0SJh5hGQByvblWFMPzeKYs3cExuOuwDZXcglgDQ3VvxLr
         M8ueziwlrhNTwazL0faOWIdyWMQOFQ+qw2uLss5WlxtajWln/C2wZKkrTZzv7g/mnoA3
         n91A==
X-Gm-Message-State: AOJu0Yw7NRlI7h08aWEXgAjPdqsSA0F41SP5A6IykAYPTP7VP2sq6/dx
	BvwR1og0BFWO4Kye9LNhiK06PA==
X-Google-Smtp-Source: AGHT+IEAPU5SQIxnbMvwbEmJ5WnR8hp8muvDpqD+rDOvenYDw86jGu3Z1m9H0TJBl6KG4FAYBCvn5Q==
X-Received: by 2002:a05:6000:1081:b0:317:64f4:5536 with SMTP id y1-20020a056000108100b0031764f45536mr660139wrw.44.1691138652147;
        Fri, 04 Aug 2023 01:44:12 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:b526:9083:f5a6:4af1? ([2a01:e0a:982:cbb0:b526:9083:f5a6:4af1])
        by smtp.gmail.com with ESMTPSA id s18-20020adfeb12000000b0031779a6b451sm1924588wrn.83.2023.08.04.01.44.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Aug 2023 01:44:11 -0700 (PDT)
Message-ID: <36acaa5c-f41a-af88-78dd-cd3714301c12@linaro.org>
Date: Fri, 4 Aug 2023 10:44:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] net: phy: meson-gxl: implement meson_gxl_phy_resume()
Content-Language: en-US
To: Da Xue <da@libre.computer>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <CACqvRUZRyXTVQyy9bUviQZ+_moLQBjPc6nin_NQC+CJ37yNnLw@mail.gmail.com>
Organization: Linaro Developer Services
In-Reply-To: <CACqvRUZRyXTVQyy9bUviQZ+_moLQBjPc6nin_NQC+CJ37yNnLw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230804_014415_014351_CE1F811E 
X-CRM114-Status: GOOD (  19.42  )
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

Hi Da,

On 04/08/2023 05:07, Da Xue wrote:
> After suspend and resume, the meson GXL internal PHY config needs to
> be initialized again or the carrier cannot be found.
> 
> Signed-off-by: Luke Lu <luke.lu@libre.computer>
> Reviewed-by: Da Xue <da@libre.computer>
> 
> ---
>   drivers/net/phy/meson-gxl.c | 14 +++++++++++++-
>   1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/phy/meson-gxl.c b/drivers/net/phy/meson-gxl.c
> index bb9b33b6b..c4a07e6f7 100644
> --- a/drivers/net/phy/meson-gxl.c
> +++ b/drivers/net/phy/meson-gxl.c
> @@ -132,6 +132,18 @@ static int meson_gxl_config_init(struct phy_device *phydev)
>    return 0;
>   }
> 
> +static int meson_gxl_phy_resume(struct phy_device *phydev)
> +{
> + int ret;
> +
> + phy_clear_bits(phydev, MII_BMCR, BMCR_PDOWN);

Call genphy_resume() instead.

> + ret = meson_gxl_config_init(phydev);
> + if (ret)
> + return ret;
> +
> + return 0;
> +}

Please re-indent this function.

> +
>   /* This function is provided to cope with the possible failures of this phy
>    * during aneg process. When aneg fails, the PHY reports that aneg is done
>    * but the value found in MII_LPA is wrong:
> @@ -196,7 +208,7 @@ static struct phy_driver meson_gxl_phy[] = {
>    .config_intr = smsc_phy_config_intr,
>    .handle_interrupt = smsc_phy_handle_interrupt,
>    .suspend        = genphy_suspend,
> - .resume         = genphy_resume,
> + .resume         = meson_gxl_phy_resume,
>    .read_mmd = genphy_read_mmd_unsupported,
>    .write_mmd = genphy_write_mmd_unsupported,
>    }, {
> --
> 2.39.2

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
