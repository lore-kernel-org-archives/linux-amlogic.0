Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68765E77180
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Dec 2024 16:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gq+APghin0UMBNgduEg81vbwthqNNyL7qqqsNVhazOk=; b=So7h/vnDYC1Mw5
	LRCYva7OUGJgUOw3jzto5SzBgDTeHO9bEotSrsj41p1coJ2GrgfUyRA6qE/6twLl7tC8T10QCC7Qm
	z23HiRQ45B4VZWVMvX7XvSPIHo8RteA47/2z/O1Z6f5z2yxOp28KuWLETFACNrEQ60mOeNvX37Ko7
	A+/xE3QQDaktdhG40WV6eglN1fKsvnbm3HUPk375QO7nnTKc6QsxGZykbC6nh6uFCJIaaF0thLmEL
	F1VlPRUi+xJGSDn9oylyTh5tq/XGFJ5ED6LXYdZC4SzKei0uEoy41hhh/CaaLnM0aS7PXsXURwETx
	WE2k7j+ePbWanbV3zaOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL2tU-0000000C3QC-2hzo;
	Tue, 10 Dec 2024 16:15:28 +0000
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL2oQ-0000000C2YW-3ET6
	for linux-amlogic@lists.infradead.org;
	Tue, 10 Dec 2024 16:10:16 +0000
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-e398484b60bso4770837276.1
        for <linux-amlogic@lists.infradead.org>; Tue, 10 Dec 2024 08:10:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733847013; x=1734451813; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HNXvfug15XfoQwdKiIGBWtNC3tcA8qpMkETpkFfQs6Q=;
        b=EglYlCcUvbK5+9SIdzWa6X84cNs7jL+zhekHrNLQjflWhofO21g8KWRbvxz0iwr6OU
         U+38R6fi5/kx5FKYf91js6FQ2Zw3bb0UWnOSTuiR5/ugk287w7g7LVatUFGma37m/Diw
         V1Z9jsR3RQwtuKObFfuZbqQNiINrJeW0OmVSeiAZXIquLERo83eFML9WAUgJ1+909kfc
         D6YWH9adSnTTzsuvZyxHG75nKtQKIz68ybyShffNp0lfj20UMoKMSx0PSNBRHbl15eTE
         /9zi+js+Xe22ooKURWaFXOQQZv8LgVPadBrHe1OikjkVIQqEf/Dj4gs4QKEWKkOrNGt6
         A0Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733847013; x=1734451813;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HNXvfug15XfoQwdKiIGBWtNC3tcA8qpMkETpkFfQs6Q=;
        b=oI/iLMcTDnAuW1aaFYVm+5D9Yup08RcRlWCQhn4FgxiMDikrW9Gtmmy1QiJziMOpGX
         0Ra4lMmYXFcETCEocDyuHe9QEZn3uNnPw4bNOPnImE/IiXb+lAo5a3q5SRp37/ul6GTT
         x3ss4viI8MJ03mjr/ns7TbE6o+l7Myj6RCLYlPoSYQ10uu7kGokBS/2/Jrcyb5cxsUOI
         yFYaN+xGOCiT3bWeyqoDTEoPHDgawPn9MawF9od5Peiph3QBEh33ZmiW1KDSjUUNuIvq
         qN9rSX1yjKjrfzgEBfhYeilfptebXtUe3GaB+fxO8xT8NqLNYH+Jfme1wIoYHWwpKVLZ
         3Vmw==
X-Forwarded-Encrypted: i=1; AJvYcCUq6La9x6yq5SHe2/I+s/R2OQFEW4oX+RKSNxJP5mMzzuhyJf2rBAT1pEpYoya0dR6UhozOhJ5kUdK2dP2I@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/9Ekr98rdwJ7Wvm/h41M1V2EBXyUmR3BuysnytQVQs316Kmil
	/uvJ2BdZq/SkwuvE6RXoOo+XaBqeQaBrGEiMIreHp5hDF3SLg6oS9/o2ylYMI7ytgqAQSuT/8+E
	KHqe8TWEDewEo69glOcZsbXFLbD01RTj6Ibza7w==
