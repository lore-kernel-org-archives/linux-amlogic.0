Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04238C4167B
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 Dec 2023 15:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/gy43BMUZObAHFkRkyVYcJ60pVjEHZ3sfmk9y2XXHHM=; b=W22uNXtFE0kvjk
	nAiSlKFnW1JFSVSoM20NhVlwtRS2G0iI8p9fJezXvOHh753tchn51BqPyBRLO7z9fTnrh4rq/Raos
	Ujat/OLpBAVtt/zYNjgXx4Ctx1R72VYBqYnqbh4NfFqPo/yyMdvTQWzRaHMkUR41+U0T3saKGO9XX
	Pgq08vX+LtJWqs16yeF/XssYBK+CSW9lZO0mjxKChTyVuGOD5U+Mi0UMmcLC7SIJYGU1WXDVSlmq5
	oUxPXQgNIbiBXeZlhJ5BAg5grptJ4Cn7wCdAYQtivawD7XT+9MtiHhkoYYeIjRxcR2evfXtHEz0g4
	l55Cc2PynZPcZD0fwJmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAAg5-004vKM-2I;
	Mon, 04 Dec 2023 15:16:09 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAAg1-004vHo-1o
	for linux-amlogic@lists.infradead.org;
	Mon, 04 Dec 2023 15:16:07 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-a1a0bc1e415so383914766b.0
        for <linux-amlogic@lists.infradead.org>; Mon, 04 Dec 2023 07:16:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701702961; x=1702307761; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MjrwjOw3+Tvjb8hNRyq77ryL3bFdg6Z++NUlWXD9Q9o=;
        b=jCJ14AUeDKOjBTMrfgWo3UKpfQGCXZkcoaLS9Mix+zsxO9HqFR/vnkfdYfIVDgt72N
         YEmv9j0eI1CcU5j9qMAD8yUNQecOpcgo1vhZmdYMWcWXmTQOcR1tWGjeNssZxLLN/T2t
         lOpUCzCpM5i0WAj9ThC1O5NFU4c0sEHfLxz8FF6Tox8lCv7hFuq2jRWEtx4d0iOKMf3B
         Rg1HlvOp0e0zGksPrgfjUlLe149bOO+QwQ10JQibM4hRVBY7P2H9dFB5wL6j77GM+uLX
         aso+NxC5elb/3SxPZHhV2avCSGNjXuoQxwI+TvjX9Q9YjC8n0Jsxc5A322JyULxe28ip
         nxuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701702961; x=1702307761;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MjrwjOw3+Tvjb8hNRyq77ryL3bFdg6Z++NUlWXD9Q9o=;
        b=McYwAZs0mYYKdiYsGmdvsM88WzGXmaMi0WtK28NODpakvBj+48bNcs1Bq9eo4bVImq
         bPOgflzT2H5jMaxv4l97l/cqV9S5zrVqm25xnmSfjSVxrhzeBU2I+n6g05+q673GP4PS
         H1C+3Hi0ZC+AZqEmJt+IbH+KIgFIWBa0qzLUyhVeKQHgaZ+mb/7c/VRYuszotg67JqzP
         /g1/0fqKD+Ojiw24F9/4NtCE0NSW25Sw5RgqDXQ1Q6oYcdCKObmxvkPxX3/+sOoQfRRF
         CGVBEDOkGg3ZbGBac1L5b//rXlbykJgiH06Sd/OUexpDHG309Dg28BkZyrK+IwQ7j1bF
         EtVw==
X-Gm-Message-State: AOJu0Yz9CJiR66jyczP4X8nm415altOhwyqKj1erOZHK6UhYKr9EA/wN
	Akgol67/94pv9x+t23So249xGA==
X-Google-Smtp-Source: AGHT+IEKRsJzXfpna9qE8QVoubJOp+KbUZIo2KcojfZLAPpx5dd/lIUPv+MfGPNt+r7FzntZ1soLsQ==
X-Received: by 2002:a17:907:508d:b0:a16:4edf:d5da with SMTP id fv13-20020a170907508d00b00a164edfd5damr2465422ejc.10.1701702960943;
        Mon, 04 Dec 2023 07:16:00 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.109])
        by smtp.gmail.com with ESMTPSA id u23-20020a17090626d700b00a017da998bdsm5390585ejc.32.2023.12.04.07.15.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Dec 2023 07:16:00 -0800 (PST)
Message-ID: <1d6625f0-1c69-46ea-86d1-c4adabfeefad@linaro.org>
Date: Mon, 4 Dec 2023 16:15:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] docs: dt-bindings: add DTS Coding Style document
Content-Language: en-US
To: Dragan Simic <dsimic@manjaro.org>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Andrew Davis <afd@ti.com>, Andrew Lunn <andrew@lunn.ch>,
 Arnd Bergmann <arnd@arndb.de>, Bjorn Andersson <andersson@kernel.org>,
 Chen-Yu Tsai <wens@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>, Michal Simek <michal.simek@amd.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Nishanth Menon <nm@ti.com>,
 Olof Johansson <olof@lixom.net>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <zajec5@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org
References: <20231203174622.18402-1-krzysztof.kozlowski@linaro.org>
 <2223b302fc43959a61578aae9cc3a15a@manjaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <2223b302fc43959a61578aae9cc3a15a@manjaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_071605_726792_1354FCDC 
X-CRM114-Status: GOOD (  11.25  )
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

On 03/12/2023 21:25, Dragan Simic wrote:
>> +Order of Properties in Device Node
>> +----------------------------------
>> +
>> +The following order of properties in device nodes is preferred:
>> +
>> +1. compatible
>> +2. reg
>> +3. ranges
>> +4. Standard/common properties (defined by common bindings, e.g. 
>> without
>> +   vendor-prefixes)
>> +5. Vendor-specific properties
>> +6. status (if applicable)
>> +7. Child nodes, where each node is preceded with a blank line
> 
> Another small suggestion...  It would be good to put the property names 
> found in the list items, such as "compatible" and "status", into 
> quotation marks, to make it obvious what they are.  That way, the list 
> would also be more consistent with the property names mentioned in the 
> sentence right below.

If there is going to be new version, I'll implement it. Otherwise it is
pickiness over style, not content essence.

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
