Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B6CDC4708E
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Dec 2022 08:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Subject:From:
	MIME-Version:Date:Message-ID:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tPdh1fuKZDy8PYZfCS0SIO+nBSuYfQViBPTMCjovpwc=; b=T2naucfDVvpz9rOIcAzVWOV7hi
	Jb0FC0raJ06ETTQDZo8WS1lpxT9oGThXr7m3ceqvauCJFqrqLL1rLKByQtQ0Gpd4PY6vcwp3us/Ug
	ngMlib2JvjKs5wCgAw7gZcutBsxp9rPODHkx4yjUqx5/f6NcG853R4X6Lj1Q0ntjwPsto7W2JtJO2
	srQFn+lKJYWAOQqgFyHyzRhrWoGfJ+s9657iIf/ilksyDamqm/dOFhf+dMQU68U0W7G+I4LW0qPue
	3frR1VT7+CL/Ut7aac2dw1FKKlV/Zv8tyky0fbuKGTQnNX/BgO4dVvzoE5ssYAHgJLBikmhBVkY99
	vowy3ZAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p26cP-00G2KC-2k; Mon, 05 Dec 2022 08:14:29 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p26c6-00G2BM-QV
	for linux-amlogic@lists.infradead.org; Mon, 05 Dec 2022 08:14:13 +0000
Received: by mail-wr1-x42c.google.com with SMTP id h11so17304370wrw.13
        for <linux-amlogic@lists.infradead.org>; Mon, 05 Dec 2022 00:14:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mOAaEDQ/+KQ94HSAsqFzfVKtm6woYUzL9fBYQMgBuLc=;
        b=e2HPFLjESRMzz+xhAqeTVs6J7M+U5l/REgtnswgMQLAoEHF/udvkXCFDUTJYrrvMGi
         jHHsPiLyYeKKoRaxUjgoK7P8q2ezNypfzTTxa0qlXXVzoCFdagY3iEM9fu6Pl/3SlkM5
         kNfB4w+ejaH0GTXmk5Cgws3weouY5xJ4dC82oEfJbV//rO+LNGvQzpbG+y9ly+gIi1d2
         ejLRyrd3502i1iV1ag9UqznyKebBPAEpbOWpMlg++nslY0vV10UABAICcYEElgww1IRz
         k3xU+st9iv1wiJ29GiJOjUTyFkkR0atN/Gc/rgw/RldEa7aJdlE5Lm+QB5Jf7FUrW3yh
         0b7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mOAaEDQ/+KQ94HSAsqFzfVKtm6woYUzL9fBYQMgBuLc=;
        b=y4lgeadcb/71XgiBqs4NDJ+Th9jFv+yD9mD25/Rrk7jYBHMIiiwaPw/g6CJzXoWTtT
         5tqrnfeg1jJgdRO8NJtKG6BR/Yc2skMssdQ/x9bhiUm/zWaRlwmijixPKt74yfqZoEcn
         ZQAgjikm+vZZ8ZZ4jHUlgmBLZgyRqzuNneT+b4Y6tyMJS7pUfP/L6Icg+3gM4wSG/ZIX
         sexshOWm102lwllLUQIpHOSYoYiLmtgo3N43kzFgYvRdqd/n3DY18fcAMYLWa0RFMYNp
         aDuOBwbkKV31HQRDiLMaruUSd1UF9BkwUYLF6gDMxBKEq2J9WBwSSeai3nrKKLV3oo47
         sBTA==
X-Gm-Message-State: ANoB5pmeBGVxHrYFS2a8+CtTSXRzqlbFj42nJgNI2uptgKbhcyb880Mn
	tAL37cXGUjcpApOLqpCha5dn8A==
X-Google-Smtp-Source: AA0mqf5Ch2HHmf8vDl45Rz3/ktkKscqe8a3oGxpy7NLT/9M1FQnwqH+PvbPyBevvGm9zi9w+mCtgXw==
X-Received: by 2002:a5d:5685:0:b0:235:f0a6:fafd with SMTP id f5-20020a5d5685000000b00235f0a6fafdmr50278628wrv.75.1670228048267;
        Mon, 05 Dec 2022 00:14:08 -0800 (PST)
Received: from [192.168.7.93] (679773502.box.freepro.com. [212.114.21.58])
        by smtp.gmail.com with ESMTPSA id z10-20020a05600c0a0a00b003c70191f267sm23656674wmp.39.2022.12.05.00.14.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 00:14:07 -0800 (PST)
Message-ID: <938d6732-adc8-5e45-6177-33cfe8c1ab70@linaro.org>
Date: Mon, 5 Dec 2022 09:14:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 4/9] media: dt-bindings: amlogic,meson-gx-ao-cec:
 reference common CEC properties
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Joe Tessler
 <jrt@google.com>, Yannick Fertre <yannick.fertre@foss.st.com>,
 Jeff Chase <jnchase@google.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20221204182908.138910-1-krzysztof.kozlowski@linaro.org>
 <20221204182908.138910-4-krzysztof.kozlowski@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20221204182908.138910-4-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_001410_991520_AEC874A2 
X-CRM114-Status: UNSURE (   8.58  )
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 04/12/2022 19:29, Krzysztof Kozlowski wrote:
> Reference common HDMI CEC adapter properties to simplify the binding and
> have only one place of definition for common properties.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   .../bindings/media/cec/amlogic,meson-gx-ao-cec.yaml        | 7 ++-----
>   1 file changed, 2 insertions(+), 5 deletions(-)
> 

<snip>


Acked-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
