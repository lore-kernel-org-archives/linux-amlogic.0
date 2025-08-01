Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C57C0C87FDA
	for <linux-amlogic@archiver.kernel.org>; Fri,  1 Aug 2025 13:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qvj+oPly48LQPaM6XMgFEDZPP0KJHQUKXCiUp5OJAJs=; b=zqqtW2oLh0v9zb
	Amc6CARGpkjQ+lZZP3Qp5aZcFPzd4FCj/e35hhj+ZvmlmnDH607Gbtho1JS56aBMKGjdFEO3YUuTi
	fiVi+AQF+IMIN1IJSzIpDo2DW0oq+1mfnJlNAR61J93JDy/7dAMDt4IVK9ka1Hy8dik4kNdGlRBge
	45+l1ySo3A5/Wf7lffUiCgtHT2nNkTyGkVwvIEj1Xx7IdkaBXwwPt8aJsJv8SlNwoFPGpi6xTkAOi
	HAdFMfnXJyfB081w3p/spn4uPwOEQ7/T90FP18k5IQMHY21db9le9vceg2cXNnPcZZx9hP9iaWjG+
	6e1rryLtojDneM6+8waw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhpTs-000000063uc-2vZQ;
	Fri, 01 Aug 2025 13:07:28 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhpP6-000000062yr-3WZP
	for linux-amlogic@lists.infradead.org;
	Fri, 01 Aug 2025 13:02:34 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3b78127c5d1so1121839f8f.3
        for <linux-amlogic@lists.infradead.org>; Fri, 01 Aug 2025 06:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754053351; x=1754658151; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gLMMegKWPAwbuAT4qa7ry5UgyjMvX8MthgDNa8ZNhbc=;
        b=RW4JIBCze2oQSdnj3mjW2E1Nm3KCWAG0pw2RjLB9CCOT52E9CgHQ+Jtx/7r7UjTvFQ
         XnNKzGHLeZ0RPqLOTt8v56gK9qlKDtD0r5iKAI3rLn97k1W9bAD0pXSCKmNfl1ShJToI
         BFCgMHHD5SznfOWqS9es4d7CsY3ZuJfikLXIeVz/KCVFE+DCTnHaE8LDL4Aj04CZbUrp
         cY2YCVOyYpvq5OH5WVZpUOOX5x811UV1XEv6PrDpxOvwhCszUKcvhTz8zJSR6JCQyVeH
         LsAsoVDKl08dDWfJ5mntxGuuvN/GfLHxm7DnJ9Yhp6gLXNh/ReLGHq9EKzqRJMg5xudq
         G1+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754053351; x=1754658151;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gLMMegKWPAwbuAT4qa7ry5UgyjMvX8MthgDNa8ZNhbc=;
        b=baUbtmcNze9xeXC5oQl7eHkafs4Choa36p4LUASBTLnGwnsnKioAgF1JNZVGV1I8rZ
         GwQKqEwQfYrqR3ltAuAFEfUXhF8Pd2q0sez5yYCVavUUPA97ttgQFfc2AX+QELWKg1tI
         Qdasafywzl6hutpzTEgjGYPDIxEJSs8kA6D/8xGI07zDcij7OpsV+lYIEMOUY2O7O7hU
         Bz7amPuyJZgKdeoJ+KGejbWfrARMclaOJBu9vkNDKkXMx0Uz8fna64vOIGoDka2hQfoM
         sb3yLsj3vcOxha/EYtSurIAozfcHlKN44KzEZp+rwSDxYL4pI2VPeY8F6tIr3SHe20AG
         Cn1Q==
X-Gm-Message-State: AOJu0YwEqpn+pWbyo/de7lUGDcVcVcD4TfMYP22De1m4lDN3KCYSNr0t
	tyqkVze4yXt0L45jhCZLfRssDTgsKpLvPJRV5Yg3lFx94qS7qXHaSHAH5pIjZZLt+cg=
X-Gm-Gg: ASbGncvwBqGi1/TvOc7a15hCVHq7L7y2vDRgPvges4NPPe4iSCpYDbtT/mynCcZJ1W9
	sNQfujJ/yq7mijTHHd5vRRHZLzXFUVeylpz+FhXyXnsi0iDLpIsKXm9RDOCl3tDKbIUMgoLmv5M
	lPjZJnTOsZN/NoCp80Chryh4IKBwC5jfMWdrLJ55Ho7IXEXsKV9zI3/yfuwJ6KwECiWH8yrNsK3
	fMi6KVmjBpkXPeg2f4XTbS1DO3ozNMmv4b/4JxCPMbu6AnC/pYMXRPvLNu9VDbyFAFhpp2kqu3U
	Zr7YCMqQCYX4woqba5sqO+M4nhM/aqIuc+pTY0b8EFbTdPj6KS9IrXhwaWyroatXNK950yoZzOH
	kucwzOoit7C2xabE+WG/2MX7SwjuCLFX1Mra2lA==
