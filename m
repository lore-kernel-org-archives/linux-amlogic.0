Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1F74C54EBC
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Jan 2023 10:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YTHn3GkfybmOX8CmikPKkmFR+OjWFxT+Bj6Bi3IRUlI=; b=GrU2dLaaq7HXhU
	F0VrGxaxAmpGHkRvc0wNQ/uL8JlRh1bk5sKlDgubVZMz5EDlTCzE0D7wQQCnlwcNSDvfda2Cr8B6W
	1Pvk1aoyQdS3TsKPoy/wIWxJ3ZAey/1XF+GJ4U8RojjTmzxEk0EMEn+3XJM5wq/c5EBmZB6J3r70V
	WJy7HWALADUsx2WLpFl4ArM55MuhTp4KDqdwU6Q3I3iVtYU2fV06nrF3tzxX7soBooGUdNm0dAcwf
	4qW/AbZA9l+EmNbkgTV2HHpdUrDzZAhe380rPFSKo46LZGVLmRPtEdLLRZS7JD5/qJKEq0SsfQLmW
	+J4NpJgGR1JCaXLNWszg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFBdx-006I9t-Li; Tue, 10 Jan 2023 10:14:09 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFBdv-006I8D-4U
	for linux-amlogic@lists.infradead.org; Tue, 10 Jan 2023 10:14:08 +0000
Received: by mail-wr1-x42e.google.com with SMTP id v2so169923wrw.10
        for <linux-amlogic@lists.infradead.org>; Tue, 10 Jan 2023 02:14:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jojCCGfavVKv5imMe2sO0IZFTAm6Qt+UkX8aAOYmM8Q=;
        b=bbhb/M2Tbo7P6JQFLKz1c0s92pip1LUY/qoQtVnezlvmXlve3kgyeNba8+WtmX4t2D
         Dqs5HvWz9j8ad8G7zjQAKt2OUhJ5oPpmAugq792ubXvNuvlNgx12r2eNxoiWtfJtAgkc
         ln8dRvw1xf/0keWdYbSaNriNWp27rABFZucUCHjhkgOSv2oYBu+gDWHpRQmu7nuZYux/
         Ch1A4NbCcbmL1JAXJRKL58l8adrR3ecbI+lYW+4ObQNnSVJc2XVqhStvYLd1MguXeStw
         ks3SHXuek07nXLDarhxwAioHsl5xyI708nCoT8Z6Vdq/Uf2JhdoccDoTWgGesRpg8BQ0
         zb0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jojCCGfavVKv5imMe2sO0IZFTAm6Qt+UkX8aAOYmM8Q=;
        b=5WAV71zeu9QB2XKJfGQYYoY60ayNbffdKILqwh0ybmVqqBDLbNzvFDC8+ekbEEgZ98
         7CIhWt8G18jgBKhIqaPOx2FikeG5Sq146cnPxhpqaStyDxCcpepN1AuQN4qkHqCI+awr
         CYgcHSykldTqK0IEpuynDcQDOaCFSti40ZKJiTIWU/gJy2h9JL2V9OTIauEiSn76UCst
         jX3LMMf/ArBnuFQJw3UVJ/8YNJ2iGvKVeFmHyG3Z55YzHmmFdyV1i7TYjW2vf0o3VdAz
         Cuj3rp/+n8ZQelG61kn0/fFjqDsBQn+Nw5e2nWjkJ21Yvytq1HQH1q2QTJgCuaav9QYf
         9J8Q==
X-Gm-Message-State: AFqh2kqN17iJX1kQz99N/0rwxtXSaEvUUCdPwNvs9CTIbTEZGTwGN5pE
	XzRjxCkwr2TOB6J9TKGuEI6ojQ==
X-Google-Smtp-Source: AMrXdXsns+wODkeVA+eyVg6DWDP7h4ZsUK2KoND8WPXo2OLQMg/ZUcoSsqQ0z3Y2wBq+9Yj/x0NG4A==
X-Received: by 2002:a05:6000:16cb:b0:242:1b0d:9c58 with SMTP id h11-20020a05600016cb00b002421b0d9c58mr50376842wrf.69.1673345645653;
        Tue, 10 Jan 2023 02:14:05 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id a10-20020adfdd0a000000b002bb6b45ab57sm8867372wrm.85.2023.01.10.02.14.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jan 2023 02:14:04 -0800 (PST)
Message-ID: <6044f85b-93f2-fe2e-68b5-9912836f4a38@linaro.org>
Date: Tue, 10 Jan 2023 11:14:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 01/11] dt-bindings: firmware: convert meson_sm.txt to
 dt-schema
Content-Language: en-US
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, Bjorn Helgaas <bhelgaas@google.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-media@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-mmc@vger.kernel.org, linux-pci@vger.kernel.org, netdev@vger.kernel.org
References: <20221117-b4-amlogic-bindings-convert-v2-0-36ad050bb625@linaro.org>
 <20221117-b4-amlogic-bindings-convert-v2-1-36ad050bb625@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221117-b4-amlogic-bindings-convert-v2-1-36ad050bb625@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_021407_211850_E74D7406 
X-CRM114-Status: UNSURE (   9.57  )
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

On 09/01/2023 13:53, Neil Armstrong wrote:
> Convert the Amlogic Secure Monitor bindings to dt-schema.
> 
> Take in account usage the used variant with amlogic,meson-gx-sm.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
