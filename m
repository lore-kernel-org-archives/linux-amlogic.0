Return-Path: <SRS0=lgrq=RV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FAF0C43381
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Mar 2019 11:28:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C20220857
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Mar 2019 11:28:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eo78kBoD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="YJ5PWeCV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C20220857
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5qnB3ILIKnJ9DBVnjkF9y9ptzfuv8d7rwJpKo/1+rVI=; b=eo78kBoDurhMsE
	hYhxqLqhDeSTadbRUIPU1E5Tc6JCXd98v0V3WEvecR+nG6eN7Hgy3DiniZDhYUwg2BBi5f8A8wlDP
	qmMV9WKfjCqUKth6A87dhBMTzo8WPff85vprXbh/gPsFCbaEpA7OdZkM6DgUODqCoAsyzLmbfA+w+
	tuFEm1icgCO/AMiPSnWTSe3aBhxKps9HvDPmP6eMpO1GpjVXBRXgI70AkaNq9ANp3YffnL+n/Jb1I
	g5xzlxxm+KkFUAo+j9O9+yugRFtWMKkYYx8lNNOAXjKz3E6+a4jSOgt5/ZTrBakqSQ4orJOSb3yZR
	NDPgtXXHhggVcfG33GlA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h5qRO-0003I1-EB; Mon, 18 Mar 2019 11:28:26 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h5qRE-00038i-TL
 for linux-amlogic@lists.infradead.org; Mon, 18 Mar 2019 11:28:18 +0000
Received: by mail-wm1-x344.google.com with SMTP id o10so14113859wmc.1
 for <linux-amlogic@lists.infradead.org>; Mon, 18 Mar 2019 04:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=RQ9y5Jqz909d8Ikr0N9/13a8UY0QG9OskTpglqP679o=;
 b=YJ5PWeCVsA1+h/a4fQkHpSgFfbdzGzJfVrHJdyHo4CcTeaP4x6PeoX8a5wL0MgDfxq
 J3ZsRVevY5llF5ESLfENKVS4vi+QD0fqPt9LRPhB2NisJaID1kR8bso1FxiDvvkdtMgd
 FqVVsD+XiVAlb397z8UsABz0B1mkodZVJjRr5xjNjbFy+ixCJe1iTvciA70YQEO9jSoN
 cIaGbSgZo+6ag4Im/8V5iqy6GNPSwZrcRqSlQ4xDd+KPtz3hdacHx9nOQ1Sn83u4dR3G
 RU9BRRsINKEZGPFeja8E+LioA9ZbjQTLK2+ycFbanhl6FpoG0onrXYzhhUT56wfAMznq
 XpIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=RQ9y5Jqz909d8Ikr0N9/13a8UY0QG9OskTpglqP679o=;
 b=aAPwoi6ILQMlzevSfRZDP9mphompIsBCY6RtQLdMNf0AjpgxNfyVkBshPvQDVtwgjD
 7v3jsHUirt5CwwZ1g95OD/J89OjrHBl93HDQ5ypiO2ztalGRo0OdXSwdcdAHV2ZQLN+z
 +B20/mVlb/dwa7+uMdP7FILzMljVu+XfDsCWwaud4d59mx4CVT/ul3qNRbig7GpkMlXU
 AQl0kigFse5JayjCuRlpCmN399wpi4sLnO4hTz08AidHhUHS4cESFIb1bj446AtYSuvi
 n6yvfO8nriEBoacDX1Wm8OmYzlYFMc/wuJwCUhQ/VOY3hfcBDmwctcaW4/vHbi6akbnO
 PcMw==
X-Gm-Message-State: APjAAAU785ZzFV6VBOOMC58aWnn8YXLljzbL0vFsP6FDlQmwDPCRojSh
 odQaQipWYQf03VZs2UfszA7QKg==
