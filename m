Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34663C433F5
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Apr 2022 16:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xRYCCSpmPqvxpOcn/MBGMPU4WO+lbeGa1B8O3+3c4dY=; b=A3aAsPoh+mPIHx
	UB0obmRDxP1ltFnB441JwzzaKQZaSaqcZrdCYXVepM9l/1xsOdYU40vQIQSlH9Nfo2dTiz3H3/EjL
	MkoEuUzaHSk9Nrb82ml4jUP9z/WgkhnFQDICUdFbYbYoQT5QeR5EJdOQvfkZA2MqfUPVKBMHnlr0O
	LT98869UiYB43wtvpkL1c47wyF34LZYTh1oRJnnAMzzZfIMySZ1sVpD5zaPfml93q9MIQ7M12/Cys
	TGqm8ufArgfwCjNednN9tavW5Vk5Ge6MVrxfJuSFlFJp95DUF3JH3PXtOUKlHe5bBQVTQ4g38W0pz
	Hewm5teE854XJRlXimDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndwcb-009jcB-Dy; Mon, 11 Apr 2022 16:10:33 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndwcY-009jbG-8Q
 for linux-amlogic@lists.infradead.org; Mon, 11 Apr 2022 16:10:32 +0000
Received: by mail-wr1-x433.google.com with SMTP id v2so10074359wrv.6
 for <linux-amlogic@lists.infradead.org>; Mon, 11 Apr 2022 09:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=e/UKO7aq94SBKfZjsreZz7LQuRqGyX1nZfKdXNtn4DQ=;
 b=Z/J52qRPfnLZdQ0L470rDwvtkPzhm9V03L7neg+b1u402HJBgaKHe+C7zJQ0iquVBd
 xYvv1L/7dcaNhEvWgjcOZ7a1+WeQiNWcf6lp7eRFZoAKwgacOgNlorj7hPOr49e6wIwq
 /+fR87Kh8d6BGbagZui3KJcoEB1e5HkAL2uQIg82BjQiOyEiZz/1jWiGvbVYEe97Q7zD
 p/2k+UZQTCnU4xha5cdDRe54CluXLWA39aUw41PtbLHtWB2/tfZyL2CbHN/EUZpzacVx
 ZTooWK694sFHyuvXAM2FFYrI3fuJFUygYO8bC9C3tDsQLD+dGvsBBXnUbM/B7TZIdEbO
 MrPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=e/UKO7aq94SBKfZjsreZz7LQuRqGyX1nZfKdXNtn4DQ=;
 b=ezkfHyly+Voc4k4Yb9w9gRPp6tPWUL8vTuoNDmbjqZOeMLcar1UnrBa0rg0KrayO4B
 4JQA5E8M9O8bDs1hmr4i55M70gB3ZM0HNen3hAmlFg0LxSaogYwawBt+NXuj4x/8yGDp
 alESP9b3idr4uYDH5Ju4XWc+F8peNLuqhFSeYf6WkCrfkVbQHPKGvIMWhtT8aPekyD65
 5nqIkMLPiCijrgDQ/U6a28eLeA0fQXIMH07O8vYGsWExxkEjz6DWdVjPB7dVkKn1gpdB
 QXyknWb7Ao+Mv4v7IKA0wXz+2FGkQjUMwiHBw+XPu8SO73sTE/KScFRioPRgZBitZJVS
 o4sw==
X-Gm-Message-State: AOAM533nZZaKwMsFDDWWQshiH9T1qPFb6KjG7OPwk5v75RsUxxwJ/uzF
 00UMRtGNnSLPRW33MH38o4h+Xg==
X-Google-Smtp-Source: ABdhPJxGMh4bpG9dA7tQfjqfzADDhs413Y4knEG1ir0hHP7QToWNiaFOX5m46YuRx9ZQ2hbojg87mg==
X-Received: by 2002:a05:6000:144e:b0:205:9a80:b4c3 with SMTP id
 v14-20020a056000144e00b002059a80b4c3mr25378634wrx.179.1649693428548; 
 Mon, 11 Apr 2022 09:10:28 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:44c0:66c0:d1:e096:d183:1bc5])
 by smtp.gmail.com with ESMTPSA id
 m3-20020a5d6243000000b001e33760776fsm26481090wrv.10.2022.04.11.09.10.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 09:10:28 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: Guillaume Giraudon <ggiraudon@prism19.com>,
	kernel-dev@prism19.com
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v2] arm64: dts: meson-sm1-bananapi-m5: fix wrong GPIO pin
 labeling for CON1
Date: Mon, 11 Apr 2022 18:10:26 +0200
Message-Id: <164969253195.978802.10778276725936874657.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220411144427.874-1-ggiraudon@prism19.com>
References: <20220411144427.874-1-ggiraudon@prism19.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_091030_351390_27894233 
X-CRM114-Status: UNSURE (   9.19  )
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

Hi,

On Mon, 11 Apr 2022 10:44:28 -0400, Guillaume Giraudon wrote:
> The labels for lines 61 through 84 on the periphs-banks were offset by 2.
> 2 lines are missing in the BOOT GPIO lines (contains 14, should be 16)
> Added 2 empty entries in BOOT to realigned the rest of GPIO labels
> to match the Banana Pi M5 schematics.
> 
> (Thanks to Neil Armstrong for the heads up on the position of the missing pins)
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v5.18/fixes)

[1/1] arm64: dts: meson-sm1-bananapi-m5: fix wrong GPIO pin labeling for CON1
      https://git.kernel.org/amlogic/c/962dd65e575dde950ef0844568edc37cfb39f302

-- 
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
