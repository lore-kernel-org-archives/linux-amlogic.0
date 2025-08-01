Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CA6FC88CB9
	for <linux-amlogic@archiver.kernel.org>; Fri,  1 Aug 2025 13:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7feOCVSNNrDUOm2gd8/Fx9fH0MvG+SRKuMaO7K0NoCw=; b=FupnEda3XueNiv
	Ytv7CCBPJN0oMry4zurtzg0QWKB4EJgeMFf4MMKbrIZfI8up6htZhAKrrPUOj0GI9KxieOhNw4NTg
	RtTnEM56cbdUeESlDXloW7B0P3rymM0aGvPA7d48q0YaAI2/HQPoLM0vSrHf+ZJiwXV2/DlD+eLs9
	p8ACvFLdhIl8RiEGOW7ewtArP/kztRZnFY056654e7Qx1svEXMbyF3EqQt7gwAwi4IkzN3/5xRmms
	F78LuiNGBJlgZOOO10kj6SY45JTTqPj+QhdXKWdscHOxfx7ujoORTVhHsDADcFSOXb1ru0agAoFAR
	exLrHdXssxA0KHwy7/zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhpTt-000000063wR-38oi;
	Fri, 01 Aug 2025 13:07:29 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhpQn-000000063Jm-2Fon
	for linux-amlogic@lists.infradead.org;
	Fri, 01 Aug 2025 13:04:18 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3b78d13bf10so1658447f8f.1
        for <linux-amlogic@lists.infradead.org>; Fri, 01 Aug 2025 06:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754053456; x=1754658256; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nUSYOILDQLOqm3Jp5VBECuVpBi3LVOVdI7HglhfyqwQ=;
        b=gce2RKZAlXFo99mjzfN8sIvNFB6WbixHmKqOn5hbAphSKbj2NjaF3PxhgU0F8lmOWN
         FPli5AbW+2XnsDEtaXELRISa7XhpqlTLOW4yLyQFIJpuEIdDdtBwUUlmL72K1NE19jbV
         a+A63cR6ay6lC6v+sCn5eQuukqs3l/RJ02ZEJ1I6otDsEVqtVN6CHBcCa6R4KBXH2OmF
         y5KBkYXymoRFwG8XrRbe1nYYQ94HNbgCokPBBF6SPEvbn43kSwsSYrL1ZxGxpKsX27Ni
         kn48tbFL90y9NNG9f7Km2KMDW6mnPJAY41QQUAvnLIdIEgNQCtQUSwf/iOLiX2HbBDq2
         Lzzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754053456; x=1754658256;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nUSYOILDQLOqm3Jp5VBECuVpBi3LVOVdI7HglhfyqwQ=;
        b=htb9uNCDpQVO09Q0MbFZkI1XvxUUNpgauYLHtC5Dq4wkV50cv2zVQ49IXvasPre3Fp
         6Av3lpocg78lnWQhsqXk9yp65V+oL99dxw9GUpS5Sa5IuxqFi7zdqMct+++DrVnuH1e3
         MzNh60p0z1obl3ciSkoJOYDW2iWS+D+Q3RVA0gj2n1T1YmzEPe37silp0/RqDSbE3Pc/
         SA2bW+8CbJjjdfFjbxFi3UIoY0rAOaa1agdnHDrXFfu870qVKUukwLP2H1BX3iZijY5c
         GoujtIWtl+wNapFURhRkA1yqXmhamIlewp1xFYyqc4MfZTchXtAN8MLRHdCk4izPruTa
         rDkA==
X-Gm-Message-State: AOJu0YyLTskvvR7CmT5ppakAdmnd/m6BHEfKD5Paw5241Sw+T5x8DM5o
	G2laTuP6QeiR9hOKy2y6k8tibCkCVAZrDanMb6yqkifZn/aKfUutk/b187F6/jIJDgM=
X-Gm-Gg: ASbGncuDP+5NVlERYoP6T9a0uRggLYWw/GvjY8ni9ewHpDPE0jwvhi/HvS+H79FCK55
	bIe+6tfONs4RRB/1txqL9iA15y8yE4HM88HyUDS560J/7/0gwA4zI05zPoE5uymqaAYCcpjzRVH
	8exMzfAFRY2tg2dWLG14AYlwoKNU+yqV/vbyKjTy/h7EWmbg0d0eTRPRXJRvnx0AjijJl9b9m+x
	pWac4yQvzno5k8w64cpnypKjcBNCwkRvB6+lMZjRU0rKoXbJ5kriL49ix/ErHCfUSajrAtSY4b7
	hsiF+UI68UW6xvM2DjYdesrVNshXAHoYTbet8NXL1SioUETDKklxos/4xfTnS0DZ59ZYxYzCdiU
	VEb/c3iNNLZ9hfTakwOlgq7qa63c=
X-Google-Smtp-Source: AGHT+IHpDgWolR8XIipY+aOHmaz5kNZzJI/RRwdtHRCBa4uOijtBoftGHDMG4/QsqTSDwHF72vlpZg==
X-Received: by 2002:a05:6000:2013:b0:3b7:94c3:277d with SMTP id ffacd0b85a97d-3b8d344703cmr2151657f8f.20.1754053455897;
        Fri, 01 Aug 2025 06:04:15 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b79c453c75sm5909716f8f.41.2025.08.01.06.04.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 06:04:15 -0700 (PDT)
Date: Fri, 1 Aug 2025 16:04:12 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sunny Luo <sunny.luo@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, linux-spi@vger.kernel.org
Subject: [bug report] spi: Add Amlogic SPISG driver
Message-ID: <aIy7TOKt1_sdIfcH@stanley.mountain>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_060417_582015_74034762 
X-CRM114-Status: UNSURE (   7.56  )
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

