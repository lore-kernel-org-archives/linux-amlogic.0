Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5C66C4332F
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Nov 2022 14:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:MIME-Version:
	Date:Message-ID:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Pg864T1/DvJ7NWw8DVvh3Hydc5oPCGrhRIntCAUOZA=; b=lLl6bxOBjQKduu/Y79yNrBmej1
	2y7Ki7yaHBXnozJSmJosW5D89C+FLvP9vL5RepEYy9UtIichn2EW7iEBEmmzc3XkLuSxdkJ9SR57A
	wVVEkGziDPm2hD7Yq63V34AkW+pQSD2L/+L56FAxChLopRezSU2Dw/7X3Npky1w6PONedCDfRzwIW
	d0rlr0BmANHoGM4f5IuZn3z8hpZ634F92tczzFfuD95EBcLQ7PFfWjkLwClspdajRlNDArI6sHrL1
	/qx9Tu3XoXTKVcdCXFGMITIQ+k8ZesEBTh+Q5I6RI5T8W6ome1ocwXWtiOOYm/BFEUuL42jCAzH9X
	AMVjK0Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovfWf-00Egpi-He; Thu, 17 Nov 2022 14:05:57 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovfWT-00Egkv-Gp; Thu, 17 Nov 2022 14:05:47 +0000
Received: by mail-ej1-x62e.google.com with SMTP id f27so5354333eje.1;
        Thu, 17 Nov 2022 06:05:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=u6c8fBhfPadc8cu0krt5hkpFlG+n4LiTHELzXtnJeR0=;
        b=kRWk6QWNDibLsq2IbAq4If83VQOALIw5xVilUxzS34YjdBCn7F+w2xkgVRLq4DO8+a
         gl/cLqQwm82EwHWDNLqBb9Cb7Zjp2+vupdMC1ZTlnWkihuQvDxEJKOy4eZ/cOyxNeyKD
         +9UXTCAtdAmLJqFMDSJnuBPI0b0xWVcZgHHirImwxGi/qjI0KePyp0M0haL1sXq0foNI
         w9Sa7cxtJUcHNMDDEz9Qeh9mJSzl41jSdavSrS0/5TwFXa5fup2kLpgjuWLykR+bMlNF
         AsqAAbdc814rG+tIBgkci99DXVfF5Xp0yEDnMptkcAxJ2eUbN8CZBufVcpCzNahfjvV5
         2tIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u6c8fBhfPadc8cu0krt5hkpFlG+n4LiTHELzXtnJeR0=;
        b=JkDUzanR+sF2AMv9qF7074o91XupNqo0DcNdyeFjryPg0iy02NC1K4lQqWmU9nL7Fn
         RBI3Wk2MU75kjBzYzk6Ix2uzGME4+jDPfKXO3xmUBOJ7eTOnqsRUbszMOls6BQd4Jl8a
         KQLl1+k+5zxp61FjYgvHy+/+YM//xNAkLH0z2u2Ll70SGeYvpAyqNc1ohtBZvZekrjXH
         aD9GGPerrOfU83dcJZwWMfLOhRoF5CPyYM3tFd0lEChYJb8RdJNe/K8u/c1jzdE6EuWy
         UBAlKd6+f8/E0JvBRVxRA/P0jhDkpg7Xvp8GEFI0YR6wkoe4Lk3ql3Rm1vqCC/GdJ1K9
         fF9g==
X-Gm-Message-State: ANoB5pmizOIY9XOdHnAgMJnKKoXQprlYFXjThy0hYTVRW7MG4g0JYAtk
	X5B9McxHYrAqExte3kgNdkk=
X-Google-Smtp-Source: AA0mqf5eoLeMemC/Xj2W2AaH0lSZZn6rPS8GtVUMR7f1tz2ZshG8CzKSuB65mlB+x22wpyvJ69fmMA==
X-Received: by 2002:a17:906:698f:b0:78d:93b1:b3ba with SMTP id i15-20020a170906698f00b0078d93b1b3bamr2348324ejr.66.1668693936035;
        Thu, 17 Nov 2022 06:05:36 -0800 (PST)
Received: from ?IPV6:2a0e:41a:894f:0:7a60:27eb:954c:5ab1? ([2a0e:41a:894f:0:7a60:27eb:954c:5ab1])
        by smtp.gmail.com with ESMTPSA id u21-20020a170906125500b007a7f9b6318asm415839eja.50.2022.11.17.06.05.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Nov 2022 06:05:35 -0800 (PST)
From: Carlo Caione <carlo@caione.org>
X-Google-Original-From: Carlo Caione <ccaione@baylibre.com>
Message-ID: <3bfffc60-a4d3-ddc2-7811-f0fbec22ba65@baylibre.com>
Date: Thu, 17 Nov 2022 15:05:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 3/3] spi: meson-spicc: Lower CS between bursts
Content-Language: en-US
To: neil.armstrong@linaro.org,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>,
 David Airlie <airlied@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20221116-s905x_spi_ili9486-v1-0-630401cb62d5@baylibre.com>
 <20221116-s905x_spi_ili9486-v1-3-630401cb62d5@baylibre.com>
 <098b923b-ff46-5ef5-9c21-19c974c9274f@linaro.org>
In-Reply-To: <098b923b-ff46-5ef5-9c21-19c974c9274f@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221117_060545_609094_455F68B5 
X-CRM114-Status: GOOD (  10.42  )
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

On 17/11/2022 09:54, Neil Armstrong wrote:

> I'm afraid this will actually break SPI NORs for example where CS 
> actually splits transactions.
> 
> Isn't Amjad change enough ? The CLK pull-up should avoid this.

It looks like it is not enough unfortunately.

> If it's not the case, then it's an HW issue and the CLK line pull-up 
> is too weak and an external pull should then be added.
	
Alright, I'll drop this patch in the next respin if needed.

Thanks,

--
Carlo Caione

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
