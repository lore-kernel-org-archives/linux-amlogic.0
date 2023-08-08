Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E188C001B0
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Aug 2023 06:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H7kZBwvuHTw/R5BevC6jNEB/iCbERTososmt4Pq/FZg=; b=rUPbShik01H5Sc
	n2Fp/I7R55jg8/YbTIE0nCLyKX2Z1ntQwFXnf7E/A7ZUduVt2VqK7/PvGDoMUzeCZjnMGHJfJwGXd
	R6lJ/4TPVWSGKgyV7vRhoU8XKQjtTketicgZvRhdUvrZmSljfqW8OzkpWWUpf78arQ7fUu7YvSfJp
	5z74aKQpzxW5O0306oBSb9NI5qjVw9LpOQ1Ql7Vzuo4qUgLHPJ5qkbToZDNIUOTN+YhYzv+FPM64K
	KHnuNjDLM3HpWctMxevxSyuOygTtKRvqWxtLJpWNm20kszd/XVD5daSalJu0ZCC45BcsS2YGuzIww
	kYZm81QjPDyyu/fr6sYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTGQU-001q0G-16;
	Tue, 08 Aug 2023 06:42:42 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTGQQ-001pzn-2D;
	Tue, 08 Aug 2023 06:42:40 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-52327d63d7cso3979263a12.1;
        Mon, 07 Aug 2023 23:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691476954; x=1692081754;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tDyaLCkG9Gwg7DW4JRUummSbEo/7bXQ3Usvl8gTviOs=;
        b=kCeppCUh1KY1UqWEdGsvJRFCOkRWKeiU7yx0rUxQQEWO3u2/OIsRVDkIczRgQ9rJOe
         9dPPbSTi91LQd+Q7IBcDzal5c4KLPq0erwFc1l/nbdY7Ts8mDiVv8Ec6WP+9WfjYW370
         Q3y+NdEE0X0gTju7sT6+fxOsys7wqhbRT2r3sdrXp8UtM8fDljLjaNcIrZugJqGxcFof
         /RF4bzHHSKfbttUfz42SsBkIFytlvEZEjE66yA4nyPIVxTzfW/FVeFQCnYfKhBMta33r
         HqZbfftZH3mrm1FZ0WKSZ5xeaooxMIUY8RPTF58qyfoHo163yRh/DN0aJTcg75b5AMmN
         xzoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691476954; x=1692081754;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tDyaLCkG9Gwg7DW4JRUummSbEo/7bXQ3Usvl8gTviOs=;
        b=JFPfrUfF/F7p4nzRQhKWMp5V21ceK6s1il5iIEq6f0yewzYiSbDhKbkzC7WjhhYBGF
         hsBfCXz0fNuhoTnFDQQvwclI+ZacEnEz4Ej9PL0AvPUlRMv2rekFO6CNfOep7wlNutx+
         0jBSD4ibKH/olA3d+X7FYeotub+ctspHp8kMb1Ek8fOahcc8bCajv2XQdwnNZ0DTU/oZ
         XOuN7AaopulgSgxYURuEgQFeY+b51YYNPWPG8jUfe/iNmbXaNvN7HMVjMgwKLFykNlwG
         VT0l5yJb2CgB3tWs8YM+yKFd2wqbCYF7WYH5hCCfZDe5RgQltCmPVLf7IAqYVLbuGoLw
         GIEg==
X-Gm-Message-State: AOJu0YymUsLojx5ZxrBnssvs6EnjiOjQdyqw2LcX7hJ6FaliEEaqDEfq
	sGoyy0Sblqv5+UGB9CxLDgY=
X-Google-Smtp-Source: AGHT+IGngRj3koc+G8bnqTzcS+/05+rLUdqPpBwdfyDQqjhLNRWeHlU8nfQEE0EYjdPBdEAVgf4UzQ==
X-Received: by 2002:a17:906:31c7:b0:99b:55e3:bbd with SMTP id f7-20020a17090631c700b0099b55e30bbdmr9437027ejf.34.1691476953939;
        Mon, 07 Aug 2023 23:42:33 -0700 (PDT)
Received: from ?IPV6:2a02:3100:9102:d500:25c8:948:5db6:241c? (dynamic-2a02-3100-9102-d500-25c8-0948-5db6-241c.310.pool.telefonica.de. [2a02:3100:9102:d500:25c8:948:5db6:241c])
        by smtp.googlemail.com with ESMTPSA id fx15-20020a170906b74f00b0099c157cba46sm6142048ejb.119.2023.08.07.23.42.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Aug 2023 23:42:33 -0700 (PDT)
Message-ID: <b8931b6c-5b35-8477-d50f-b7a43b13615f@gmail.com>
Date: Tue, 8 Aug 2023 08:42:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v3] net: phy: meson-gxl: implement meson_gxl_phy_resume()
To: Da Xue <da@libre.computer>, Andrew Lunn <andrew@lunn.ch>,
 Russell King <linux@armlinux.org.uk>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Luke Lu <luke.lu@libre.computer>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20230808050016.1911447-1-da@libre.computer>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
In-Reply-To: <20230808050016.1911447-1-da@libre.computer>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230807_234238_746966_B539D445 
X-CRM114-Status: GOOD (  20.76  )
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

On 08.08.2023 07:00, Da Xue wrote:
> After suspend and resume, the meson GXL internal PHY config needs to

To avoid misunderstandings:
You mean suspend/resume just of the PHY, or of the system?

Description sounds like this patch is a fix and should go to stable.
So add a Fixes tag.

And a formal remark: Your patch misses the net / net-next annotation.

> be initialized again, otherwise the carrier cannot be found:
> 
> 	eth0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc mq state
> 		DOWN group default qlen 1000
> 
> After the patch, resume:
> 
> 	eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP
> 		group default qlen 1000
> 
> Signed-off-by: Luke Lu <luke.lu@libre.computer>
> Signed-off-by: Da Xue <da@libre.computer>
> ---
> Changes since v2:
>  - fix missing parameter of genphy_resume()
> 
> Changes since v1:
>  - call generic genphy_resume()
> ---
>  drivers/net/phy/meson-gxl.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/phy/meson-gxl.c b/drivers/net/phy/meson-gxl.c
> index bb9b33b6bce2..bbad26b7c5a1 100644
> --- a/drivers/net/phy/meson-gxl.c
> +++ b/drivers/net/phy/meson-gxl.c
> @@ -132,6 +132,18 @@ static int meson_gxl_config_init(struct phy_device *phydev)
>  	return 0;
>  }
>  
> +static int meson_gxl_phy_resume(struct phy_device *phydev)
> +{
> +	int ret;
> +
> +	genphy_resume(phydev);

Return value of this function should be checked.

> +	ret = meson_gxl_config_init(phydev);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
>  /* This function is provided to cope with the possible failures of this phy
>   * during aneg process. When aneg fails, the PHY reports that aneg is done
>   * but the value found in MII_LPA is wrong:
> @@ -196,7 +208,7 @@ static struct phy_driver meson_gxl_phy[] = {
>  		.config_intr	= smsc_phy_config_intr,
>  		.handle_interrupt = smsc_phy_handle_interrupt,
>  		.suspend        = genphy_suspend,
> -		.resume         = genphy_resume,
> +		.resume         = meson_gxl_phy_resume,
>  		.read_mmd	= genphy_read_mmd_unsupported,
>  		.write_mmd	= genphy_write_mmd_unsupported,
>  	}, {


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
