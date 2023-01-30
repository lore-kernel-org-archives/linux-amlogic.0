Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D9E7C636CD
	for <linux-amlogic@archiver.kernel.org>; Mon, 30 Jan 2023 20:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+D6ClO2VAIbCDxaSKsDy0srIDbYHSjkzDMKhKE49PRA=; b=hBTH55Mbip3lsF
	O7oX9RBtmL68DbCr10dsU2u7OVOQHq8emOCAAmjxFr/FNi/sIe4VMGAwnZU9QDUBGsOVQD7RDOmtn
	oZo/jrccNXbh+cEvqtzkFlp6LmTR1qu8BEUhPfatNQLxps0jzf5HCnwbhZKc73ny4FIHtPyzie9vb
	u4JBzfJjs1aoLzHRfL4EEZmBYWa40ihpVgeh5W0J4X8vpLa+zKD+3d1455h9bDcAQQ+PYM7eru+mz
	GiuDtEtPwpFCx0ywWUR8aeRnygTpePDqPYqReABO+mYYeInacfevLpkxvMM9tZQ+ogFhMhEDWyuGD
	80LM1YLBNwT/Mfa5f5fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMaZu-005Kf8-D2; Mon, 30 Jan 2023 20:16:34 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMaZj-005Kd4-Su; Mon, 30 Jan 2023 20:16:25 +0000
Received: by mail-ej1-x62f.google.com with SMTP id mc11so12827060ejb.10;
        Mon, 30 Jan 2023 12:16:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uPkPZ9hXb0YMQ9faHMJ8j8JGYXj5rWLnlmb1qb1codI=;
        b=WIJw0SxW2vsP9TRRknDb2FY31vDOZgEWggYys5sjxOFiZibWs2TKug6ZNVKVM0ijVi
         5clmtMicO0cMGzi+QAUZaQC8pFWRB3FfSnvPgOB5hGcWG/1eVvT7TG8RWdG/rLp1maA4
         2YusTbQ1V3t3AgT/FDNsE6N83zQVqU5x8aOa+uTYs6Mfn5HqUJzNUUByenEZuoKxjK72
         PUR2KIKcInpU+2koT99kYNC7WjgGh7juflxgHl5ruF2ols1qRD7FTLqhUr/CfWnK5BCN
         GgIIPsNRntsUWtZVRqHwrzEMpGBlgMdaJE+wZERFwkDktRL9KXvNqoUgeSA5r3dIex8u
         CEaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uPkPZ9hXb0YMQ9faHMJ8j8JGYXj5rWLnlmb1qb1codI=;
        b=RmayL8hu+bChYoWgZDXe9Oiaxo8VYyQYwizhsvKviyEweByZTKgSKaav/b0ZiffVQu
         hZzd18A/RcsYY1BI+pFfMEA51t8f16Q0wdUzCzRI+VkRSWdGlBLM36kVvWAdGLBjqw0Z
         6jZMybTCXrz7IcIGFKSYEz0A0BkFUKyYORjWs55PHdbVykS7TTJuymV6/TBeYmWHmH/x
         ykiZ4SSEzjaOxP+F8mxwkVu5lPql9EaAhtVfVWLs4KUYBlwh+KWSPmyqlJ2r9EDB4Ari
         O1vUgYFqOTarLtp8/eMdBhtIlvKMAh9eTiszOYEMSyxo7BUm6j9lz7dAgLWmw8NgCGiA
         FRbA==
X-Gm-Message-State: AO0yUKXRSBFQkAjgTEoI0iNw2fpQIKt5KNFbSDI82vxD2WSEd1JhsZDF
	GzP2MCikVkI/geyGembTlFg=
X-Google-Smtp-Source: AK7set/iisSzpF5vyGzXWeKEJ9SOXJV/hMny8Yz/vbZ7Y7oBrWg2V1eTmKTsaWJW0ik2OkN3038pKw==
X-Received: by 2002:a17:906:8444:b0:879:ab3:2864 with SMTP id e4-20020a170906844400b008790ab32864mr12057736ejy.24.1675109774600;
        Mon, 30 Jan 2023 12:16:14 -0800 (PST)
Received: from ?IPV6:2a01:c23:c074:7400:d941:3cb5:fa86:8ec8? (dynamic-2a01-0c23-c074-7400-d941-3cb5-fa86-8ec8.c23.pool.telefonica.de. [2a01:c23:c074:7400:d941:3cb5:fa86:8ec8])
        by smtp.googlemail.com with ESMTPSA id k16-20020a170906579000b0087bdae33badsm5772981ejq.56.2023.01.30.12.16.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jan 2023 12:16:14 -0800 (PST)
Message-ID: <0489ac03-ff79-adf1-104d-72523ace9701@gmail.com>
Date: Mon, 30 Jan 2023 21:16:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2] net: phy: meson-gxl: Add generic dummy stubs for MMD
 register access
Content-Language: en-US
To: Chris Healy <cphealy@gmail.com>, andrew@lunn.ch, linux@armlinux.org.uk,
 davem@davemloft.net, neil.armstrong@linaro.org, khilman@baylibre.com,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 jeremy.wang@amlogic.com
Cc: Chris Healy <healych@amazon.com>
References: <20230130200352.462548-1-cphealy@gmail.com>
From: Heiner Kallweit <hkallweit1@gmail.com>
In-Reply-To: <20230130200352.462548-1-cphealy@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_121623_962679_E1ED285E 
X-CRM114-Status: UNSURE (   8.70  )
X-CRM114-Notice: Please train this message.
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

On 30.01.2023 21:03, Chris Healy wrote:
> From: Chris Healy <healych@amazon.com>
> 
> The Meson G12A Internal PHY does not support standard IEEE MMD extended
> register access, therefore add generic dummy stubs to fail the read and
> write MMD calls. This is necessary to prevent the core PHY code from
> erroneously believing that EEE is supported by this PHY even though this
> PHY does not support EEE, as MMD register access returns all FFFFs.
> 
> Fixes: 5c3407abb338 ("net: phy: meson-gxl: add g12a support")
> Signed-off-by: Chris Healy <healych@amazon.com>
> ---
> 
> Change in v2:
> * Add fixes tag
> 
Reviewed-by: Heiner Kallweit <hkallweit1@gmail.com>



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