X-Gm-Gg: ASbGnctsBdzp4QqHfXmNWLaMmxUxV9DPNvFRfKoaDXWO+5gJu+qA5Tiv2MBeg11LM6P
	IAG1YomUCw48KCVPj+SGy1JzXMBnfMGJplsmv
X-Google-Smtp-Source: AGHT+IELbJvk0NPV36M+fcncTTHMyREVObNbnHGvfeRgsIrYaGiOwpPdOwf890kyMOnEyS8+yJEfq/uf9mQc3jRotz8=
X-Received: by 2002:a05:6902:2b0c:b0:e38:b889:7eff with SMTP id
 3f1490d57ef6-e3a0b071e93mr15453171276.6.1733847013083; Tue, 10 Dec 2024
 08:10:13 -0800 (PST)
MIME-Version: 1.0
References: <20241128-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v4-0-11d9f9200a59@linaro.org>
In-Reply-To: <20241128-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v4-0-11d9f9200a59@linaro.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 10 Dec 2024 17:09:37 +0100
Message-ID: <CAPDyKFon9-3U5Vn2i+WtarSAYQHnA_ho8CGQmiVoboq1tnt4fw@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] dt-bindings: mmc: document mmc-slot and convert
 amlogic,meson-mx-sdio.txt to dtschema
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Maxime Ripard <mripard@kernel.org>, 
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_081014_830878_2BB0B010 
X-CRM114-Status: GOOD (  13.18  )
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

On Thu, 28 Nov 2024 at 16:16, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> Document mmc-slot because used by amlogic,meson-mx-sdio.txt and
> cavium-mmc.txt, so make it common.
>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Applied for next, thanks!

Kind regards
Uffe


> ---
> Changes in v4:
> - Fixed address-cells description of mmc controller
> - Cleanup '|' when not needed
> - Added review tags
> - Link to v3: https://lore.kernel.org/r/20241007-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v3-0-ad4eb22c2a8d@linaro.org
>
> Changes in v3:
> - Revert and insteads move common properties between slot and controller into mmc-controller-common.yaml
> - Fix other comments on patch 2 & 3
> - Link to v2: https://lore.kernel.org/r/20240920-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v2-0-5aa8bdfe01af@linaro.org
>
> Changes in v2:
> - Fixed description, limited to 3 slots
> - Moved out mmc-slot in a separate common schema
> - Link to v1: https://lore.kernel.org/r/20240911-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v1-1-b7bfae886211@linaro.org
>
> ---
> Neil Armstrong (5):
>       dt-bindings: mmc: controller: clarify the address-cells description
>       dt-bindings: mmc: controller: move properties common with slot out to mmc-controller-common
>       dt-bindings: mmc: controller: remove '|' when not needed
>       dt-bindings: mmc: document mmc-slot
>       dt-bindings: mmc: convert amlogic,meson-mx-sdio.txt to dtschema
>
>  .../bindings/mmc/amlogic,meson-mx-sdio.txt         |  54 ----
>  .../bindings/mmc/amlogic,meson-mx-sdio.yaml        |  94 ++++++
>  .../bindings/mmc/mmc-controller-common.yaml        | 357 +++++++++++++++++++++
>  .../devicetree/bindings/mmc/mmc-controller.yaml    | 346 +-------------------
>  .../devicetree/bindings/mmc/mmc-slot.yaml          |  49 +++
>  5 files changed, 504 insertions(+), 396 deletions(-)
> ---
> base-commit: f486c8aa16b8172f63bddc70116a0c897a7f3f02
> change-id: 20240911-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-6fa70546ebb8
>
> Best regards,
> --
> Neil Armstrong <neil.armstrong@linaro.org>
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
