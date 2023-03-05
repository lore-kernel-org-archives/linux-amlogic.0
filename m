Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21B42C61DA4
	for <linux-amlogic@archiver.kernel.org>; Sun,  5 Mar 2023 13:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JIPiuJFTv8fwz/5KCaeRvpYHyyUdyQD/F5snejWe4t4=; b=eOK1ZHCGQCjviJ
	YRUpzkxMoLxWsv9LCXJb+Sd1E4Bx3nVfIkLLFmH7fDMsd3JpUjIRULGcTkAlx2aS/Vhc+brAqXzyU
	QybtuW9g7ICx8ColLU4iolNqWKMJJpLX+pocN1uI2X5MG2IG6+Z2ZQg2EDEWnGUw2O8FmBD8SITEU
	uB2QE08GjWc+QAM+bTo3h9pfKBIXkRSd1xdCAR60R7Ma+2Mka44ljbyZ7SlnWopjpjAhIqok5h0TM
	J7rU1YcJju6ZKBybBiwwWd8hNmJtwUiVDAgTHPq2ODI1R+JvmORJ9LLpNO0+C/G+TzCek6zFNRxfK
	rHxv/Ex2CCN7NvonVJ4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pYoSy-00AG3t-2h; Sun, 05 Mar 2023 13:31:56 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pYoSv-00AG2c-Ge
	for linux-amlogic@lists.infradead.org; Sun, 05 Mar 2023 13:31:54 +0000
Received: by mail-ed1-x52e.google.com with SMTP id x3so28056771edb.10
        for <linux-amlogic@lists.infradead.org>; Sun, 05 Mar 2023 05:31:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678023111;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uYU3IZQDcyAinIOEBmNvAQ0I4IvNbd1yC7kYUTJDSMU=;
        b=pfaDpSiWb7I5T9Q9XRrS6EL/gzpAVm93JhF3C2ki/AKOPTPqSod9Lf7URM7GnGD9Nz
         u7yQBsGOuZ0TGmUkNjhle2DaIxkYQWiAe+uojr3Mx2+OppOQA5QXgbGAbfb6GzIwbjF1
         o1u1OH8iAM78GRJ+ncyCtmBCbPdzP17B8c1OcCunkDVTtm67vl6gVvg2F01DbaARFeRU
         su9NV7MP7+wW3wQAKiKySTUU2H3im0Ws2CXlR71Tj69eOaz9bQGumYRkzg7If5rdsECf
         RoE29/RrmKZm63Ds6tNf8sTP+iD34tpqNBvgyjciG3RtebQF8W4Le6JE2zOtSugBd957
         nR2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678023111;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uYU3IZQDcyAinIOEBmNvAQ0I4IvNbd1yC7kYUTJDSMU=;
        b=IK+VSpPO/aMLJMYXR7/oSwCGFYQFLD/Zdm0na3+TDxhnDW7UXWc2ZZhb8RfsXdKhNd
         NjzS1ONUPej3+OJm8agfw2zfG6yFs9UDSbrSDeBLBLM3qrRF3iIhaanOCDLSwnXzdO1b
         JFBgTTfOHe5TJQDmdjThNxQIQI3YC8+4O5ubKOKB54k1IJjqrYUhR8fdrvtkpRqk93ui
         3evwvPhQAfh+eoSATTjb7gqn+kdzxeXI+GxEnYZnuot05rjRSIfLb835qagXPioMyTF2
         SKB6Q8y3ObQl6tcsrZHtpsZFRguvBROEzKY8NOvlxP6FBM5XXNXRZ0JEiUEtr1G4nFnY
         BXeQ==
X-Gm-Message-State: AO0yUKXNiETgTGrWgNRL84OQlaDyChlnmkJtHf0boN84NEHmJYLQnSfe
	d8nw0Y1hgR656VNaA6sjsZx86g==
X-Google-Smtp-Source: AK7set9VVeZcdpiS8HZtHwdQtUzByMHqlqxfuluMzmuGmUy04g2fBkTsORK0BJCHBACv1doqeUG64A==
X-Received: by 2002:a17:906:76c5:b0:8aa:c0a4:2aa5 with SMTP id q5-20020a17090676c500b008aac0a42aa5mr7778712ejn.16.1678023111062;
        Sun, 05 Mar 2023 05:31:51 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:71e7:13d:1c29:505f? ([2a02:810d:15c0:828:71e7:13d:1c29:505f])
        by smtp.gmail.com with ESMTPSA id gj14-20020a170906e10e00b008df7d2e122dsm3198395ejb.45.2023.03.05.05.31.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Mar 2023 05:31:50 -0800 (PST)
Message-ID: <187dd727-7ff9-02c5-7308-65abe29570dc@linaro.org>
Date: Sun, 5 Mar 2023 14:31:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/2] dt-bindings: arm: amlogic: add support for BananaPi
 M2S variants
Content-Language: en-US
To: Christian Hewitt <christianshewitt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230305132044.1596320-1-christianshewitt@gmail.com>
 <20230305132044.1596320-2-christianshewitt@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230305132044.1596320-2-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230305_053153_621142_08AC90AF 
X-CRM114-Status: UNSURE (   7.07  )
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

On 05/03/2023 14:20, Christian Hewitt wrote:
> BananaPi M2S ships in two variants with Amlogic S922X or A311D chips.
> 
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/amlogic.yaml | 2 ++


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
