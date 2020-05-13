Return-Path: <SRS0=ZxT9=63=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7724CA90AF
	for <linux-amlogic@archiver.kernel.org>; Wed, 13 May 2020 10:42:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6326120673
	for <linux-amlogic@archiver.kernel.org>; Wed, 13 May 2020 10:42:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tkNgObNJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uQuO6RtH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6326120673
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hkAUSs4IxfX/fW+LKrbnqBKzaBlkQ4FmfHlzmvElShM=; b=tkNgObNJLJM7fttXDIysGdRpR
	OhOqT3s7eXMUXOut5yfQqsxm+25+xWnLnBydXcc6UcY6+zIqTkg0Zz09IpB/V82tthUx8wpBvit9i
	F5+Rzf9wEBGwrHNKlmH4I8xswlIvYXkHWn9PYsWwIMZHti+b+2UUq6W0UQe0PzwcuhM6Qp4g2pd2s
	+vD7qi1pqM94ep63ZqD+eqiTrHmRPYbzMI5CtPN4UW7MYgHVTjenigaIk+CujFOqEwRz1dyAPrOLm
	V+EDAPNDSBNUsfU0jDJynEM8uG1jXyruvcw82bflVnJXFQAlHsr5GN/iICs7FPJgRL4eiMzuH8kXy
	pu3BQ8zkA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYomR-00046z-FR; Wed, 13 May 2020 10:38:27 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYoiO-0007z7-KM
 for linux-amlogic@lists.infradead.org; Wed, 13 May 2020 10:34:18 +0000
Received: by mail-wm1-x343.google.com with SMTP id n5so12987492wmd.0
 for <linux-amlogic@lists.infradead.org>; Wed, 13 May 2020 03:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=RAYZx92zrU+XEe1c66bMex9zzQrfW8p1ZDJSPXKhkxg=;
 b=uQuO6RtH84Sdte9oQ6z12C173539QDB3JFLHZvwnWliYctpNhh7U3d3BWSmnM3PQcW
 2TihzvWsRZT+drxcJBKvCJhGlYnMVB+1Vea4v+CCdpnO08hlkBK5gR5iHl6wLluHIkWs
 aiJcjamaQDMNCKx/TRLEdfgdq6uga+a6GGIRhP0XeTMdk80d1sTjO8rc5DepupocSZdD
 z1sIANLCNepEeRKZKLNTVpC28i/xhU+CAFKHWOQMgUzDXP93oyxlo6Glp8/5KMFmIkoP
 5hd2RDMyZKBWjXaVnk0wfYOBObymhyhNWM3uYTHfsxmW1LdI8Kof2hifz6ZrGzn2kd+d
 SMZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RAYZx92zrU+XEe1c66bMex9zzQrfW8p1ZDJSPXKhkxg=;
 b=NTaQX48a4CV176qvvCmcC2yfoiXqfAHna7EW/YTsoTXRwXycQQxpl3+aV1WuiSclI8
 ZvdyTGFPJBeQBWxHDKZsOHey8SN6gmr+lqHCbDT+weVqshJLzk594JAqLv+9r0h/6BFd
 5xVCNpj8nsOqMwEG/Xa21eZ5gO1T3Q3+MlcKaoeYPuobCOr2AG849OM+uZ+0zFGrYjee
 NV8ZeMQ03HllLfIrXQPOWSLB+8sDt0EWxqVf3C3/qnZgzMSajJ8JtXrU/VFTY/zBQqgU
 c/iWK/wRQGfp2rPfIp7GBxUE1V/ebtedjWhA6OubLz7kZyu9sWpo2jNQ/SFyPCUdhJAv
 H6ZQ==
X-Gm-Message-State: AGi0PuasnJEaMm9vtfRBZCnmoEcwSPhbnVgbhPzjKSYGh6hNq9jySAO+
 40PfuIgsJaARQYEUXFpsshMUGc0mfRY=
X-Google-Smtp-Source: APiQypIlcy8RztoPWUmYbI5majIan1aFDKxbles48VYEQI8EF1HsfXlJxm++TtxU/GwXCgcMsZCf7A==
X-Received: by 2002:a1c:2ed3:: with SMTP id u202mr40266117wmu.77.1589366054922; 
 Wed, 13 May 2020 03:34:14 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id c25sm34270101wmb.44.2020.05.13.03.34.13
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 13 May 2020 03:34:14 -0700 (PDT)
Subject: Re: [PATCH v2 4/6] nvmem: add support for the Khadas MCU Programmable
 User Memory
