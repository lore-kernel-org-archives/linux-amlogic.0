Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7FD8C004D4
	for <linux-amlogic@archiver.kernel.org>; Sat, 21 Jan 2023 18:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Br9PfYGMTBqadESY5+Q9EZ1c8pEiNxNC1FWDDA/TeEA=; b=3cJAAjgwGI9CLk
	KSg5YEpf2EwMUE4boGpEpwgDBgkDIHvD4TcRp0dOooZgL2hvY5cMBpwRvn8tvMfi6RIeLx2s7gw8K
	5P7kneL2I1GoFXIsWcMrWfF/E+3OHfg8xp/NWU96KVLUHZuo8gnmQ/Ycbqr8anPAtVd34HyuIKL+D
	DjfDuxQva86fBiBQQUS4Kkl32UyoTT78zlk/XL5hkQ1Q4pIEevKdY/tR6fAne+4Jly5kpBCpZyslA
	Lg5gQ5Zj0dckwFPrnAeqj027t/dJvwA1jKmMNUwbSs11+CXfEn5dsCmt0W3YfrzMjhshVr4gFGIkE
	76nsEPTss0Zt6XufGiTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJIyn-00EIt7-T8; Sat, 21 Jan 2023 18:52:41 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJIyk-00EIro-JZ
	for linux-amlogic@lists.infradead.org; Sat, 21 Jan 2023 18:52:39 +0000
Received: by mail-wr1-x431.google.com with SMTP id d2so7466851wrp.8
        for <linux-amlogic@lists.infradead.org>; Sat, 21 Jan 2023 10:52:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ngf6C8Ou5uJHgmljPhG4Mf0c9oFhFgcZFIr9zgd3T8c=;
        b=bYaqz0tj/Khn6++kyaUpS1/DBgHHbdkXu/iYga3bJujcGvaNivFLj/wCCwYshgmKXh
         SikdpW5/jueLQs/LlQNXMWq3DmUQLI8uqNmjo/9Brafxd1AIKLcPhOFfPJ1qsU2shB1Z
         r9DIjgsuDBGX/vxZvfYqE3BlM3WSdXyl6XNSAk4cDv+8dBay1oDwim/fQyv7QktQ/V/p
         tfLm0xLmlQyIvrmhq4CBWdntwVyIEBNFZI6E04rBQwO/4YPCdulPs4KgkvTFk/vnPgRn
         3YfImXnEli83KmYTWx25u2DMqmXyX/ME+g8IU44tnNzoNdsIsGPSFnEsj7MXs4YTgNap
         XmqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ngf6C8Ou5uJHgmljPhG4Mf0c9oFhFgcZFIr9zgd3T8c=;
        b=YIW2LTxaIQcXGzFgcqM28BgPl0jSGLYmc4CowcbtL77cHo8ggi9tEq4Ysxwh486ezf
         cYIMTIu3oKv/7vqctOKwQM3H/7ao15Fh0uO/xUwo0gSvd1glhw5BfRZpDmho0icxu3oe
         e+scftOqAfo9rtQoGGXsDgNv0mT5N754ZEvL9vlsoZiwd6J4DzpWqphN9oLE6KyNxfkS
         jBVXbnsRw7Ply3HK2qtMsm8F6uR05jhhqUY6mmDIzM050StaE4O+qtql0fxmeRfeq5RZ
         akgSWi7SulOyG4jGGZU5VbLenM2xFTNT7sXgx9Poof3kmgK90XC3wINvRn5SqPuZYIDu
         p4IQ==
X-Gm-Message-State: AFqh2kpJpEHPI6kVZyPEsc3XSClPFnTy2ALwJx6IpyuoR/vMeRO2lI+G
	Tjfnbh9vMMXWQV15qx/FXKX6Yw==
X-Google-Smtp-Source: AMrXdXv8n66dcnGj8QTsiWJKzX1M9YdavoiJFsFZ/FkXTfi2l2iPlyG1ie/uLmMptiuTN/VmbYyZcw==
X-Received: by 2002:a5d:548d:0:b0:2aa:438a:2165 with SMTP id h13-20020a5d548d000000b002aa438a2165mr15730125wrv.24.1674327149444;
        Sat, 21 Jan 2023 10:52:29 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id bw26-20020a0560001f9a00b00241cfe6e286sm245062wrb.98.2023.01.21.10.52.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Jan 2023 10:52:29 -0800 (PST)
Message-ID: <df1c8545-01d0-3821-0c19-07a369e40472@linaro.org>
Date: Sat, 21 Jan 2023 19:52:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v3 6/9] dt-bindings: usb: Add Via lab VL817 hub
Content-Language: en-US
To: Anand Moon <linux.amoon@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-amlogic@lists.infradead.org, Matthias Kaehlcke <mka@chromium.org>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230121175639.12818-1-linux.amoon@gmail.com>
 <20230121175639.12818-7-linux.amoon@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230121175639.12818-7-linux.amoon@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230121_105238_693029_B32E8E4E 
X-CRM114-Status: GOOD (  10.15  )
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

On 21/01/2023 18:56, Anand Moon wrote:
> The VIA Lab VL817 is a USB 3.1 Gen 1 hub and USB 2.0 hub
> controller that features 4 downstream ports and 1 otg, with
> an internal 5V regulator and has external reset pin.
> 
> Add a device tree binding for its USB protocol part.
> The internal LDO is not covered by this and can just be modelled
> as a fixed regulator.
> 
> Add combo of USB 2.0 and USB 3.0 root hub using peer-hub.
> 
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
> v3 - address review coments - Krzysztof

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
