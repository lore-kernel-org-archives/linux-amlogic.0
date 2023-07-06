Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CEA1EB64D9
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Jul 2023 19:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ev2rfz0zywMgnewQbrhr0ekLyqQP0rpMJ2KFK2bVXDM=; b=wrGtmvN78/gvgW
	pXjJMMgfPDqq5exSlp3LgPNll1GFo0fmevS5A26GyeC9rTWx8uXXyiPdQ0qEKpozBnESl89KhVV3N
	0PfRJDm2HTChTZ0YuBj7ON/HKqthN3WzrW0iZcAJOW2KaoPD023WRj+rBvHY2cv0HI/HvByA8ujWb
	qvqI3VP81R32Z5m/e6llqOgx4Y/FCByDbGp4LRewBdXyoMq5ZYyUXnb6P/rJUulm9RkKyuXIRTVYx
	PEXEnvLLAPP50eMw0/2v5vPF6iqbi4lHps5vFx9tGRBNiHvJzxNDxaC8lNS9tDcaaibkoCVb6bB16
	ciy8nLhh7qaB4lG7MmKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHUYh-002UxU-3A;
	Thu, 06 Jul 2023 19:22:31 +0000
Received: from mail-io1-f49.google.com ([209.85.166.49])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHUYe-002UwE-0u;
	Thu, 06 Jul 2023 19:22:29 +0000
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-78360b822abso38206939f.2;
        Thu, 06 Jul 2023 12:22:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688671345; x=1691263345;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b1vhHxHDYnQQYlAo2yiSpaZvyCaq/6aSS1boX6Qwnys=;
        b=AlAJ19NupHdF8e41z9I+JBM/8wR42nV47ZtU4d1N0AldIKOpklqOrs7LBoC9FCnMf/
         OQiq5NKawuIwnGxSXi8K+Zwfyo22BGmHt9hcz20lBHk9YsjgmX31w5O1RuwxrYfRxWUa
         yj2aKtbEUcz0q8PI4kY+pOHdFRDeaXOpdOWG42XbNkIvQzjrKsjYKwkoLH5DLzdy3FSx
         Puhpii52/9emFjhF2L7XVY5uSaWnK6CKIJry/JiMuTAvnCAQoyfNDp0fbJaZyQP47Nor
         bIuvesXhjn8HG0DbbqdWa7KlDdFYa0xMBaeOHw5GRghmhcgdHw0ofBiAoys5LLM3/E47
         rrUA==
X-Gm-Message-State: ABy/qLbvlKuVI77Ap6YXu7z6gGTx7n/VI6txE9GUzANhVeLL+PkqvKHP
	o73O6lcLsBSiiFH9MvcgT7wng0Lp3A==
X-Google-Smtp-Source: APBJJlFWoym+oBQ2Q3VJdb2mYORaZVCrsen7ZoIQ1ReqH1GTrhFEq86fUM15IHFSUMYuwKf5lH1o8w==
X-Received: by 2002:a05:6602:274e:b0:783:58a3:ce2a with SMTP id b14-20020a056602274e00b0078358a3ce2amr3175614ioe.12.1688671345303;
        Thu, 06 Jul 2023 12:22:25 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id f12-20020a056638118c00b0041f4ce6e9cdsm714157jas.65.2023.07.06.12.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 12:22:24 -0700 (PDT)
Received: (nullmailer pid 182715 invoked by uid 1000);
	Thu, 06 Jul 2023 19:22:23 -0000
Date: Thu, 6 Jul 2023 13:22:23 -0600
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, devicetree@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v3 2/3] dt-bindings: clock: amlogic: convert
 amlogic,gxbb-aoclkc.txt to dt-schema
Message-ID: <168867134189.182630.15973523447108474911.robh@kernel.org>
References: <20230706-b4-amlogic-bindings-convert-take2-v3-0-f63de6f12dcc@linaro.org>
 <20230706-b4-amlogic-bindings-convert-take2-v3-2-f63de6f12dcc@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230706-b4-amlogic-bindings-convert-take2-v3-2-f63de6f12dcc@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230706_122228_324019_7DF21198 
X-CRM114-Status: UNSURE (   8.69  )
X-CRM114-Notice: Please train this message.
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


On Thu, 06 Jul 2023 16:52:33 +0200, Neil Armstrong wrote:
> Convert the Amlogic Always-On Clock Controller bindings to dt-schema.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../bindings/clock/amlogic,gxbb-aoclkc.txt         | 64 ----------------
>  .../bindings/clock/amlogic,gxbb-aoclkc.yaml        | 85 ++++++++++++++++++++++
>  2 files changed, 85 insertions(+), 64 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
