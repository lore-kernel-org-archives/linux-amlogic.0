Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 034ECC32796
	for <linux-amlogic@archiver.kernel.org>; Wed, 24 Aug 2022 13:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ySQ8OYimCMqZLQ55rhKWTJSbN2wXUol2AQHwEV7R5uI=; b=2q4OLBmZOS8CuJ
	hkHGKzuVBZhRINZqF47ZK5OOm4HLfdXpA+s/+tZteeNobSvcUPX96C5RuBwnuQkTuueCEaFG9gdMb
	m60k2AjRJC9ky7QWJ3XcBaS9aYfEoJiV348wj5wQPsTA3qeD6su9UabDGAhVr/+AyUuoLtGWMLzv7
	N0aCCD2u0FFbg/uoi/SYNaXgBB2u6Zs8vd6cYRl/Sfk1Bbj/IKRNJ3pylZFxkrx5gqUWCMxrm5YdM
	YuVWTPbBUDtn5pUPqFcCHmYCxoRRCCm9uxdeKlhF3lmY6SYyjSWdQTuzBPchOz/7p3noysH1tcbGx
	0GdPmUVh+JJcn1f+qGrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQqZv-00DHoS-Sr; Wed, 24 Aug 2022 13:37:55 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQqZt-00DHmi-29
	for linux-amlogic@lists.infradead.org; Wed, 24 Aug 2022 13:37:54 +0000
Received: by mail-lf1-x130.google.com with SMTP id m3so18351263lfg.10
        for <linux-amlogic@lists.infradead.org>; Wed, 24 Aug 2022 06:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=FNnIJyZLA/DkTE9+Zpr6Ng3J1POb/zmR9BDJb09121Q=;
        b=h6BdaQtrsWihUPz25ye52qmPW2BJdRf34tszfDgYIc54i4TMcnZJ/JvenaEIMRYjDZ
         QUM5a3L1gNjDID5UjU0pq5tW23N5jHdQbD8KAItUKzFOwX9vx6pT+K364t3h0/tzoxjt
         wJvmk/NyPj0GQR5dtiriZbkkW5uMLQmEx5S8ChFTSeNw0u7IMLUlVhIHsu7ZWeoe/AG5
         8qo6ppqtNVcNZk18+mJ8rOfMhkXjNYH0UJK57wrPlQSU88H/lslZiUX9sLfsZOd4EQjR
         /JY7RnDCDgg0aV8OiX1iM7xzv1KG3mmLnccyGTFVMVq8rDRx/GmWXi1Xl6mSB29RVGxc
         9i4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=FNnIJyZLA/DkTE9+Zpr6Ng3J1POb/zmR9BDJb09121Q=;
        b=ilaYTUtrv9ISKFY33kSCX7ffDombwbxqHihll0UGNeQak57JgcdFkCyGUIA72NNADk
         1qwVGQBSe0Nv7RnvkTdkxjVTv74uuaZm8LIZ24kRZfOsY/gXahYBjzy/OUkY4vXsjKBa
         LhaerMpQdyGI6v4JNl7luryxpENC8RZStMxr9WguWDn8cxSPonRPqsFKp67Mih8qZQCG
         U1YzoMekGuNtzdMuJfHaDbK6GX0nfDaAf0rRqJZAOqxwWJxQa//iusYpLYVA2UhMKc+L
         VBXYYZTUr2TemiIqTD+uMJ8ZUT94b0oHd2Mr1gR2uekEg8BsY8SKUnrR482JXMFAuPhz
         hupg==
X-Gm-Message-State: ACgBeo0OcgPO2Z6Gl59vQmF3/ODSTKA8Tj+YZXd+J++JWFOEJ9R+dW3P
	cZ0h4TvkvaVacq81UbcIo31jxQ==
X-Google-Smtp-Source: AA6agR5/XXVW1Gc7QE0nZt5Z1Bn77q2PqqOB2dPRp0AQNRayelqdqv1+ki+d/TSM2zjY+7pI4vB+Kw==
X-Received: by 2002:a05:6512:b12:b0:492:daa9:75ea with SMTP id w18-20020a0565120b1200b00492daa975eamr7338464lfu.297.1661348271490;
        Wed, 24 Aug 2022 06:37:51 -0700 (PDT)
Received: from [10.243.4.185] (94-12-180-213.sta.estpak.ee. [213.180.12.94])
        by smtp.gmail.com with ESMTPSA id 22-20020ac24856000000b0048a921664e8sm3033917lfy.37.2022.08.24.06.37.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Aug 2022 06:37:50 -0700 (PDT)
Message-ID: <bf882a57-adaf-e093-fee0-39e197dbcda0@linaro.org>
Date: Wed, 24 Aug 2022 16:37:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH V4 4/6] dt-bindings: clk: meson: add S4 SoC peripheral
 clock controller bindings
Content-Language: en-US
To: Yu Tu <yu.tu@amlogic.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20220823022630.25007-1-yu.tu@amlogic.com>
 <20220823022630.25007-5-yu.tu@amlogic.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220823022630.25007-5-yu.tu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220824_063753_130925_95AE2C19 
X-CRM114-Status: UNSURE (   6.50  )
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

On 23/08/2022 05:26, Yu Tu wrote:
> Add peripheral clock controller compatible and dt-bindings header for
> the of the S4 SoC.
> 
> Signed-off-by: Yu Tu <yu.tu@amlogic.com>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
