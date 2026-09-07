Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5235C79FA1
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Sep 2026 15:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ryoq5cZcUMGq3q76kBppLMiuQ6Wgs45gWtPkhJjRDdQ=; b=DVRayG/jEx3sus
	jDRH/05BwTmX6bJcmG/KegWAsAPfiM9BNtCC2j24RkBUX9xB8LZOUjPkZhBDeqPwSQqpQh8XyFURQ
	Z7rWTFm0zmr/fq4KUIs6QDtTol7t6pvmhAS5oWllw0B8ysVh98EGxcu2Mhmga4rGuot6KyOZyXr14
	Bm7mJMKuSnyWMZYZuwOqa8kqvDozqwpv1ejddd2PjSrKfbNm2aWAVcSiym0uhe6gzUgLMvnZ9yLRm
	PJ53XLbeMvpypTrOsrpcF1oGyyrtZDh9/ASmm+IqyCjDxgNwFY28ANxg1hcSFdcrq7ZNXaP/td6u4
	8PENWxxHRVGpuNF5/ISg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3b86-000000078fb-0MYx;
	Mon, 07 Sep 2026 15:19:30 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3b81-000000078dK-2Zmg
	for linux-amlogic@lists.infradead.org;
	Mon, 07 Sep 2026 15:19:28 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-48436251906so4200160f8f.0
        for <linux-amlogic@lists.infradead.org>; Mon, 07 Sep 2026 08:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788794362; x=1789399162; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wfsM5V0FaQQokzmgJre3daRZfS2iieNpUVCSCH5e4Uo=;
        b=OomyvhsBIeXjI+ibJQkhRE0jyaS5DbCG0p5G5pwABH+oi7yP1rjQ0ecB2nHnMPNaim
         YzPJW7SQR1knmHEPDO9xuRnCDxnCe6Q6F8eTveWNAQeewOir8kIOF6UufXUYJ1QHjmuZ
         HJ+zxK8ZznClXnXucpGoNpzfSacAtJGIyXFs79A20ZI3xDKq0UB649xSlFQrOnLka189
         p8eo4A4Dbs3mn9VmZqRjd4o+4zxsx6sKhDbjCzkIqWR1N9llBqfnIHC2wEpOCSUtQsuK
         o/7kNKBubHgy7pB5uv57Jzq45od+O31rL9E+S4T2zbtxZZayne4V5rQMD6TytZP+6rLl
         OsZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788794362; x=1789399162;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wfsM5V0FaQQokzmgJre3daRZfS2iieNpUVCSCH5e4Uo=;
        b=NExafN0iuCa+maSCgF1KxDY5xU0yoVpPkZCvY0l8VlIr6x15IUEweROXs/ipXnudj6
         6DSKan1wxnDKVrQ2C36usxyvNnSXlNjb2T5HYkN+QHB7kwBQGrzuCEZlGgO3ZDk4sM3S
         PPqeYopXGiog3ejoFQhyoY+e7gdpclwiLWPrYh90LDYQEIHbGsSs9jJRBW0Gx+e8Vvgp
         sChLwVSO8dFEJaEOVd5DdYdrQ2z7ybPivAWykhBMuRPG+4f0SjvU6dr/3j6Rv550LDDy
         8fXQuLPFgNWOusCCYd2Y4gT1E0mgTLJx0gFJHG0Uh0j21zq9ehlzerEBtfqvGO5NC3Zo
         K28A==
X-Forwarded-Encrypted: i=1; AKwUvBzEKHuW2e40t4vRopmhFhbeeGhk+ym7O8XZQEtIqXcJsucWoDjnJ4VekElyhY6brmiXA9FNDA0+vAjr7f6P@lists.infradead.org
X-Gm-Message-State: AFuF++nE2JbIHwLYtYrOZNeflB7AbPNAUu82xRVyCPp3fRsfDVqE9NZv
	2P1p/n8X1zxOvvSVmlyOSfBg2tR9/0n+JO0gdUMQHRmr79HIGeue3sYfkjaD0xI+KI4=
