Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 630FAC77B75
	for <linux-amlogic@archiver.kernel.org>; Tue, 16 May 2023 09:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2tfXiN8NzNS9dZSLrBYRQ5+cTulx690qDpQLilIZnVw=; b=tFN9SQYuVKfACJ
	XKYRr+wy/ogeaCwh8vCU6pnh9cpEZ7JGIgR7DmW5S9YLPdnAU2xPQcZ2dXHqSWDDo59Kq7dPsFOZt
	GNE6KZ+gZcrkOoHflGE9HifV+NtB1hl88frbyZXJ3WeYfvVAEN+OJlM19r9440KHMB+qmqJmsnnPc
	GP0AzO47jXzC9H1Wyq3PdEMbmXzuaosC5CHa4aItqff2I1ZzfTCFaj826EZr8RxVh7Sn7XfpNMLeB
	yzjh3bF5OdyCiA1w9AjLemKafMX5xiJmI6c5Rv2I75skXsSe5CKmEAviqehw/aTXex6Yz832ZWtNL
	/eNsuBJFDXuK1ExKk/Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyqsG-0052ok-0A;
	Tue, 16 May 2023 09:21:40 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyqsC-0052nN-1o
	for linux-amlogic@lists.infradead.org;
	Tue, 16 May 2023 09:21:37 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-50bcb229adaso25221210a12.2
        for <linux-amlogic@lists.infradead.org>; Tue, 16 May 2023 02:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684228895; x=1686820895;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cLFC2bNX6txLnjTPD5+kbo++oGCyGs9/o5oXQDZQo4c=;
        b=iu0gLDPhCLaWcd6EPNDAMZ6RADmZTS7G17U99YpQtRVBlZ5XuiIUPr6/uZOmxwbE9h
         xTJ41HMul09+N1P7ZoYma9BMw6ie+5PW+hznisj7u8wHbDV+4fC7oTzMO1n9uAXz/1Sz
         QLRhsg24PRZUztVMhLfV99/GvIMJC5jcDPTZ4SYjpxMkvaU4Fx1Pw4tFyY2bpxySNvKG
         w/f49Nb3M/glSIUNwreXGY3xjvPh39lKiuehClugMZQCOeCcwqONa60EYADMN04C9Y5t
         ZGi8JBWP+pFZAz3uZELImxqWYSAU3jd1KEX3u+MvlBDFl1qsLTUAiCs2tcijr6lJhhcw
         c7aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684228895; x=1686820895;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cLFC2bNX6txLnjTPD5+kbo++oGCyGs9/o5oXQDZQo4c=;
        b=K/GaA+O++dqWPBY/nGO6QGETdb6icXP/KKzIkhCukt0wXFh5ZLQ5r0BFN3YPCqaPz2
         Aob+nMdX19ZcAzQ/xxR9A3jaqtRn942dYWLT5P6f5oDv6+tVd11YDKrfaeK6MCSp8FHY
         zwDdV8leZ+5H7nhQ5J29DlCaNm89kehlwpIaOeUifwCOsc7WnkC/YI4gjGpvOS3UWegq
         uv4XaHULWkTd6LNhQ3f4b8RAwPhr86B3RjPpLZVBNxPjEzGfB1sIPkftmOCKhsmadwhO
         CQ1c9WU2V/mvk2EtZuWmCSBZkH0QYJEUMCT+3qQ5vY0ADls81O6tO2siyjWoXU0xp/85
         2BWw==
X-Gm-Message-State: AC+VfDxXnpYi8yEJnomQmK2A4t4P8R9cvI28H70VYvxEN8/EBs3zFCHw
	/pzGCyoSwW1SmOWwAbJMcm+1iA==
X-Google-Smtp-Source: ACHHUZ7pSEzzkRBU/kT98UVCxfWhQeBfw5kAf0aPQHsa2kgcYfw+RMjIwWa+6b7fuAWllQ+0Y+XM7g==
X-Received: by 2002:a05:6402:614:b0:506:c2d7:503c with SMTP id n20-20020a056402061400b00506c2d7503cmr28441142edv.41.1684228895224;
        Tue, 16 May 2023 02:21:35 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:77d1:16a1:abe1:84fc? ([2a02:810d:15c0:828:77d1:16a1:abe1:84fc])
        by smtp.gmail.com with ESMTPSA id q22-20020aa7da96000000b0050470aa444fsm8008834eds.51.2023.05.16.02.21.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 May 2023 02:21:34 -0700 (PDT)
Message-ID: <f2c348d1-4ffe-d515-17d5-ddb25bd38f53@linaro.org>
Date: Tue, 16 May 2023 11:21:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH V8 RESEND 2/4] dt-bindings: clock: document Amlogic S4 SoC
 peripherals clock controller
Content-Language: en-US
To: Yu Tu <yu.tu@amlogic.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: kelvin.zhang@amlogic.com, qi.duan@amlogic.com
References: <20230516064736.10270-1-yu.tu@amlogic.com>
 <20230516064736.10270-3-yu.tu@amlogic.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230516064736.10270-3-yu.tu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230516_022136_600664_D0229676 
X-CRM114-Status: GOOD (  11.40  )
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

On 16/05/2023 08:47, Yu Tu wrote:
> Add the S4 peripherals clock controller dt-bindings in the s4 SoC
> family.
> 
> Signed-off-by: Yu Tu <yu.tu@amlogic.com>
> ---

This is a friendly reminder during the review process.

It looks like you received a tag and forgot to add it.

If you do not know the process, here is a short explanation:
Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions. However, there's no need to repost patches *only* to add the
tags. The upstream maintainer will do that for acks received on the
version they apply.

https://elixir.bootlin.com/linux/v5.17/source/Documentation/process/submitting-patches.rst#L540

If a tag was not added on purpose, please state why and what changed.

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