X-Google-Smtp-Source: AGHT+IF6UIhzEv/BIKAVKHHuy1yN8mG09Jf9PwNyU+wKaH+xagJfNv3fil+yZcyBDIY076Ap5Oe2Jw==
X-Received: by 2002:a5d:5f47:0:b0:3b8:d1a4:bab9 with SMTP id ffacd0b85a97d-3b8d349cecamr1926931f8f.45.1754053351081;
        Fri, 01 Aug 2025 06:02:31 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b79c3c4d02sm5751772f8f.33.2025.08.01.06.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 06:02:30 -0700 (PDT)
Date: Fri, 1 Aug 2025 16:02:26 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sunny Luo <sunny.luo@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, linux-spi@vger.kernel.org
Subject: [bug report] spi: Add Amlogic SPISG driver
Message-ID: <aIy64j1zj316IF_h@stanley.mountain>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_060232_882532_30063416 
X-CRM114-Status: GOOD (  11.09  )
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

	drivers/spi/spi-amlogic-spisg.c:652 aml_spisg_clk_init()
	warn: passing zero to 'PTR_ERR'

drivers/spi/spi-amlogic-spisg.c
    640 static int aml_spisg_clk_init(struct spisg_device *spisg, void __iomem *base)
    641 {
    642         struct device *dev = &spisg->pdev->dev;
    643         struct clk_init_data init;
    644         struct clk_divider *div;
    645         struct clk_div_table *tbl;
    646         char name[32];
    647         int ret, i;
    648 
    649         spisg->core = devm_clk_get_enabled(dev, "core");
    650         if (IS_ERR_OR_NULL(spisg->core)) {

This should just be an IS_ERR() check...

    651                 dev_err(dev, "core clock request failed\n");

Otherwise, let's pretend that devm_clk_get_enabled() could really return
NULL because there was a bug in the Kconfig or somewhere else, then it
would need to be treated as success

--> 652                 return PTR_ERR(spisg->core);

This returns success, so I guess that would be fine except that really
it's not fine at all.

For more information see my blog:
https://staticthinking.wordpress.com/2022/08/01/mixing-error-pointers-and-null/

    653         }
    654 
    655         spisg->pclk = devm_clk_get_enabled(dev, "pclk");
    656         if (IS_ERR_OR_NULL(spisg->pclk)) {
    657                 dev_err(dev, "pclk clock request failed\n");
    658                 return PTR_ERR(spisg->pclk);

Same.

    659         }
    660 
    661         clk_set_min_rate(spisg->pclk, SPISG_PCLK_RATE_MIN);
    662 
    663         clk_disable_unprepare(spisg->pclk);
    664 
    665         tbl = devm_kzalloc(dev, sizeof(struct clk_div_table) * (DIV_NUM + 1), GFP_KERNEL);
    666         if (!tbl)
    667                 return -ENOMEM;
    668 
    669         for (i = 0; i < DIV_NUM; i++) {
    670                 tbl[i].val = i + SPISG_CLK_DIV_MIN - 1;
    671                 tbl[i].div = i + SPISG_CLK_DIV_MIN;
    672         }
    673         spisg->tbl = tbl;
    674 
    675         div = devm_kzalloc(dev, sizeof(*div), GFP_KERNEL);
    676         if (!div)
    677                 return -ENOMEM;
    678 
    679         div->flags = CLK_DIVIDER_ROUND_CLOSEST;
    680         div->reg = base + SPISG_REG_CFG_BUS;
    681         div->shift = __bf_shf(CFG_CLK_DIV);
    682         div->width = CLK_DIV_WIDTH;
    683         div->table = tbl;
    684 
    685         /* Register value should not be outside of the table */
    686         regmap_update_bits(spisg->map, SPISG_REG_CFG_BUS, CFG_CLK_DIV,
    687                            FIELD_PREP(CFG_CLK_DIV, SPISG_CLK_DIV_MIN - 1));
    688 
    689         /* Register clk-divider */
    690         snprintf(name, sizeof(name), "%s_div", dev_name(dev));
    691         init.name = name;
    692         init.ops = &clk_divider_ops;
    693         init.flags = CLK_SET_RATE_PARENT;
    694         init.parent_data = &(const struct clk_parent_data) {
    695                                 .fw_name = "pclk",
    696                            };
    697         init.num_parents = 1;
    698         div->hw.init = &init;
    699         ret = devm_clk_hw_register(dev, &div->hw);
    700         if (ret) {
    701                 dev_err(dev, "clock registration failed\n");
    702                 return ret;
    703         }
    704 
    705         spisg->sclk = devm_clk_hw_get_clk(dev, &div->hw, NULL);
    706         if (IS_ERR_OR_NULL(spisg->sclk)) {

Same.

    707                 dev_err(dev, "get clock failed\n");
    708                 return PTR_ERR(spisg->sclk);
    709         }
    710 
    711         clk_prepare_enable(spisg->sclk);
    712 
    713         return 0;
    714 }

regards,
dan carpenter

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
