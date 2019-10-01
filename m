Return-Path: <SRS0=zbOs=X2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C54C6C352AA
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Oct 2019 22:09:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9007121906
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Oct 2019 22:09:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Xd7uunHk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9007121906
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Subject:To:From:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Myl0Qo8Gau/BxU+L1h+URlHUDUruj9v24suJqaDz6Qg=; b=Xd7uunHk5Md2kX
	+FV50B3wQrwIQEJWZSmvnx5nd+DIOTwTb7kodMEPmhnmU7XqgRFuM+8TH9kKcJMxf58/c1Lwo/mjm
	NbpjTeP5868PY2EELqM2B/7Dy5w+pb993mPQ1hGNn4gQ4Vhb3veR491jgmD6EaYj8R+0/QGoftxSH
	JmXCnqrPXNRGy4jd0NfI3EKj7Rl6mcID1gQTJ9fH+KVRWMvUkc6YkmEEKRlKqgdAsXuO/cq+2q291
	ppXHZbvda6ADQiUCUZ4jHlfVMQJlrWxJDsH/rqXdqZrSFZEw8pwvBhy/+0oBydtmOMgfJlC0RvBKE
	kwt2krekRoC1QPwuDFTA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iFQKb-00006y-5Q; Tue, 01 Oct 2019 22:09:17 +0000
Received: from mail-io1-f67.google.com ([209.85.166.67])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iFQKX-00005I-NS; Tue, 01 Oct 2019 22:09:15 +0000
Received: by mail-io1-f67.google.com with SMTP id a1so52199674ioc.6;
 Tue, 01 Oct 2019 15:09:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:from:to:cc:subject:references
 :mime-version:content-disposition:in-reply-to;
 bh=nlWjCK4JfoFwVHPd1CXSJz1uB7s9TlzfcEVekMEDvj4=;
 b=dk97J1KBFTOnpnfSjUz1jVSpp5OW1xInh5E7Q0bkFl1WlastkslnNNxAS+Rc0ztSvP
 If7iJ/0amk5NUXxopZXgpkK1TPz+8TC48jQwkutCR4apOyxIedqWSraEXqfya87peIp3
 0LHZ6UxlXOXxdKb3crvSm9jpXsck0jhyDWwJAi5BN8hjAEEQ22HTZPghUw0ARaeXuMay
 6OVblKNjNWPh71VBDeR9N+3T+Fe471dsMx5iWFJ4ur3S+SwLyMHZCwoe/NufHpLWO4/3
 48IQaaS1cqxs31KJDF/Hcao6I0oKKJ0aSSAE2gyG0DQhs34r72qEkrbm0b7+0y6wzZuJ
 UpGQ==
X-Gm-Message-State: APjAAAVzj0kJgw3o59dhLX+GzWSFWIENYZxs/bk9acpNKvwg2dVrs9vl
 Cbcv1/w1OvDq+q7rALRrFQ==
X-Google-Smtp-Source: APXvYqytMSqnPmc36JxDmrc1RBCCTAHoyzL0pSQngsbJL0iWzc3ScR5eVrCWnvbFN9m04ret5bw0yg==
X-Received: by 2002:a92:3bca:: with SMTP id n71mr380086ilh.104.1569967752751; 
 Tue, 01 Oct 2019 15:09:12 -0700 (PDT)
Received: from localhost ([2607:fb90:1780:6fbf:9c38:e932:436b:4079])
 by smtp.gmail.com with ESMTPSA id o187sm6921932ila.13.2019.10.01.15.09.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Oct 2019 15:09:12 -0700 (PDT)
Message-ID: <5d93ce88.1c69fb81.aec64.6b1b@mx.google.com>
Date: Tue, 01 Oct 2019 17:09:09 -0500
From: Rob Herring <robh@kernel.org>
To: Jianxin Pan <jianxin.pan@amlogic.com>
Subject: Re: [PATCH 1/3] dt-bindings: power: add Amlogic secure power domains
 bindings
References: <1568895064-4116-1-git-send-email-jianxin.pan@amlogic.com>
 <1568895064-4116-2-git-send-email-jianxin.pan@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1568895064-4116-2-git-send-email-jianxin.pan@amlogic.com>