X-Gm-Gg: AYBFou3KrGI+7iuvgZx/+taV6YKs6WSOy0Od6Ml4RyBygFxRt1m7xxYsZp6eHHiLxts
	LIwhczSGdke/489hJQZP/pShGUP+gNLtmArbVWUSJmtQms+bzt5ul414hNE8OurVqCpb0KMWvFW
	GuI597yB+H3qGWUIC9lVRZZgMNhfhvQyW/d0bq3/6UpWypUSTuMN1ElPyzz1os3PkG5rNhERCa0
	7ahjtYXfx9bR6hlLp0s/9hMEzYNS3r3CvEzoxa4d91hymxatMTyg0pTaw94u7oB8SasPThNKhT+
	gceyq2b0imqQ7xPjc8q7IniMQaJlpe1aysJ0Clr4Oc/P+dluFfA8kx5hy+ttFSRWwZkVDctV1Mb
	/dPvB3xZb42yNN0cjB1gj9Q9MWkLtqMU6u+NPHJtRpnYOs1kZEsAoeBOh9XCUeGDz30fWH1ts07
	XYIrZYxSt6n8cmzD1IaNf6Q3S7LeF9SSpxadTGN2N9KDIj3gBi0Ik8Kh024B4ZIk1GgeT4tz7CH
	BawX1aXQqUW3/93puGvqg==
X-Received: by 2002:a05:600c:4e94:b0:498:943:ccc0 with SMTP id 5b1f17b1804b1-49cf81e368emr393160235e9.6.1788794362159;
        Mon, 07 Sep 2026 08:19:22 -0700 (PDT)
Received: from [192.168.7.218] (82-230-44-19.subs.proxad.net. [82.230.44.19])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49ce46696e8sm288040175e9.0.2026.09.07.08.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 08:19:21 -0700 (PDT)
MIME-Version: 1.0
Subject: Re: [PATCH v4 2/4] pwm: meson: add the PWM count driver data
From: Alexandre Mergnat <amergnat@baylibre.com>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org
In-Reply-To: <20260827-s6-s7-pwm-v4-2-d28a2015177d@amlogic.com>
References: <20260827-s6-s7-pwm-v4-0-d28a2015177d@amlogic.com>
 <20260827-s6-s7-pwm-v4-2-d28a2015177d@amlogic.com>
Date: Mon, 07 Sep 2026 17:19:15 +0200
Message-Id: <178879435514.2256446.12623877061277695056.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=748; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=rcVRS04U4Y1NhrUxKFWvxVXiVm9RAyYBSNeIX0vtRAg=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBqntX6M1dVwwpG2kkr876Epbt5jZrSl70Nlw4AG
 HstsY/+0kyJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCap7V+gAKCRArRkmdfjHU
 RbpRD/0ehx78POhhYnSt521wnujPrwLy1gEErNRrExkWhZysX4QDuXyJy2R8JOv9iSpxCyY6sHp
 OStxUC59Z7yn8cTVgbQufMKwTpINIBqq5eXL8bQhdsmJEy+Pk1/3ww0GAVwSq5ZXHtMjsE0/7eV
 AkW7ix5czGVHop96QPnKwjREam7sb0FcFaRGjR0hs1AAnQEl9DTq2+UFZCj1ikMy4Tz43KRS9qX
 1h+GdCJIlctY0Ge/7SF9+07et3J/2sH3lE8vQRMoPP7wQLB6dXuGbrbv3LYHmXIW55nZY4c/viA
 e5eM4ibjmSZMZCeRZH7T8mDxi5aZTDC5KggxpX120TSlF/RpdsC0MXhtgxg5jA8HLusYvIWV/rm
 BVTWqgIAxnOD2oZSKgE1THvUmZQ+tZ28aeVKEo+Ppv08GZva7gqjPTPTUeIzenyqwqaShfSAQSt
 gsvvXrPntt6cLxx9mVFNvNrcEK7z0FVkpP6Eb6sJW3if8dSnHywjT0ORFxjzt2ppnmSPMM5oMKk
 Su0Z/+5Gnc5ZeZY3CMt/hHdXJdRL4csf3nqLomgLjoJfIPBQLmB/xj8JEaO/So0odhbKv8K0x2n
 0u5N4D7tb2oUl/tf0At1LWLYbd6JgnKZ7nlfiL3OzD3xfYXgt7x8rmtMFDTO9rVbDdJuPI1Bsr4
 /p2Q9nrsCVSI+sQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_081925_920401_6BDCEE63 
X-CRM114-Status: GOOD (  10.17  )
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

> Add .npwm fill the  existing entries, use it in probe, and switch the loop
> in meson_pwm_init_clocks_meson8b() and meson_pwm_init_channels_s4() to
> chip->npwm. No functional change.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
>
> diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
> index 8c6bf3d49753..22cefc6d5dd0 100644
> --- a/drivers/pwm/pwm-meson.c
> +++ b/drivers/pwm/pwm-meson.c
> @@ -113,6 +113,7 @@ struct meson_pwm_data {
>  	int (*channels_init)(struct pwm_chip *chip);

The commit message has a small typo ("Add .npwm fill the  existing entries" has
a double space.

beside that:
Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Alexandre Mergnat <amergnat@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
