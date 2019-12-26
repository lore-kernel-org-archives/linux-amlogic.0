Return-Path: <SRS0=sGw/=2Q=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5AA3C2D0C0
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Dec 2019 20:11:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89CA020740
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Dec 2019 20:11:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OA6y3mXJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="dkoPDMmR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 89CA020740
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r24h5hRpUFnl2IVFOVLNUSZVC8zKXY9kptaZyVMUda0=; b=OA6y3mXJ3KkzJn
	+CNKQXoy4RhFTK/CZue0ZYDpxqJmHhM/L4l1Dm8LdwowzROKzJ5GzX/6qtLY5uknrR3HCYZ5O9wAB
	mF681oYNTfNffohqlNsFx9yzm4HEK/ehiM7plDWYL1RtnGDVXS+tRu7eoDbOW/zk1hnv27bLSXxgr
	KYCTRKcJIurt1r/1wmvx3sKJrP84U3I2KY8zlzlJzC5KylP2rGlRGNDYqM+MOAHDRiV6Ucn++H1R9
	WBBvb829hPJVx5JUlY31RWfw+Quq+xWfL2rwdE8v+zWhVuxZGfK9DzV34HzSha4O3JCoaAHHJeLtI
	z4/96PvNdO+KVbE9P56A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ikZTW-00054D-6N; Thu, 26 Dec 2019 20:11:14 +0000
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ikZTT-00053t-6t
 for linux-amlogic@lists.infradead.org; Thu, 26 Dec 2019 20:11:12 +0000
Received: by mail-ed1-x543.google.com with SMTP id cy15so23635450edb.4
 for <linux-amlogic@lists.infradead.org>; Thu, 26 Dec 2019 12:11:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DKyS0Vzar44g5nZVMq7w89sJBVTVVQr7IhBAjNIROrI=;
 b=dkoPDMmRO2eMwq7TMq1HtLGXctYNZZjUXuFpwJaYLHjL4DHZBgoqJoj2hhpUurQB86
 quqctLUkVeEctiVeMOgGlQKlzRsXqBY2H2rp9rluW2Ub29W0vqIMPXGP+zlhb+8UJmBD
 NSl/EdBjv3zKh1ruJhqdiuFdRG813PmDhGNiz+al4f34WHfimfbMB8AlJCQVI/WhMSfz
 7kMLzUho23PWWhN6nGDqRlnyl5bOKDsKbnmG/QVlKaVotqfucxZCUwe+mp+f52OcZpnR
 ec0YYHCFTvIhPXxhSWEyhNw5FkVMpPcjhLiNnsQBSClPmjXpKatN6p2YCq8M+5eNPBYE
 1vLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DKyS0Vzar44g5nZVMq7w89sJBVTVVQr7IhBAjNIROrI=;
 b=Bh7EpiBg3KILJRGAncVY69fWMXErtOGbHnI1PqdvVbRFAUSJHiiBQu8K7KdRKuOJkn
 EHJ4sE7Z8qLid3kK+8HkXo0ha4L2ZA3qvR5xY5O9JUXkwiPcJucmBUC0ahTx6TQm8VM6
 7/ifu3oXgOE0sx/PTJd4fEBhQw3q/ZxfCIXEGh4tNsve4EINEqrDLGntyyNJALl0CGU7
 jl1uA+VEPJYaqqdMUDaySUvAy6DyGu2g8EohuR17oBgC9OsVmC8VSqLCOo+o1HGfP+u8
 vMFDbZzVEQPwiLfLr6MQ6C+XzutFHDO/ary66Sq3+NLf0sU7BmzBaeDREG9HJP8PTgKl
 CZww==
X-Gm-Message-State: APjAAAVqpnl59h+fddj8MaiHAJfD8QmYOvDvOwovjGCc64ZPE9wcKhH9
 KX2kTma4GxUa6WmrU/ZvxRV+dQlxYcN8dcsdG5I=
X-Google-Smtp-Source: APXvYqyOHd8m4jOZ18liraS1LmkJgDRRTlRaa1TAnpybzR7ymvltec/WOyoBzbMMK/SVycz37m9EThbBbClEbuEt25k=
X-Received: by 2002:a50:fb96:: with SMTP id e22mr51700477edq.18.1577391069615; 
 Thu, 26 Dec 2019 12:11:09 -0800 (PST)
MIME-Version: 1.0
References: <20191224173942.18160-1-repk@triplefau.lt>
 <20191224173942.18160-6-repk@triplefau.lt>
In-Reply-To: <20191224173942.18160-6-repk@triplefau.lt>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 26 Dec 2019 21:10:58 +0100
Message-ID: <CAFBinCBzt6SRGx+8iT=NHW00ip_gtg2cW7T8z9aqjeGPH8f7OQ@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] dt-bindings: Add AXG PCIE PHY bindings
To: Remi Pommarel <repk@triplefau.lt>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191226_121111_279513_A3A3BF93 
X-CRM114-Status: GOOD (  12.58  )
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
Cc: devicetree@vger.kernel.org, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 Yue Wang <yue.wang@amlogic.com>, linux-amlogic@lists.infradead.org,
 Andrew Murray <andrew.murray@arm.com>, Kishon Vijay Abraham I <kishon@ti.com>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, Dec 24, 2019 at 6:32 PM Remi Pommarel <repk@triplefau.lt> wrote:
>
> Add documentation for PCIE PHYs found in AXG SoCs.
>
> Signed-off-by: Remi Pommarel <repk@triplefau.lt>
> ---
>  .../bindings/phy/amlogic,meson-axg-pcie.yaml  | 51 +++++++++++++++++++
>  1 file changed, 51 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/amlogic,meson-axg-pcie.yaml
>
> diff --git a/Documentation/devicetree/bindings/phy/amlogic,meson-axg-pcie.yaml b/Documentation/devicetree/bindings/phy/amlogic,meson-axg-pcie.yaml
> new file mode 100644
> index 000000000000..c622a1b38ffc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/amlogic,meson-axg-pcie.yaml
> @@ -0,0 +1,51 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright 2019 BayLibre, SAS
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/phy/amlogic,meson-axg-pcie.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Amlogic AXG PCIE PHY
> +
> +maintainers:
> +  - Remi Pommarel <repk@triplefau.lt>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - amlogic,axg-pcie-phy
> +
> +  reg:
> +    maxItems: 1
> +
> +  aml,hhi-gpr:
> +    maxItems: 1
nit-pick (as I didn't have time to review the whole series yet):
we have at least two other IP blocks that need this. they use
"amlogic,hhi-sysctrl" for the property name


Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
