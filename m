Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD30DC6FD1C
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Mar 2023 07:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3kVdpaiDeVH/K/5xWrCI35MsdyQH5t52wRI0HSaZ7Ow=; b=eQT7HPoX+DaCvK
	/OfmTv1kHzrA3AxcyEGDYBr+wBmKXf3loItcQspw1m5aAnvZ8PP2cJhgMqby7zVJsR+6kDpM/FT7B
	ZjPlQCN1cV7iMhLPkNLtITn6olQT+qe58X97Ir6uuV/qkHU8wejuKUfV6uF+E9KWi25eGC1UNGSDY
	i+F5glOnnvdULbl0ML0PK1q//97uMSZzPRNb6RKhdh67T36dHKh8a2xXUkWqnfeXOqVIt4MTKpjaM
	H38f14XVmZLwqE320xbY/kgRN/KVo1jhBSORJ0yvjjdft1vPn4F+qhsmc3DK1+bQ9UBXl754iGOQD
	r6KvnV6E0pVMDlGzy5Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfFQr-0016j7-0B;
	Thu, 23 Mar 2023 07:32:21 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfFQl-0016i9-2U
	for linux-amlogic@lists.infradead.org;
	Thu, 23 Mar 2023 07:32:19 +0000
Received: by mail-ed1-x530.google.com with SMTP id x3so82575423edb.10
        for <linux-amlogic@lists.infradead.org>; Thu, 23 Mar 2023 00:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679556732;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ekZUPnt2Vozh7f2sOzqBtvIcIMLGfykVhoLT/YHh2xE=;
        b=pC6bEEtISpupKbooEnItYeOUxJJpkyUKbPbem4vpMOtx6RQac2zK/BBuPkaQwYGBn+
         2gghiVMFqGQq6wLhQp7Wq6bTizLcjze5sAJ6PIEXBGpPFU8S1E+NrTFq2pbnJCJtOnL4
         Sf5uGk32KUyZd5mpZGDcqco7zzaLNbCZohqhnSMddC0H7SeB5qH8WLxweIY5Slr7gZGU
         XftvzlFKCePNt0fdNwKCNfa8qnSOHK50tPgcXkc/xLAJk37H25j+CyEuZX+K3R/17T+Q
         YRhISXDaIPc5i9JJ2eL1c5NA2vjKeIc3i1MTeF1IyD4mfW1uuHX/SWG06F6A8cbnHV85
         xtQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679556732;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ekZUPnt2Vozh7f2sOzqBtvIcIMLGfykVhoLT/YHh2xE=;
        b=ak0BXU3qz8MMK6xfRBvQrdQFXf/9AwsvNR2ZmMEx177QUnakNqP9JO1Yn57W1RanOO
         D5GblBOlOepq4NUq3aivQoMoKwYBGPjjqzzsGmNfpg7is6VSsx0/Kg+7cT57TpuL1+I/
         3OnZJXN+TrkuQ0hZ7QX1H4c4BH6BWH4G+90+MPeOFMIM0xZYPKM9NH/q+e9qrksoSSRa
         8hMOcp/9p2UqgRVSEbH8xd2h98hJFtJdp/4p1DivqBq2b9i7yVkvcg8yvtOKeK0aTx5/
         yhl6HPUSB9l8vx477eYj6EZ8Rr2kojT4qqEhyq1rgHBv+XsNdJhoKMFkSey35MA2sS2J
         FqcA==
X-Gm-Message-State: AO0yUKVmzmsD5A6zXmtYgRABRUwHMJ92dto72awUKIMqZJP9g9ZpzuJK
	lrb8uTMe8PQ3dffjfRl/h47mmw==
X-Google-Smtp-Source: AK7set+ARGwKmwALE+hH8XP9VbFZ7LM80o6ORUW/2+pvw7+8GvYyhjllDHLV73FEqd6Olano8ZNlsw==
X-Received: by 2002:a17:907:7654:b0:8b1:7857:2331 with SMTP id kj20-20020a170907765400b008b178572331mr10035651ejc.65.1679556732624;
        Thu, 23 Mar 2023 00:32:12 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:a665:ed1e:3966:c991? ([2a02:810d:15c0:828:a665:ed1e:3966:c991])
        by smtp.gmail.com with ESMTPSA id c2-20020a170906694200b0092b546b57casm8249382ejs.195.2023.03.23.00.32.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Mar 2023 00:32:12 -0700 (PDT)
Message-ID: <b45401a5-89e9-16f4-1c58-50b465672e99@linaro.org>
Date: Thu, 23 Mar 2023 08:32:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] dt-bindings: reset: Drop unneeded quotes
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Qin Jian <qinjian@cqplus1.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230322173508.3971182-1-robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230322173508.3971182-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_003215_807907_C968C523 
X-CRM114-Status: UNSURE (   7.87  )
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

On 22/03/2023 18:35, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
