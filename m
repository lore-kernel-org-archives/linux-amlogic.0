Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72D30C433F5
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Jan 2022 21:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ge2uLpRHDHnNXBjtlkpT5LiEUzVqp+o9s/+oeRu5rFg=; b=4zBj1aZlaZcC0B
	Y0WRK95Y8RqRjdfX1o3OM0YoYu8Y7Zby5cvZ2m4DbuIPZuCENL1xSYewtjM1WXYE71coG4XI26x8U
	SRUIbNuwOjnUtK3jVRiRPRY/evYLGHKnKQ+Uojnq3GYJATGMso/BJZDJO8pqnGktw0vWyYYwCEMlL
	Ih8eV3v9hdZWfxhqrGCAyPatrmoKkpG7GxeE4S3899x3d6iZyktEFrpVDpHdX1GYa1VocF086gSN7
	7SkyojFvjCRc/NDJjn8tFJiZe8XvqJtEmwEXI3A+yO/rMv/2Sc+GAvG89ZZlyQuYNHst4rETMoKZ2
	lN98ACTuj9O8JC0u97Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n87fV-0078zr-LE; Thu, 13 Jan 2022 21:30:01 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n87fS-0078yh-JV; Thu, 13 Jan 2022 21:30:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 255E161444;
 Thu, 13 Jan 2022 21:29:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 768FFC36AE3;
 Thu, 13 Jan 2022 21:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642109397;
 bh=yW9AcQzuoUaR989bsxK4TgDY9aBm1cvbSwLkItbJe+Y=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=ZQThfKK7ttBmAVSKpY2YgYBHP94O7LeXCIJUdl8+pjbRPJ5abqlr9/PQ0a51XddUZ
 8LbcU3NMrR/Ywb8RRYOYLmOmKw2LexzZdyKzP+MTJ58lp+s7BSqHY7+ujWai4G68sz
 vo1epPK0h4ahadtDZ02MF5PsftcG2/N7C7U3/haig6JBbTsJClSXKHxlVbjHMN0cbc
 DFxt8ZH+FqVSbvnA2R9QQsM3xwuRJuJgt4INQ7G/7J5h8YV2nRjCHTXyNHH/LvgnIs
 4z1jzXa0SUpD1P7s4xOHuZ/RJ3rv4X0NNURdLQEVfwqP6hBg/llz6vLHQ1squwWF9R
 CC/IPehM0jiGA==
MIME-Version: 1.0
In-Reply-To: <20220113115745.45826-4-liang.yang@amlogic.com>
References: <20220113115745.45826-1-liang.yang@amlogic.com>
 <20220113115745.45826-4-liang.yang@amlogic.com>
Subject: Re: [PATCH v9 3/4] clk: meson: add DT documentation for emmc clock
 controller
From: Stephen Boyd <sboyd@kernel.org>
Cc: Liang Yang <liang.yang@amlogic.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jianxin Pan <jianxin.pan@amlogic.com>, Victor Wan <victor.wan@amlogic.com>,
 XianWei Zhao <xianwei.zhao@amlogic.com>,
 Kelvin Zhang <kelvin.zhang@amlogic.com>,
 BiChao Zheng <bichao.zheng@amlogic.com>, YongHui Yu <yonghui.yu@amlogic.com>,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Liang Yang <liang.yang@amlogic.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 linux-clk@vger.kernel.org
Date: Thu, 13 Jan 2022 13:29:56 -0800
User-Agent: alot/0.9.1
Message-Id: <20220113212957.768FFC36AE3@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220113_132958_699033_5EDCD0DD 
X-CRM114-Status: GOOD (  14.06  )
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

Quoting Liang Yang (2022-01-13 03:57:44)
> Document the MMC sub clock controller driver, the potential consumer
> of this driver is MMC or NAND. Also add four clock bindings IDs which
> provided by this driver.
> 
> Signed-off-by: Liang Yang <liang.yang@amlogic.com>
> ---
>  .../bindings/clock/amlogic,mmc-clkc.yaml      | 64 +++++++++++++++++++
>  include/dt-bindings/clock/amlogic,mmc-clkc.h  | 14 ++++
>  2 files changed, 78 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/amlogic,mmc-clkc.yaml
>  create mode 100644 include/dt-bindings/clock/amlogic,mmc-clkc.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/amlogic,mmc-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,mmc-clkc.yaml
> new file mode 100644
> index 000000000000..a274c3d5fc2e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/amlogic,mmc-clkc.yaml
> @@ -0,0 +1,64 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/amlogic,mmc-clkc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Amlogic MMC Sub Clock Controller Driver Device Tree Bindings
> +
> +maintainers:
> +  - jianxin.pan@amlogic.com
> +  - liang.yang@amlogic.com
> +
> +properties:
> +  compatible:
> +    enum:
> +      - "amlogic,axg-mmc-clkc", "syscon"

Why is it a syscon?

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
