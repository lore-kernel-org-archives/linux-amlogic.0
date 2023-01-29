Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDE23C05027
	for <linux-amlogic@archiver.kernel.org>; Sun, 29 Jan 2023 10:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rLHxYlA0cFQcm2P9w91bMVEjKg1N0O1JBEeUnEwED6I=; b=egA6iZ/bTA/Elm
	PZRZlYQu8tAqdCIdxxzmvsJFSdL+m4r4EPwN1PcJ2gU5qUeadnN87zvzpRmNa7KTa5pdkE3SXKbOs
	waNkYAx25eCb86+Um0TBOzXbecfrV9RLrcZDlUOWsJl9x/PA4VG3llHzCR5eGZvZwzAD+DVyFl8KD
	pphF7dNBbyB2XFh2DE0T97McjrUe42W4MUsR2lNEjXN4dOfM0oyABlnqYoj8Hp7gAaUmwB70v+Ioc
	QwZfA5p/q1RRlEIc//1DJ2VZZkWYhnH5Ui9hrBX6srBzoxCwtq1CZ8Pgrrl1EktSKS2xkJni5FTE2
	SsmrUKBTuook7L0NG9xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pM4tq-001IHE-F6; Sun, 29 Jan 2023 10:27:02 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pM4tg-001IFp-Jo; Sun, 29 Jan 2023 10:26:53 +0000
Received: by mail-ej1-x633.google.com with SMTP id dr8so2777044ejc.12;
        Sun, 29 Jan 2023 02:26:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:content-language
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ovxUQ/V5TcqN7BqebdwkQNb4pbvMOfkJ9D3O8GSI0hQ=;
        b=agFF7uN71aQ+hCMyIfo2ZUbt96fqep8Jxj58lW1laQM67Mea5FEUPCCIM0jJP+g2ro
         YJojag30Kbf2u6yUD0FfcgP/uXDlbMkVVwqbRxvnIwCweGVsCmK37Eepgc+Kc98qHqx2
         uoqtCFqqcX/CsHroAohNXVL/vRQWV8yf0rsq7/7ReTjwOc2kIjGNQKLYSneCCCFXWQX5
         qrPOidUqBYwhRZ3tis0WGXvAUjTQfx5CNDFqJI5RolzDNGIefazn4oxrgs4cpMONZoXO
         SlGygsUTXMHox1P8IcpkvrKAWX1cwQKdphlJ9T83cH/noCEIcb6BqcF48oH8BeoeerJB
         m2Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:content-language
         :references:cc:to:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ovxUQ/V5TcqN7BqebdwkQNb4pbvMOfkJ9D3O8GSI0hQ=;
        b=1swREuYlUEUDr/mvNvwAiPruaLl9yFMn324y0DFnobF25Dcn0wrSMQucIWwz1mkK+q
         DyBsSMXXEe2ts7zB9FH7jeYaOy91M+4WCtOt46+khvX1bYl51WNTe18BkvxVgJ2+FAGM
         eR0Fcw3oCRzMuCG/EeV1iFNpDkoJHBGLmHuozCnhBuARcdQ987j4jpJ4xVIwZDWrvRbj
         I6kBthlkOp8IWHAR52HRrV9koIamw4e4QkXsDMob0xde2O/UcK4uLSh5q7Y+qVKctM35
         AqDhI0+2KWMeWJOy3yZBy6/he4N8QzXajNpSam77smkbg+IdT9Jkk3HMk5ADOIs/pq3+
         8t7Q==
X-Gm-Message-State: AO0yUKXWTv4Mo/6YdvTsni+hLOKfPY9Dfuxcxj998lF2gxlK0yG/KOFN
	MCKgTQlGB+cfCFQxDNIrKLBfg0pY4oA=
