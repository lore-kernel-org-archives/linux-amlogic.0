Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F482C761A6
	for <linux-amlogic@archiver.kernel.org>; Tue, 28 Mar 2023 06:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=397IhdpViDm7jzh/13DG7CbGH70qeuP+KnEbTL0dzR0=; b=nqC40XinPoktok
	d2o/08EW9GuhhKqJyVxvuGETyAyhdWymWseYpcZo/7mk7mPvjkAlT35K9g4AIGOvYBCzttlTEO/NP
	J6h7WhS+Wvuz2e96OhaEXQLvSBixeE07ISlcqbrMGmpRBfA8N1flPLhoRj3D8G9YQ3Ekg849f7/Sd
	0PA8hVCVE7AxuB7Qp7ECe2Oa5RNOI6pt/qJnoz43/DNh3Zm4Y9RCrgWB0u+rhsxcv4q4LwCCvzVcw
	44LFR3sGg9TNrNdvEUcf17qJuPTSDz3NjQn0+m0LNX9pZdkQIIaGjmolUVBcnkIEd50vA58KJkplR
	gGQRTgl4Tckc9/yWhLHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ph32I-00DLLa-1A;
	Tue, 28 Mar 2023 06:42:26 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ph329-00DLH1-1e
	for linux-amlogic@lists.infradead.org;
	Tue, 28 Mar 2023 06:42:18 +0000
Received: by mail-ed1-x52d.google.com with SMTP id b20so45420313edd.1
        for <linux-amlogic@lists.infradead.org>; Mon, 27 Mar 2023 23:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679985736;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ugTwB3nlWFvY364JS8o25gk6uB0TRisKc7yrTFLXKV4=;
        b=waC4uNfWLTMm31jOiDNj7E0Tk6R4f79kPFgb2PRGbtayQ6AE3QHKZuVEQQyYOgd6d1
         HzpdSiomjiAiVTgwteMUIwCMW3j2wWW4e3/vkAZbMbQ58x7+b9ooRfYt7IWJ9gtWN//k
         3PK/r7N22g3Sq0Ssb1JtfgrCn2J7o0EZvN9zAAs0M+NVY07K+4fRYNQAJPRz+0l4YV9R
         2VL9OEoeq/ixlHLkcHRe6ANlSzKnchxFRM993L49H6dIny+WC97UnMvpnlrU2oCz5QJU
         LJN6D2/57UGj6ufnTP/QfeQUG6otIDI0Ej6e3vcoCJQq3YASINBbQ4CPzYyK8YVY15qB
         Jc7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679985736;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ugTwB3nlWFvY364JS8o25gk6uB0TRisKc7yrTFLXKV4=;
        b=f/Ot24ZqNNvpwB1vofXtMAoJxGdC5aciLTFd6eGdcaP5RJkEyNuc5VxE1oTtdVTBiA
         tnutrDncHVj3m2LUgNRmnSZjCyaf75Mk7X2vL2RF9e5msqvFQLR5ueapA6VPdxfTNbax
         xopCZyTLJ8CNzqyQfRppr1SWAsIgMRj/DppfQ664XKxZ5rsiCtkp17tGwbmAXyJlw7Es
         +PWBBuw2m76Rw8NkGTsJ/INErvKDIFSS2gZUym2P7hzo+dmQNuCggSMjTe0CSANWA7gT
         1ZCOAOISUgVbdYQhLvh7BgEDw1CFBqhnxBFGy4Q6E3tIYejah0MGxA6D0gF5gFq/HJIm
         AKcQ==
X-Gm-Message-State: AAQBX9dWOOKtOwgMznzGtrK9yqpEKSBeRBg2Ao+4Vd8ukRCyKe1gS1MP
	/zIoxJOz0XRXTXkc0CCcXnZubA==
X-Google-Smtp-Source: AKy350Y0yDfnTCHqG2i9UQFcPpCM0HrNNBssNs8DcguIv7kPB1Ao21jSX3jD1CCnE265MR1wM0OicA==
X-Received: by 2002:a17:906:184d:b0:8b1:e791:faef with SMTP id w13-20020a170906184d00b008b1e791faefmr14631173eje.67.1679985736280;
        Mon, 27 Mar 2023 23:42:16 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:9e92:dca6:241d:71b6? ([2a02:810d:15c0:828:9e92:dca6:241d:71b6])
        by smtp.gmail.com with ESMTPSA id v5-20020a17090690c500b0093188e8d478sm14878469ejw.103.2023.03.27.23.42.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 23:42:15 -0700 (PDT)
Message-ID: <fea2f419-917f-7be8-5386-6d2159d0f141@linaro.org>
Date: Tue, 28 Mar 2023 08:42:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] dt-bindings: thermal: Drop unneeded quotes
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Guillaume La Roque
 <glaroque@baylibre.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria
 <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>
Cc: linux-pm@vger.kernel.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20230327170233.4109156-1-robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230327170233.4109156-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_234217_547180_29FB8AAC 
X-CRM114-Status: UNSURE (   7.67  )
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

On 27/03/2023 19:02, Rob Herring wrote:
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
