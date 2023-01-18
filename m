Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B49D7C004D4
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Jan 2023 08:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qcMGPu/ANdhARNrPPejYjteZtVbPXJXFSWNwP6MosGE=; b=PQH2VYb1uidPx5
	f4YTQoosd3elhzdjFZMlVkogm6ktQWGTmOCpIw3XTR39bapHW0SpaaMKNraDKBtGk2S+TqpEmXlKU
	cGdxx5+CuxUl1GXxazDHkCT0QNKsBm6MlUEBjc4kDrTEMIGv1AeLAr46MBmXREMrR/nlM4UGXrTF4
	iywTZaO8pS1038c/ufI/DTubpCtY6AypEsk/1QJJDVn0YMsR0fGji4nChM7aKPI3qgAwhJmWoJz/g
	BYG8MIjNOgD438Vx/Xlbv/dqq7HicO3jIoYQDpbcQBkeBJV4GtY4HrNF9eMBZsgxHl1zxGx8vgU8X
	w8ism4nqe6qrNQNvnr2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI3pI-00HTHE-8j; Wed, 18 Jan 2023 08:29:44 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI3pF-00HTFI-Bd
	for linux-amlogic@lists.infradead.org; Wed, 18 Jan 2023 08:29:42 +0000
Received: by mail-wr1-x431.google.com with SMTP id d2so12978363wrp.8
        for <linux-amlogic@lists.infradead.org>; Wed, 18 Jan 2023 00:29:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=caKf+QEHqFSWMTQRDg3esNGYaBBpYdAgePw5YEDb1YY=;
        b=QXEds+wcKF0mA18VdlKd41gB4WEAfFlmNGY077Sg7tSGw0iCf+b/3Mgy0qxPuglwOD
         ALxEJn5k0VJdZcqkOtdP4NTHWQxaTno9PFUWj48Z16CXsqUVkHbyY9j+8YpY4QrOoi9z
         Gw6EnzCtxvziWHag0k17ZjuZrhyhazWbgLe9ADibtfAoEkuovd/rT+rqxrIGfVr7QfEm
         PZQUrixZ7oCPM2n6VmhjlZ9BGv6nWE6hInMFWcKQu+aCH4TuFE8Az/P1mFkhTHLMmcxc
         7Uh7hCGh7Mwc8Q9CgZJHg8VS3we2cnafsmkU3R+6aLbhl/dE9+KboUwgJjFWiHbKwL4C
         ZwPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=caKf+QEHqFSWMTQRDg3esNGYaBBpYdAgePw5YEDb1YY=;
        b=eoEe1IA11Lda5TyI5xQwMPgmFWCydfQR0sRvoX7fXncFuZ5Zq4sNErJCNkCBd9BeLW
         GCwpVaNeX8V3C/b7gZX06wi8r11qNgbCvvyaCE4sS+vpBHWYzpilXKwKmNRFcfQi4ykc
         IK57h1xdK5oabjpZOmxTGpwr8vSvaaZoLJ7kx29hbJk9Yn4Ydva/ByFXI6N7m2TCwtNw
         n7hrBzvNNPaPYXXKtPrYz05ejdfqxIOMWePNjkLa6Ttr5dTjZ2zO9N7zvoao/fLxjYDR
         5aL9PGnfQxvqzG3+BK6PvfB4hCuppUzCEp/OI4/zf/yu1mg3aqPN77wAl6g3hjp4qBDH
         2KFw==
X-Gm-Message-State: AFqh2kqkfPH7WOGd7ZASg6t2jw9qoUlhP1fgeQO/xnhcNxIosFbFP+3U
	tEtP0el1AOThQiUHgNuj+u4XZA==
X-Google-Smtp-Source: AMrXdXsCleOnEX0pX0Ewi5xxAsal+1ms6kKW3o1DU5hZLa/dJV/l8ofYZ1a6VIwT3FwX4iLDL0zAPg==
X-Received: by 2002:adf:e38f:0:b0:2bd:d76f:23eb with SMTP id e15-20020adfe38f000000b002bdd76f23ebmr1454296wrm.29.1674030578937;
        Wed, 18 Jan 2023 00:29:38 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:37dc:5071:959c:93e4? ([2a01:e0a:982:cbb0:37dc:5071:959c:93e4])
        by smtp.gmail.com with ESMTPSA id o15-20020a5d62cf000000b002bbedd60a9asm24987808wrv.77.2023.01.18.00.29.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jan 2023 00:29:38 -0800 (PST)
Message-ID: <72214e57-74b3-7bba-61e5-ee727f4a32d0@linaro.org>
Date: Wed, 18 Jan 2023 09:29:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 9/9] arm64: defconfig: Enable USB onboard HUB driver
Content-Language: en-US
To: Anand Moon <linux.amoon@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-amlogic@lists.infradead.org, Matthias Kaehlcke <mka@chromium.org>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Johan Hovold <johan@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20230118044418.875-1-linux.amoon@gmail.com>
 <20230118044418.875-10-linux.amoon@gmail.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230118044418.875-10-linux.amoon@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_002941_437280_CCDCE7A2 
X-CRM114-Status: GOOD (  11.20  )
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

On 18/01/2023 05:44, Anand Moon wrote:
> Enable the USB onboard HUB driver, used on Amlogic boards.
> 
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
> v2: - none
> ---
>   arch/arm64/configs/defconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 851e8f9be06d..42c3528a2473 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -923,6 +923,7 @@ CONFIG_USB_SERIAL_CP210X=m
>   CONFIG_USB_SERIAL_FTDI_SIO=m
>   CONFIG_USB_SERIAL_OPTION=m
>   CONFIG_USB_HSIC_USB3503=y
> +CONFIG_USB_ONBOARD_HUB=m
>   CONFIG_NOP_USB_XCEIV=y
>   CONFIG_USB_GADGET=y
>   CONFIG_USB_RENESAS_USBHS_UDC=m

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
