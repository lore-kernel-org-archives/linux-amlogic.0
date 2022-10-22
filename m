Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50113C04A95
	for <linux-amlogic@archiver.kernel.org>; Sat, 22 Oct 2022 10:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3/WhD7zbylO/ojMBSNxrePU1dSy1Q4B4NMTB+6sVw54=; b=LwNf4nwbfsP91p
	MilzEcuggP0AozpEWYR3GAKrpUV/1Ymy129QuX8sYwXBlmDCFT2zgw74HSpTeeElBv+4pSJxjWjps
	Q6Rg4dEx1gSMc9+30FW3PFxgUt/qqTl1i5XA2qLgoIdztEkSI9TLf9C54rM6P0LOrVwyCXOfevjZp
	RktSoBHOoaLjE+APR7ZvGOEDC8p/nHYwBPHy4rMgY/Tm3sEWanpOj5TslicA7WMCY9SDmbLCw9dI0
	VjZXfjWpvcIRK9uHow5Q3L2/I9hu/+IkRSiWPkMZLESt02Fa7PX+stuC78mA0MwqJUNj33bH5cmpT
	F5HZyGJHL4vlSF863HPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omBVN-00C8Mw-El; Sat, 22 Oct 2022 10:13:25 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omBVK-00C8M6-LU; Sat, 22 Oct 2022 10:13:23 +0000
Received: by mail-ed1-x530.google.com with SMTP id m16so14333487edc.4;
        Sat, 22 Oct 2022 03:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WlXvlEg6bctP44b/au/15ReetHC08Q5PP32gg18o8Ok=;
        b=WbjY0+tOWZdm90+Ro9ychyoYTBQ5k08JBaJAi4TzgcG8ebuY5wT6Rk2qJmmg8Se7QI
         V8GCccdnEAK2Sj8K78LRVn+dPikhaT0X909X4PIsrClXKM+V3ZmE/Zi/knzyRMdrJl6+
         lK0f7eqTF+DnNY/MQKIAWmVV0F1agtxTodB/7gpgDAXFsmZq18kFv5tvUdupybwKIi2M
         2Cw5Bom8/XkFJJqhOO3SW5QkT3A3YFq7LHOi6BEao01ZDSQkjPtNhL4ho/icP3E1qKWo
         ItleBOK3iayo/LLswsITa1oHP2O1qjOaBewGJoXEQ2qGFT/4srYlyI/39zOzOtYg97v8
         EvcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WlXvlEg6bctP44b/au/15ReetHC08Q5PP32gg18o8Ok=;
        b=0f5sIv4LKf4OHonPrbjx024MLlGcCapMyZfcaTtG+3wcgtAd8yA7Oe07Uxqu4dEudH
         jvd6/crCcHZ9AYZbrz1veQYEZy6n1xp+S15XBXMdadLX0AR3864IR9XvPBKyTbpytnIm
         1KVZUMOIbs4pfvENSmOvOIlPyNV5Vo/QnqkekktLTVZi1JC68Hq8pO7h+FPJerKRuqOQ
         tU57T6zvUHHf9x6IlkYOI2LlfQ9Dm7LmddWfrKnhd3lMfOvA0kBj+TsV+xwX8UrxJ71l
         imoueX9jGD0lgfz8s3TwIFDPuvwzoctkmvJWpBKbr9H2Q8AIjiHoUrohTaspgTPpyFps
         HbBQ==
X-Gm-Message-State: ACrzQf1tI0Ym357x/tWxP7s8FoS6LoyWwNtuXsY9JGPn8RegW0ufvFm4
	PQwtT20zoPgEbRYtS9LiTy1dWaviaAk1aLEsfO8=
X-Google-Smtp-Source: AMsMyM7hlcd+YDE/ZivoAfafimij3dBh6J+XlO9QT3sdw0BO/po/2UHGunU8QkJwyQeS4hfV0tD+CQPk8Dg/ApP5pUI=
X-Received: by 2002:a17:906:401:b0:73d:af73:b78 with SMTP id
 d1-20020a170906040100b0073daf730b78mr19829562eja.122.1666433600362; Sat, 22
 Oct 2022 03:13:20 -0700 (PDT)
MIME-Version: 1.0
References: <20221004-up-aml-fix-spi-v4-0-0342d8e10c49@baylibre.com> <20221004-up-aml-fix-spi-v4-1-0342d8e10c49@baylibre.com>
In-Reply-To: <20221004-up-aml-fix-spi-v4-1-0342d8e10c49@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 22 Oct 2022 12:13:09 +0200
Message-ID: <CAFBinCB8j+1EpB4f2wNL4Bmmd4H-Oaeo5KHnjFbVFLtpqVXm=g@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] spi: dt-bindings: amlogic, meson-gx-spicc: Add
 pinctrl names for SPI signal states
To: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Rob Herring <robh+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Mark Brown <broonie@kernel.org>, 
	linux-amlogic@lists.infradead.org, Da Xue <da@libre.computer>, 
	linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221022_031322_736966_B1485307 
X-CRM114-Status: UNSURE (   8.67  )
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

On Fri, Oct 21, 2022 at 3:31 PM Amjad Ouled-Ameur
<aouledameur@baylibre.com> wrote:
>
> SPI pins of the SPICC Controller in Meson-GX needs to be controlled by
> pin biais when idle. Therefore define three pinctrl names:
s/biais/bias/
> - default: SPI pins are controlled by spi function.
> - idle-high: SCLK pin is pulled-up, but MOSI/MISO are still controlled
> by spi function.
> - idle-low: SCLK pin is pulled-down, but MOSI/MISO are still controlled
> by spi function.
>
> Reported-by: Da Xue <da@libre.computer>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Other than the typo:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
