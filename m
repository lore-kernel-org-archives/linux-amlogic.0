Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56015C87FDB
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 Aug 2025 08:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4qNHGiL+SMra/m6qldsf4bD2+eifJpx9C2OKCpEE7zI=; b=C25cFn5yq6pTTQ
	g3hyzyr1mH8aJ35d4qvPo6PlOmbt9RWCmjjyr6EJu6+VfcJ+3g5AikgINXxeN4vgE+FlXEY4NXpSW
	VAQ2BLy57qOOMjgLTXyB+5Y1r/yGgjdtZD0TBkBJSp0MwBahl/MImHl1Ck84DauoZTTbiHSJEdn0L
	czX4l2Viz8/Qb+QTxBNhHnmX9mETKQvvdXokOyaF3Mxeuv1IcOKt6na2sRWR4LLs20hC/NkSMaWYB
	UaAUlKXZtgpyy7pOPPqAZB4YBXDX/ZrNQO8durgM9PFn4dyeziLw64nUsPBxvAtPDVXRoeBiucj3P
	mFZ6j8UrctTlfmZ+qFEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiqlD-00000009ygR-3Z8S;
	Mon, 04 Aug 2025 08:41:35 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiqKg-00000009utT-0HvZ
	for linux-amlogic@lists.infradead.org;
	Mon, 04 Aug 2025 08:14:11 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-458bece40fcso7410175e9.3
        for <linux-amlogic@lists.infradead.org>; Mon, 04 Aug 2025 01:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754295248; x=1754900048; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aIs0VZsx9ne5+u8erw4jNU+9U75wvlH5jVml9RCdY5w=;
        b=YGj74d7og0BjxNiE6VRUvNdaf/eCdqfXcylaNza0Xjl3jihC7JgJgY82tef4SmOUsf
         g9bzXyxw2sZWTOHqUGohAhEqSxtzsppMr8VXv392y1L/wUVbM0VTwp0MREEgGqAIwbg6
         9jNCzAwKSck2YW4Ehjqh4kEzeRt/pHewp/f6BqvoeAJdiw2xNa9kaHFIz5eaaQyu4VTr
         QPoHfa9dDEO9tgYRg2jOCVsYw17gidZIY6kfgE6RKkq+Epc0YRvx9CXl3SXJ0vcHkYBh
         +YfzB3DxPcxhkezZI+q2ygnEUrb9PYSHlh55hwFYymQ6NNGe/aBhzFJ12hLrTOjDPjHD
         DcjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754295248; x=1754900048;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aIs0VZsx9ne5+u8erw4jNU+9U75wvlH5jVml9RCdY5w=;
        b=E1LNCR2ZnVJ95iYcuzigQkhm5ERRyTMFL7rvENV6SjBTFp86rcJh0kD98E8G8GrR9z
         t/ukePMoz3M7sxm41qgGyF4YiGDiQMtuKUx0+M8P8qLXk6uGTA/LCYjJeUScnU5hBgcz
         lgMqDa6cKfQ2W5lxXRVMFyZwPrZWZni8Wvh0mje4qYV4YU6S1bpQLeTu/LYukwjSL8ec
         roBTPwYhigVPoQ2ZLOGXwjsCdPxu1y+fP0M1HjoQHjX00SzSdrF8q095JHVLVV2FYLG8
         jtr62h3InUvvxMbusyyQV2vq3+PDgdBJ8jZXP9uqO5MRlsy+kUKLbWGAI4slzJLmqnO2
         JNmw==
X-Gm-Message-State: AOJu0YwWy8ZAI/5YRaGVjQACALdlQZ7Pnh5Z1VgXhp4rkQ29zkPIhzkY
	oSjcymg9GOYtzC2P+U/U3DKfpWkZszFth9Q1q0m8xqghTd566YG5l6/rsl54AID5h0o=
X-Gm-Gg: ASbGncuZTXsDS3F1dcTLAYumFJic+J/+B4e46irCcKtxF7C+n+rDRgtYhMjnnebArwU
	VKINMXJ6U9RKrQIQB9XPUnG7q+UpAqBjR/nBcqHa3n/FWVnX3Hp/cHV8eT+Rqc7LiksW9ZFpazw
	mJ/xRmxrogwv8mvhXOTE6AiJ2FolAm8FKf5JyglOxjS7fyJf/o/L+Uuf4NaEavZ5Nsvs/WzTvji
	mH9ah43W+ZOffIhJ6wMUjLKYXpUBzPkNwGL1LF96CN2IwhkFeKYXefXIgQl7uUa9tEzijVxnm0r
	irJdlV1473EtRGbIwWSKgsqVKbLxaG8cWruzEykZi7sKBzhN110cWCkYv2WWR1/aERWhm9x5zcm
	9nslzDPNc7Al4epaUXUw8W46tnt4=
