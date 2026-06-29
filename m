Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4049CC43327
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Jun 2026 13:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vfpEaMBOVny/GEDpk2VPszw0IwyyDOoDHrOqRnPIbBY=; b=waSmN8wFF/yo1I
	boJicZllYzh3U+oPx68rv/CF/EojGz5wWFGUf/wabi9RxbzPsP9irk1hnbnAueuzj7uw7HweGbUK6
	53Le8Tzdz66XcPRO5wq2oISUIU1avEdeU4R5WQ4zSvqgVtI9iAlHOAKr+7CXlwdcGKA5ZzoaBb4a/
	YTOhI06r62RlRPFZe1L+VmBk4fox0NTwfDk23Aur7WEyMKun498wm7Y+ZN3i7iXKWuNn3vA2BMGzs
	911J1C6dyKnJCu9NGVk+FB8LDh7PuSZ+T4sxVI66Nqho1Wr2UnaazWMLIZe1ScG5IV5bxNd3za/a6
	Oz3O+vYSKxUyxKm7Iwbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weCOy-0000000EnOP-1WmQ;
	Mon, 29 Jun 2026 13:51:56 +0000
Received: from mail-vs1-f46.google.com ([209.85.217.46])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weCOv-0000000EnNl-3Y0T
	for linux-amlogic@lists.infradead.org;
	Mon, 29 Jun 2026 13:51:55 +0000
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-7348dc69800so1110853137.0
        for <linux-amlogic@lists.infradead.org>; Mon, 29 Jun 2026 06:51:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782741111; x=1783345911;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yDPhNjOsxEQ0DHLYZPQfDHuBKCTUhxYTzus1J/5tEMc=;
        b=dblPZ8tqofmZXtNxXSS2twry6GpQ43+QOgsE+tpc0tLCANDkjkFBcaJshkkpPQrN6b
         t1yjTQEiXz8m1xDuZ+EwQX/G3Nkz4DJnGofn1w+wSj0de7rUO+i///6ccYXTpXbJvXaJ
         ncrJKLrmoqcYQbQSgeK9r0QJsZA/AUbpzbUy8Hm5m4cDclpMPqoeRr0UoyzKgkqxhlwT
         FckGCzIpDDtFJJZkVqcqDgejzfN0v+zxEY566bPZmap3nV7PZ4qlJ3YDHR+xzUOq7S3y
         WjPTxFQyZ2LcybsEn8siGZ+YO3ZGGa8kKR00s5J4I63zhY5LCombvxXchs9h/Ig4qT6P
         3ZCA==
X-Forwarded-Encrypted: i=1; AHgh+RrDvB3K4MBAZtB31Rd3IZ5wFbXX2JXm/PrLy+pljsotalqpAqmFtDCHf+VkZcvPVIRqPFj3c8BoiJ8ikeYo@lists.infradead.org
X-Gm-Message-State: AOJu0YxFvtJ/9XMv0N+3PFh6onCZvzIDaWMXTdLqCulAaD6HIbeMFds5
	zJahmJYqt21vWuUFQan4k+mQERX2Y8oiVck8frNZeybjJuiw8sA5qD95nJsGQR7j
X-Gm-Gg: AfdE7ck2ng9Lh98ORxl86KTLhf4MVfq6cFB0YuRHM8rRvpcgkVwRkozIhwlw3E5tOVW
	MYKtieujTvewwdJ3gbcmcmWDw87KLdlnK550fYuNQ3sw+urhfW+n3kRfcj8tvFrIEpClsSqGYRK
	p7HOhEvhRwQKtr0DeAqgSlMBskT57EnsOefbcqtcgqZ8dfsEJupTDQ/Vj8Q7TlZsmJXXtOIKNxB
	GbKH72nONejgLIAFH4I6vzwsupIGMQeJruoYvaZWiy38Kdd8jUwCNBJSfciC5p2b7FJqRtJkAVT
	mDWRS0/3XMDIprElLLxaKSo7M0RV3JRdGvM9PLMAuLc31J1Ur2KZST7PPu2Pct63465cEiwSVxr
	tR8se3fkbM0zjoEKzsisfU9+F1n2WCbkG+VI3vZ+6bKZ0Do/XmNnz/s8GYjHDtiuAwrRiFsKqAb
	aujqQB+Vv7Pzv3uoLF4cOXb0XWA8aekqi0U2Kl+Q/LW4FcwsZUWg==
