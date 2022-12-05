Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A721BC4321E
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Dec 2022 08:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wUXU5L6Em2mPTDmXN4oMRSFtmSmkUdTT7BS+5ZvaL3E=; b=4R68a6YP5riqL4
	iVlE4FgLyd+gqPLkg86VWbXETdrx0xmHQuA1rqfbSZmuhX17Mu+lxFlKsTlKyHMvDpnAL/xnop4I2
	zXWVEvSR3I1aeCipeDeKtHA9YFzRyg65qxcTfGJR8/itfX44q1ueurztKteNMO8VZlRNkAL6bK88Q
	DIGgGn+fpqHeR2BXC9lAQ1mNLOsPswiUwMvHUtXStk9Bn4tTHxGDoLj528KN8afz/mWpi7dJqmmgZ
	dniS12EVjsnzrgbj/k/9lBmryiP82iVOvTdBqGoI2O5vGIaW28GORSUSh+OhZOjSrxrag0MjiLXig
	DZCW4qL1pdsDMjWzdbxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p26WF-00FyLD-Go; Mon, 05 Dec 2022 08:08:07 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p26WA-00FyHH-Fo; Mon, 05 Dec 2022 08:08:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 251C0B80D6B;
	Mon,  5 Dec 2022 08:08:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED95BC433C1;
	Mon,  5 Dec 2022 08:07:53 +0000 (UTC)
Message-ID: <ed6a2a1c-e14c-ef9f-b20b-8e662e2c78c8@xs4all.nl>
Date: Mon, 5 Dec 2022 09:07:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 3/9] media: dt-bindings: cec: convert common CEC
 properties to DT schema
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Joe Tessler
 <jrt@google.com>, Yannick Fertre <yannick.fertre@foss.st.com>,
 Jeff Chase <jnchase@google.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20221204182908.138910-1-krzysztof.kozlowski@linaro.org>
 <20221204182908.138910-3-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20221204182908.138910-3-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_000802_884567_829AF490 
X-CRM114-Status: GOOD (  22.75  )
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

On 04/12/2022 19:29, Krzysztof Kozlowski wrote:
> Convert common HDMI CEC adapter bindings to DT schema.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Thanks!

	Hans

> ---
>  .../devicetree/bindings/media/cec.txt         |  8 ------
>  .../bindings/media/cec/cec-common.yaml        | 28 +++++++++++++++++++
>  MAINTAINERS                                   |  2 +-
>  3 files changed, 29 insertions(+), 9 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/cec.txt
>  create mode 100644 Documentation/devicetree/bindings/media/cec/cec-common.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/cec.txt b/Documentation/devicetree/bindings/media/cec.txt
> deleted file mode 100644
> index 22d7aae3d3d7..000000000000
> --- a/Documentation/devicetree/bindings/media/cec.txt
> +++ /dev/null
> @@ -1,8 +0,0 @@
> -Common bindings for HDMI CEC adapters
> -
> -- hdmi-phandle: phandle to the HDMI controller.
> -
> -- needs-hpd: if present the CEC support is only available when the HPD
> -  is high. Some boards only let the CEC pin through if the HPD is high,
> -  for example if there is a level converter that uses the HPD to power
> -  up or down.
> diff --git a/Documentation/devicetree/bindings/media/cec/cec-common.yaml b/Documentation/devicetree/bindings/media/cec/cec-common.yaml
> new file mode 100644
> index 000000000000..af6ee5f1c73f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/cec/cec-common.yaml
> @@ -0,0 +1,28 @@
> +# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/cec/cec-common.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: HDMI CEC Adapters Common Properties
> +
> +maintainers:
> +  - Hans Verkuil <hverkuil@xs4all.nl>
> +
> +properties:
> +  $nodename:
> +    pattern: "^cec(@[0-9a-f]+|-[0-9]+)?$"
> +
> +  hdmi-phandle:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle to the HDMI controller.
> +
> +  needs-hpd:
> +    type: boolean
> +    description:
> +      The CEC support is only available when the HPD is high. Some boards only
> +      let the CEC pin through if the HPD is high, for example if there is a
> +      level converter that uses the HPD to power up or down.
> +
> +additionalProperties: true
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 07cb85cac4c3..45402e03cda5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4832,7 +4832,7 @@ S:	Supported
>  W:	http://linuxtv.org
>  T:	git git://linuxtv.org/media_tree.git
>  F:	Documentation/ABI/testing/debugfs-cec-error-inj
> -F:	Documentation/devicetree/bindings/media/cec.txt
> +F:	Documentation/devicetree/bindings/media/cec/cec-common.yaml
>  F:	Documentation/driver-api/media/cec-core.rst
>  F:	Documentation/userspace-api/media/cec
>  F:	drivers/media/cec/


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
