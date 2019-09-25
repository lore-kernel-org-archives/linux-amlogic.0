Return-Path: <SRS0=JnL7=XU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81F79C432C2
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Sep 2019 22:55:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 536ED21D7B
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Sep 2019 22:55:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ukN2Npeg";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="eoqlvEqQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 536ED21D7B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E2MEhOsLZ0wqKVA6hfzIhJ1SSZ2D9RcwPLXsZ9ZZOKM=; b=ukN2NpegkaiRzb
	oHmQXv52m+0r8DLYZflhEioF+EXSgHjE6fERRjWJ93jpi4DeRAkvpA47K323mUYUOs6H4NlSmQATu
	sG03cuJs0EyI+HNi9T0e33doXnbEsEsiogf057hTW3V8QNiTWF3mTPO8awfQMY/akFn1hKjka+o9g
	FxvZcRLxM/P081nOCmuHD1/xAoxRjLt3feKmLNsj2ES4Fr0X4xaTiQqn2DMybLjnWQpdfLh6vvS9T
	fcgt/HVm4HtsPd8HwKPHKeNuKq8qxxk1TBk1rRQP59uF8MmlmxP+SOCbOT8FAGVJA5NSrhzyXY7Xo
	pAuk520gCvLOSHi2pnkQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iDGBv-0002NZ-5R; Wed, 25 Sep 2019 22:55:23 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iDGBf-00023p-Mi
 for linux-amlogic@lists.infradead.org; Wed, 25 Sep 2019 22:55:10 +0000
Received: by mail-pg1-x541.google.com with SMTP id t14so209461pgs.3
 for <linux-amlogic@lists.infradead.org>; Wed, 25 Sep 2019 15:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=9WC9auWepUy78cUJN0aqVvX0lDk3WeTONEi6+SRxepQ=;
 b=eoqlvEqQxVKWBUggvKjRbdxmqgttREvbLfuo9DiOOEnl2OUh0wUEp4SrUi0xIDRbOq
 V5BovfMxNoOTiYrIiSiauLlB8IUPau86O8w5VEXiD89gUa97Tl/hmc9Ekwgnhc3cmDDX
 RCVE98WWlxe5UCCRhwuKjewoproUEVcDDZn2Z7ovjumQvyzfAfFDXT0nM1ZkInMVe72B
 VkR1u6V510QP34t6MdbbFP0KMeIrp3VIPtM8KvFxMpohWWNV9dUR5mYxWZojPXbGw88e
 zSx8oPFkeq8P3EH3hQMKVB8CgNQS3nCZvaVsFjl/GjssU+6pbt/DNxOPMyLicl236ns9
 g9kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=9WC9auWepUy78cUJN0aqVvX0lDk3WeTONEi6+SRxepQ=;
 b=thAja9DF+j85is94p4WTcV8k6mcFWW/0yjFAt1wGrM6KxbYA7z3qV483ff7DuXW0au
 H3Gfm9paXNG0Ql6t22XWeZgu9/FwIDlLVLLPghsTQY4Czdl5d/DlGdZE6JzBd7PhaM7K
 uGjCdfHzwxMNuYEPHSMhukFTv/KnUmVMxE8lPIgv+qr+ZFzCOet/Wx6x3uDAFdY9ZmXD
 KIGzNmpZIa4yQeWLiymEXy+7TbfklAJmBy5NJVnn4/IhPQy8JXw/1A39UnNcHdHU8vqW
 B5X5Kb/ix/wSGrZC1n1j/dEBNPyDoRrFsWCCYmLHxhjOX/z3buOStZrIEQNDlqmqqDyA
 Ch4A==
X-Gm-Message-State: APjAAAWH6SjfWsFErYqIflQYkBaPEItCxIphcktGpZ86F67cWlCs4tKl
 ADqLtqdWY1MRqxoAVI+R8XTq2Q==
X-Google-Smtp-Source: APXvYqyHy++T2AILkhhlqZKUmq7GMsbUVh3oS83mlr5NVQ7OOev5eiPms6EaAI0vnUK3PPzAG6b4fg==
X-Received: by 2002:a17:90a:244f:: with SMTP id
 h73mr59911pje.137.1569452106814; 
 Wed, 25 Sep 2019 15:55:06 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id y15sm62024pfp.111.2019.09.25.15.55.05
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 25 Sep 2019 15:55:05 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Xingyu Chen <xingyu.chen@amlogic.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v2 2/3] dt-bindings: reset: add bindings for the Meson-A1
 SoC Reset Controller
In-Reply-To: <1569227661-4261-3-git-send-email-xingyu.chen@amlogic.com>
References: <1569227661-4261-1-git-send-email-xingyu.chen@amlogic.com>
 <1569227661-4261-3-git-send-email-xingyu.chen@amlogic.com>
Date: Wed, 25 Sep 2019 15:55:05 -0700
Message-ID: <7htv90rnp2.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190925_155507_746691_CAE3C46F 
X-CRM114-Status: GOOD (  14.45  )
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
 Jianxin Pan <jianxin.pan@amlogic.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, Xingyu Chen <xingyu.chen@amlogic.com>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Xingyu Chen <xingyu.chen@amlogic.com> writes:

> Add DT bindings for the Meson-A1 SoC Reset Controller include file,
> and also slightly update documentation.
>
> Signed-off-by: Xingyu Chen <xingyu.chen@amlogic.com>
> Signed-off-by: Jianxin Pan <jianxin.pan@amlogic.com>

The order here doesn't look right.  As the sender, your sign-off should
be last.  Is Jianxin the author or are you?  If Jianxin, there should be
a "From:" line at the beginning of the changelog to indicate authorship
that's different from the sender.

> ---
>  .../bindings/reset/amlogic,meson-reset.yaml        |  1 +
>  include/dt-bindings/reset/amlogic,meson-a1-reset.h | 59 ++++++++++++++++++++++
>  2 files changed, 60 insertions(+)
>  create mode 100644 include/dt-bindings/reset/amlogic,meson-a1-reset.h
>
> diff --git a/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml b/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml
> index 00917d8..b3f57d8 100644
> --- a/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml
> +++ b/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml
> @@ -16,6 +16,7 @@ properties:
>        - amlogic,meson8b-reset # Reset Controller on Meson8b and compatible SoCs
>        - amlogic,meson-gxbb-reset # Reset Controller on GXBB and compatible SoCs
>        - amlogic,meson-axg-reset # Reset Controller on AXG and compatible SoCs
> +      - amlogic,meson-a1-reset # Reset Controller on A1 and compatible SoCs
>  
>    reg:
>      maxItems: 1
> diff --git a/include/dt-bindings/reset/amlogic,meson-a1-reset.h b/include/dt-bindings/reset/amlogic,meson-a1-reset.h
> new file mode 100644
> index 00000000..8d76a47
> --- /dev/null
> +++ b/include/dt-bindings/reset/amlogic,meson-a1-reset.h
> @@ -0,0 +1,59 @@
> +/* SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> + *
> + * Copyright (c) 2019 Amlogic, Inc. All rights reserved.
> + * Author: Xingyu Chen <xingyu.chen@amlogic.com>
> + *
> + */
> +
> +#ifndef _DT_BINDINGS_AMLOGIC_MESON_A1_RESET_H
> +#define _DT_BINDINGS_AMLOGIC_MESON_A1_RESET_H
> +
> +/* RESET0 */
> +#define RESET_AM2AXI_VAD		1

minor nit: can you use comments/whitespace here to indicate holes?
Please see the other amlogic files in this dir for examples.

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
