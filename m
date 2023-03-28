Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 537A5C76195
	for <linux-amlogic@archiver.kernel.org>; Tue, 28 Mar 2023 06:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xDNz3MvKUmX33igs3rZuzKIYFPPu9XDMP759U1Ia2Ko=; b=OhMa6yK2CYac57
	bPz5YAR9FGUkfRQS5EvaEtxoC7U6goLhXaMwr5/IIJKPD9wBKm1f2A+U+7KIrZlcSwiJNbwcuyC+3
	zTv9m7tRd3TTEY0AP10gCkftRy6m4CAEnbdziWc3nTdzA/tr2hFHebTE+PiF780CKrBDgbHt27c9n
	DPYE61cW6sGhmTc1JVmhK1mGInNsPs+wwAAR8Wijr2VOolrNvrwknJF7nNk4WtFDoYupFADuUbvi5
	v6aV23dBjeV+EM5jPaDvZZUgYVO2L9RPqDnwCZ/gqhiGL1fm8eO9Q2dtcxyTokAT3gIf7dFbsgNHb
	jkbkJnwN1M/lfAuvLZaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ph33R-00DLjb-2q;
	Tue, 28 Mar 2023 06:43:37 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ph33P-00DLiP-0C
	for linux-amlogic@lists.infradead.org;
	Tue, 28 Mar 2023 06:43:36 +0000
Received: by mail-ed1-x534.google.com with SMTP id r11so45367383edd.5
        for <linux-amlogic@lists.infradead.org>; Mon, 27 Mar 2023 23:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679985814;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MbHK9gxquzTu4OuudBalIqxg+HKqPSQ44lp6Dx4TnjQ=;
        b=Foq1aZAHjoORNNMO4AEP6iM8Kfj1xj1TL4YoMPzZRa4lpdIUjbBTKP0y65K3Bmx9VZ
         RK2laGsY4vm6D4cZhjoSzwCI2Qr6D/27EYSYDw2rlGClHXCVwk4l8xKX8YcBdu/7TBGo
         YCQVw8YM+xU3dX3Xk3ZnrGU/L5vBWKmOnyeqoOQ5YTZj48dvZvAZZuMdapZp5DTy/xwD
         RKe8MJDGP7dhcab1RykWhwTO4FOcBrSsMmIDRDYwYZyyjgH8XHTYbnm9ZgkwILN1GfFG
         WZOuqm3l45knzAE19JVmtRKo+dWhRBKpLYVEkjAa8fk+kte6PETpVNgXjLkdnAdJrz7+
         y6xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679985814;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MbHK9gxquzTu4OuudBalIqxg+HKqPSQ44lp6Dx4TnjQ=;
        b=pxdBHCPwWDcIAWE3ap5awbkCUgcCt9C+Lhr1j+whq19Xs8yKHofu+VHWd6cHvZETcb
         V/kjO74AwRA+cfKSwoOmmzcrzVcqJ5iGF4atCsM61gVobvGDH7NahRHSI/ceC23csAAW
         cUR/FWT0HDtFtKu62CuTQAmtc+LIcIsAZS4eUsd7zdIeRPAcg7d2rc4F7TDcFTNsmoLU
         sE0b8uW2SeZfVGcQ5KgRCv2/PMBDLoo7/WMgBdZMv7UmBnssJCFWgVTEvVS56VEgVljD
         mWX+ppFW2qbSCqrbm9lobPBUpFYj5D2mdOQAayqJV6oh8OyDlbLhlksQCITTICt5CvXQ
         QMfQ==
X-Gm-Message-State: AAQBX9c1eK4SmuHl9ZzfiK5RFC4o30wYm+vPd/qp2yvv7YUKjMmMg4rP
	LxJMSBLBj1LvDqxo4/2O4Snhng==
X-Google-Smtp-Source: AKy350aozLV/kfMw0o+gXcWxC3Pkq1/8ASNpFZqkIcdiw/e7W0+mPismptepSP9CgSIhNrY4WS98Pw==
X-Received: by 2002:a05:6402:125a:b0:4fe:9689:96bb with SMTP id l26-20020a056402125a00b004fe968996bbmr15336132edw.35.1679985813782;
        Mon, 27 Mar 2023 23:43:33 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:9e92:dca6:241d:71b6? ([2a02:810d:15c0:828:9e92:dca6:241d:71b6])
        by smtp.gmail.com with ESMTPSA id x92-20020a50bae5000000b004fa19f5ba99sm15577741ede.79.2023.03.27.23.43.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 23:43:33 -0700 (PDT)
Message-ID: <28789ca3-923b-2aed-b921-ed68b776dc92@linaro.org>
Date: Tue, 28 Mar 2023 08:43:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] dt-bindings: serial: Drop unneeded quotes
Content-Language: en-US
To: Rob Herring <robh@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Hammer Hsieh <hammerh0314@gmail.com>
Cc: linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20230327170137.4104272-1-robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230327170137.4104272-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_234335_096784_196EE5CC 
X-CRM114-Status: UNSURE (   7.65  )
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


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
