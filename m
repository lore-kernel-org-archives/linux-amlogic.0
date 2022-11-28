Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7F15C43217
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Nov 2022 11:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=knFqyS/RT3t1CHN7QnECTQ0eCeDdsIXMHOgTQVzIdYA=; b=Q5PtLTYbAVSFJJ
	BlWehTdNu0X0pHTN8LLJZ5o4is3HSZ7+eaUemU21yahnpiXKfY6YuoOcIImKtFV2ComE7W45XGlVn
	dUrjZ83VQ5m5kIjXsiKlJjNIXdND2LMUzPFSD7r26rbhx7nxAlNxKM6qpr1U58ASBtdXwvt4xQDY4
	R9DUl7STg1TKIYJdoCJgoWOmtj3fmxtVBx1OE8ata9YJqT9YYN9V07oC3tadtV8w56h5IAINIFiLW
	ni0P8TsW7uD0M8+tUwAFmy8xt2JwmEmgC3pVstb30NTl4HcRgZEmxBtR/xTOBPFzhekhY9CxnwuWR
	o2+Mhvq6G/Goe8HF9CEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozcYn-001Nsd-Mm; Mon, 28 Nov 2022 11:44:29 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozcXd-001Njj-Do
	for linux-amlogic@lists.infradead.org; Mon, 28 Nov 2022 11:43:19 +0000
Received: by mail-lj1-x231.google.com with SMTP id l8so12765263ljh.13
        for <linux-amlogic@lists.infradead.org>; Mon, 28 Nov 2022 03:43:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y/NMdKpvhQ7cYen/mRGTvw+CDxQ+zYX5fNUIZk143oU=;
        b=zPPIZYgrwVjHLzBWjVMvmXXqJo7dVQcVfNrE3MVLyPOZHpdHEcG8UpD1BY4g5euhIe
         nLXA8Ksvo7aVHwGrUGMpF/Nuwbv2JMboQz+9ZkkbChF3UF57IkRrQtJDZHE97HxkmChu
         L2r8eu0jHe95NZf98vkGQyVbHw9WaSBAK/7AY9IuMC0nsOttBjkFxEJFfk6ayfXxE9Ef
         xPl9rExhKXLBHXwR7K6hDygN0b21lbSOi+Bqb2VDVkZkYQGCduttL+BohwwyZrzPId6h
         yNcxQsFW5KECtYlth79xa8erpyTxgIdWutVOa2gDsEpx7YuXlrVVfzOeab0OGn86UrOo
         BAyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y/NMdKpvhQ7cYen/mRGTvw+CDxQ+zYX5fNUIZk143oU=;
        b=uxNt/gvthkOFkPseQEba9c1+IbFiblb9XXYdDw3QcEExkFHvoQrqVgNIXyZY4MyDh/
         1xyE7LViixyoa27zKQrbvMv2vw9Nar9/qzt2sZmPRYiDy0mdjxepeUdLPwKrew1jJMKc
         zQyhnobIz6uDYsZ+27NQcxD+oC4PrRfBTmyzpnnlEIdv50w4ATnLk2Wo0h/dXJYVizfX
         gZtiNMLNx/n3na+TvG9psR3eyMp4VnJG2AZS+RBLIuYN9LxsEpQR8JlrTGI3W5/oWSs5
         SzagGpDf4vzxtZjlDBpcFQHyfx5W5XlyTuNdkFFB9BaH9uaoQyvljKjs4LRh0o2uhjVi
         GC9g==
X-Gm-Message-State: ANoB5pk2/7C3tHCiLs8tOa9vxHr6T7yg/sFmkRXH0KiSC/Cs9VizXPKq
	qMQVYOWVqc90GWst7kyqtYpghQ==
X-Google-Smtp-Source: AA0mqf7JcyuuiKV19YXlSN9PwOCS11wpzt/G/7BdhxRJZAX3qBlz4emKPnOW9rw04xAqKRp63FvXaQ==
X-Received: by 2002:a2e:800e:0:b0:279:8e27:b42f with SMTP id j14-20020a2e800e000000b002798e27b42fmr4917410ljg.106.1669635794980;
        Mon, 28 Nov 2022 03:43:14 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id o6-20020ac25e26000000b00492e3a8366esm1696734lfg.9.2022.11.28.03.43.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Nov 2022 03:43:14 -0800 (PST)
Message-ID: <1aeecc8a-9fa7-dc69-c4fc-1238bbfda85e@linaro.org>
Date: Mon, 28 Nov 2022 12:43:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 2/5] dt-bindings: power: Add NNA power domain
Content-Language: en-US
To: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: italonicola@collabora.com, Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/Amlogic Meson SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson SoC support"
 <linux-amlogic@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>
References: <20221128111740.39003-1-tomeu.vizoso@collabora.com>
 <20221128111740.39003-3-tomeu.vizoso@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221128111740.39003-3-tomeu.vizoso@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_034317_471820_681EB6FF 
X-CRM114-Status: UNSURE (   5.98  )
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

On 28/11/2022 12:17, Tomeu Vizoso wrote:

Missing commit msg.

Same problem with missing changelog.

> Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> Acked-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---


Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
