Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03D58C54EBC
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Jan 2023 14:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZPC1Eqb0L/UiCkyzrTp6ffJsZ8nzRQc7lxPxZKXgmb0=; b=wh7QZCksvEXwXv
	sNt0358w2oMZtsXK0IxEBYAMOyk8BNJ57YrOmBgXYOUpQV1e36HTX6spbN2Z2UJ0LIfD56N5CZmbD
	oxYqBqylGPg4YOXivAkVmbqCJn4PGaibjA73m+U2UVemuFnPqZeu1x0xIs5fW6GUbVsugIbkV665h
	PMvMv7KKtsvHT7KowUdLlTDgENnpy3tsi2koCLisZBSsBUxXTDNniKGovj6/ktWlimo+DiHI2r7h7
	cI++9dUWMWwJdgGSxxhI5I41eiUrb78pSG/hFulVXcRWWspEIhzUNlD2L8FmbLH+P2184Zh6Znze/
	YAN6Dm06ZULXL/rLmRUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFFV1-007HDC-Lw; Tue, 10 Jan 2023 14:21:11 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFFUq-007H9B-78
	for linux-amlogic@lists.infradead.org; Tue, 10 Jan 2023 14:21:03 +0000
Received: by mail-wr1-x42a.google.com with SMTP id z5so10857734wrt.6
        for <linux-amlogic@lists.infradead.org>; Tue, 10 Jan 2023 06:20:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8wOlYhsSTVgaYdm2eFZoziUvSeaqxeeC4ypm2ZU+u8E=;
        b=kszY69SppzG5Jtt72RWEpPxfZlA++8X+pe4zSpoGzWxZpDO7QjiSUYnre1WyViXAY7
         1iiWRER6HTf6S2w06VNjW9Ek+hfRQxFAU+/IYMI4W4YWwDhrsDtawi7DyBoI6gmGKm1Q
         0+M2MSORAbu8Ba6hwMxISTSe0WTxhTarMF2tgaST8lj4/7xgaDp2/UaXzPEnYNOvOUij
         EPtqNQR2mhoWaHmxONo3dIvRyX7TdO2y6b3ggnCU0qrh6EVfI1aR/JngbZyGd/hTd9+p
         fp43ISUfXPVH4FIk9xYvMeXzZgYFgvbb1N8ezsuiPAXvtlpEWMj2ixCYsKm1FqG4HLpU
         Mvug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8wOlYhsSTVgaYdm2eFZoziUvSeaqxeeC4ypm2ZU+u8E=;
        b=Or+KfDdF5k1FqrFm3kDMTgkVv4ue0bqDdB7kdrZhtPV39g4mZIWiQ6qoVsU+U5Ucc1
         4OskDbLgdLXhyvl6ppKNjDixz2WCCOSy6RMARpv4LIrEGDQkkpd1CjwOxZdZWAPNTt4W
         i+OtJg6Kw0P56Qm1nRkdODDvt1aIEDbe0lI7pyxFNUHFLyiDydJZEit7fj7t+tZDBEJn
         XchwuvlXc5UAchdswV+WQ7g9p6YMhJnb/1Kn+FD2/4wBfjNY9538Ph/sJmmQ420mivHd
         ggEaoSZylBHliODHOj9pkhsNV79y71fXXNkBwNZTOKIC0t0pei+ZIMAz12TwVJRC71j7
         5KeQ==
X-Gm-Message-State: AFqh2krASHmh0wbuRD69yVxYJJjs+4Mh9I1i2KpTOrKm20HNlnimZEjX
	jSSUd1nBXcYmy1MKosHw+L5O9g==
X-Google-Smtp-Source: AMrXdXsGPm+Lqm6jdep1fxgzxJDhDVBWyqAyOyD8u4pWy8z+Ow8K31O4z7YtMI4EBCBZ0cS02zAcVQ==
X-Received: by 2002:a5d:4bc9:0:b0:2bb:ebaa:7ae1 with SMTP id l9-20020a5d4bc9000000b002bbebaa7ae1mr6343276wrt.50.1673360457917;
        Tue, 10 Jan 2023 06:20:57 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id z2-20020a5d6402000000b00297dcfdc90fsm11284992wru.24.2023.01.10.06.20.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 06:20:57 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, Bjorn Helgaas <bhelgaas@google.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-media@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-mmc@vger.kernel.org, linux-pci@vger.kernel.org, netdev@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To:  <20221117-b4-amlogic-bindings-convert-v2-0-36ad050bb625@linaro.org>
References:  <20221117-b4-amlogic-bindings-convert-v2-0-36ad050bb625@linaro.org>
Subject: Re: (subset) [PATCH v2 00/11] dt-bindings: first batch of dt-schema
 conversions for Amlogic Meson bindings
Message-Id: <167336045651.1961204.1502592666018702430.b4-ty@linaro.org>
Date: Tue, 10 Jan 2023 15:20:56 +0100
MIME-Version: 1.0
X-Mailer: b4 0.11.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_062100_267639_4D4FF29B 
X-CRM114-Status: GOOD (  13.12  )
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

On Mon, 09 Jan 2023 13:53:25 +0100, Neil Armstrong wrote:
> Batch conversion of the following bindings:
> - meson_sm.txt
> - amlogic-efuse.txt
> - amlogic-meson-mx-efuse.txt
> - meson-wdt.txt
> - meson-ir.txt
> - rtc-meson.txt
> - amlogic,meson6-timer.txt
> - meson-gxl-usb2-phy.txt
> - amlogic,meson-gx.txt
> - amlogic,meson-pcie.txt
> - mdio-mux-meson-g12a.txt
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.3/drivers)

[01/11] dt-bindings: firmware: convert meson_sm.txt to dt-schema
        https://git.kernel.org/amlogic/c/658a8ef679435959f550a45f7312afaebb9e20a8
[06/11] dt-bindings: power: amlogic,meson-gx-pwrc: mark bindings as deprecated
        https://git.kernel.org/amlogic/c/bc5998b92b9ee8818cc0f7fe02604751389a154e

These changes has been applied on the intermediate git tree [1].

The v6.3/drivers branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