X-Received: by 2002:a05:6102:cd0:b0:739:379c:fc95 with SMTP id ada2fe7eead31-739fa23094cmr417384137.20.1782741111301;
        Mon, 29 Jun 2026 06:51:51 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-735697bb003sm5812205137.9.2026.06.29.06.51.44
        for <linux-amlogic@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 06:51:47 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-966f003be09so749600241.3
        for <linux-amlogic@lists.infradead.org>; Mon, 29 Jun 2026 06:51:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rpqo1ZCNoKs1GvYwWVqvv7QMyfwOVENfddOOIXmapkpGIipPTS+mwUAj/WWFk3E6xVsTmypnZ24SQR6cwEm@lists.infradead.org
X-Received: by 2002:a05:6102:c93:b0:739:86da:7777 with SMTP id
 ada2fe7eead31-739fa951f6emr430364137.27.1782741103904; Mon, 29 Jun 2026
 06:51:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260629-qcom-sa8255p-emac-v11-0-1b7fb95b51f9@oss.qualcomm.com> <20260629-qcom-sa8255p-emac-v11-1-1b7fb95b51f9@oss.qualcomm.com>
In-Reply-To: <20260629-qcom-sa8255p-emac-v11-1-1b7fb95b51f9@oss.qualcomm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Jun 2026 15:51:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXen+E-Ai51aWBa_KV9W8Fz2cQPpT-FG_kQ7akhrrYa_A@mail.gmail.com>
X-Gm-Features: AVVi8CdHRRLXddfc63bNJYLQ9RF__6zMi6ngPMxYGYM87lHlKy_8kZoakyQBXrY
Message-ID: <CAMuHMdXen+E-Ai51aWBa_KV9W8Fz2cQPpT-FG_kQ7akhrrYa_A@mail.gmail.com>
Subject: Re: [PATCH net-next v11 1/7] dt-bindings: phy: document the serdes
 PHY on sa8255p
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Vinod Koul <vkoul@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Shawn Guo <shawnguo@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com, 
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>, Romain Gantois <romain.gantois@bootlin.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
	Christophe Roullier <christophe.roullier@foss.st.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Radu Rendec <rrendec@redhat.com>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Drew Fustini <dfustini@tenstorrent.com>, 
	linux-sunxi@lists.linux.dev, linux-amlogic@lists.infradead.org, 
	linux-mips@vger.kernel.org, imx@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_065153_895883_833120CE 
X-CRM114-Status: GOOD (  20.45  )
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

Hi Bartosz,

Thanks for your patch!

On Mon, 29 Jun 2026 at 13:29, Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
> Describe the SGMII/SerDes PHY present on the Qualcomm sa8255p platforms.
> This is essentially the same hardware as sa8775p rev3 but the PHY is
> managed by firmware over SCMI.

So why can't it be reuse the DT bindings, and be compatible with
qcom,sa8775p-dwmac-sgmii-phy?

> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/qcom,sa8255p-dwmac-sgmii-phy.yaml

> +  power-domains:
> +    maxItems: 1
> +
> +  power-domain-names:
> +    items:
> +      - const: serdes

> +examples:
> +  - |
> +    phy@8901000 {
> +        compatible = "qcom,sa8255p-dwmac-sgmii-phy";
> +        reg = <0x08901000 0xe10>;
> +        #phy-cells = <0>;
> +        power-domains = <&scmi7_dvfs 0>;
> +        power-domain-names = "serdes";

Ah, this uses power-domains, while the existing bindings for
qcom,sa8775p-dwmac-sgmii-phy use a clock.
I guess the clock is the correct hardware description?

Adding to my list of examples for backing a hardware-to-SCMI remapping
driver...

> +    };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
