Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B510C3601E
	for <linux-amlogic@archiver.kernel.org>; Thu, 10 Apr 2025 07:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b5xmferro7MxBKm8emCcPpXG4bDTqLDbZmO11wyAMEo=; b=NpkdOPaLqlVQBj
	2D7mk3q+ZyZozTSyjSITfppv8FTlws1eIeJ7zuLTeHM3lvcCHwxDLw2YEkIlq92ksj5g5nbXU+IvN
	b6wGLX/7Z4CVCOQSDEcj3NUrAXsQohGnnTCG5MZRx/4jd6HyGc/1k8r0k35ji+gPD5WQmngs0K5X2
	Q+4AQBvHSA2nk7pXhgd6vBG8tNFVvD/cW8clLX+W11qBuS26e5MEF2nq7ENHmFOEQV/QqNqQjCSzk
	oNalaPBOrPQ3+AiXcgUKUeELpo/V16zHnL54gKbMD+gcJkUhPxefRMUsYF4VymxBHb381UHSPZrkO
	ig3/1GZXc0fC54u//d2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2mkQ-00000009dk8-0PYz;
	Thu, 10 Apr 2025 07:54:54 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2m90-00000009VRa-000V
	for linux-amlogic@lists.infradead.org;
	Thu, 10 Apr 2025 07:16:15 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-43cf3192f3bso4844235e9.1
        for <linux-amlogic@lists.infradead.org>; Thu, 10 Apr 2025 00:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1744269371; x=1744874171; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zmLueEOSOx1TOZ/xE11puxSYTKnDaeqcR4nW9ehtutQ=;
        b=TtgZhPVv+Uyxjc9Z47zOcAsnhdZM7K6DYu4E2L/NIvLhFco+V4NkL47wflk9dRVh79
         x+9pZZSekx9ZEcCD/SeJCIP3lQsZew2yX/rC5EpTZnULdJRPCp66K/k/Y5faAntdnzkY
         15LAXTOnzyzdoM1elS8EMAhNoPFuiR/UjyuJwIYWbiTybB/rTDq7dmEHKmR6QV47rJky
         t2QaQqY0KW2vFFc2ccoNJVf0lyZLJhZshby+Wz2N+ZkRf75YXKV/8+Mr+la5bQoLdkOT
         q1oRmQS1Jty++DNUmukaPTcXmCQNTFEcHXQ3za0aqonqeySuhjF3OVAGDEwxvC9gFQjk
         603Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744269372; x=1744874172;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zmLueEOSOx1TOZ/xE11puxSYTKnDaeqcR4nW9ehtutQ=;
        b=DacyiDuSfMq3MAHmAFcS6Hy0324tfwjVfrdHuT6snl2n6MzKTPFg9x6OcI9IG06vmb
         UES581H1jb1diXLog0r45CLPs1yRhPv2csvLrTVviZmwO9nRSvv7yAwSFHxu1LZbGRsO
         0jFsLPmz5ApoTgL0A0hda9R9Syys4w2oJ4mc2Vp6u9bcS8lxeNdvVbaoE8rbEelGgoW5
         uQKdSRWj57QPau0Vp7bAOuvzypswmIkRBEP3q/8s0q+OJ6H8OWwCLTkq7y8Zezsp9QkA
         oYzHg7ZHo6QAXNr5tzAtGy6OMh5gH9gwtzhAMWYTZ2f89c5YknfgDj7Pq5Mcez+os1Wq
         DLlQ==
X-Forwarded-Encrypted: i=1; AJvYcCXL6Hc1s9FmzW0GWD1dWtj0BJWbAguDSRs+mvOLvYnYJGNLP2Lt2Rbb/FtMxidLh6TwrkxRBbaZDV5D0Gwg@lists.infradead.org
X-Gm-Message-State: AOJu0YxrrkWTLzQwBI3Eq4ZfnRkcXEf1QVK80PEiY6vcSkcBeTMPqbjf
	G1dVSdcVg9GrvEvOvXY9+JZp0RDhl9tPDtiU/GCWPSbsY+NKJiQmqVUvRUDjb14=
X-Gm-Gg: ASbGncvFLIUPoaaokYv4ODHuS3R++1bVCfmnAkHxMu2sScNMFm+Si48Hu+vMRUrZdec
	ohHjDM0/3XMBPnRm5BE/lA0VAlwpFF0HbY+rjQG51/+1S0kz3UQvIHImVBoaJ+nJZ0rqXxqL1z0
	Wtz+IXYYNgR+nZC0orOTudQHF7q6b7QXc6H70kqcfVRk4VDsnNfNUO0vAtvw0T7ce/G4N+QcAil
	zLYOw5sXwQK5r4X84InefTUrte1i7bicUb6QnzYlnHdCwF/Jalw2nm67LWXwV7sVaBhldVTaXKa
	5YBRH0x/OuofSsmyulUgK7yFytAlQVAUQyhp4xYoVc9sorN2P6vXlO21/W8=
X-Google-Smtp-Source: AGHT+IEz5IG00lmAVwHCdXdSnJ2Z0KQTlp+V18IFUkzrkAAyElIVx0JjEnVPmuw7GvI+SO1ZUwQhPQ==
X-Received: by 2002:a05:600c:4ec9:b0:43c:ea1a:720c with SMTP id 5b1f17b1804b1-43f2ff0540fmr11919285e9.18.1744269371500;
        Thu, 10 Apr 2025 00:16:11 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f2066d069sm45329215e9.17.2025.04.10.00.16.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 00:16:10 -0700 (PDT)
Message-ID: <b8f356b8-b242-41da-a654-d937a354fc1e@tuxon.dev>
Date: Thu, 10 Apr 2025 10:16:07 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/10] pinctrl: at91-pio4: use new GPIO line value setter
 callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Xianwei Zhao <xianwei.zhao@amlogic.com>,
 Patrick Rudolph <patrick.rudolph@9elements.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250408-gpiochip-set-rv-pinctrl-part1-v1-0-c9d521d7c8c7@linaro.org>
 <20250408-gpiochip-set-rv-pinctrl-part1-v1-1-c9d521d7c8c7@linaro.org>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250408-gpiochip-set-rv-pinctrl-part1-v1-1-c9d521d7c8c7@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_001614_041286_3CD0B154 
X-CRM114-Status: UNSURE (   6.30  )
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



On 08.04.2025 10:17, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
