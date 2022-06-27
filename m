Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 856B7C433EF
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Jun 2022 07:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QjtiYD6L/lWy+n+F86q7Ul5YsA47EoNz0xQ1kjiCBJg=; b=ZobPZFumVL/Md9
	vffrX0qguyIicUr84XFva/3Defsfd+xtQwLTi1sEsB6hEiLbdAKfW9mCTQW0Yf20VLULwhZpLr+Vw
	D/+v4NOZGg2Q/i90axVI+V/BhkpbY/oFKeLIASZB0p2vZBLdJR3sw2J576uK5plaEZPXquBWMOe7G
	3n0tH4tdvlQA/42cYCU7qIPT+GBvBjv20/fYgJg/TTCwlvgpXlgBCdRugs/gNytedYf+9al67rFhr
	UkdhTKEsbTxCDa6CdEFaxQSZ2Z5tdDT94JPrNsmXnIq/Is7fYLnn54rItQjtOPQN8nfTr4oXcoaUA
	Au9pTBJLKhgFOyaGUYpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5im5-00GI7B-84; Mon, 27 Jun 2022 07:03:09 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5ilH-00GHkY-O9
	for linux-amlogic@lists.infradead.org; Mon, 27 Jun 2022 07:02:21 +0000
Received: by mail-wr1-x42d.google.com with SMTP id d17so5965321wrc.10
        for <linux-amlogic@lists.infradead.org>; Mon, 27 Jun 2022 00:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=LTRupNP8zGDlH2rCD8HF8CfVKNgPhKFXXtp+I+X0sqE=;
        b=GunVaYPe0aHenehxsNEW691AFHt8ol+2ZpaACxMNN7V/O6NbASYFjjgf2oPP1TIHkT
         zyrsf3rtFQO2r+a+ln7hc4FcdVUpTR84UaVo4n84rhHkT59PVUA8mM1UUshZ7eYJ04OA
         DukqEEt/gYJIfQHoIwaxqwldk1RFEeobJAevTacX6yLfW33fJ+6IFJJl0sEic4JQBKjh
         ahBgNZJB/q/PxcTxtb76QiavIknRfBGRXk9PAdrdNG8t0ykmmi4akYmp5j8PDwbgT1Tn
         nrpCZjC9wllarxIx9fwFzJrHEeIsxdxz8FV9TtQy39PDPHdsfFEZk6bM2CLXwdlW8kBG
         JzjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=LTRupNP8zGDlH2rCD8HF8CfVKNgPhKFXXtp+I+X0sqE=;
        b=JMoSEAc46QrOjdFl9jkUfVPtYUXqFKuC1vz3xXOnExgWDBp0t+tDpCW4g7Sp1k4nyT
         uXL6uOPJiTUUPAHTd/t9za9jx3IgkUb2uzNHuTSvve3JZEl5Tz64WjKUFu7hG78JkwJR
         vAsUO2DyWZmDyb1g5bP3HBQL8s97Q4IL8Cxh0us91JHm4CuFxFGM/B53flXK2+zNHnQz
         0+QQwaGVzcrifY8pZ74HbQt5YFMnakDdnhnJGuLbU2ojh/DoFnPsXvvHglxOUjrwOdaY
         YCsKtcJLfI5bor+1yf/fKHNzRTlFxf9bgaUnrcCGEd/j9tgYbhr90xXzBj7iylGBXPx0
         VPWg==
X-Gm-Message-State: AJIora8OuIYJZBbU5Xw5Ie90rQda/3yNkx1RxDy+9mvDC2kK4GTyQf0x
	0wxRBVuiTh6rH3FLfpdctXBSow==
X-Google-Smtp-Source: AGRyM1t7nroGAbqdhY6T5XxWBzJWB/PdIsEagImnNYDHnCS7rC/REHafmtvVrPe/H7ZA+YSTp30Fiw==
X-Received: by 2002:a05:6000:1f08:b0:21b:ae8f:4f0a with SMTP id bv8-20020a0560001f0800b0021bae8f4f0amr11200060wrb.456.1656313337255;
        Mon, 27 Jun 2022 00:02:17 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:6f56:f3c6:ba4f:bf5c? ([2001:861:44c0:66c0:6f56:f3c6:ba4f:bf5c])
        by smtp.gmail.com with ESMTPSA id y10-20020a1c4b0a000000b0039c587342d8sm16489337wma.3.2022.06.27.00.02.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jun 2022 00:02:16 -0700 (PDT)
Message-ID: <ee17ba1e-19ef-f72d-ce81-077fa5c30bd7@baylibre.com>
Date: Mon, 27 Jun 2022 09:02:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v8 5/5] mtd: rawnand: meson: not support legacy clock
Content-Language: en-US
To: Liang Yang <liang.yang@amlogic.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Cc: kernel test robot <lkp@intel.com>, Rob Herring <robh+dt@kernel.org>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Jianxin Pan <jianxin.pan@amlogic.com>,
 Victor Wan <victor.wan@amlogic.com>, XianWei Zhao
 <xianwei.zhao@amlogic.com>, Kelvin Zhang <kelvin.zhang@amlogic.com>,
 BiChao Zheng <bichao.zheng@amlogic.com>, YongHui Yu
 <yonghui.yu@amlogic.com>, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220627031703.33243-1-liang.yang@amlogic.com>
 <20220627031703.33243-6-liang.yang@amlogic.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220627031703.33243-6-liang.yang@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_000219_853017_F11C3E9D 
X-CRM114-Status: GOOD (  14.67  )
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

On 27/06/2022 05:17, Liang Yang wrote:
> meson NFC driver use common clock interfaces. so the test robot report
> some errors once using the legacy clock with HAVE_LEGACY_CLK on.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Liang Yang <liang.yang@amlogic.com>
> ---
>   drivers/mtd/nand/raw/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/raw/Kconfig b/drivers/mtd/nand/raw/Kconfig
> index 67b7cb67c030..c309cfeb74cd 100644
> --- a/drivers/mtd/nand/raw/Kconfig
> +++ b/drivers/mtd/nand/raw/Kconfig
> @@ -395,7 +395,7 @@ config MTD_NAND_STM32_FMC2
>   
>   config MTD_NAND_MESON
>   	tristate "Support for NAND controller on Amlogic's Meson SoCs"
> -	depends on ARCH_MESON || COMPILE_TEST
> +	depends on COMMON_CLK && (ARCH_MESON || COMPILE_TEST)
>   	select MFD_SYSCON
>   	help
>   	  Enables support for NAND controller on Amlogic's Meson SoCs.

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
