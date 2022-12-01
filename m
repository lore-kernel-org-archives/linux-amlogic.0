Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A755C4708C
	for <linux-amlogic@archiver.kernel.org>; Thu,  1 Dec 2022 12:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JcqI4LSSCUYKWmsIByxz0JMuFxSTX8VWwSPbATd9380=; b=VV2t+4KxVclMLLLl78g951YHcP
	g7E8wkecSIh1Ix2LWKLf+SipgZM9KaoBfhqKQaijkYFVRvs4surXYKVsnL4PF/uS99Zv842J0Imsg
	axImQG0Fvn5PTe4wrAuS7j/++lVG5wVaSVWZrpWibUtLrcFeHXdcfDwNfonLU9mTu9EGKU8Ld1lK5
	ziZmPSqviwDDnK8C62g29gy2ivRVK7sCRSDTDIoXbj7rdBon0+9jT+0FdtZy17ZPi7CV0x1C5yqDW
	YU4Y5bmI3li9B0/HJuO8I/aYoIYvWuN6g97qmaVivXoTKC2DlNXr9qlY3JVozX1UPtEOxMR6qsk8X
	nMAi7cUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0ijk-007K1W-NT; Thu, 01 Dec 2022 12:32:20 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0ijg-007Jz4-8t
	for linux-amlogic@lists.infradead.org; Thu, 01 Dec 2022 12:32:19 +0000
Received: by mail-wr1-x429.google.com with SMTP id m14so2455997wrh.7
        for <linux-amlogic@lists.infradead.org>; Thu, 01 Dec 2022 04:32:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oxqmNG8QVZimK11GUSa3uC8aKzXNCTd3Uy233UpMikw=;
        b=brwGJiSQB2PgNAjfjeVDu2Lw4MXR3s7nddenvTEzsUvZVZpSThxWO2TuzR83KNl5fK
         whfr1WCo/41xOH9uRtOu3NhP+0vGJRGnHwE2Uv0J1RCcKN6TGIu+NjJLgTaHypV56Khj
         0nRxGt1XUJ4gZ5GabHNRrhqdzdEZW4Nhht0C0necxV2EM588kqp5SDnqTLHokxCfu1Uu
         cWIaH6d5iPBdWQviZ7in2WlrvUPYEgpoQi1NQNeGhESO79KEqc9AhlCB6RKu40EzchSQ
         4kOLf0xfYhxQtja1gXaPHrrP87i1EK5Y6aX43uwLnst81HsBGT5vTYBkf1Ryo/bT3Y8k
         ISCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oxqmNG8QVZimK11GUSa3uC8aKzXNCTd3Uy233UpMikw=;
        b=rmhe+xU34JUgsWFkF56G7Ho8lD79Wpff45+7bIYRcmmKBVlXpGuzOcthmRcFcyS1GI
         M+VhqLxo3DKFwpf141bfsCPgKI3AFxyhowAa7xleu5i+AE1/j7Cd4kC1Cc8L21YTZaYx
         /8240o5411Yj4Jd56qEjuK9AR402UaJo326A0OJawj1qWL1E68iarqhCAtDc1IqHv+9c
         nt2RhaoQgxMHltZ7eR76TBjM3HSfWey/D7QoJBgHI1Q7aIgk9birbaIJC7A2tJD/EzOJ
         Sygj5AoeAtKoFZru6RmN3aXld8/DOGd1BfNhVLmEHumZ0qSiqXJAvQSkCNu4Ka/oPVGH
         3MUQ==
X-Gm-Message-State: ANoB5pk0H4UkCAos2Kmd0R9yPl3kGW4xHCyS7xJRz+yZWokLF8301hjI
	zqxLu3fB+1a3hMBFqn12KdKRMw==
X-Google-Smtp-Source: AA0mqf4Nr9iAQ6o9/0h2mpgVlskb2Nt6UNuURrnkxoah0H1FYMkvfzCFRPuJEr+vCGMNJGkDcVSSQw==
X-Received: by 2002:adf:ea0a:0:b0:241:fcd5:6b94 with SMTP id q10-20020adfea0a000000b00241fcd56b94mr22579342wrm.592.1669897933467;
        Thu, 01 Dec 2022 04:32:13 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:bec0:73a:70e1:228f? ([2a01:e0a:982:cbb0:bec0:73a:70e1:228f])
        by smtp.gmail.com with ESMTPSA id l5-20020a5d5605000000b002367ad808a9sm4316424wrv.30.2022.12.01.04.32.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Dec 2022 04:32:13 -0800 (PST)
Message-ID: <16642605-2842-2210-440e-44f37cf06783@linaro.org>
Date: Thu, 1 Dec 2022 13:32:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v5 1/7] dt-bindings: reset: meson-g12a: Add missing NNA
 reset
Content-Language: en-US
To: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: italonicola@collabora.com, Philipp Zabel <p.zabel@pengutronix.de>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/Amlogic Meson SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson SoC support"
 <linux-amlogic@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>
References: <20221201103026.53234-1-tomeu.vizoso@collabora.com>
 <20221201103026.53234-2-tomeu.vizoso@collabora.com>
Organization: Linaro Developer Services
In-Reply-To: <20221201103026.53234-2-tomeu.vizoso@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_043216_363384_C39FC79F 
X-CRM114-Status: GOOD (  13.44  )
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

On 01/12/2022 11:30, Tomeu Vizoso wrote:
> Doesn't appear in the TRM I have, but it is used by the downstream
> galcore driver.
> 
> Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> Acked-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>   include/dt-bindings/reset/amlogic,meson-g12a-reset.h | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/include/dt-bindings/reset/amlogic,meson-g12a-reset.h b/include/dt-bindings/reset/amlogic,meson-g12a-reset.h
> index 6d487c5eba2c..45f6b8a951d0 100644
> --- a/include/dt-bindings/reset/amlogic,meson-g12a-reset.h
> +++ b/include/dt-bindings/reset/amlogic,meson-g12a-reset.h
> @@ -69,7 +69,9 @@
>   #define RESET_PARSER_FETCH		72
>   #define RESET_CTL			73
>   #define RESET_PARSER_TOP		74
> -/*					75-77	*/
> +/*					75	*/
> +#define RESET_NNA			76
> +/*					77	*/
>   #define RESET_DVALIN			78
>   #define RESET_HDMITX			79
>   /*					80-95	*/

Missing from https://lore.kernel.org/all/98517f65e600cddf585e53d1ca98cbb7b0b43aee.camel@pengutronix.de/ :
Acked-by: Philipp Zabel <p.zabel@pengutronix.de>

No need to send to send a v6 for that, I'll add it while applying after next rc1.

Neil


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
