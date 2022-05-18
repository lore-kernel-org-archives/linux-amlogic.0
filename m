Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94D62C433EF
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 May 2022 07:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KmPGZaLQ6lPWbdOcD7GOCTbWWU06YJZBVDTKnu1bxoU=; b=uS2JkbSvpDQ2+z
	Y4uu6kzGMsQ2U+jNCufaAqdqZYVDW16ttxrgt+E9QlGZXUNIKZFX/KS3dQlN+9L6uYlSaT8Bd0qxJ
	GMygHYDg5iACN4CT706ExmUgomPJfTWhbHO4AjlDYSe0LL1f1YsYd7mOIsjWbgHKelRFbajX8QVJJ
	RsL1V849ajzNLoyJfIvTL95dho6yDZyG6GUPV0W3AXbC7LDdsc5+Dgs77vBVimPqaOQOaFusQMqz+
	8DvK6U8J/KWq6G3BYH4RQ1gMTzXVr4mYdpc36dStMnO/1zKdjUPuvFxIojvoTQZZ591nxb+eDPSdW
	i1her9Rje9ZR11I2reyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrE2j-0003o8-Es; Wed, 18 May 2022 07:24:25 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrE2M-0003fs-HQ
 for linux-amlogic@lists.infradead.org; Wed, 18 May 2022 07:24:05 +0000
Received: by mail-wr1-x435.google.com with SMTP id r23so1356807wrr.2
 for <linux-amlogic@lists.infradead.org>; Wed, 18 May 2022 00:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tF/YGASfOyaH8iI5vv3uSJNrq2Gg87HO0wZHDFyPngk=;
 b=RG9tkY0SlpJCC4fUyPDBYyPxc1bnRxdq9yhw1UbK4P0ZWnyS49MbdRzXriqpHINzhg
 QB1s8sAKM5MrBJ2M+GOs8vTMSMfcTia4GuWHEjdPj+lj83iWaGO686JHHKdsEu+moN/S
 MoDOlYHmHlEuU18sVUuboGdeJJQsihjlQSoYroG8sVf4fJKqMLfhnmpksK1oFzMHCNtr
 wAvYxKXJR5Hs5sJoG3HHUsOJ5klf7Na/hNv8+QVci/I/C/FcdBB6Jr7Jfrj6uRYVfXr1
 D3YBFwtWVHjsvv6EYzSBbn6vNgzhLCtKReBZvWyNCNi7sYGyKHl1Tq29PhaTYEZaCDxf
 XeOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tF/YGASfOyaH8iI5vv3uSJNrq2Gg87HO0wZHDFyPngk=;
 b=JL1xvRgDNTuT9PLRtm6n99+gnjAhg9JhstnoSu8sRCtN5+cNtLQOkBT7p/jvMYCGet
 WvMPlcmAVb34uL205FGvASeuuevat802Wr+thgEKr9HYKXME3gSdjJpGLggB9wncf6Dv
 +fO2+OeeE2U1+BYFGp5YIRmHeZd8RStaHuGCBczB6iMxGNQl1+u77WZZ8Kxbye2a9Xxs
 hSzPaljiGw1Cw0m2SyswWnjR6WUwWPsBh8TGlUAj6Q3vpdVnTuN09hqnJorgNpSrEd7f
 1JIUdCnVcWra9zd0/CdCdTQN0zGaWegH5hhLBv6Nbz3HxQDKcbNlz2ANv3wKm+hyR8Po
 2zGw==
X-Gm-Message-State: AOAM531Ur4ZE6jRxeJFoxhgzp2OKP8xm/LXG+Q6POyvA264yqpZWIju4
 zcssHWvoZ5Sxakxq4OTLIRiSDhBh2yzqbgu/
X-Google-Smtp-Source: ABdhPJwD/OM2Sk3G/iloBGcUeXj5wnTIB9bygC4e5ck1U/lgfHV5xDqpe3z/o37CfegDOS5NY6oiMA==
X-Received: by 2002:a05:6000:1d90:b0:20c:9efd:bd6b with SMTP id
 bk16-20020a0560001d9000b0020c9efdbd6bmr22300308wrb.605.1652858637676; 
 Wed, 18 May 2022 00:23:57 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:44c0:66c0:dea9:338d:d500:c574])
 by smtp.gmail.com with ESMTPSA id
 e2-20020adfa742000000b0020d0b2de858sm1112113wrd.33.2022.05.18.00.23.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 May 2022 00:23:57 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: linux-amlogic@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>
Cc: Neil Armstrong <narmstrong@baylibre.com>, Dongjin Kim <tobetter@gmail.com>,
 Furkan Kardame <f.kardame@manjaro.org>
Subject: Re: [PATCH] drm/meson: add YUV422 output support
Date: Wed, 18 May 2022 09:23:53 +0200
Message-Id: <165285860562.1281822.12934298648827697620.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220516072245.10745-1-christianshewitt@gmail.com>
References: <20220516072245.10745-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_002402_599579_CF77AAA7 
X-CRM114-Status: UNSURE (   9.58  )
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

On Mon, 16 May 2022 07:22:45 +0000, Christian Hewitt wrote:
> From: Dongjin Kim <tobetter@gmail.com>
> 
> Support YUV422 output from the Amlogic Meson SoC VPU to the HDMI
> controller. Without this YUV422 format out of the HDMI encoder
> leads to using the dw-hdmi YUV444 to YUV422 color conversion which
> gives wrong colors and a green line on the left edge of the screen.
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/1] drm/meson: add YUV422 output support
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=c193a003dc46ae601f46908b41d6f485b87db1ad

-- 
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
