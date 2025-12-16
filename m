Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFA60D5CC89
	for <linux-amlogic@archiver.kernel.org>; Tue, 16 Dec 2025 09:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S9dNRYMcHvf9KKsYtlGD4Kc/mVwgQwRsg2LfkDJt5Pw=; b=DtYh1OrWQoYXH5v7hfQxxEVxgK
	w/0RpfKjyYpuuwdqQvZzlKJKtDgm5tEowVzhecTn8qeoYRMMz2sCptvhtI+d/vAWv/XXByjdp760h
	fjWBKDTq0ukd4O9U45AUL4/zdwyi15tcDmJeWwgGqV26tWkh3AfwtuGcBATC1ZpS/0pVmj/BB8KJ/
	OKgdtQ6oKXlOC0rFo/mkbhwY4tprgaTR5fwa/bcb/gqv9Gof/RqT9nF7KC1lzigOBagkT/r3+v5dG
	nH23k6cFcuAh3KnAxc3xgjlvUERg79dOnQ9nZ1lkokhSzrAEuJlFyefl+3kMcnERcygDssgKQsmIR
	6GBLrx4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVR3s-00000004y2S-2Loo;
	Tue, 16 Dec 2025 09:09:40 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVR3p-00000004y1g-3dMu
	for linux-amlogic@lists.infradead.org;
	Tue, 16 Dec 2025 09:09:39 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-47a80d4a065so26982735e9.2
        for <linux-amlogic@lists.infradead.org>; Tue, 16 Dec 2025 01:09:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765876174; x=1766480974; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zsamOLoz9raNL+kbewepFzwwOTiUubRO+4H3BWVePlE=;
        b=RBShCTcv91rtUVtAmRQxTVdA83MS3Mi+nwOvsV6wNhKCqmL+MnFk16jKPacjcUmnDa
         /+9o7ffLr13eeyd9IQATrFSzzZMf5iT1yxLRreRWgQyOEqlncsNrbj4wblTG+/ud9mj/
         pf4h+j3HFhKaEfgmAOHKYeHXf40KroNXTULlViZli8HSPn702pamsTn9a21xTyes0qWa
         3bmpQd3qNEWGbMm232VwTUbFoaeI6KEWssrhQQqvcXpfXmqBQSgTv6wRSuQ6fljfZvVf
         bRppBKmckYCTy4zoNUjPTyd08rsgeGx1Oh0KMgpoJPRtukJE2OgwZoHSDFw5nbE3E4n+
         j9Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765876174; x=1766480974;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zsamOLoz9raNL+kbewepFzwwOTiUubRO+4H3BWVePlE=;
        b=WZRSmq6LnryBaRdrDw8/bgU5R+YZ6P/LZZDy7/MM2kF+42yUKVfLhs8ut1u3wAiigj
         bZo2R10D1JjdjpqHEBwhwAs+P3PhoVU5N5EZ8jborYH+wcsdVWPXiezWb4/G0gf+8QlH
         xSfizC+nw/88vUUhz7a10n1rmFInIaqXGbd7wQbjm1Ghk7KF8vj4LuJ2YPyHLyV25wo+
         O5Hbyj0Ar0p7yhqjEq3BL44b0aNzd2wsnQHIii/iwFVmAcjsoLFqvU8JNT8nFN7Dbt4H
         ylhDfdpWvsutUEH9SLte55YtCO3kpdjKApRW2s8567X3ZdgldO2J0PBMIB23OASAYgAs
         jjyg==
X-Gm-Message-State: AOJu0Yyc+6go7UaKIlEnE9xjAcy3HzWVwngvMApax0acTi7MMnoa1aAc
	JvUHj9EZ8KTlcQ+Z7vJQ5knbJLlhACnFxRwQVvBf1xRTsSrLFLhwPqo+eH/jmoF0q1I=
