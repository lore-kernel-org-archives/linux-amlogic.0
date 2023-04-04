Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F60BC6FD1D
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Apr 2023 14:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jo2wB7puPEf4S7q7yOL0/HAAWbp34Wl71vvCIrqiiZE=; b=ZnS/sVa5PEc9HU
	129R0AKDZe0gDDpGF/JcnhYLMuWWCNudowUk8xEAlehJm1AuDsGMs+bha96dTIfTPDrOar22hUk/X
	I8E0ppO4atLiIjdPuhQEokuXpN7/mqfims1xxzZDlzslTDHAkc2nrUZ7hEc8ay53cGkImDmytQd8u
	y53UG4bSOAI7/AZVBxNshLfkAdrJ6+Dm55u0eZ/QjXTm8GuaiwNsDqhZtuN16vChVTDRx1vsgn5ZX
	Aa6uEaqRmv6F/IqvVYRAQAtgjAQcF74yH8poAgkZW3/bVfNu758j8lbuFisbBKwI3YjyNHqK+vPK7
	yvEyzcdqRDjAVsv2kl0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjhbC-001n16-0e;
	Tue, 04 Apr 2023 14:25:26 +0000
Received: from mail-ot1-f43.google.com ([209.85.210.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjhb9-001myn-0k;
	Tue, 04 Apr 2023 14:25:24 +0000
Received: by mail-ot1-f43.google.com with SMTP id cm7-20020a056830650700b006a11f365d13so16109772otb.0;
        Tue, 04 Apr 2023 07:25:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680618319;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hfFv+QOf1yDHw8Nr+wigwgw08UuoqTsGPijrLxx6WDQ=;
        b=GOKz06h9KcyrN3gWED4GdMl/iD9M8AcyPzU56/CLSF1TODRaFtgrAvfheCSUbHLas7
         7XopEBnzcIBc7/XkFtFmgsD6Gz3LligI0ixuVcooXumT3TaL5+9ujQy4Ch5gDRgloOIF
         5E1NvcwyaNd1q0l4LxtSNgdJ/MGQ1vxZszZ2eVo7aGWjrSSaU14HqHpykCaK1a/joCnj
         +ugUpxykG5rVr7QQce9VkZ0VMx4kwfGrQkVLIk8OQiqy3sWzkT2dMHY/zeIfIWIklnUN
         suJ88QVgpSUOfZ3O2ojG3joA7fk6XxFMuvVmNGcLOcXhRS64b/w38IH5j3HvfJcDV88C
         4tfA==
X-Gm-Message-State: AAQBX9dkqIJfEDH3OrTdsa1sDpOo5aKenV/IOZ4O7jIQxlquTcXhmsdV
	pL5oRIq6ynGrw/O/iPacX5YcE6DfXg==
X-Google-Smtp-Source: AKy350aGHvbr3/R6CmlMOZBHR4mblqLK7dsQewgjjTGJyRnzwdMXECZyKR21UEsg0xIjmKvgIOySZg==
X-Received: by 2002:a05:6830:e8a:b0:6a1:796e:c380 with SMTP id dp10-20020a0568300e8a00b006a1796ec380mr1283573otb.6.1680618319614;
        Tue, 04 Apr 2023 07:25:19 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id a15-20020a056830008f00b006a036b9794asm5563444oto.37.2023.04.04.07.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 07:25:19 -0700 (PDT)
Received: (nullmailer pid 3833292 invoked by uid 1000);
	Tue, 04 Apr 2023 14:25:18 -0000
Date: Tue, 4 Apr 2023 09:25:18 -0500
From: Rob Herring <robh@kernel.org>
To: Martin Kurbanov <mmkurbanov@sberdevices.ru>
Cc: linux-amlogic@lists.infradead.org, Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, kernel@sberdevices.ru
Subject: Re: [PATCH v3 1/2] dt-bindings: spi: add Amlogic A1 SPI controller
Message-ID: <168061831774.3833234.8717892160543675087.robh@kernel.org>
References: <20230403183217.13280-1-mmkurbanov@sberdevices.ru>
 <20230403183217.13280-2-mmkurbanov@sberdevices.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230403183217.13280-2-mmkurbanov@sberdevices.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230404_072523_267556_19268A0F 
X-CRM114-Status: UNSURE (   9.03  )
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


On Mon, 03 Apr 2023 21:32:16 +0300, Martin Kurbanov wrote:
> Add YAML devicetree Amlogic A1 (A113L SoC) SPIFC.
> 
> Signed-off-by: Martin Kurbanov <mmkurbanov@sberdevices.ru>
> ---
>  .../bindings/spi/amlogic,a1-spifc.yaml        | 41 +++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/spi/amlogic,a1-spifc.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