X-Google-Smtp-Source: APXvYqy8YlouaefIfGADVTUDOx3ZvYqRxt1LuCyA67aGgkUsSEAUoSoAY06EEbjfBHbC6s8Zy7a59Q==
X-Received: by 2002:a05:600c:21d9:: with SMTP id
 x25mr11168050wmj.136.1552908494215; 
 Mon, 18 Mar 2019 04:28:14 -0700 (PDT)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id z14sm8415454wrr.23.2019.03.18.04.28.12
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 18 Mar 2019 04:28:13 -0700 (PDT)
Subject: Re: [PATCH v3 5/8] phy: amlogic: add Amlogic G12A USB2 PHY Driver
To: Kishon Vijay Abraham I <kishon@ti.com>, gregkh@linuxfoundation.org,
 hminas@synopsys.com, balbi@kernel.org
References: <20190318101153.7531-1-narmstrong@baylibre.com>
 <20190318101153.7531-6-narmstrong@baylibre.com>
 <a0001535-350a-6f3b-a8f4-3b853e4bc990@ti.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <6ded8a0c-81a0-a01e-0f05-748c6164fb80@baylibre.com>
Date: Mon, 18 Mar 2019 12:28:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <a0001535-350a-6f3b-a8f4-3b853e4bc990@ti.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190318_042816_946636_664AFE75 
X-CRM114-Status: GOOD (  20.51  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 18/03/2019 11:18, Kishon Vijay Abraham I wrote:
> Hi,
> 
> On 18/03/19 3:41 PM, Neil Armstrong wrote:
>> This adds support for the USB2 PHY found in the Amlogic G12A SoC Family.
>>
>> It supports Host and/or Peripheral mode, depending on it's position.
>> The first PHY is only used as Host, but the second supports Dual modes
>> defined by the USB Control Glue HW in front of the USB Controllers.
>>
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>> ---
>>  drivers/phy/amlogic/Kconfig               |  11 ++
>>  drivers/phy/amlogic/Makefile              |   1 +
>>  drivers/phy/amlogic/phy-meson-g12a-usb2.c | 189 ++++++++++++++++++++++
>>  3 files changed, 201 insertions(+)
>>  create mode 100644 drivers/phy/amlogic/phy-meson-g12a-usb2.c
>>
>> diff --git a/drivers/phy/amlogic/Kconfig b/drivers/phy/amlogic/Kconfig
>> index 23fe1cda2f70..560ff0f1ed4c 100644
>> --- a/drivers/phy/amlogic/Kconfig
>> +++ b/drivers/phy/amlogic/Kconfig
>> @@ -36,3 +36,14 @@ config PHY_MESON_GXL_USB3
>>  	  Enable this to support the Meson USB3 PHY and OTG detection
>>  	  IP block found in Meson GXL and GXM SoCs.
>>  	  If unsure, say N.
>> +
>> +config PHY_MESON_G12A_USB2
>> +	tristate "Meson G12A USB2 PHY driver"
>> +	default ARCH_MESON
>> +	depends on OF && (ARCH_MESON || COMPILE_TEST)
>> +	select GENERIC_PHY
>> +	select REGMAP_MMIO
>> +	help
>> +	  Enable this to support the Meson USB2 PHYs found in Meson
>> +	  G12A SoCs.
>> +	  If unsure, say N.
>> diff --git a/drivers/phy/amlogic/Makefile b/drivers/phy/amlogic/Makefile
>> index 4fd8848c194d..7d4d10f5a6b3 100644
>> --- a/drivers/phy/amlogic/Makefile
>> +++ b/drivers/phy/amlogic/Makefile
>> @@ -1,3 +1,4 @@
>>  obj-$(CONFIG_PHY_MESON8B_USB2)		+= phy-meson8b-usb2.o
>>  obj-$(CONFIG_PHY_MESON_GXL_USB2)	+= phy-meson-gxl-usb2.o
>> +obj-$(CONFIG_PHY_MESON_G12A_USB2)	+= phy-meson-g12a-usb2.o
>>  obj-$(CONFIG_PHY_MESON_GXL_USB3)	+= phy-meson-gxl-usb3.o
>> diff --git a/drivers/phy/amlogic/phy-meson-g12a-usb2.c b/drivers/phy/amlogic/phy-meson-g12a-usb2.c
>> new file mode 100644
>> index 000000000000..9f35259f237f
>> --- /dev/null
>> +++ b/drivers/phy/amlogic/phy-meson-g12a-usb2.c
>> @@ -0,0 +1,189 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Meson G12A USB2 PHY driver
>> + *
>> + * Copyright (C) 2017 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>> + * Copyright (C) 2017 Amlogic, Inc. All rights reserved
>> + * Copyright (C) 2019 BayLibre, SAS
>> + * Author: Neil Armstrong <narmstrong@baylibre.com>
>> + */
>> +
>> +#include <linux/clk.h>
>> +#include <linux/delay.h>
>> +#include <linux/io.h>
>> +#include <linux/module.h>
>> +#include <linux/of_device.h>
>> +#include <linux/regmap.h>
>> +#include <linux/reset.h>
>> +#include <linux/phy/phy.h>
>> +#include <linux/platform_device.h>
>> +
>> +#define PHY_CTRL_R0						0x0
>> +#define PHY_CTRL_R1						0x4
>> +#define PHY_CTRL_R2						0x8
>> +#define PHY_CTRL_R3						0xc
>> +#define PHY_CTRL_R4						0x10
>> +#define PHY_CTRL_R5						0x14
>> +#define PHY_CTRL_R6						0x18
>> +#define PHY_CTRL_R7						0x1c
>> +#define PHY_CTRL_R8						0x20
>> +#define PHY_CTRL_R9						0x24
>> +#define PHY_CTRL_R10						0x28
>> +#define PHY_CTRL_R11						0x2c
>> +#define PHY_CTRL_R12						0x30
>> +#define PHY_CTRL_R13						0x34
>> +#define PHY_CTRL_R14						0x38
>> +#define PHY_CTRL_R15						0x3c
>> +#define PHY_CTRL_R16						0x40
>> +#define PHY_CTRL_R17						0x44
>> +#define PHY_CTRL_R18						0x48
>> +#define PHY_CTRL_R19						0x4c
>> +#define PHY_CTRL_R20						0x50
>> +#define PHY_CTRL_R21						0x54
>> +#define PHY_CTRL_R22						0x58
>> +#define PHY_CTRL_R23						0x5c
>> +
>> +#define RESET_COMPLETE_TIME					1000
>> +#define PLL_RESET_COMPLETE_TIME					100
>> +
>> +struct phy_meson_g12a_usb2_priv {
>> +	struct device		*dev;
>> +	struct regmap		*regmap;
>> +	struct clk		*clk;
>> +	struct reset_control	*reset;
>> +};
>> +
>> +static const struct regmap_config phy_meson_g12a_usb2_regmap_conf = {
>> +	.reg_bits = 8,
>> +	.val_bits = 32,
>> +	.reg_stride = 4,
>> +	.max_register = PHY_CTRL_R23,
>> +};
>> +
>> +static int phy_meson_g12a_usb2_init(struct phy *phy)
>> +{
>> +	struct phy_meson_g12a_usb2_priv *priv = phy_get_drvdata(phy);
>> +	int ret;
>> +
>> +	ret = reset_control_reset(priv->reset);
>> +	if (ret)
>> +		return ret;
>> +
>> +	udelay(RESET_COMPLETE_TIME);
>> +
>> +	/* usb2_otg_aca_en == 0 */
>> +	regmap_update_bits(priv->regmap, PHY_CTRL_R21, BIT(2), 0);
>> +
>> +	/* PLL Setup : 24MHz * 20 / 1 = 480MHz */
>> +	regmap_write(priv->regmap, PHY_CTRL_R16, 0x39400414);
>> +	regmap_write(priv->regmap, PHY_CTRL_R17, 0x927e0000);
>> +	regmap_write(priv->regmap, PHY_CTRL_R18, 0xac5f49e5);
> 
> Please add macros for each of the individual bit-fields.

Will resent with this added.

Neil

>> +
>> +	udelay(PLL_RESET_COMPLETE_TIME);
>> +
>> +	/* UnReset PLL */
>> +	regmap_write(priv->regmap, PHY_CTRL_R16, 0x19400414);
> 
> Here too..
> 
> Thanks
> Kishon
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