X-Gm-Gg: AY/fxX7mWTLMCVt6Hl5jVhdDcyCITdZXJujslp6jfzfLHEB0coFLWceF4Q/UtdvCb4b
	XmtNxVvSresNU3eUuYqgZFMpqc0XifcWfZt8rG0EXicYSdbqZXS0U/GRex196C9mlX4hAUaZdrE
	FHwCn31491oOCYvJPq4fusiYontz2FkPwHp0ZSBsU/b6nwfzE+cTy5XoQcfOTHuRedX549/Tr9+
	z7Sf1eXhLBpU/aOCGCRYr+NWBgaxggnWgHi1yRogNvguE3AsOmih7AUytQc9HybHX5dB8RiLtHz
	aUkW1a5wOxi3q5kr7JmuS4Vjx4bsW8sjOSRUYDKHOjBzRc4JULpLTBa7jFYvJoRSh9uJqY80j9P
	vCbVGYrzZnRNBpOM4omEVBR5MZDNE/P1jywcf+vBwrp1E3R2io+MtLSiE0mvr+kQDKLOj1uupRx
	S4pOdhvHZO129pPogknNZaOwdmeB8qgQP6BYlSQUwflnWMd3cuO5Mn3ijHv59v+Y0=
X-Google-Smtp-Source: AGHT+IGij3jOc2iF5lXDigGk+OWdM2vVojjTGmqELswdjvNjWmVLG1JSvnJlvLj6esf3AQVjca7z2Q==
X-Received: by 2002:a05:600c:474a:b0:46e:33b2:c8da with SMTP id 5b1f17b1804b1-47a8f9162b3mr141644225e9.32.1765876174104;
        Tue, 16 Dec 2025 01:09:34 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:2913:9c11:b7b9:c6d2? ([2a01:e0a:3d9:2080:2913:9c11:b7b9:c6d2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a8f8d9a06sm227698295e9.10.2025.12.16.01.09.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Dec 2025 01:09:33 -0800 (PST)
Message-ID: <c996b317-cda0-46d6-82d1-cd91569341a1@linaro.org>
Date: Tue, 16 Dec 2025 10:09:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 2/3] dma: amlogic: Add general DMA driver for SoCs
To: xianwei.zhao@amlogic.com, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-amlogic@lists.infradead.org, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <20251216-amlogic-dma-v1-0-e289e57e96a7@amlogic.com>
 <20251216-amlogic-dma-v1-2-e289e57e96a7@amlogic.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20251216-amlogic-dma-v1-2-e289e57e96a7@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_010938_101608_E5206060 
X-CRM114-Status: GOOD (  27.12  )
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

On 12/16/25 09:03, Xianwei Zhao via B4 Relay wrote:
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
> 
> Amlogic SoCs include a general-purpose DMA controller that can be used
> by multiple peripherals, such as I2C PIO and I3C. Each peripheral group
> is associated with a dedicated DMA channel in hardware.

PLease add which SoC is concerned, in commoit message and in Kconfig help.

> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>   drivers/dma/Kconfig       |   8 +
>   drivers/dma/Makefile      |   1 +
>   drivers/dma/amlogic-dma.c | 567 ++++++++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 576 insertions(+)
> 
> diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
> index 8bb0a119ecd4..fc7f70e22c22 100644
> --- a/drivers/dma/Kconfig
> +++ b/drivers/dma/Kconfig
> @@ -85,6 +85,14 @@ config AMCC_PPC440SPE_ADMA
>   	help
>   	  Enable support for the AMCC PPC440SPe RAID engines.
>   
> +config AMLOGIC_DMA
> +	tristate "Amlogic genneral DMA support"
> +	depends on ARCH_MESON
> +	select DMA_ENGINE
> +	select REGMAP_MMIO
> +	help
> +	  Enable support for the Amlogic general DMA engines.
> +
>   config APPLE_ADMAC
>   	tristate "Apple ADMAC support"
>   	depends on ARCH_APPLE || COMPILE_TEST
> diff --git a/drivers/dma/Makefile b/drivers/dma/Makefile
> index a54d7688392b..fc28dade5b69 100644
> --- a/drivers/dma/Makefile
> +++ b/drivers/dma/Makefile
> @@ -16,6 +16,7 @@ obj-$(CONFIG_DMATEST) += dmatest.o
>   obj-$(CONFIG_ALTERA_MSGDMA) += altera-msgdma.o
>   obj-$(CONFIG_AMBA_PL08X) += amba-pl08x.o
>   obj-$(CONFIG_AMCC_PPC440SPE_ADMA) += ppc4xx/
> +obj-$(CONFIG_AMLOGIC_DMA) += amlogic-dma.o
>   obj-$(CONFIG_APPLE_ADMAC) += apple-admac.o
>   obj-$(CONFIG_ARM_DMA350) += arm-dma350.o
>   obj-$(CONFIG_AT_HDMAC) += at_hdmac.o
> diff --git a/drivers/dma/amlogic-dma.c b/drivers/dma/amlogic-dma.c
> new file mode 100644
> index 000000000000..40099002d558
> --- /dev/null
> +++ b/drivers/dma/amlogic-dma.c
> @@ -0,0 +1,567 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
> +/*
> + * Copyright (C) 2025 Amlogic, Inc. All rights reserved
> + * Author: Xianwei Zhao <xianwei.zhao@amlogic.com>
> + */
> +
> +#include <linux/init.h>
> +#include <linux/bitfield.h>
> +#include <linux/types.h>
> +#include <linux/mm.h>
> +#include <linux/interrupt.h>
> +#include <linux/clk.h>
> +#include <linux/device.h>
> +#include <linux/platform_device.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/slab.h>
> +#include <linux/dmaengine.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_dma.h>
> +#include <linux/list.h>
> +#include <linux/regmap.h>
> +#include <asm/irq.h>
> +#include "dmaengine.h"
> +
> +#define RCH_REG_BASE		0x0
> +#define WCH_REG_BASE		0x2000
> +/*
> + * Each rch (read from memory) REG offset  Rch_offset 0x0 each channel total 0x40
> + * rch addr = DMA_base + Rch_offset+ chan_id * 0x40 + reg_offset
> + */
> +#define RCH_READY		0x0
> +#define RCH_STATUS		0x4
> +#define RCH_CFG			0x8
> +#define CFG_CLEAR		BIT(25)
> +#define CFG_PAUSE		BIT(26)
> +#define CFG_ENABLE		BIT(27)
> +#define CFG_DONE		BIT(28)
> +#define RCH_ADDR		0xc
> +#define RCH_LEN			0x10
> +#define RCH_RD_LEN		0x14
> +#define RCH_PRT			0x18
> +#define RCH_SYCN_STAT		0x1c
> +#define RCH_ADDR_LOW		0x20
> +#define RCH_ADDR_HIGH		0x24
> +/* if work on 64, it work with RCH_PRT */
> +#define RCH_PTR_HIGH		0x28
> +
> +/*
> + * Each wch (write to memory) REG offset  Wch_offset 0x2000 each channel total 0x40
> + * wch addr = DMA_base + Wch_offset+ chan_id * 0x40 + reg_offset
> + */
> +#define WCH_READY		0x0
> +#define WCH_TOTAL_LEN		0x4
> +#define WCH_CFG			0x8
> +#define WCH_ADDR		0xc
> +#define WCH_LEN			0x10
> +#define WCH_RD_LEN		0x14
> +#define WCH_PRT			0x18
> +#define WCH_CMD_CNT		0x1c
> +#define WCH_ADDR_LOW		0x20
> +#define WCH_ADDR_HIGH		0x24
> +/* if work on 64, it work with RCH_PRT */
> +#define WCH_PTR_HIGH		0x28
> +
> +/* DMA controller reg */
> +#define RCH_INT_MASK		0x1000
> +#define WCH_INT_MASK		0x1004
> +#define CLEAR_W_BATCH		0x1014
> +#define CLEAR_RCH		0x1024
> +#define CLEAR_WCH		0x1028
> +#define RCH_ACTIVE		0x1038
> +#define WCH_ACTIVE		0x103C
> +#define RCH_DONE		0x104C
> +#define WCH_DONE		0x1050
> +#define RCH_ERR			0x1060
> +#define RCH_LEN_ERR		0x1064
> +#define WCH_ERR			0x1068
> +#define DMA_BATCH_END		0x1078
> +#define WCH_EOC_DONE		0x1088
> +#define WDMA_RESP_ERR		0x1098
> +#define UPT_PKT_SYNC		0x10A8
> +#define RCHN_CFG		0x10AC
> +#define WCHN_CFG		0x10B0
> +#define MEM_PD_CFG		0x10B4
> +#define MEM_BUS_CFG		0x10B8
> +#define DMA_GMV_CFG		0x10BC
> +#define DMA_GMR_CFG		0x10C0
> +
> +#define DMA_MAX_LINK		8
> +#define MAX_CHAN_ID		32
> +#define SG_MAX_LEN		((1 << 27) - 1)
> +
> +struct aml_dma_sg_link {
> +#define LINK_LEN		GENMASK(26, 0)
> +#define LINK_IRQ		BIT(27)
> +#define LINK_EOC		BIT(28)
> +#define LINK_LOOP		BIT(29)
> +#define LINK_ERR		BIT(30)
> +#define LINK_OWNER		BIT(31)
> +	u32 ctl;
> +	u64 address;
> +	u32 revered;
> +} __packed;

PLease make sure __packed is needed

> +
> +struct aml_dma_chan {
> +	struct dma_chan			chan;
> +	struct dma_async_tx_descriptor	desc;
> +	struct aml_dma_dev		*aml_dma;
> +	struct aml_dma_sg_link		*sg_link;
> +	dma_addr_t			sg_link_phys;
> +	int				sg_link_cnt;
> +	int				data_len;
> +	enum dma_status			status;
> +	enum dma_transfer_direction	direction;
> +	int				chan_id;
> +	/* reg_base (direction + chan_id) */
> +	int				reg_offs;
> +};
> +
> +struct aml_dma_dev {
> +	struct dma_device		dma_device;
> +	void __iomem			*base;
> +	struct regmap			*regmap;
> +	struct clk			*clk;
> +	int				irq;
> +	struct platform_device		*pdev;
> +	struct aml_dma_chan		*aml_rch[MAX_CHAN_ID];
> +	struct aml_dma_chan		*aml_wch[MAX_CHAN_ID];
> +	unsigned int			chan_nr;
> +	unsigned int			chan_used;
> +	struct aml_dma_chan		aml_chans[]__counted_by(chan_ns);
> +};
> +
> +static struct aml_dma_chan *to_aml_dma_chan(struct dma_chan *chan)
> +{
> +	return container_of(chan, struct aml_dma_chan, chan);
> +}
> +
> +static dma_cookie_t aml_dma_tx_submit(struct dma_async_tx_descriptor *tx)
> +{
> +	return dma_cookie_assign(tx);
> +}
> +
> +static int aml_dma_alloc_chan_resources(struct dma_chan *chan)
> +{
> +	struct aml_dma_chan *aml_chan = to_aml_dma_chan(chan);
> +	struct aml_dma_dev *aml_dma = aml_chan->aml_dma;
> +
> +	aml_chan->sg_link = dma_alloc_coherent(aml_dma->dma_device.dev,
> +					       sizeof(struct aml_dma_sg_link) * DMA_MAX_LINK,
> +					       &aml_chan->sg_link_phys, GFP_KERNEL);
> +	if (!aml_chan->sg_link)
> +		return  -ENOMEM;
> +
> +	/* offset is the same RCH_CFG and WCH_CFG */
> +	regmap_update_bits(aml_dma->regmap, aml_chan->reg_offs + RCH_CFG, CFG_CLEAR, CFG_CLEAR);
> +	aml_chan->status = DMA_COMPLETE;
> +	dma_async_tx_descriptor_init(&aml_chan->desc, chan);
> +	aml_chan->desc.tx_submit = aml_dma_tx_submit;
> +	regmap_update_bits(aml_dma->regmap, aml_chan->reg_offs + RCH_CFG, CFG_CLEAR, 0);
> +
> +	return 0;
> +}
> +
> +static void aml_dma_free_chan_resources(struct dma_chan *chan)
> +{
> +	struct aml_dma_chan *aml_chan = to_aml_dma_chan(chan);
> +	struct aml_dma_dev *aml_dma = aml_chan->aml_dma;
> +
> +	aml_chan->status = DMA_COMPLETE;
> +	dma_free_coherent(aml_dma->dma_device.dev,
> +			  sizeof(struct aml_dma_sg_link) * DMA_MAX_LINK,
> +			  aml_chan->sg_link, aml_chan->sg_link_phys);
> +}
> +
> +/* DMA transfer state  update how many data reside it */
> +static enum dma_status aml_dma_tx_status(struct dma_chan *chan,
> +					 dma_cookie_t cookie,
> +					 struct dma_tx_state *txstate)
> +{
> +	struct aml_dma_chan *aml_chan = to_aml_dma_chan(chan);
> +	struct aml_dma_dev *aml_dma = aml_chan->aml_dma;
> +	u32 residue, done;
> +
> +	regmap_read(aml_dma->regmap, aml_chan->reg_offs + RCH_RD_LEN, &done);
> +	residue = aml_chan->data_len - done;
> +	dma_set_tx_state(txstate, chan->completed_cookie, chan->cookie,
> +			 residue);
> +
> +	return aml_chan->status;
> +}
> +
> +static struct dma_async_tx_descriptor *aml_dma_prep_slave_sg
> +		(struct dma_chan *chan, struct scatterlist *sgl,
> +		unsigned int sg_len, enum dma_transfer_direction direction,
> +		unsigned long flags, void *context)
> +{
> +	struct aml_dma_chan *aml_chan = to_aml_dma_chan(chan);
> +	struct aml_dma_dev *aml_dma = aml_chan->aml_dma;
> +	struct aml_dma_sg_link *sg_link;
> +	struct scatterlist *sg;
> +	int idx = 0;
> +	u32 reg, chan_id;
> +	u32 i;
> +
> +	if (aml_chan->direction != direction) {
> +		dev_err(aml_dma->dma_device.dev, "direction not support\n");
> +		return NULL;
> +	}
> +
> +	switch (aml_chan->status) {
> +	case DMA_IN_PROGRESS:
> +		/* support multiple prep before pending */
> +		idx = aml_chan->sg_link_cnt;
> +
> +		break;
> +	case DMA_COMPLETE:
> +		aml_chan->data_len = 0;
> +		chan_id = aml_chan->chan_id;
> +		reg = (direction == DMA_DEV_TO_MEM) ? WCH_INT_MASK : RCH_INT_MASK;
> +		regmap_update_bits(aml_dma->regmap, reg, BIT(chan_id), BIT(chan_id));
> +
> +		break;
> +	default:
> +		dev_err(aml_dma->dma_device.dev, "status error\n");
> +		return NULL;
> +	}
> +
> +	if (sg_len + idx > DMA_MAX_LINK) {
> +		dev_err(aml_dma->dma_device.dev,
> +			"maximum number of sg exceeded: %d > %d\n",
> +			sg_len, DMA_MAX_LINK);
> +		aml_chan->status = DMA_ERROR;
> +		return NULL;
> +	}
> +
> +	aml_chan->status = DMA_IN_PROGRESS;
> +
> +	for_each_sg(sgl, sg, sg_len, i) {
> +		if (sg_dma_len(sg) > SG_MAX_LEN) {
> +			dev_err(aml_dma->dma_device.dev,
> +				"maximum bytes exceeded: %d > %d\n",
> +				sg_dma_len(sg), SG_MAX_LEN);
> +			aml_chan->status = DMA_ERROR;
> +			return NULL;
> +		}
> +		sg_link = &aml_chan->sg_link[idx++];
> +		/* set dma address and len  to sglink*/
> +		sg_link->address = sg->dma_address;
> +		sg_link->ctl = FIELD_PREP(LINK_LEN, sg_dma_len(sg));
> +
> +		aml_chan->data_len += sg_dma_len(sg);
> +	}
> +	aml_chan->sg_link_cnt = idx;
> +
> +	return &aml_chan->desc;
> +}
> +
> +static int aml_dma_pause_chan(struct dma_chan *chan)
> +{
> +	struct aml_dma_chan *aml_chan = to_aml_dma_chan(chan);
> +	struct aml_dma_dev *aml_dma = aml_chan->aml_dma;
> +
> +	regmap_update_bits(aml_dma->regmap, aml_chan->reg_offs + RCH_CFG, CFG_PAUSE, CFG_PAUSE);
> +	aml_chan->status = DMA_PAUSED;
> +
> +	return 0;
> +}
> +
> +static int aml_dma_resume_chan(struct dma_chan *chan)
> +{
> +	struct aml_dma_chan *aml_chan = to_aml_dma_chan(chan);
> +	struct aml_dma_dev *aml_dma = aml_chan->aml_dma;
> +
> +	regmap_update_bits(aml_dma->regmap, aml_chan->reg_offs + RCH_CFG, CFG_PAUSE, 0);
> +	aml_chan->status = DMA_IN_PROGRESS;
> +
> +	return 0;
> +}
> +
> +static int aml_dma_terminate_all(struct dma_chan *chan)
> +{
> +	struct aml_dma_chan *aml_chan = to_aml_dma_chan(chan);
> +	struct aml_dma_dev *aml_dma = aml_chan->aml_dma;
> +	int chan_id = aml_chan->chan_id;
> +
> +	aml_dma_pause_chan(chan);
> +	regmap_update_bits(aml_dma->regmap, aml_chan->reg_offs + RCH_CFG, CFG_CLEAR, CFG_CLEAR);
> +
> +	if (aml_chan->direction == DMA_MEM_TO_DEV)
> +		regmap_update_bits(aml_dma->regmap, RCH_INT_MASK, BIT(chan_id), BIT(chan_id));
> +	else if (aml_chan->direction == DMA_DEV_TO_MEM)
> +		regmap_update_bits(aml_dma->regmap, WCH_INT_MASK, BIT(chan_id), BIT(chan_id));
> +
> +	aml_chan->status = DMA_COMPLETE;
> +
> +	return 0;
> +}
> +
> +static void aml_dma_enable_chan(struct dma_chan *chan)
> +{
> +	struct aml_dma_chan *aml_chan = to_aml_dma_chan(chan);
> +	struct aml_dma_dev *aml_dma = aml_chan->aml_dma;
> +	struct aml_dma_sg_link *sg_link;
> +	int chan_id = aml_chan->chan_id;
> +	int idx = aml_chan->sg_link_cnt - 1;
> +
> +	/* the last sg set eoc flag */
> +	sg_link = &aml_chan->sg_link[idx];
> +	sg_link->ctl |= LINK_EOC;
> +	dma_wmb();
> +	if (aml_chan->direction == DMA_MEM_TO_DEV) {
> +		regmap_write(aml_dma->regmap, aml_chan->reg_offs + RCH_ADDR,
> +			     aml_chan->sg_link_phys);
> +		regmap_write(aml_dma->regmap, aml_chan->reg_offs + RCH_LEN, aml_chan->data_len);
> +		regmap_update_bits(aml_dma->regmap, RCH_INT_MASK, BIT(chan_id), 0);
> +		/* for rch (tx) need set cfg 0 to trigger start */
> +		regmap_write(aml_dma->regmap, aml_chan->reg_offs + RCH_CFG, 0);
> +	} else if (aml_chan->direction == DMA_DEV_TO_MEM) {
> +		regmap_write(aml_dma->regmap, aml_chan->reg_offs + WCH_ADDR,
> +			     aml_chan->sg_link_phys);
> +		regmap_write(aml_dma->regmap, aml_chan->reg_offs + WCH_LEN, aml_chan->data_len);
> +		regmap_update_bits(aml_dma->regmap, WCH_INT_MASK, BIT(chan_id), 0);
> +	}
> +}
> +
> +static irqreturn_t aml_dma_interrupt_handler(int irq, void *dev_id)
> +{
> +	struct aml_dma_dev *aml_dma = dev_id;
> +	struct aml_dma_chan *aml_chan;
> +	u32 done, eoc_done, err, err_l, end;
> +	int i = 0;
> +
> +	/* deal with rch normal complete and error */
> +	regmap_read(aml_dma->regmap, RCH_DONE, &done);
> +	regmap_read(aml_dma->regmap, RCH_ERR, &err);
> +	regmap_read(aml_dma->regmap, RCH_LEN_ERR, &err_l);
> +	err = err | err_l;
> +
> +	done = done | err;
> +
> +	i = 0;
> +	while (done) {
> +		if (done & 1) {

Use BIT(0)

> +			aml_chan = aml_dma->aml_rch[i];
> +			regmap_write(aml_dma->regmap, CLEAR_RCH, BIT(aml_chan->chan_id));
> +			if (!aml_chan) {
> +				dev_err(aml_dma->dma_device.dev, "idx %d rch not initialized\n", i);
> +				continue;
> +			}
> +			aml_chan->status = (err & (1 << i)) ? DMA_ERROR : DMA_COMPLETE;
> +			/* Make sure to use this for initialization */
> +			if (aml_chan->desc.cookie >= DMA_MIN_COOKIE)
> +				dma_cookie_complete(&aml_chan->desc);
> +			dmaengine_desc_get_callback_invoke(&aml_chan->desc, NULL);
> +		}
> +		i++;
> +		done = done >> 1;
> +	}

I would rather iterate on bits or loop with ffs():

for (i = ffs(done); i; i = ffs(done)) {
	aml_chan = aml_dma->aml_rch[i - 1];
	...
}

> +
> +	/* deal with wch normal complete and error */
> +	regmap_read(aml_dma->regmap, DMA_BATCH_END, &end);
> +	if (end)
> +		regmap_write(aml_dma->regmap, CLEAR_W_BATCH, end);
> +
> +	regmap_read(aml_dma->regmap, WCH_DONE, &done);
> +	regmap_read(aml_dma->regmap, WCH_EOC_DONE, &eoc_done);
> +	done = done | eoc_done;
> +
> +	regmap_read(aml_dma->regmap, WCH_ERR, &err);
> +	regmap_read(aml_dma->regmap, WDMA_RESP_ERR, &err_l);
> +	err = err | err_l;
> +
> +	done = done | err;
> +	i = 0;
> +	while (done) {
> +		if (done & 1) {
> +			aml_chan = aml_dma->aml_wch[i];
> +			regmap_write(aml_dma->regmap, CLEAR_WCH, BIT(aml_chan->chan_id));
> +			if (!aml_chan) {
> +				dev_err(aml_dma->dma_device.dev, "idx %d wch not initialized\n", i);
> +				continue;
> +			}
> +			aml_chan->status = (err & (1 << i)) ? DMA_ERROR : DMA_COMPLETE;
> +			if (aml_chan->desc.cookie >= DMA_MIN_COOKIE)
> +				dma_cookie_complete(&aml_chan->desc);
> +			dmaengine_desc_get_callback_invoke(&aml_chan->desc, NULL);
> +		}
> +		i++;
> +		done = done >> 1;
> +	}
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static struct dma_chan *aml_of_dma_xlate(struct of_phandle_args *dma_spec, struct of_dma *ofdma)
> +{
> +	struct aml_dma_dev *aml_dma = (struct aml_dma_dev *)ofdma->of_dma_data;
> +	struct aml_dma_chan *aml_chan = NULL;
> +	u32 type;
> +	u32 phy_chan_id;
> +
> +	if (dma_spec->args_count != 2)
> +		return NULL;
> +
> +	type = dma_spec->args[0];
> +	phy_chan_id = dma_spec->args[1];
> +
> +	if (phy_chan_id >= MAX_CHAN_ID)
> +		return NULL;
> +
> +	if (type == 0) {

Add or use a define for type

> +		aml_chan = aml_dma->aml_rch[phy_chan_id];
> +		if (!aml_chan) {
> +			if (aml_dma->chan_used >= aml_dma->chan_nr) {
> +				dev_err(aml_dma->dma_device.dev, "some dma clients err used\n");
> +				return NULL;
> +			}
> +			aml_chan = &aml_dma->aml_chans[aml_dma->chan_used];
> +			aml_dma->chan_used++;
> +			aml_chan->direction = DMA_MEM_TO_DEV;
> +			aml_chan->chan_id = phy_chan_id;
> +			aml_chan->reg_offs = RCH_REG_BASE + 0x40 * aml_chan->chan_id;
> +			aml_dma->aml_rch[phy_chan_id] = aml_chan;
> +		}
> +	} else if (type == 1) {
> +		aml_chan = aml_dma->aml_wch[phy_chan_id];
> +		if (!aml_chan) {
> +			if (aml_dma->chan_used >= aml_dma->chan_nr) {
> +				dev_err(aml_dma->dma_device.dev, "some dma clients err used\n");
> +				return NULL;
> +			}
> +			aml_chan = &aml_dma->aml_chans[aml_dma->chan_used];
> +			aml_dma->chan_used++;
> +			aml_chan->direction = DMA_DEV_TO_MEM;
> +			aml_chan->chan_id = phy_chan_id;
> +			aml_chan->reg_offs = WCH_REG_BASE + 0x40 * aml_chan->chan_id;
> +			aml_dma->aml_wch[phy_chan_id] = aml_chan;
> +		}
> +	} else {
> +		dev_err(aml_dma->dma_device.dev, "type %d not supported\n", type);
> +		return NULL;
> +	}
> +
> +	return dma_get_slave_channel(&aml_chan->chan);
> +}
> +
> +static int aml_dma_probe(struct platform_device *pdev)
> +{
> +	struct device_node *np = pdev->dev.of_node;
> +	struct dma_device *dma_dev;
> +	struct aml_dma_dev *aml_dma;
> +	int ret, i, len;
> +	u32 chan_nr;
> +
> +	const struct regmap_config aml_regmap_config = {
> +		.reg_bits = 32,
> +		.val_bits = 32,
> +		.reg_stride = 4,
> +		.max_register = 0x3000,
> +	};

Please move out of function

> +
> +	ret = of_property_read_u32(np, "dma-channels", &chan_nr);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "failed to read dma-channels\n");
> +
> +	len = sizeof(*aml_dma) + sizeof(struct aml_dma_chan) * chan_nr;
> +	aml_dma = devm_kzalloc(&pdev->dev, len, GFP_KERNEL);
> +	if (!aml_dma)
> +		return -ENOMEM;
> +
> +	aml_dma->chan_nr = chan_nr;
> +
> +	aml_dma->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(aml_dma->base))
> +		return PTR_ERR(aml_dma->base);
> +
> +	aml_dma->regmap = devm_regmap_init_mmio(&pdev->dev, aml_dma->base,
> +						&aml_regmap_config);
> +	if (IS_ERR_OR_NULL(aml_dma->regmap))
> +		return PTR_ERR(aml_dma->regmap);
> +
> +	aml_dma->clk = devm_clk_get_enabled(&pdev->dev, NULL);
> +	if (IS_ERR(aml_dma->clk))
> +		return PTR_ERR(aml_dma->clk);
> +
> +	aml_dma->irq = platform_get_irq(pdev, 0);
> +
> +	aml_dma->pdev = pdev;
> +	aml_dma->dma_device.dev = &pdev->dev;
> +
> +	dma_dev = &aml_dma->dma_device;
> +	INIT_LIST_HEAD(&dma_dev->channels);
> +
> +	/* Initialize channel parameters */
> +	for (i = 0; i < chan_nr; i++) {
> +		struct aml_dma_chan *aml_chan = &aml_dma->aml_chans[i];
> +
> +		aml_chan->aml_dma = aml_dma;
> +		aml_chan->chan.device = &aml_dma->dma_device;
> +		dma_cookie_init(&aml_chan->chan);
> +
> +		/* Add the channel to aml_chan list */
> +		list_add_tail(&aml_chan->chan.device_node,
> +			      &aml_dma->dma_device.channels);
> +	}
> +	aml_dma->chan_used = 0;
> +
> +	dma_set_max_seg_size(dma_dev->dev, SG_MAX_LEN);
> +
> +	dma_cap_set(DMA_SLAVE, dma_dev->cap_mask);
> +	dma_dev->device_alloc_chan_resources = aml_dma_alloc_chan_resources;
> +	dma_dev->device_free_chan_resources = aml_dma_free_chan_resources;
> +	dma_dev->device_tx_status = aml_dma_tx_status;
> +	dma_dev->device_prep_slave_sg = aml_dma_prep_slave_sg;
> +
> +	dma_dev->device_pause = aml_dma_pause_chan;
> +	dma_dev->device_resume = aml_dma_resume_chan;
> +	dma_dev->device_terminate_all = aml_dma_terminate_all;
> +	dma_dev->device_issue_pending = aml_dma_enable_chan;
> +	/* PIO 4 bytes and I2C 1 byte */
> +	dma_dev->dst_addr_widths = BIT(DMA_SLAVE_BUSWIDTH_4_BYTES | DMA_SLAVE_BUSWIDTH_1_BYTE);
> +	dma_dev->directions = BIT(DMA_DEV_TO_MEM) | BIT(DMA_MEM_TO_DEV);
> +	dma_dev->residue_granularity = DMA_RESIDUE_GRANULARITY_BURST;
> +
> +	ret = dmaenginem_async_device_register(dma_dev);
> +	if (ret)
> +		return ret;
> +
> +	ret = of_dma_controller_register(np, aml_of_dma_xlate, aml_dma);
> +	if (ret)
> +		return ret;
> +
> +	regmap_write(aml_dma->regmap, RCH_INT_MASK, 0xffffffff);
> +	regmap_write(aml_dma->regmap, WCH_INT_MASK, 0xffffffff);
> +
> +	ret = devm_request_irq(&pdev->dev, aml_dma->irq, aml_dma_interrupt_handler,
> +			       IRQF_SHARED, dev_name(&pdev->dev), aml_dma);
> +	if (ret)
> +		return ret;
> +
> +	dev_info(aml_dma->dma_device.dev, "initialized\n");
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id aml_dma_ids[] = {
> +	{ .compatible = "amlogic,general-dma", },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, aml_dma_ids);
> +
> +static struct platform_driver aml_dma_driver = {
> +	.probe = aml_dma_probe,
> +	.driver		= {
> +		.name	= "aml-dma",
> +		.of_match_table = aml_dma_ids,
> +	},
> +};
> +
> +module_platform_driver(aml_dma_driver);
> +
> +MODULE_DESCRIPTION("GENERAL DMA driver for Amlogic");
> +MODULE_AUTHOR("Xianwei Zhao <xianwei.zhao@amlogic.com>");
> +MODULE_ALIAS("platform:aml-dma");

Unneeded, please drop

> +MODULE_LICENSE("GPL");
> 

Neil


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
