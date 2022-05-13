Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44857C433EF
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 May 2022 13:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HCBTY3sN8u7U1j/K7Lq7A8QB9+WvZlLbrhQ972lb3DQ=; b=S1OKSONErHoOFU
	uaTNejjqykWr8c/B+M3TiB66Zp42BMXXUeeKFiy8FfjeybcxSrqCnaL5z5tIgX40FVxBcJLj4+5MO
	fY1k3cAe+Y67ERlCWQ59c1J4R8vbP/V/uxbArxnFm4Cw487P7EbKBoJlJqkxi7xyjzhGvbb9s9MYi
	HaYwRUrHYTbjwL9cJAlAVdU4eH5uN2TbshiGZ4LPrni2XDFGxvvKhW91354PNQTUKKAmIBkKc31OW
	hmUBxq+xOgpVitguadYCDSWupB4uZNb0WoRyuR/W/Cgi/e+OHiSSC9mGD/WczHTELn3egEgTqpPMF
	lXWx0h6Pr4DhGC5C3ehA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npV5c-00GBfw-Vo; Fri, 13 May 2022 13:12:16 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npV5U-00GBbY-O8
 for linux-amlogic@lists.infradead.org; Fri, 13 May 2022 13:12:10 +0000
Received: by mail-wr1-x434.google.com with SMTP id v12so11370995wrv.10
 for <linux-amlogic@lists.infradead.org>; Fri, 13 May 2022 06:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=LGxOhx8g+uzMEucXSgcWuDgXr4IlXAOmT59wc9xxNUQ=;
 b=wRQl3HzxSMdYo3oAFiLxfCpRXx68CvABA7PTFHJ4KoYFsSKoKYI2o0kck84GVkrBPy
 Ydmi/opjnQr49lORQ2aUaZSPE+/GVtznPLLirTIhAGKxyF9K+8SkFklnqG8THPvEnIl9
 4OnyFli6+XLHcvlwPFcd/Lruz0Fk2j8qyZ0QhBnKLJzDsnJjuHoUuslW66qfhOHUDICf
 FYaXMNNqGc7u+UnZbaWj8jLEL35mH0fsJEnNRtrBKIZ1clKfzNQhhoetCB5ScLqSg8/J
 idGnNG0BGzsGtIvpg4JMSLaF5jqun0MxhJPpGU0TfZaAvlaDKAHhqGaxavFd2yb+/dB2
 vveQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=LGxOhx8g+uzMEucXSgcWuDgXr4IlXAOmT59wc9xxNUQ=;
 b=gnA1rEIbMjzpowxVeNP2O3Uw+If1HMmu8Bgl+zsCQ/lR9QCuzc0y68nZl9TS5SWfKY
 IJ/jtq5VcfmSV8SrcXI75JLECTKFD9ezbue+is78mEpXzlKH2OVA4xvtW4qnY7cTjzem
 vxApsFX4cTki5eG+BtCChrYVO61YSVIx/dWrVqFx6f/KwSDc36acSREIcpKQ84Z1gU+2
 gXcOy3aY3ziXDlDk2QRgz+17P761G6SWxkhCvvRcCg4r0oTc1el4ZSYhVzagQBRD9eF6
 aAE/o8sOvqyMC/ocYTRhWDbU3Bz8cm9FRInTTJjW4lv3cmrD0wRxMMf4eebtM6Nmc8Wb
 b5fw==
X-Gm-Message-State: AOAM531uY9FppMbJBd8jsJpzpp4f7949UJi+U+c2HtubxREcboTAWwNB
 oyQlpUoYq8a0Hsdv47HC9HTtZA==
X-Google-Smtp-Source: ABdhPJzqtxMi8tXdBozGwPO/lz7/uf3fxfcq7tdNkmA+KiH+k9aO4jgE0qPxI3t/ZmZJHJs6tODIAw==
X-Received: by 2002:adf:cc83:0:b0:20a:ca0c:ca1 with SMTP id
 p3-20020adfcc83000000b0020aca0c0ca1mr3817869wrj.553.1652447524944; 
 Fri, 13 May 2022 06:12:04 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:7639:a43b:f4c1:258d?
 ([2001:861:44c0:66c0:7639:a43b:f4c1:258d])
 by smtp.gmail.com with ESMTPSA id
 m10-20020a05600c460a00b003947e11c3ecsm2204392wmo.17.2022.05.13.06.12.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 May 2022 06:12:04 -0700 (PDT)
Message-ID: <d0730221-537c-ba0e-378b-388a37a2a736@baylibre.com>
Date: Fri, 13 May 2022 15:12:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v5 3/4] mtd: rawnand: meson: refine resource getting in
 probe
Content-Language: en-US
To: Liang Yang <liang.yang@amlogic.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Cc: Rob Herring <robh+dt@kernel.org>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Jianxin Pan <jianxin.pan@amlogic.com>,
 Victor Wan <victor.wan@amlogic.com>, XianWei Zhao
 <xianwei.zhao@amlogic.com>, Kelvin Zhang <kelvin.zhang@amlogic.com>,
 BiChao Zheng <bichao.zheng@amlogic.com>, YongHui Yu
 <yonghui.yu@amlogic.com>, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220513123404.48513-1-liang.yang@amlogic.com>
 <20220513123404.48513-4-liang.yang@amlogic.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220513123404.48513-4-liang.yang@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220513_061208_840181_4DBEA9BB 
X-CRM114-Status: GOOD (  14.47  )
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

On 13/05/2022 14:34, Liang Yang wrote:
> Signed-off-by: Liang Yang <liang.yang@amlogic.com>
> ---
>   drivers/mtd/nand/raw/meson_nand.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
> index cc93667a1e7f..6e50387475bb 100644
> --- a/drivers/mtd/nand/raw/meson_nand.c
> +++ b/drivers/mtd/nand/raw/meson_nand.c
> @@ -1378,7 +1378,6 @@ static int meson_nfc_probe(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
>   	struct meson_nfc *nfc;
> -	struct resource *res;
>   	int ret, irq;
>   
>   	nfc = devm_kzalloc(dev, sizeof(*nfc), GFP_KERNEL);
> @@ -1395,8 +1394,7 @@ static int meson_nfc_probe(struct platform_device *pdev)
>   
>   	nfc->dev = dev;
>   
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	nfc->reg_base = devm_ioremap_resource(dev, res);
> +	nfc->reg_base = devm_platform_ioremap_resource_byname(pdev, "nfc");
>   	if (IS_ERR(nfc->reg_base))
>   		return PTR_ERR(nfc->reg_base);
>   

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
