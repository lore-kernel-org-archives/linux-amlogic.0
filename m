Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2AAEC352A1
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Dec 2022 13:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KHYv+CApyuj+fBqawdqhIs5XR0bbenAWFn+vtjf4tu8=; b=FHMcPY1nvd001x
	jdUVA7QqlXe9wpp+cCR+4NJlz1Ee3qXMdHesZHMiderMrBDZyoRz8J5L0tyuNA1wnJ7UHxCFM+SgW
	J5xVpA2exKFe3hXycKZNoIQhl2k7E7An825mYGgzMYJVWtOHRx7Ra59bWDZFErKGjha1nKiLM2FKu
	aDH/R3LCpCRGkedPOJ4KYTtsD9k1bAH6dIk92H1HWjm5iV8eDnn0LmPZWYF9Fnx/wtSON0PJhbxDD
	+iu79qPrkS7ZHJ+787KkGvzOXv+HQh33BFf6Em5uLDeYnw67dEKe3afhYla6YR1xCbAf5/NRR+cTw
	mHScqNalfx95PBykbEuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2XZM-009TZU-Ui; Tue, 06 Dec 2022 13:01:08 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2XZB-009TV8-DE
	for linux-amlogic@lists.infradead.org; Tue, 06 Dec 2022 13:00:58 +0000
Received: by mail-ej1-x631.google.com with SMTP id m18so4437120eji.5
        for <linux-amlogic@lists.infradead.org>; Tue, 06 Dec 2022 05:00:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wPt4+hNHEAygAYm/iIi7WWfY6gI8L5cWMRSUMDDponY=;
        b=bQCKAqQfljf1U+dmf1KTvgvajxOVvy8g4xkI4rqmjigYqgb9X1FMbQ8tIMdrKaz3P6
         rctDhvLQTL+2Q4qbe1stTd1+SPdOxXAgcDeFRdvGHLkC4LInwOCbzeVlXod0yH3gpiAr
         vrxak2zCWhjeVMx+yMy6Vdn5liiPfn/oxVrUaD/UkMpxYVrD+P6N7Bmf4smucUSd/rNo
         2Xehk9hDqq8zPpddbXzqRxYnWw1k/32h5/s3p9KEseBLmRGtDxdiNdZEEVps0v+qdwl4
         2j+wS2CBuRpXP4IWlQlBxw8lvGERcYYR6izUxZUShkdjLvgzgqcywwDgvqBhKLq7F29H
         Holg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wPt4+hNHEAygAYm/iIi7WWfY6gI8L5cWMRSUMDDponY=;
        b=D6rI124O7odUgprZiRQdH2nKwMAHhC1NxX27axDSxQZ6hebCkZyxhLkK9gjtjsV0yp
         3xQadL5WTqPA+FTvcyLF1rmHA1bxq6zuMGW0A4w6ItuDsz+N9MEnYG8X4HnRbJDvncwD
         d/1rGqdXBr165NYxw5mG6hi63f4rQjV0S6Yf6P9gj1JK5ZjBfyGyxIrS9pZULNMHVA6k
         aLnSOehiLPnG3fwzbgwVNYPlIBC+D9P9BfjhehhVfGjb1PTYT7fZM1LnOeiOYM8v1aJA
         Je3X85Op47WJ0pRXZUOzPkA36kUJY1bcKSs15t3MlfPD3l53EyMhINCjSRFWJ/gFHGhm
         vlOg==
X-Gm-Message-State: ANoB5pneTxbGtjK2Hw0yVPH2XJgOrur2kx0Ejmditlpv52h7MPxiVjAB
	UD4JyXk28Z3HW7I6T81MQ7EQ3g==
X-Google-Smtp-Source: AA0mqf4ZqirxuOZeT0doTihcv0ObkbVOPHk5CHTRLxdM1jLRtMbB2+TyECyb6JOuMmm8aMSm/aDMXQ==
X-Received: by 2002:a17:906:1585:b0:7ad:84c7:502d with SMTP id k5-20020a170906158500b007ad84c7502dmr58639319ejd.177.1670331652808;
        Tue, 06 Dec 2022 05:00:52 -0800 (PST)
Received: from ?IPV6:2a0e:41a:894f:0:5e13:2125:2912:2c56? ([2a0e:41a:894f:0:5e13:2125:2912:2c56])
        by smtp.gmail.com with ESMTPSA id fe17-20020a1709072a5100b0077a8fa8ba55sm7325471ejc.210.2022.12.06.05.00.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Dec 2022 05:00:52 -0800 (PST)
Message-ID: <9ec0204d-ca4c-afd9-33d6-1ebaaaf6b144@baylibre.com>
Date: Tue, 6 Dec 2022 14:00:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 3/3] drm/tiny: ili9486: remove conflicting framebuffers
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, neil.armstrong@linaro.org,
 Daniel Vetter <daniel@ffwll.ch>, Jerome Brunet <jbrunet@baylibre.com>,
 David Airlie <airlied@gmail.com>,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20221116-s905x_spi_ili9486-v3-0-59c6b58cbfe3@baylibre.com>
 <20221116-s905x_spi_ili9486-v3-3-59c6b58cbfe3@baylibre.com>
 <14e5c4e4-30dd-8efd-81e4-d680664ab04a@linaro.org>
 <c460bbda-6e9d-24e8-eb73-2e7207958deb@suse.de>
From: Carlo Caione <ccaione@baylibre.com>
In-Reply-To: <c460bbda-6e9d-24e8-eb73-2e7207958deb@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221206_050057_451837_1F720271 
X-CRM114-Status: GOOD (  13.37  )
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

On 06/12/2022 10:52, Thomas Zimmermann wrote:

>> Conflicting framebuffer on the SPI display ? How is that possible ?
> 
> Calling drm_aperture_remove_framebuffers() is only required if the 
> graphics card may have been pre-initialized by the system, such as a 
> VGA-compatible card on a PC.
> 
> Could the SPI display have been initialized by the firmware? If not, the 
> call should be left out.

What's happening on this board is that the builtin simpledrm driver is 
creating fb0 backed by the framebuffer prepared by u-boot / grub, and 
this the framebuffer being used by fbcon at early boot.

When the ILI9486 DRM driver is probed later during boot a second 
framebuffer is created (fb1) and when fb0 is destroyed, fbcon still 
remains attached to a non-existent framebuffer, so the user is left in 
the dark.

What this patch is doing is that when the ILI driver is probed, fb0 is 
destroyed and a new DRM-backed fb0 is created by the ILI DRM driver that 
can be used by fbcon, so the user can correctly see the console on the 
SPI display.

Cheers,

-- 
Carlo Caione


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
