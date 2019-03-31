Return-Path: <SRS0=KZtH=SC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB80EC43381
	for <linux-amlogic@archiver.kernel.org>; Sun, 31 Mar 2019 06:42:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BDC6B20882
	for <linux-amlogic@archiver.kernel.org>; Sun, 31 Mar 2019 06:42:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FEfTKgfC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BDC6B20882
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:
	References:Subject:From:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Glfja4xkNx5ectzJP5cfyy4qetPUehPjGJsYbvSJknk=; b=FEfTKgfCSgXZjE4ShC6ZKn5Q89
	wziAHljb8JNzf0gPoe3VYsGiScTtsjkL1I5lkF9GGSxoQAv9F3motNAAHVrj2g/rQMjRx6PHX2uYT
	9369we3xRQCYGV2c7Xw/7MV5bAMEAum9iw5qwZH8NhiJyGJC99yT+nRp5S2amh4E3KGzu3miTym+E
	OuRpsCVJ8D9UZFolGKsKFWy1CWnoq8GeyONB6Mrw3YVdu3ky4Qzirw78EKNU6Tg81Rc+J+JmLHTCr
	bMvVEYc5X47xDYZW7nNS2ivEOyfe+a/QkXzbyMXHbBV/cf7C6iiOGVg3xc+8QpadkN/IntXw/Fn97
	3hxHtyjQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hAUB3-000185-Cm; Sun, 31 Mar 2019 06:42:45 +0000
Received: from mail-pf1-f195.google.com ([209.85.210.195])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hAU9T-0007gK-Ps
 for linux-amlogic@lists.infradead.org; Sun, 31 Mar 2019 06:41:10 +0000
Received: by mail-pf1-f195.google.com with SMTP id i17so2982794pfo.6
 for <linux-amlogic@lists.infradead.org>; Sat, 30 Mar 2019 23:41:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:from:subject:references
 :in-reply-to:cc:cc:to;
 bh=ZpgGUCqxuQpGk62dSSiHph6XjK8orHXc7xsRUZLJqe0=;
 b=rE0OoWVIadv6nngGGO8mxGzcYq9EiGnIC4hNFmeI/WaRWYiRe4g1izVYaNQYXudMW+
 LRIlfSHCMTjzXXSwMEskY4ySWkd6dOg6MEpJdMyVBfHylNS86g0Pna0ZULOI3K6mYOeF
 FqhVjTKgsCPJYlD4Krr/5xNx22wCBGgeS4QuaP65zLRNiyhacy7hY4490+sZX0UM2zJn
 1YC6P6k93ibM/cQAWxx0LmlwXa+Q7sDyCDCyZTdXv6OBe7g3zHIazayOptx3cLGXkaZ+
 nGXn6ATj7f2juK9zEtZ2uaF+CXopNP4/HXiovYoWnt5tTiQCZzPZsf0eWxUhuN6XImlR
 DZKA==
X-Gm-Message-State: APjAAAUoIzHIVTYQ5OPfR8H9f//pDcYIhHVA7PmeYvA4bhSyO4+qXnlR
 tcreqc4HHshhaCv6t8yovY3anig3Og==
X-Google-Smtp-Source: APXvYqx4ec9vIlEG1P5IUKGvPeDJPyE1Qu/jLVu/rNLVCtlqDBLGihx9cHUceIT5YrzIi+XzGD720g==
X-Received: by 2002:a63:84c7:: with SMTP id
 k190mr54559022pgd.255.1554014467266; 
 Sat, 30 Mar 2019 23:41:07 -0700 (PDT)
Received: from localhost ([210.160.217.68])
 by smtp.gmail.com with ESMTPSA id 20sm8982861pfn.131.2019.03.30.23.41.06
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 30 Mar 2019 23:41:06 -0700 (PDT)
Message-ID: <5ca06102.1c69fb81.44711.7b74@mx.google.com>
Date: Sun, 31 Mar 2019 01:41:04 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: clock: g12a-aoclk: expose CLKID_AO_CTS_OSCIN
References: <20190321092010.14382-1-narmstrong@baylibre.com>
In-Reply-To: <20190321092010.14382-1-narmstrong@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190330_234108_366931_BDF2A720 
X-CRM114-Status: UNSURE (   9.57  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, jbrunet@baylibre.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, 21 Mar 2019 10:20:10 +0100, Neil Armstrong wrote:
> When submitted v2 of the G12A AO-CLK IDs, the CLKID_AO_CTS_OSCIN was moved
> to the internal non-exported bindings, but this clock is necessary for
> the second AO-CEC-B module since it embeds the 32768Hz dual-divider
> clock generator unlike the AO-CEC-A module.
> 
> Export it back to the public bindings.
> 
> Fixes: be3d960b0aeb ("dt-bindings: clk: add G12A AO Clock and Reset Bindings")
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  drivers/clk/meson/g12a-aoclk.h          | 1 -
>  include/dt-bindings/clock/g12a-aoclkc.h | 1 +
>  2 files changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