To: Neil Armstrong <narmstrong@baylibre.com>
References: <20200512132613.31507-1-narmstrong@baylibre.com>
 <20200512132613.31507-5-narmstrong@baylibre.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <09026bde-0ae7-b1a4-835f-bf2481199398@linaro.org>
Date: Wed, 13 May 2020 11:34:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200512132613.31507-5-narmstrong@baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200513_033416_838078_5D0929E4 
X-CRM114-Status: GOOD (  27.44  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org



On 12/05/2020 14:26, Neil Armstrong wrote:
> The new Khadas VIM2, VIM3 and Edge boards embeds an on-board microcontroller
> offering a 56bytes User Programmable NVMEM array.
> 
> This array needs a password to be writable, thus a password sysfs file
> has been added on the device node to unlock the NVMEM.

Is this one time programmable? Or does it need to be unlocked for every 
read/write?

How can you make sure that the memory is unlocked before making attempt 
to read/write?

> 
> The default 6bytes password id: "Khadas"
> 
> This implements the user NVMEM devices as cell of the Khadas MCU MFD driver.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>   drivers/nvmem/Kconfig               |   8 ++
>   drivers/nvmem/Makefile              |   2 +
>   drivers/nvmem/khadas-mcu-user-mem.c | 128 ++++++++++++++++++++++++++++
>   3 files changed, 138 insertions(+)
>   create mode 100644 drivers/nvmem/khadas-mcu-user-mem.c
> 
> diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
> index d7b7f6d688e7..92cd4f6aa931 100644
> --- a/drivers/nvmem/Kconfig
> +++ b/drivers/nvmem/Kconfig
> @@ -67,6 +67,14 @@ config JZ4780_EFUSE
>   	  To compile this driver as a module, choose M here: the module
>   	  will be called nvmem_jz4780_efuse.
>   
> +config NVMEM_KHADAS_MCU_USER_MEM
> +	tristate "Khadas MCU User programmable memory support"
> +	depends on MFD_KHADAS_MCU
> +	depends on REGMAP
> +	help
> +	  This is a driver for the MCU User programmable memory
> +	  available on the Khadas VIM and Edge boards.
> +
>   config NVMEM_LPC18XX_EEPROM
>   	tristate "NXP LPC18XX EEPROM Memory Support"
>   	depends on ARCH_LPC18XX || COMPILE_TEST
> diff --git a/drivers/nvmem/Makefile b/drivers/nvmem/Makefile
> index a7c377218341..0516a309542d 100644
> --- a/drivers/nvmem/Makefile
> +++ b/drivers/nvmem/Makefile
> @@ -17,6 +17,8 @@ obj-$(CONFIG_NVMEM_IMX_OCOTP_SCU)	+= nvmem-imx-ocotp-scu.o
>   nvmem-imx-ocotp-scu-y		:= imx-ocotp-scu.o
>   obj-$(CONFIG_JZ4780_EFUSE)		+= nvmem_jz4780_efuse.o
>   nvmem_jz4780_efuse-y		:= jz4780-efuse.o
> +obj-$(CONFIG_NVMEM_KHADAS_MCU_USER_MEM)	+= nvmem-khadas-mcu-user-mem.o
> +nvmem-khadas-mcu-user-mem-y	:= khadas-mcu-user-mem.o
>   obj-$(CONFIG_NVMEM_LPC18XX_EEPROM)	+= nvmem_lpc18xx_eeprom.o
>   nvmem_lpc18xx_eeprom-y	:= lpc18xx_eeprom.o
>   obj-$(CONFIG_NVMEM_LPC18XX_OTP)	+= nvmem_lpc18xx_otp.o
> diff --git a/drivers/nvmem/khadas-mcu-user-mem.c b/drivers/nvmem/khadas-mcu-user-mem.c
> new file mode 100644
> index 000000000000..a1d5ae9a030c
> --- /dev/null
> +++ b/drivers/nvmem/khadas-mcu-user-mem.c
> @@ -0,0 +1,128 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Driver for Khadas MCU User programmable Memory
> + *
> + * Copyright (C) 2020 BayLibre SAS
> + * Author(s): Neil Armstrong <narmstrong@baylibre.com>
> + */
> +
> +#include <linux/clk.h>

Why do we need this header?

> +#include <linux/module.h>
> +#include <linux/nvmem-provider.h>
> +#include <linux/mfd/khadas-mcu.h>
> +#include <linux/regmap.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +
> +static int khadas_mcu_user_mem_read(void *context, unsigned int offset,
> +			    void *val, size_t bytes)
> +{
> +	struct khadas_mcu *khadas_mcu = context;
> +
> +	return regmap_bulk_read(khadas_mcu->map,
> +				KHADAS_MCU_USER_DATA_0_REG + offset,
> +				val, bytes);
> +}
> +
> +static int khadas_mcu_user_mem_write(void *context, unsigned int offset,
> +			     void *val, size_t bytes)
> +{
> +	struct khadas_mcu *khadas_mcu = context;
> +
> +	return regmap_bulk_write(khadas_mcu->map,
> +				KHADAS_MCU_USER_DATA_0_REG + offset,
> +				val, bytes);
> +}
> +
> +static ssize_t password_store(struct device *dev, struct device_attribute *attr,
> +			     const char *buf, size_t count)
> +{
> +	struct khadas_mcu *khadas_mcu = dev_get_drvdata(dev);
> +	int i, ret;
> +
> +	if (count < 6)
> +		return -EINVAL;

Possibly this magic 6 value needs proper define. An additional check 
here for > 6 would be better as well.

> +
> +	ret = regmap_write(khadas_mcu->map, KHADAS_MCU_PASSWD_START_REG, 1);
> +	if (ret)
> +		return ret;
> +
> +	for (i = 0 ; i < 6 ; ++i) {
> +		ret = regmap_write(khadas_mcu->map,
> +				   KHADAS_MCU_CHECK_USER_PASSWD_REG,
> +				   buf[i]);
> +		if (ret)
> +			goto out;
> +	}
> +
> +	ret = regmap_write(khadas_mcu->map, KHADAS_MCU_PASSWD_START_REG, 0);
> +	if (ret)
> +		return ret;
> +
> +	return count;
> +out:
> +	regmap_write(khadas_mcu->map, KHADAS_MCU_PASSWD_START_REG, 0);
> +
> +	return ret;
> +}
> +
> +static DEVICE_ATTR_WO(password);
> +
> +static struct attribute *khadas_mcu_user_mem_sysfs_attributes[] = {
> +	&dev_attr_password.attr,
> +	NULL,
> +};
> +
> +static const struct attribute_group khadas_mcu_user_mem_sysfs_attr_group = {
> +	.attrs = khadas_mcu_user_mem_sysfs_attributes,
> +};
> +
> +static int khadas_mcu_user_mem_probe(struct platform_device *pdev)
> +{
> +	struct khadas_mcu *khadas_mcu = dev_get_drvdata(pdev->dev.parent);

You could probably get away with dependency of this structure and the 
header itself by directly getting hold of regmap from parent device.


> +	struct device *dev = &pdev->dev;
> +	struct nvmem_device *nvmem;
> +	struct nvmem_config *econfig;
> +
> +	econfig = devm_kzalloc(dev, sizeof(*econfig), GFP_KERNEL);
> +	if (!econfig)
> +		return -ENOMEM;
> +
> +	econfig->dev = pdev->dev.parent;
> +	econfig->name = dev_name(pdev->dev.parent);
> +	econfig->stride = 1;
> +	econfig->word_size = 1;
> +	econfig->reg_read = khadas_mcu_user_mem_read;
> +	econfig->reg_write = khadas_mcu_user_mem_write;
> +	econfig->size = 56;
define 56 to make it more readable!

> +	econfig->priv = khadas_mcu;
> +
> +	platform_set_drvdata(pdev, khadas_mcu);
> +
> +	nvmem = devm_nvmem_register(&pdev->dev, econfig);
> +	if (IS_ERR(nvmem))
> +		return PTR_ERR(nvmem);
> +
> +	return sysfs_create_group(&pdev->dev.kobj,
> +				  &khadas_mcu_user_mem_sysfs_attr_group);
> +}
> +
> +static const struct platform_device_id khadas_mcu_user_mem_id_table[] = {
> +	{ .name = "khadas-mcu-user-mem", },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(platform, khadas_mcu_user_mem_id_table);
> +
> +static struct platform_driver khadas_mcu_user_mem_driver = {
> +	.probe = khadas_mcu_user_mem_probe,
> +	.driver = {
> +		.name = "khadas-mcu-user-mem",
> +	},
> +	.id_table = khadas_mcu_user_mem_id_table,
> +};
> +
> +module_platform_driver(khadas_mcu_user_mem_driver);
> +
> +MODULE_AUTHOR("Neil Armstrong <narmstrong@baylibre.com>");
> +MODULE_DESCRIPTION("Khadas MCU User MEM driver");
> +MODULE_LICENSE("GPL v2");
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
