Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48219C77B75
	for <linux-amlogic@archiver.kernel.org>; Tue, 16 May 2023 11:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=awcndy/ftko57Axp5azdsTXpYpilm8Cvm4MWFawql+g=; b=L5X3CAZALbsjvQ
	s80/ADzQVcLIE6KGt63PZKfXG7eHgId0RN33p7OQFG1l/ijrtoLrBslZ7FDvfQAQfqIyN6J1UfMO/
	T0c0XZ6JfqI7nyVNkLtFY+J9IeYe2Jbk5S/PJf4DctPicQbPBLL+a/0sJ8whGShulnSf9TvSUL2hg
	WyKZL5QylGwel8n75infOzhjnrWPOcAgMDerP6G1b1yokJEomvS4mjZl32GZQubi4NLwR466AAEp/
	/C1Vv+Cm2Kf4zdYs7hK5u/331YWDygtXlWM0OQH6BI7/zLHdH+tvmve6pBOGHp+QVLcOyMWI+2wwC
	uASDFQqC/EAtWS4Ol+jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pytEr-005eQv-2m;
	Tue, 16 May 2023 11:53:09 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pytEo-005ePE-2e
	for linux-amlogic@lists.infradead.org;
	Tue, 16 May 2023 11:53:08 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-30626f4d74aso9216411f8f.0
        for <linux-amlogic@lists.infradead.org>; Tue, 16 May 2023 04:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684237981; x=1686829981;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GBv3RQ9E2nj2VxVWOi5OYZIIGU6LVm0XUgPs/FVz3EY=;
        b=dZj+q1a5cl045iNsMOKpwwF/V9dBa3peELj2cK5rM3PXOqVZChNxYzJEB2iupEZZML
         q2/izu4n9Mbeoo9uEYcT3Se5AXydgPawXIzOiOIvoNbnJZxrgFxaLmOsXX34tnF1qI2J
         LlRZy6Rnktc0gKa4Pp2zuudLHFJpPOi4V9qGY9Q2iLixuXRoEUS3//yxMl6Pn1dhDJXE
         ItUxPQ2turFHIZg7pzRqc5Fc1hUAqYaBxc0PbScpuqixueiuA1zQTg1PuiJdd7rBXCt5
         4Snkb94eYu9aLuxgk0NSx9rYkRpIlug1oytOWl7rJfbE8bWy9EnQEt8FHs3GYc15C487
         Yw8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684237981; x=1686829981;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GBv3RQ9E2nj2VxVWOi5OYZIIGU6LVm0XUgPs/FVz3EY=;
        b=MoyShLGP2qv8wnnEvj9wSYCRe86WdpIMlRqYIpphyQt0ljmMEdC8gOWDt04A7Afo1R
         3x6p5BT0HlYlREHmh9WJqG+eKExSAcwnUg2wbc1x82HidXVfwcVzP9cdUiL/mBlkpll8
         GIJCtZi9cDlYB2FDowUmf7dsrcN6V1n8IFc8SFWfKJAFmbL2N02420JJ4gyxltrarjbF
         o3wCyMWDMG2v+E4w+i0gUzVW0zRQUH3W3z2YsiPlELeCVtVB0caZkyuQe3KFZrgvOikk
         ox+3wG594L2xIfo/LS70WExE/pLXD5dDu+lixd7o5coGKKq74AlqbZD5KG+ep0W1TlVl
         v7hA==
X-Gm-Message-State: AC+VfDwCdNuDDJVyZN9nIZ8Ht9PanHQ1wAMCU35ymgfUExwfcAErnDm3
	nJz5EL4yrM3i9/Aff/0FQgtZhg==
X-Google-Smtp-Source: ACHHUZ7Wm97TbRm4zFAEgF4ZbdkO1QUID7eLVTIVYR6mk0NeWb3nVQ/3NU4NCXPFFIAkfTar3xo1IA==
X-Received: by 2002:a5d:4904:0:b0:307:bd64:f5a4 with SMTP id x4-20020a5d4904000000b00307bd64f5a4mr15556197wrq.52.1684237981336;
        Tue, 16 May 2023 04:53:01 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id e7-20020a5d5307000000b003063772a55bsm2399380wrv.61.2023.05.16.04.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 May 2023 04:52:59 -0700 (PDT)
Date: Tue, 16 May 2023 14:52:47 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Zelong Dong <Zelong.Dong@amlogic.com>
Cc: oe-kbuild@lists.linux.dev, Neil Armstrong <neil.armstrong@linaro.org>,
	Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
	Qianggui.Song@amlogic.com, Yonghui.Yu@amlogic.com,
	kelvin.zhang@amlogic.com
Subject: Re: [PATCH] media: rc: meson-ir: support MMIO regmaps to access
 registers
Message-ID: <1d4b788e-6750-4f72-ad70-c91319e6714d@kili.mountain>
References: <95860d11-8317-4082-a1b8-a1fdaba9f6aa@kili.mountain>
 <32954093-cf5d-8802-eb1b-3458596a24ea@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <32954093-cf5d-8802-eb1b-3458596a24ea@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230516_045306_858891_D94E3B53 
X-CRM114-Status: UNSURE (   9.93  )
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

On Tue, May 16, 2023 at 07:47:24PM +0800, Zelong Dong wrote:
> Hi Dan Carpenter,
> 
> Thanks for your review.
> 
> Neil suggest to use devm_platform_ioremap_resource(), would it be better
> like this?
> 
> 	res_start = devm_platform_ioremap_resource(pdev, 0);;
> 	if (IS_ERR(res_start))
>         	return PTR_ERR(res_start);
> 
> 	ir->reg = devm_regmap_init_mmio(&pdev->dev, res_start,
>                                 	&meson_ir_regmap_config);
> 	if (IS_ERR(ir->reg))
>         	return PTR_ERR(ir->reg);

Yep.  That works.

regards,
dan carpenter



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