X-Google-Smtp-Source: AGHT+IEeeJkFKsl7/38jlJguNroD6DzRmQgXbAi7gRxUyE2DHkd/n/ytZVazRk0tnMc3kTWnIPGKwQ==
X-Received: by 2002:a05:600c:a01:b0:456:1d61:b0f2 with SMTP id 5b1f17b1804b1-458b6b57100mr61139955e9.30.1754295245801;
        Mon, 04 Aug 2025 01:14:05 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4589ee4f239sm156065575e9.21.2025.08.04.01.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 01:14:05 -0700 (PDT)
Date: Mon, 4 Aug 2025 11:14:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sunny Luo <sunny.luo@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, linux-spi@vger.kernel.org
Subject: [bug report] spi: Add Amlogic SPISG driver
Message-ID: <aJBryDMreHB9dI_i@stanley.mountain>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_011410_116987_58B9097A 
X-CRM114-Status: UNSURE (   6.38  )
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

	drivers/spi/spi-amlogic-spisg.c:314 aml_spisg_setup_transfer()
	error: we previously assumed 'exdesc' could be null (see line 261)

drivers/spi/spi-amlogic-spisg.c
    248 static int aml_spisg_setup_transfer(struct spisg_device *spisg,
    249                                     struct spi_transfer *xfer,
    250                                     struct spisg_descriptor *desc,
    251                                     struct spisg_descriptor_extra *exdesc)
    252 {
    253         int block_size, blocks;
    254         struct device *dev = &spisg->pdev->dev;
    255         struct spisg_sg_link *ccsg;
    256         int ccsg_len;
    257         dma_addr_t paddr;
    258         int ret;
    259 
    260         memset(desc, 0, sizeof(*desc));
    261         if (exdesc)
                    ^^^^^^
Checked for NULL

    262                 memset(exdesc, 0, sizeof(*exdesc));
    263         aml_spisg_set_speed(spisg, xfer->speed_hz);
    264         xfer->effective_speed_hz = spisg->effective_speed_hz;
    265 
    266         desc->cfg_start = spisg->cfg_start;
    267         desc->cfg_bus = spisg->cfg_bus;
    268 
    269         block_size = xfer->bits_per_word >> 3;
    270         blocks = xfer->len / block_size;
    271 
    272         desc->cfg_start |= FIELD_PREP(CFG_EOC, 0);
    273         desc->cfg_bus |= FIELD_PREP(CFG_KEEP_SS, !xfer->cs_change);
    274         desc->cfg_bus |= FIELD_PREP(CFG_NULL_CTL, 0);
    275 
    276         if (xfer->tx_buf || xfer->tx_dma) {
    277                 desc->cfg_bus |= FIELD_PREP(CFG_LANE, nbits_to_lane[xfer->tx_nbits]);
    278                 desc->cfg_start |= FIELD_PREP(CFG_OP_MODE, SPISG_OP_MODE_WRITE);
    279         }
    280         if (xfer->rx_buf || xfer->rx_dma) {
    281                 desc->cfg_bus |= FIELD_PREP(CFG_LANE, nbits_to_lane[xfer->rx_nbits]);
    282                 desc->cfg_start |= FIELD_PREP(CFG_OP_MODE, SPISG_OP_MODE_READ);
    283         }
    284 
    285         if (FIELD_GET(CFG_OP_MODE, desc->cfg_start) == SPISG_OP_MODE_READ_STS) {
    286                 desc->cfg_start |= FIELD_PREP(CFG_BLOCK_SIZE, blocks) |
    287                                    FIELD_PREP(CFG_BLOCK_NUM, 1);
    288         } else {
    289                 blocks = min_t(int, blocks, SPISG_BLOCK_MAX);
    290                 desc->cfg_start |= FIELD_PREP(CFG_BLOCK_SIZE, block_size & 0x7) |
    291                                    FIELD_PREP(CFG_BLOCK_NUM, blocks);
    292         }
    293 
    294         if (xfer->tx_sg.nents && xfer->tx_sg.sgl) {
    295                 ccsg_len = xfer->tx_sg.nents * sizeof(struct spisg_sg_link);
    296                 ccsg = kzalloc(ccsg_len, GFP_KERNEL | GFP_DMA);
    297                 if (!ccsg) {
    298                         dev_err(dev, "alloc tx_ccsg failed\n");
    299                         return -ENOMEM;
    300                 }
    301 
    302                 aml_spisg_sg_xlate(&xfer->tx_sg, ccsg);
    303                 paddr = dma_map_single(dev, (void *)ccsg,
    304                                        ccsg_len, DMA_TO_DEVICE);
    305                 ret = dma_mapping_error(dev, paddr);
    306                 if (ret) {
    307                         kfree(ccsg);
    308                         dev_err(dev, "tx ccsg map failed\n");
    309                         return ret;
    310                 }
    311 
    312                 desc->tx_paddr = paddr;
    313                 desc->cfg_start |= FIELD_PREP(CFG_TXD_MODE, SPISG_DATA_MODE_SG);
--> 314                 exdesc->tx_ccsg = ccsg;
                        ^^^^^^^^
Unchecked dereference

    315                 exdesc->tx_ccsg_len = ccsg_len;
    316                 dma_sync_sgtable_for_device(spisg->controller->cur_tx_dma_dev,
    317                                             &xfer->tx_sg, DMA_TO_DEVICE);
    318         } else if (xfer->tx_buf || xfer->tx_dma) {
    319                 paddr = xfer->tx_dma;
    320                 if (!paddr) {
    321                         paddr = dma_map_single(dev, (void *)xfer->tx_buf,
    322                                                xfer->len, DMA_TO_DEVICE);
    323                         ret = dma_mapping_error(dev, paddr);
    324                         if (ret) {
    325                                 dev_err(dev, "tx buf map failed\n");
    326                                 return ret;
    327                         }
    328                 }
    329                 desc->tx_paddr = paddr;
    330                 desc->cfg_start |= FIELD_PREP(CFG_TXD_MODE, SPISG_DATA_MODE_MEM);
    331         }
    332 
    333         if (xfer->rx_sg.nents && xfer->rx_sg.sgl) {
    334                 ccsg_len = xfer->rx_sg.nents * sizeof(struct spisg_sg_link);
    335                 ccsg = kzalloc(ccsg_len, GFP_KERNEL | GFP_DMA);
    336                 if (!ccsg) {
    337                         dev_err(dev, "alloc rx_ccsg failed\n");
    338                         return -ENOMEM;
    339                 }
    340 
    341                 aml_spisg_sg_xlate(&xfer->rx_sg, ccsg);
    342                 paddr = dma_map_single(dev, (void *)ccsg,
    343                                        ccsg_len, DMA_TO_DEVICE);
    344                 ret = dma_mapping_error(dev, paddr);
    345                 if (ret) {
    346                         kfree(ccsg);
    347                         dev_err(dev, "rx ccsg map failed\n");
    348                         return ret;
    349                 }
    350 
    351                 desc->rx_paddr = paddr;
    352                 desc->cfg_start |= FIELD_PREP(CFG_RXD_MODE, SPISG_DATA_MODE_SG);
    353                 exdesc->rx_ccsg = ccsg;
    354                 exdesc->rx_ccsg_len = ccsg_len;
    355                 dma_sync_sgtable_for_device(spisg->controller->cur_rx_dma_dev,
    356                                             &xfer->rx_sg, DMA_FROM_DEVICE);
    357         } else if (xfer->rx_buf || xfer->rx_dma) {
    358                 paddr = xfer->rx_dma;
    359                 if (!paddr) {
    360                         paddr = dma_map_single(dev, xfer->rx_buf,
    361                                                xfer->len, DMA_FROM_DEVICE);
    362                         ret = dma_mapping_error(dev, paddr);
    363                         if (ret) {
    364                                 dev_err(dev, "rx buf map failed\n");
    365                                 return ret;
    366                         }
    367                 }
    368 
    369                 desc->rx_paddr = paddr;
    370                 desc->cfg_start |= FIELD_PREP(CFG_RXD_MODE, SPISG_DATA_MODE_MEM);
    371         }
    372 
    373         return 0;
    374 }

regards,
dan carpenter

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
