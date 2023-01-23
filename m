Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C369C05027
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Jan 2023 17:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tFp5yeSH+lJ5+CnhBSxIM0MSkLzPi0hPJptXkb6gLGE=; b=qlAfxYcxl2NnuK
	4QYvrOIP3vi3ICu83Km0XElYAF7ns7E61VmZBTPgTWTfuEy2oPWl4BzxqyI2hGg6D6E0LtEma7bnm
	lTtueGM7QRhB6lQNqmf5mtAZm4OFmven3b7I02Kpf6FnDXxXS1xflJLkXpE0QEyjfa+j/1hvs83e0
	ByuwIPaaSOQgxbWYsg3nQfuGo0x2zpgrcl1SMF5Zym0XWaCzySI1+m9DAnAxL2ujLMC1FxvEiDeV3
	RChqkeF8udGGtGNkVjKP5Q+tLlQGIzIhMHGXqECnvEWfkyuTMq3QvH1mA9qz9ysuZRdm6ffAiaf8l
	zmHACElKxpSvzf/yEOHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pK0dD-000rTk-Ej; Mon, 23 Jan 2023 17:29:19 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pK0cz-000rPV-Jp
	for linux-amlogic@lists.infradead.org; Mon, 23 Jan 2023 17:29:06 +0000
Received: by mail-wr1-x42c.google.com with SMTP id r9so11529788wrw.4
        for <linux-amlogic@lists.infradead.org>; Mon, 23 Jan 2023 09:29:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NwTlvuJuAIghS26NnVpyyRvZGcuEOs61IaO+NF4nagQ=;
        b=uhYIvcjkhXGu0oqqp+6e+ZBJPe7uq/YlhETV7dqCwosYuLYgrLpNHwHvCjyZ02X1e7
         Ue879m3+ZfoWbgARPz2iBlihA1+FCgRYsItbUA3CZ9+stz00N2Sxu/fCCGbgI2H2/EVz
         jDAbhTXBIKFJqaLY/JKav0H9VVnFxZcViXcqYnjIq3IB8/c6Jz0fEtSciklsodsxr8yL
         zrNqKh6wxDG+sUX4KgTc+u5Q4NbLGII3NmfWtWUfDOcitF4E2b6Vb8RDC6Xoh2IFlo5M
         fD/Tg3F1u+1tIZtMmDNTgcJq9zyPPKRFU7Jp9UKSwRbGhT9ibVCgopuJ1kW0v1xso7Sn
         UKwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NwTlvuJuAIghS26NnVpyyRvZGcuEOs61IaO+NF4nagQ=;
        b=sZpY0s0RuwvW9B0EXCvDFQFDZlswHA06GS2YTyy+4mUi05sW23A9i9bxiJcMEBegr+
         tpMrZdVieIH62nP+XSlF9qQsbgmWJVrU3Idi/GExQ6xi7ezQoEPsTh3O5DYNA6EH5/f4
         axs3m5RO3H9xrHeesWXjM5pFB0rNYsqbGE3fgqxnTae93muHZjYiixXjFJma9bmDnUsv
         /tzvY7dvZPH8JYCLOeySalxRP7VAzQwknBkyn0HNfAEA66KZOWEx8ualGKIombzhcut2
         LRpUrLXH1EIofLAKr3dWs/wq/QJDpUhHTgOJDftAcUXRAnywDCZscPXQNABZnY8XMe+9
         bT+A==
X-Gm-Message-State: AFqh2koNiV/aPoThuOtp8QZh13lvfzS/rdzJKlBuXk/H60LLzEDU6B2F
	YIAOLUoht11bendbCDzwBoShFA==
X-Google-Smtp-Source: AMrXdXudl+2yzwvw1jE0jM6FJ9tqi9H9sjhc16bH/xfVrnV+/acM7WhMX4jqg9wMdEYt+l6LXUQLuA==
X-Received: by 2002:adf:f0c7:0:b0:2bd:e18d:c9e5 with SMTP id x7-20020adff0c7000000b002bde18dc9e5mr23003524wro.40.1674494941987;
        Mon, 23 Jan 2023 09:29:01 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id z14-20020a5d4c8e000000b002bdbde1d3absm6950014wrs.78.2023.01.23.09.29.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 09:29:01 -0800 (PST)
Message-ID: <de7fec53-fe03-456a-8464-d60fdf32ee06@linaro.org>
Date: Mon, 23 Jan 2023 18:28:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 1/3] dt-bindings: arm: amlogic: document Odroid-N2L
Content-Language: en-US
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 Dongjin Kim <tobetter@gmail.com>
References: <20230122-topic-odroid-n2l-upstream-initial-v1-0-1ce5e08039d0@linaro.org>
 <20230122-topic-odroid-n2l-upstream-initial-v1-1-1ce5e08039d0@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230122-topic-odroid-n2l-upstream-initial-v1-1-1ce5e08039d0@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_092905_686427_942FA17C 
X-CRM114-Status: UNSURE (   7.42  )
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

On 23/01/2023 15:07, Neil Armstrong wrote:
> ODROID-N2L is a variant SBC in small form factor and some peripherals
> are removed from ODROID-N2PLUS based on S922X SoC.
> 
> - On-board ethernet is removed

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