X-Google-Smtp-Source: AMrXdXvbwS/S5KZGamBzCgPOBYm2o/4/jSpanUXMp21D45Lfe6P+AqaIcV6NNT4MROLNs9cvaMSGvQ==
X-Received: by 2002:a05:6402:4447:b0:497:c96b:4dea with SMTP id o7-20020a056402444700b00497c96b4deamr100372527edb.5.1674987998398;
        Sun, 29 Jan 2023 02:26:38 -0800 (PST)
Received: from ?IPV6:2a01:c23:c5b5:3100:da7:b18e:20b4:eee8? (dynamic-2a01-0c23-c5b5-3100-0da7-b18e-20b4-eee8.c23.pool.telefonica.de. [2a01:c23:c5b5:3100:da7:b18e:20b4:eee8])
        by smtp.googlemail.com with ESMTPSA id v15-20020a50954f000000b004a227e254dbsm2015167eda.80.2023.01.29.02.26.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Jan 2023 02:26:38 -0800 (PST)
Message-ID: <76e0aeea-2c15-528e-da21-4ad1f9281a13@gmail.com>
Date: Sun, 29 Jan 2023 11:26:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
To: Chris Healy <cphealy@gmail.com>, andrew@lunn.ch, linux@armlinux.org.uk,
 davem@davemloft.net, neil.armstrong@linaro.org, khilman@baylibre.com,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 jeremy.wang@amlogic.com
Cc: Chris Healy <healych@amazon.com>
References: <20230129022615.379711-1-cphealy@gmail.com>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH 1/1] net: phy: meson-gxl: Add generic dummy stubs for MMD
 register access
In-Reply-To: <20230129022615.379711-1-cphealy@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230129_022652_724597_A0126EBD 
X-CRM114-Status: GOOD (  16.03  )
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

On 29.01.2023 03:26, Chris Healy wrote:
> From: Chris Healy <healych@amazon.com>
> 
Hi Chris,

> The Meson G12A Internal PHY does not support standard IEEE MMD extended
> register access, therefore add generic dummy stubs to fail the read and
> write MMD calls. This is necessary to prevent the core PHY code from
> erroneously believing that EEE is supported by this PHY even though this
> PHY does not support EEE, as MMD register access returns all FFFFs.
> 
> Signed-off-by: Chris Healy <healych@amazon.com>
> ---
>  drivers/net/phy/meson-gxl.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/net/phy/meson-gxl.c b/drivers/net/phy/meson-gxl.c
> index c49062ad72c6..5e41658b1e2f 100644
> --- a/drivers/net/phy/meson-gxl.c
> +++ b/drivers/net/phy/meson-gxl.c
> @@ -271,6 +271,8 @@ static struct phy_driver meson_gxl_phy[] = {
>  		.handle_interrupt = meson_gxl_handle_interrupt,
>  		.suspend        = genphy_suspend,
>  		.resume         = genphy_resume,
> +		.read_mmd	= genphy_read_mmd_unsupported,
> +		.write_mmd	= genphy_write_mmd_unsupported,
>  	},
>  };
>  

thanks for catching this. The same issue we may have for the GXL-internal PHY.
Did you check this?

One result of the issue is the invalid ethtool --show-eee output given below.
Therefore the patch should go to stable, please annotate it as [PATCH net].

Fixes tag should be:
5c3407abb338 ("net: phy: meson-gxl: add g12a support")


EEE settings for eth0:
        EEE status: enabled - active
        Tx LPI: 1000000 (us)
        Supported EEE link modes:  100baseT/Full
                                   1000baseT/Full
                                   10000baseT/Full
                                   1000baseKX/Full
                                   10000baseKX4/Full
                                   10000baseKR/Full
        Advertised EEE link modes:  100baseT/Full
                                    1000baseT/Full
                                    10000baseT/Full
                                    1000baseKX/Full
                                    10000baseKX4/Full
                                    10000baseKR/Full
        Link partner advertised EEE link modes:  100baseT/Full
                                                 1000baseT/Full
                                                 10000baseT/Full
                                                 1000baseKX/Full
                                                 10000baseKX4/Full
                                                 10000baseKR/Full


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
