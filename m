Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBD52C76196
	for <linux-amlogic@archiver.kernel.org>; Tue, 28 Mar 2023 06:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d3CIcagqmLAloHqsMQwHiFK19fuXxWemucoc9RceY6Y=; b=Ed16pjeyDRz8qX
	ZZkHiDkcEwEisOwnV7jXFE9Dho2z2ncK62lTEzr4Sjf4YKd5rOeght4d5zNPAxJS6YBp2S1VAlbwJ
	LClxQdxYYkOwIEdm6Lj0ChqXYEXQDWr+eyThj4YmozNUIfbzBu0vOxloJX/sGFf5C3Z6cL/WAG2YF
	xRXbkYT/yqXYQHeelk2GnV6bmiGJPOc1VS6QD/OnzK0AECxXKzFuRhuA0kP17HTYQXvd7sU+lU1Or
	E4MDJ47r/I0yZ7NEixQtDPn6syt4/Roo/xTdsYxnewsd7zYM/dbz3XUAMPPVmb0lYrRqUDXDZ2hrH
	WsF/N+I1Xk8vcYWa5Bmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ph34q-00DM6o-0u;
	Tue, 28 Mar 2023 06:45:04 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ph34m-00DM4W-03
	for linux-amlogic@lists.infradead.org;
	Tue, 28 Mar 2023 06:45:01 +0000
Received: by mail-ed1-x52b.google.com with SMTP id t10so45254779edd.12
        for <linux-amlogic@lists.infradead.org>; Mon, 27 Mar 2023 23:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679985894;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nmTvziNt2VFrSmXaXHn7cfTQldiBzclyda4PoCjJxWE=;
        b=KDvjJ+sJSVFfF+ax9cNRTuZm3PPD4QOVnSoLIozYu62wHnN0LvthEFWDLtXVvroHmO
         UG9miq8QhrSuSD27nq641NkuPALs5ipEHnV2igK6U9zVyewBXLMQOl9i+yOXyBoC7lO5
         +RWiBPkGLmNJk6NBYnc5sgw9mquFl1aSyyfIb0YeNCzFf7oPSekfsQhhlM7O4frh3zA2
         mbjauxBgowvPV19/w2zFI47p57F/g/8S6qlIcTdtJ7NDO09LanXxtC3z2GTab4qNsumB
         F9bLEszOEd2ps5tmD3bCfc0BI90KsOK12rR+l5AvfV/oKzqwipnPXF382hkkXduQ1Hu6
         LtMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679985894;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nmTvziNt2VFrSmXaXHn7cfTQldiBzclyda4PoCjJxWE=;
        b=rbssUL0IAiFgFNiI2tfz3r7M6wlSxwdbQzzbyZTiwMxet3tNGIDWQa7IdWqfpsuNVd
         yQxQds0WR0zNIRdQTfrypUK/TD0tM8EYXTFku0nx5d6Mcv0RX6Lq8GRk8w9YCJvWhczI
         fINzhJjMymP/RNtKq42oqUyrzSCKO4ZWzMXN0JH8hyKx6D+5+1o/PFQMny40UsgLTUAE
         2klQspZxBhAsZbfzJe8NsrZeEMKer2ekBQRMO8FMB/a+zumAlUvtwnIOcW5vZA8rWatd
         nEyg37YTOwSVYUoXviZExZbwbnEea5GoOW4AO1m9OPLAc78szOyDYCsRyNzmTEXWd4ok
         Wzdg==
X-Gm-Message-State: AAQBX9fDj24WGNzw/pftW4HwsatKrIT587jJitERdTW3/jP+GvlFLVR2
	LbfIp7VRnMvUQGTG2NAQR0ndQQ==
X-Google-Smtp-Source: AKy350Yo2Rt1rOFhXVKxwzhnMFISblPFU1CUUdS7F8h8GwafujSMEOGbp0rS44wexna8I2I5SC9t/w==
X-Received: by 2002:a17:906:9f04:b0:944:8c30:830d with SMTP id fy4-20020a1709069f0400b009448c30830dmr7483214ejc.42.1679985894744;
        Mon, 27 Mar 2023 23:44:54 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:9e92:dca6:241d:71b6? ([2a02:810d:15c0:828:9e92:dca6:241d:71b6])
        by smtp.gmail.com with ESMTPSA id k2-20020a50c082000000b005002daeb27asm15465414edf.37.2023.03.27.23.44.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 23:44:54 -0700 (PDT)
Message-ID: <06919af5-a518-2da8-5cd0-ac657948b6c3@linaro.org>
Date: Tue, 28 Mar 2023 08:44:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] dt-bindings: remoteproc: Drop unneeded quotes
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Andy Gross <agross@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20230327170114.4102315-1-robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230327170114.4102315-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_234500_055978_ABCD37BD 
X-CRM114-Status: UNSURE (   7.64  )
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

On 27/03/2023 19:01, Rob Herring wrote:
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