X-Mutt-References: <1568895064-4116-2-git-send-email-jianxin.pan@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191001_150913_764882_9B71DBAC 
X-CRM114-Status: GOOD (  15.20  )
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
Cc: devicetree@vger.kernel.org, Hanjie Lin <hanjie.lin@amlogic.com>,
 Victor Wan <victor.wan@amlogic.com>, Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Zhiqiang Liang <zhiqiang.liang@amlogic.com>,
 Jian Hu <jian.hu@amlogic.com>, Xingyu Chen <xingyu.chen@amlogic.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, Sep 19, 2019 at 08:11:02AM -0400, Jianxin Pan wrote:
> Add the bindings for the Amlogic Secure power domains, controlling the
> secure power domains.
> 
> The bindings targets the Amlogic A1 and C1 compatible SoCs, in which the
> power domain registers are in secure world.
> 
> Signed-off-by: Jianxin Pan <jianxin.pan@amlogic.com>
> Signed-off-by: Zhiqiang Liang <zhiqiang.liang@amlogic.com>
> ---
>  .../bindings/power/amlogic,meson-sec-pwrc.yaml     | 32 ++++++++++++++++++++++
>  include/dt-bindings/power/meson-a1-power.h         | 32 ++++++++++++++++++++++
>  2 files changed, 64 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml
>  create mode 100644 include/dt-bindings/power/meson-a1-power.h
> 
> diff --git a/Documentation/devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml b/Documentation/devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml
> new file mode 100644
> index 00000000..327e0d9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml
> @@ -0,0 +1,32 @@
> +# SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +# Copyright (c) 2019 Amlogic, Inc
> +# Author: Jianxin Pan <jianxin.pan@amlogic.com>
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/power/amlogic,meson-sec-pwrc.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Amlogic Meson Secure Power Domains
> +
> +maintainers:
> +  - Jianxin Pan <jianxin.pan@amlogic.com>
> +
> +description: |+
> +  A1/C1 series The Secure Power Domains node should be the child of a syscon
> +  node with the required property.

'a syscon node' is not specific enough. It must be a specific node.

> +
> +properties:
> +  compatible:
> +    enum:
> +      - amlogic,meson-a1-pwrc
> +
> +required:
> +  - compatible
> +
> +examples:
> +  - |
> +    pwrc: power-controller {
> +          compatible = "amlogic,meson-a1-pwrc";

But why do you need this node? It has no resources.

#power-domain-cells needed?

> +    };
> +
> +
> diff --git a/include/dt-bindings/power/meson-a1-power.h b/include/dt-bindings/power/meson-a1-power.h
> new file mode 100644
> index 00000000..6cf50bf
> --- /dev/null
> +++ b/include/dt-bindings/power/meson-a1-power.h
> @@ -0,0 +1,32 @@
> +/* SPDX-License-Identifier: (GPL-2.0+ or MIT) */
> +/*
> + * Copyright (c) 2019 Amlogic, Inc.
> + * Author: Jianxin Pan <jianxin.pan@amlogic.com>
> + */
> +
> +#ifndef _DT_BINDINGS_MESON_A1_POWER_H
> +#define _DT_BINDINGS_MESON_A1_POWER_H
> +
> +#define PWRC_DSPA_ID	8
> +#define PWRC_DSPB_ID	9
> +#define PWRC_UART_ID	10
> +#define PWRC_DMC_ID	11
> +#define PWRC_I2C_ID	12
> +#define PWRC_PSRAM_ID	13
> +#define PWRC_ACODEC_ID	14
> +#define PWRC_AUDIO_ID	15
> +#define PWRC_OTP_ID	16
> +#define PWRC_DMA_ID	17
> +#define PWRC_SD_EMMC_ID	18
> +#define PWRC_RAMA_ID	19
> +#define PWRC_RAMB_ID	20
> +#define PWRC_IR_ID	21
> +#define PWRC_SPICC_ID	22
> +#define PWRC_SPIFC_ID	23
> +#define PWRC_USB_ID	24
> +#define PWRC_NIC_ID	25
> +#define PWRC_PDMIN_ID	26
> +#define PWRC_RSA_ID	27
> +#define PWRC_MAX_ID	28
> +
> +#endif
> -- 
> 2.7.4
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