Hello Sunny Luo,

Commit cef9991e04ae ("spi: Add Amlogic SPISG driver") from Jul 18,
2025 (linux-next), leads to the following Smatch static checker
warning:

	drivers/spi/spi-amlogic-spisg.c:764 aml_spisg_probe()
	warn: missing unwind goto?

drivers/spi/spi-amlogic-spisg.c
    716 static int aml_spisg_probe(struct platform_device *pdev)
    717 {
    718         struct spi_controller *ctlr;
    719         struct spisg_device *spisg;
    720         struct device *dev = &pdev->dev;
    721         void __iomem *base;
    722         int ret, irq;
    723 
    724         const struct regmap_config aml_regmap_config = {
    725                 .reg_bits = 32,
    726                 .val_bits = 32,
    727                 .reg_stride = 4,
    728                 .max_register = SPISG_MAX_REG,
    729         };
    730 
    731         if (of_property_read_bool(dev->of_node, "spi-slave"))
    732                 ctlr = spi_alloc_target(dev, sizeof(*spisg));
    733         else
    734                 ctlr = spi_alloc_host(dev, sizeof(*spisg));
    735         if (!ctlr)
    736                 return dev_err_probe(dev, -ENOMEM, "controller allocation failed\n");
    737 
    738         spisg = spi_controller_get_devdata(ctlr);
    739         spisg->controller = ctlr;
    740 
    741         spisg->pdev = pdev;
    742         platform_set_drvdata(pdev, spisg);
    743 
    744         base = devm_platform_ioremap_resource(pdev, 0);
    745         if (IS_ERR(base))
    746                 return dev_err_probe(dev, PTR_ERR(base), "resource ioremap failed\n");

This should be goto out_controller

    747 
    748         spisg->map = devm_regmap_init_mmio(dev, base, &aml_regmap_config);
    749         if (IS_ERR(spisg->map))
    750                 return dev_err_probe(dev, PTR_ERR(spisg->map), "regmap init failed\n");
    751 
    752         irq = platform_get_irq(pdev, 0);
    753         if (irq < 0) {
    754                 ret = irq;
    755                 goto out_controller;
    756         }
    757 
    758         ret = device_reset_optional(dev);
    759         if (ret)
    760                 return dev_err_probe(dev, ret, "reset dev failed\n");

Same

    761 
    762         ret = aml_spisg_clk_init(spisg, base);
    763         if (ret)
--> 764                 return dev_err_probe(dev, ret, "clock init failed\n");

Same.

    765 
    766         spisg->cfg_spi = 0;
    767         spisg->cfg_start = 0;
    768         spisg->cfg_bus = 0;
    769 
    770         spisg->cfg_spi = FIELD_PREP(CFG_SFLASH_WP, 1) |
    771                          FIELD_PREP(CFG_SFLASH_HD, 1);
    772         if (spi_controller_is_target(ctlr)) {
    773                 spisg->cfg_spi |= FIELD_PREP(CFG_SLAVE_EN, 1);
    774                 spisg->cfg_bus = FIELD_PREP(CFG_TX_TUNING, 0xf);
    775         }
    776         /* default pending */
    777         spisg->cfg_start = FIELD_PREP(CFG_PEND, 1);
    778 
    779         pm_runtime_set_active(&spisg->pdev->dev);
    780         pm_runtime_enable(&spisg->pdev->dev);
    781         pm_runtime_resume_and_get(&spisg->pdev->dev);
    782 
    783         ctlr->num_chipselect = 4;
    784         ctlr->dev.of_node = pdev->dev.of_node;
    785         ctlr->mode_bits = SPI_CPHA | SPI_CPOL | SPI_LSB_FIRST |
    786                           SPI_3WIRE | SPI_TX_QUAD | SPI_RX_QUAD;
    787         ctlr->max_speed_hz = 1000 * 1000 * 100;
    788         ctlr->min_speed_hz = 1000 * 10;
    789         ctlr->setup = aml_spisg_setup;
    790         ctlr->cleanup = aml_spisg_cleanup;
    791         ctlr->prepare_message = aml_spisg_prepare_message;
    792         ctlr->transfer_one_message = aml_spisg_transfer_one_message;
    793         ctlr->target_abort = aml_spisg_target_abort;
    794         ctlr->can_dma = aml_spisg_can_dma;
    795         ctlr->max_dma_len = SPISG_BLOCK_MAX;
    796         ctlr->auto_runtime_pm = true;
    797 
    798         dma_set_max_seg_size(&pdev->dev, SPISG_BLOCK_MAX);
    799 
    800         ret = devm_request_irq(&pdev->dev, irq, aml_spisg_irq, 0, NULL, spisg);
    801         if (ret) {
    802                 dev_err(&pdev->dev, "irq request failed\n");
    803                 goto out_clk;
    804         }
    805 
    806         ret = devm_spi_register_controller(dev, ctlr);
    807         if (ret) {
    808                 dev_err(&pdev->dev, "spi controller registration failed\n");
    809                 goto out_clk;
    810         }
    811 
    812         init_completion(&spisg->completion);
    813 
    814         pm_runtime_put(&spisg->pdev->dev);
    815 
    816         return 0;
    817 out_clk:
    818         if (spisg->core)
    819                 clk_disable_unprepare(spisg->core);
    820         clk_disable_unprepare(spisg->pclk);
    821 out_controller:
    822         spi_controller_put(ctlr);
    823 
    824         return ret;
    825 }

regards,
dan carpenter

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
