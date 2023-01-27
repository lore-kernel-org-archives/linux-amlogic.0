Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E246EC61DA4
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Jan 2023 13:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lqKgD3UnpDYC3AjYgcqx+k2ac4liu5PW3QNAbxgi1hU=; b=mAzybn0wbewS56
	/25fcYvR2Zs8k4g5ymT8dGiXTm17YcYQT160GctPt/7h/erwvQlqMK3pmeCChMkJtRmIdvxLlM3cL
	8s40JKVpSyuxrvJk/Y7Y9zMxtCySPThIANFBnklxphYYk6EauCWaL+xeBnAqpgseD4IhLAn7BXeNn
	JN+AWav5xmsV2/WQjm+3jqFa+a3coZV4Z+zmPEax3mliooLfsvugb5P+bMiXRcO/NzMjnEZXNbdNA
	Q83WPIJxj4SV+FGyjGCGvOV778OYzhbS0TyAsIrdPInO3ck3N9bcfAzix3ReCJPLoxevGRlGIWN8q
	A/7bpRBfgWTinVuvcFhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLOYm-00EubJ-T6; Fri, 27 Jan 2023 13:14:28 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLNuK-00EZoz-Ot
	for linux-amlogic@lists.infradead.org; Fri, 27 Jan 2023 12:32:42 +0000
Received: by mail-wm1-x332.google.com with SMTP id e19-20020a05600c439300b003db1cac0c1fso5298492wmn.5
        for <linux-amlogic@lists.infradead.org>; Fri, 27 Jan 2023 04:32:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zOZLnCCSB4bMWTg2//OMRb+a8xBlO3pQtkZONx7me9k=;
        b=MBLQfSlFVm5e6eH4hLBrw51ODKea5IRMHFX6KcL1hiqtbCc5VyjKH9Uh7cEoRUUOWp
         rMBuWGZzfF8rCVg795QqTXKqrA0gLK5n5c87uTtCoR1YDMVaedTxj0VNOjuCt13lliRp
         ESkiVIJBDAHKWOrRLKoKeSXBkiv0GUFeHQBEm2CdN/zZKEWiqZH5DRKyXImCyn5B1ed0
         YqU0BA6+zRU7OUqHUbSkM3cf647JBpELsZiEhhgkmO0RqwZ4OaEZ+Q7IkJgHhI3Onw32
         s1NKfJPqM+Ucopvvv7N6ux9gyX3fiAHyxFBm1nCp+u2z0BWDMP3woH2iXrEFlvaPdsgj
         Ry3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zOZLnCCSB4bMWTg2//OMRb+a8xBlO3pQtkZONx7me9k=;
        b=zrYe5/HA0Kb+L8DkSwJq9tSNj/0qe3zURGgXitsvg5cDdyjWH+06Na8rSALMbI7cgS
         S21u/PaoK63w1LwIJtdakjLN8rYBAsZ/35njoQDR5rRPYHBTTUFIQU4pZaY2yDkFidnY
         JQPTNvxvAJ4Lhj6Z1KK7B1LxxCvXnfddZ3fMNyyatpzJd1Lt94M4E79ME58vpivecqZA
         EJNn8Faq5P463Eii7huEHO+SLrG1li0TELdUirczp+738ApCiscvI6tti4WnPBOchR3q
         UtWTDeLyQoe82XV5ik3BxKB2FiMnqeVSHx5FavoosQrinFDeBSkplrz+yABem+1WM8dq
         fHVQ==
X-Gm-Message-State: AFqh2krsWMej1G8Ym6VqCeiCn/VPaMBr90HTI4W5LvPn7TH5JXbYt8Kz
	LpYJ7gxol1aESRu2iZfMOP2DxA==
X-Google-Smtp-Source: AMrXdXsW1aVVkxLXdl4r65UZK22XQvImWGDpqsMZdSeZ7sW59AK47O9+z8LSxQk4XKzqNihmVuGDYA==
X-Received: by 2002:a05:600c:a13:b0:3db:1de2:af31 with SMTP id z19-20020a05600c0a1300b003db1de2af31mr31652904wmp.37.1674822759169;
        Fri, 27 Jan 2023 04:32:39 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id p12-20020a05600c418c00b003d9780466b0sm4143686wmh.31.2023.01.27.04.32.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jan 2023 04:32:38 -0800 (PST)
Message-ID: <c8c923d3-26d0-00ed-9639-251504950593@linaro.org>
Date: Fri, 27 Jan 2023 13:32:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/2] dt-bindings: arm: amlogic: add support for Radxa
 Zero2
Content-Language: en-US
To: Christian Hewitt <christianshewitt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230127110928.3387654-1-christianshewitt@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230127110928.3387654-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_043240_908277_7C5D44F4 
X-CRM114-Status: UNSURE (   7.69  )
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

On 27/01/2023 12:09, Christian Hewitt wrote:
> The Radxa Zero2 is a small form-factor SBC using the Amlogic
> A311D chip.
> 
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
