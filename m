Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EC18C433FE
	for <linux-amlogic@archiver.kernel.org>; Sat, 22 Oct 2022 10:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BI9AoCOTupmQBaV2EOYkbsiGS2v3mnLhFurQ9aUefiM=; b=LnyEHOAMrMfwC3
	rLwEOl3zLs12GUITb3CoZq0JzEpxpY/gJVO1ti9uTYQIvUorMCfk2AMPVii34CbaQPQPO+vH/NrqD
	OILRmfhkqiwa6axtI0Ue21YD5ha0wJuNGI0Ip/kUkth0TEjTEPW/WPL6Xew+x6/xcxI5UvYI2VfbO
	r5EwLuxUQ3/hDfjF/Cq45lmDDleCvCCbw2OnRmh3IkKeGSqmHl1DVbttBjyAO2+/rTUp/+2wuqvy8
	xa+IFkaxik2pzj4Tcom78PBq3lNzSogg7TkqQmKXH4fVLSyFcxttkNn3/DWIYgiH4hMI8sQw+NXrQ
	+87meg3z+Ofqfs+j1siw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omBVx-00C8Vk-IG; Sat, 22 Oct 2022 10:14:01 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omBVu-00C8U6-Gy; Sat, 22 Oct 2022 10:13:59 +0000
Received: by mail-ed1-x52d.google.com with SMTP id m15so14390719edb.13;
        Sat, 22 Oct 2022 03:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=06Eh/nhcc2dk5YHgUHqVnCwIQ6d3gtHqF6ndFEyn00o=;
        b=VMuZTZXRwDpR3O+afkcfnJXAjQaa5SZKkHcYlMnVcwYNqOFKFxdi0LFa6WPSQTKNM/
         pc5fiF04hiUnP4DSCczNQyvQnbN4AESxQECufjLjtfKnqrc2XPmpgpeNDR7z2bs4+CHL
         IvxEmFJCZ4uAe2JcieU3RgEEe8ustULxygdjz8h62X8fClJKGJOxjr2kcqtm9V/C4mwv
         yE0qxdwqHcSimSx+euw2ho3YtC6fIVUsyvNQKYfQMgkoPu104g3gYBtWIeZiHzwa2X3P
         Z9a6e48lhW1bTuubdJt+KuMtq8fuANAk9+DD21gRtOqQNpE5bj8W7pO+mWUV8oGMa6n6
         OcWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=06Eh/nhcc2dk5YHgUHqVnCwIQ6d3gtHqF6ndFEyn00o=;
        b=mWNQa1myUv/e3tZpwqe2ew5n/+ivsz9yna5n9kt9lmdZ/Ps9bNiZxN+CVBvT7v0848
         7ZLAz3OXDOhItOtp4rLAo4c5IHTQtG8i87336b6lBcDABSYlu840CiInFCi0tXoTaY/9
         qzr6A2qq3ZRADUpR5SFVD1TL7QcvAtqU6GboeoaqFT6HoMEIiOCG2YkwFwk11BI6fJK4
         66OJNewT+2pRyrRuTVPvCyBPY0pcV7sycQ8hcYwf5yGxc5/iPk1YMVyuauuI6RYm6lid
         BEOJVmH/NgwvwiDAD9RayeCI+AzDDjjSXmFF0IGkfJshAU3HlFQA+SONvzaxcxJS/aBQ
         07aA==
X-Gm-Message-State: ACrzQf0dNjwsSeCJQt11u4ooFJka6HDcQcCuvwTApXNgqFMdiLweqZQ7
	MOgf3fwlwtOc/GpwdXongIA85Efhww5uULLEP6c=
X-Google-Smtp-Source: AMsMyM7QaRZd6ahXj6EN8TYBfKGXqZyCiosKZRQy5INk2+Si4bfGFYLHkGLRXI+5OCESdg4fjJkhVuQqUiCbjUV96RM=
X-Received: by 2002:a17:906:7314:b0:791:a45a:bc84 with SMTP id
 di20-20020a170906731400b00791a45abc84mr17664692ejc.394.1666433634815; Sat, 22
 Oct 2022 03:13:54 -0700 (PDT)
MIME-Version: 1.0
References: <20221004-up-aml-fix-spi-v4-0-0342d8e10c49@baylibre.com> <20221004-up-aml-fix-spi-v4-2-0342d8e10c49@baylibre.com>
In-Reply-To: <20221004-up-aml-fix-spi-v4-2-0342d8e10c49@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 22 Oct 2022 12:13:43 +0200
Message-ID: <CAFBinCDWP78Eft63G_QpDH28LibUZF__GNwnBVLcM85dQO8XnA@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] spi: meson-spicc: Use pinctrl to drive CLK line
 when idle
To: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Rob Herring <robh+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Mark Brown <broonie@kernel.org>, 
	linux-amlogic@lists.infradead.org, Da Xue <da@libre.computer>, 
	linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221022_031358_590739_5A7A5A5E 
X-CRM114-Status: GOOD (  14.74  )
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
> Between SPI transactions, all SPI pins are in HiZ state. When using the SS
> signal from the SPICC controller it's not an issue because when the
> transaction resumes all pins come back to the right state at the same time
> as SS.
>
> The problem is when we use CS as a GPIO. In fact, between the GPIO CS
> state change and SPI pins state change from idle, you can have a missing or
> spurious clock transition.
>
> Set a bias on the clock depending on the clock polarity requested before CS
> goes active, by passing a special "idle-low" and "idle-high" pinctrl state
> and setting the right state at a start of a message
>
> Reported-by: Da Xue <da@libre.computer>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
