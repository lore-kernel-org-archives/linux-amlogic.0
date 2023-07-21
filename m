Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A403EB64DC
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Jul 2023 08:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BFIYzK8/egUPDiNTKPGZq1Ms8PAE6E8WlrLyP1m73XI=; b=lXX/qhuAJ3SDLw
	4DYDKCZaeg52zok/rCFVbh/GSQi1on/Phj/6ZSHiUviYZqwvN893l7iJqKJE+dNZaohf+bD2163uL
	x32o97r+98vVSFeXBkCZRSFF5dDhdzTIa3vKVVFQ7ksLWAXdcCi0pJZQPS74+C5HMP+e+kaf2OLIj
	lA2+U4jq5WcAg+GF3WielfsTYGNmsQ2ap8YGmNBPAuiA0Wq5BYP9/gjt2PqHpCgkX55JiSk5hDI28
	lLBLO373wEGmgoJFJNLJ6c9yd02Y4PqirbSMxY2oc2FlFUaoKf/kqOZZpaMzzpGCIJWJ8JpLI8nEc
	IGJiGr+rYI0Qy33DtJwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMlK1-00DKVh-0Y;
	Fri, 21 Jul 2023 08:17:09 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMlJz-00DKTf-0C
	for linux-amlogic@lists.infradead.org;
	Fri, 21 Jul 2023 08:17:08 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3159d5e409dso1779744f8f.0
        for <linux-amlogic@lists.infradead.org>; Fri, 21 Jul 2023 01:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689927421; x=1690532221;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o6B+rnfSM0xcXsymXoRy0hO01EbexjC2r2BJi7Oh4Tg=;
        b=M3frvDxJ8Lx541wDYgYu/fFxid+iV9soVtPl2tef8QPqzhCKPM900nnmHqaOwD6yN4
         hoK39FKywAALhTAoI/g1FmjHG1lF4pe74P4zkqCICu1cEuGPBBb25wqDxqfgMT28HzAt
         4RbwizxZJBF865LH8V0OkV4jJWyQ3Dq7829KgzZ9+bIyYuxFZMIlcq1byFjsOzVrz6aa
         H52Gu7xyX/sGF8sns3uYqy5w0WjFijHb0xfBfuX/fKPDOohxostJgvAvx6Lih34JMPXk
         BFrn8GqdhHxK5b/E2EZmdr9wW4LqTldGxWCekV7WgksLAdQP1Z2ApBowwGHPDXp2D42j
         XwPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689927421; x=1690532221;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o6B+rnfSM0xcXsymXoRy0hO01EbexjC2r2BJi7Oh4Tg=;
        b=gEb9MgKR8C1i6B2kvMGXhAGLwCjokF0ChwycAVcFrEboWIXjejxJ0/K3pawf7D58/9
         OMEQGglJ/wcuwQS2biRG/siY5Zf3ySZSpcQayDYWAhO/WBHiyM+1puc4ffxYMFkKM33l
         odDoNzpJt8wrX5dAvNOaWxG9c322EPFOVJDSStoleqfEN+BvWtNDBxpunQowZbwnBMe1
         i1geppsD8jQlYzv4/d0V7V3kIVZcVV4HcsDM2sfYCagC2olcPsHg2iLDqfkoicWcNU+h
         avReBxFdGMFAwjnP55pN2jMilTd5NUZU73T5s3XpBUdFd4gBJZZowEw32qfgaDAio+Jg
         i+Uw==
X-Gm-Message-State: ABy/qLZFn6U3dQQ0+gPt2qL9dluvNUIP+O917psqJll+JFCMxKIZfmaL
	9pbaQcOVIEaXaYT1Zxirz57R6w==
X-Google-Smtp-Source: APBJJlFUlwJlGXYQN9cg7lAdMveKlgbhYYK0b7nlHGwn3FLbMm3zs3wgdWU1pRTS5MnsuBi0I68UXA==
X-Received: by 2002:a5d:4eca:0:b0:314:2736:ba3e with SMTP id s10-20020a5d4eca000000b003142736ba3emr4614811wrv.3.1689927420908;
        Fri, 21 Jul 2023 01:17:00 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id l8-20020a5d6748000000b003143cb109d5sm3495784wrw.14.2023.07.21.01.16.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jul 2023 01:17:00 -0700 (PDT)
Message-ID: <50b781c0-6800-84fc-1bfb-3f8831f728e0@linaro.org>
Date: Fri, 21 Jul 2023 10:16:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/3] dt-bindings: interrupt-controller: Add header file
 for Amlogic Meson-G12A SoCs
Content-Language: en-US
To: Huqiang Qin <huqiang.qin@amlogic.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, linus.walleij@linaro.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org
References: <20230721073214.1876417-1-huqiang.qin@amlogic.com>
 <20230721073214.1876417-2-huqiang.qin@amlogic.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230721073214.1876417-2-huqiang.qin@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_011707_124610_EF345C15 
X-CRM114-Status: UNSURE (   9.64  )
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

On 21/07/2023 09:32, Huqiang Qin wrote:
> Add a new dt-binding header that details the interrupt number of the GPIO.
> 
> Signed-off-by: Huqiang Qin <huqiang.qin@amlogic.com>
> ---
>  .../irq-meson-g12a-gpio.h                     | 126 ++++++++++++++++++
>  1 file changed, 126 insertions(+)
>  create mode 100644 include/dt-bindings/interrupt-controller/irq-meson-g12a-gpio.h

Use compatible style as filename, so amlogic,meson-g12a-something-something.



Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
