Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8670AC25B50
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Jan 2023 18:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/0eW1F0yUoqfM/tErYeU8HwAmKezUNmMJF5kUsXOVWw=; b=WVCaTs1lxuaBRi
	KmdEUFIm829mtUty6MeFuUxmzkFgBVCxTGz3WRmGLypSQGPWUgBHwRRHomLmGm40HJOQXVgNoqztX
	KCpsuJBWTZ8Nob6SRAxk8/bIGLUAynqrg4e+rIULHVOnk8rMG2zHY7qZwMfj46qsFbiyxHETwEqVH
	0MywGLWlQms7W9z5eUlPx2dxt7cXd3zJUrRS3bYeYDSvMgvPgMMdm/ZA/f1cxH7FKFR577cee8oy/
	GJo9gA9K3MzE+lbNSZ2x32p7WYP3oQt6MrozC0NkxaHUHSQyRtn45WQ0AuzOp8TFiV8iey3KTShHd
	gm2FS+8X+j8QCnXADBdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pK1zf-0014ra-9A; Mon, 23 Jan 2023 18:56:35 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pK1zd-0014qf-84
	for linux-amlogic@lists.infradead.org; Mon, 23 Jan 2023 18:56:34 +0000
Received: by mail-wm1-x331.google.com with SMTP id m15so9810592wms.4
        for <linux-amlogic@lists.infradead.org>; Mon, 23 Jan 2023 10:56:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7P5hcEaheNNmOvOI92M/UaXJ9usXWngKAfzU751Q808=;
        b=Dh+IPZrC81ABHdlrTFXxjKVt2deQLm6OYqnMWLhyblF2Vs9es46cOfQ3Zssfyg0b4Z
         iCS7aLuxdeNS39SCSFy6TFKLWwYYwz6quXz2vEUw4jCxvjFVAQvGTTobkcOoJi3HXYL4
         Trt48iGMnCaDgwgcLp+ZAegL5JUSDNYp1v6u93XzqrFZXpdtdY89DJQt2nUqMqxWSS+s
         vDHRmHU7UtP1P6OuXyrQhAjlBV7+TK3ps6nQxFvLAVxR7Es14xqVDh4JPFlYWWETCNWn
         qoRM57JktCazOv6GwRFxGE4wQDgHc9Zdj/9lDM2I5k7R98bgcvq5C2aO+70W0jpI5JbP
         cxig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7P5hcEaheNNmOvOI92M/UaXJ9usXWngKAfzU751Q808=;
        b=04n7gDiOa3oC8HucNGbjIDC2H08495XQQ1TeacWz3MgF+qFP0TyHsjEi0zxpwfQd4I
         wi1m4/+seadgjZDeU4qyN+b2GX5QaTaZMRUHlol8XGqaDyv6R/FuqLmu/vKs6i+ZBG7d
         wic9tC5t3M3qCXthehGORcn4L6AHXXQbRFYVlhCn7gXacTLLIb3nQ8/CNDRbI8ZfshdO
         z6U+HfWUz8Eb3Iim5TAYnHEfD6uGyG5xWGHNgR8bbqYppaNlYQe8T1hASgKg7yzk8sur
         nRpYcxtZ0kBOFhH8jcgtbGK+epjbB4zz8sGVZFOGSTKthWo3c++ZULvfU9d0WKIzPt1v
         UCww==
X-Gm-Message-State: AFqh2koftLLy8cmv6T0C1eFyuUtpsa6gNqAtKh59fhjV+cA4P1w4jMX/
	58OcuFio1Qw2kfg8uUciZ0WVsw==
X-Google-Smtp-Source: AMrXdXsHIotgqdwCyduVSCyhPS8Cv15rRVIPuogNv2CC3YO5vKSQ9gSFrBNp+pSjVYcFJknpowzMmA==
X-Received: by 2002:a05:600c:3296:b0:3cf:82b9:2fe6 with SMTP id t22-20020a05600c329600b003cf82b92fe6mr26077571wmp.8.1674500191948;
        Mon, 23 Jan 2023 10:56:31 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id e17-20020a05600c439100b003dafa04ecc4sm16964wmn.6.2023.01.23.10.56.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 10:56:31 -0800 (PST)
Message-ID: <2b5c823f-16a2-297e-5f0f-04e4a7f20dc9@linaro.org>
Date: Mon, 23 Jan 2023 19:56:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v3 2/7] dt-bindings: nvmem: convert
 amlogic-meson-mx-efuse.txt to dt-schema
Content-Language: en-US
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ulf Hansson <ulf.hansson@linaro.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-pci@vger.kernel.org
References: <20221117-b4-amlogic-bindings-convert-v3-0-e28dd31e3bed@linaro.org>
 <20221117-b4-amlogic-bindings-convert-v3-2-e28dd31e3bed@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221117-b4-amlogic-bindings-convert-v3-2-e28dd31e3bed@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_105633_322545_091B7469 
X-CRM114-Status: UNSURE (   7.11  )
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

On 23/01/2023 11:09, Neil Armstrong wrote:
> Convert the Amlogic Meson6 eFuse bindings to dt-schema.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
