Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B85E8C4332F
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Nov 2022 12:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3tqZZVwujCaCfDcb3Z5yGsS2+TQWRzu5l0aV9KkUN+E=; b=PDw4OKGeT/5jpxMPOQQZR4kST+
	Mjoqd0qlymhuqbpAGNwb8jpxFuKbWl4egTUQPJIdraTPo3Nl1f3dQgY9fmjNIv/DGPB4ev+vlXH7c
	7CJt4ZpPcCV2+YC7c8rrc8ZiSGlhSS45+OGAmey+sYEdx3tziVp0P8Q866YrrhqkSxdfhNpcWqIek
	KZLs6Jqj4FyjkkK7ojyxlytPRVbZ3VwoMEgmhAhancyeldR5PjEAQACpxPxyEQ3Ybxy2yYXMg3xZr
	4vfzY+q+EcrZfh8bEmUCF5zzQI2aYMlIJsR66DZMDPPsBxNLdVAcNLeb7TO1sGR+1Nxv8RecnyXuR
	diAJjOzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyYE5-00GX6Q-2W; Fri, 25 Nov 2022 12:54:41 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyYDm-00GWy7-L9
	for linux-amlogic@lists.infradead.org; Fri, 25 Nov 2022 12:54:24 +0000
Received: by mail-wm1-x32d.google.com with SMTP id o30so3389133wms.2
        for <linux-amlogic@lists.infradead.org>; Fri, 25 Nov 2022 04:54:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5fMUQM11ScQmJFsh5+zp1neRXE0jcnRGWVW/sbvW0aY=;
        b=GIdtHOoQHHiUn1y9l/Y9Y7lvVJH5safuLE/ABl8bNAvBBRta8ryKAcNTERLKJzAf3m
         /h03SXHSMKmQd7PoGYDKXhQZwfTv8l+6vbO6sbdfVNgIlAvXi8ubIR0ZbsecY6j+PzRd
         in2I8dCK1E/kOFv87JMn9uR6rtiDr/uaE5So9b/1CbeutTGaLphg50PhJba2Xn2soH+V
         kShBskf/0Aj/Od4H3KnFYn/Yni+5401mZsnlcrGZa5IPuzYbSewTGiXHicmshnUEtXTX
         Y3kQjSJcL6QONme2XAZVn5/HYOWirqv979NYXzuC4oNqQv2XOsyqv0ok92jWClinMjCe
         LtKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5fMUQM11ScQmJFsh5+zp1neRXE0jcnRGWVW/sbvW0aY=;
        b=OdryWsjpMcCEWNxLkqzxRovdN70RkxnkC8386bfeA4ogyzL3/ETtXYEUlGT37YxaHu
         VLzKQ6//+jsjPn7mtLH74cMYu+bI+YWsl0rugyGn2ht23Y7ezcgmvZB4aVfkUXRj/SVR
         Mmec0kyXyxrsZknJXJrpsCDCNMgP1JSYMmkYxZ2R2i93veo0LzMtHpzz7scSb6ozuMLN
         g+fuh8hQ927LAFU2Ret94XMqauam/CtWvB3eJSP7n3enk0G+xRP9gvbVUoKC2nbKAzP+
         7/9qyDFYS7OPIqtr3RJBZUR5gHZ/ZU+mMxMUGx5RwoZC2RdYngeyOkDTTdBk1Mv/rilz
         TY9w==
X-Gm-Message-State: ANoB5pmTbbUI0VQBd0M9UJEk77AwkTh2RXAtHlzx7beIgVR+rteRQd4p
	BGQpkWcVb5HJdZrLT2DOj4/B6A==
X-Google-Smtp-Source: AA0mqf6di6CQrRNIc+mrM8NPW7llqrHiL3OqZguZhdBaU+sCaOV5whaWpASwKSH7fyutYkh0E5A5Mw==
X-Received: by 2002:a05:600c:1e8d:b0:3d0:2c5c:e483 with SMTP id be13-20020a05600c1e8d00b003d02c5ce483mr12808700wmb.141.1669380859643;
        Fri, 25 Nov 2022 04:54:19 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:84a5:7e09:b15:f1fe? ([2a01:e0a:982:cbb0:84a5:7e09:b15:f1fe])
        by smtp.gmail.com with ESMTPSA id u26-20020a7bcb1a000000b003cfd42821dasm5092970wmj.3.2022.11.25.04.54.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Nov 2022 04:54:19 -0800 (PST)
Message-ID: <22300a29-c2c4-6514-ec4b-a62e04ade70a@linaro.org>
Date: Fri, 25 Nov 2022 13:54:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/6] dt-bindings: power: Add NNA power domain
Content-Language: en-US
To: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/Amlogic Meson SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson SoC support"
 <linux-amlogic@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>
References: <20221125111921.37261-1-tomeu.vizoso@collabora.com>
 <20221125111921.37261-3-tomeu.vizoso@collabora.com>
Organization: Linaro Developer Services
In-Reply-To: <20221125111921.37261-3-tomeu.vizoso@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221125_045422_747495_D12DBFA4 
X-CRM114-Status: GOOD (  10.93  )
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

On 25/11/2022 12:19, Tomeu Vizoso wrote:
> Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> ---
>   include/dt-bindings/power/meson-g12a-power.h | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/include/dt-bindings/power/meson-g12a-power.h b/include/dt-bindings/power/meson-g12a-power.h
> index bb5e67a842de..93b03bdd60b7 100644
> --- a/include/dt-bindings/power/meson-g12a-power.h
> +++ b/include/dt-bindings/power/meson-g12a-power.h
> @@ -9,5 +9,6 @@
>   
>   #define PWRC_G12A_VPU_ID		0
>   #define PWRC_G12A_ETH_ID		1
> +#define PWRC_G12A_NNA_ID		2
>   
>   #endif


Acked-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
