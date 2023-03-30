Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0E2EC6FD1D
	for <linux-amlogic@archiver.kernel.org>; Thu, 30 Mar 2023 05:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k+sX9AtFnXVFazXxDj/BuC90asl7Mn/KJTrdkKwxJTM=; b=RiEsupNWE1+G4A
	1CsMlv0/MemYWNYEiItB5QQXq4egcbOxJUJKHmKcpbofNrL5ZxQTc9VWoLEuo93MK8WVho62P3bv1
	39tRHabXfs7OZtn7kkzaNn74MJeuho8ShEqFVi8dmyXSGRpO7wo3uvTKaDfGTyj5S5jNGbPC3LOGI
	Yo05JHG13lDS3imUTnRXxINfmoVIlTMGldcGKEVm5cGGpFKQJIZPfPj1XpnRRNpV98n3DHb2REH2y
	QgAMCcwP3J8/9S/wsctC+8+63LGZ9EqWdr1qe2BXpH+FxgwEIFDawgoosYsZJTKv5D/kzhJzIg13A
	qC535edvhprh0HkJmbcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phlE7-002gkq-1J;
	Thu, 30 Mar 2023 05:53:35 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phlE3-002gjZ-2j;
	Thu, 30 Mar 2023 05:53:33 +0000
Received: by mail-ed1-x52e.google.com with SMTP id b20so72116667edd.1;
        Wed, 29 Mar 2023 22:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680155607;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=M40+CQTvWF9fErLwHCr08yZ52iq/ZqLbTfoV/Qx2dd4=;
        b=D01RUuuQjRPATkfIKAocgR6R3xldMyl8bXv/+Anm/4uiaamYH76ymNJfsFHZ2KtQXm
         jtGx90FJjL8/Cqy1iy1+g12kvTqIMFr4iYZy53eHB9Vb4+ko+alfD32/dYdm1jE3Gpdx
         J9tStYbR3yvqtKxD/nnM0IRoJmYuXrvkbHlgdJxOEcxWed+9G90r0nNpmcxPt3ddnn6+
         HqqbKjTtM0RPpeekuLaea9+ke3JpVErCjBmN7R+A1erQb8L/Je0v43E/zZVl7Z32P94b
         pOYhxeq6bMiX6IkS3yB5MJXhLjrEcscFc2QR+szN02bOSPLX3g3zsM3+641lce3Q54FP
         jv0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680155607;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M40+CQTvWF9fErLwHCr08yZ52iq/ZqLbTfoV/Qx2dd4=;
        b=oThhBTTvj05iTwm71q5kd/HS6fnImfeYOLEJl4D88rv9G0AT7wWo0HaNQhWcDZ2HsL
         wi/CEHCO0Um9b4EoIfMfJwXRgEFLZmVH27NwN9+6gyhdTvDpUNr2c6uaybDN6gkxNkiN
         6L+5Zeeu2r9GGOEAvMGvT58PUMGtb4rrI1RhSJlu9uqD4avrm2bbVvaXbyumJTfxRe8J
         pv3GxUhFVn/w43cRstbW/sf6K8IZexKQMJPDgwcy81rmLrZh6kwCX8V8DlTf6yYKk1yn
         Zt53Wks7wPrmCwWm3GTfmqaHFZSyo5HGhGP8/IQjH//dDLF1c3WWn2+1bZByxp02mAy9
         DAoA==
X-Gm-Message-State: AAQBX9dlUT6SytdXuC/ASqZ0QQuEefXqnnWeeIlhYwl5EMfIa966BcTC
	4qiH64gjDNy9MEo6t4N9GKc=
X-Google-Smtp-Source: AKy350Z1pVKoRz/cFqJEtiZq4H+sbM1zlzzYTemQe7vW390iBptjAGSrvWclpJLNIaFDhH/55J3oiQ==
X-Received: by 2002:aa7:c609:0:b0:4fc:61a5:b9c8 with SMTP id h9-20020aa7c609000000b004fc61a5b9c8mr22058783edq.11.1680155607242;
        Wed, 29 Mar 2023 22:53:27 -0700 (PDT)
Received: from ?IPV6:2a01:c23:c5e9:c400:dc70:f2b9:c0ea:5b79? (dynamic-2a01-0c23-c5e9-c400-dc70-f2b9-c0ea-5b79.c23.pool.telefonica.de. [2a01:c23:c5e9:c400:dc70:f2b9:c0ea:5b79])
        by smtp.googlemail.com with ESMTPSA id q27-20020a50aa9b000000b004af73333d6esm17688872edc.53.2023.03.29.22.53.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Mar 2023 22:53:26 -0700 (PDT)
Message-ID: <10f2a9d2-3c80-ec9c-2ea9-3701737c7818@gmail.com>
Date: Thu, 30 Mar 2023 07:53:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2] dt-bindings: interrupt-controller: Convert Amlogic
 Meson GPIO interrupt controller binding
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <marc.zyngier@arm.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>
Cc: "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <e06e9f26-cf55-5596-c799-d698e9d7b409@gmail.com>
Content-Language: en-US
In-Reply-To: <e06e9f26-cf55-5596-c799-d698e9d7b409@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_225331_880155_70A8A107 
X-CRM114-Status: GOOD (  10.78  )
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

On 12.03.2023 22:29, Heiner Kallweit wrote:
> Convert Amlogic Meson GPIO interrupt controller binding to yaml.
> 
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
> - consider that more than one compatible may be set
> - remove bus part from example
> - remove minItem/maxItem properties for compatible
> - reduce compatible fallback complexity
> - add that 8 or 12 GIC interrupts can be used
> - fix typo
> ---
>  .../amlogic,meson-gpio-intc.txt               | 38 ----------
>  .../amlogic,meson-gpio-intc.yaml              | 72 +++++++++++++++++++
>  2 files changed, 72 insertions(+), 38 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.txt
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.yaml
> 
Who's going to take this patch?


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
