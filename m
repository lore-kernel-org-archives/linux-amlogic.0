Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5639EC76196
	for <linux-amlogic@archiver.kernel.org>; Tue, 28 Mar 2023 06:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jO+lnD8PngffzEWeU//gdFlaNZD9zr683/f7t3j9To8=; b=aPIGLmUc/yfNOk
	fQfXcqr8AU/jJGlOCoWZchYbaJOM8z5NKqk+SqhQMZbEz0nZzX9uqDQ25P5RvBTqcATvgFZ2RykC6
	snLGyodRg/r7WpFJNbfhJ9rFyuXpznSpCZ4UCTFM6DJoMVJHSLZ3Qh1O7y1sURlXfGWZI79ojDob8
	T3kSyjhqUeblGGN7hH83q2rrQ093mMrs1dGCXNc72n7a77fV7oTDo4xupz87oVHz7YtT1xpdLyjM7
	gcor7dzS7m5z+G5vFm9c6wyXMNP76OxMuddOK/d6RwrQvKiRxtJToFz68skef40yfGoqEt4hD7Il3
	Lqao3ucH9jD85BPGYA4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ph32K-00DLMi-0h;
	Tue, 28 Mar 2023 06:42:28 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ph32H-00DLKk-0f
	for linux-amlogic@lists.infradead.org;
	Tue, 28 Mar 2023 06:42:26 +0000
Received: by mail-ed1-x52f.google.com with SMTP id er13so4380866edb.9
        for <linux-amlogic@lists.infradead.org>; Mon, 27 Mar 2023 23:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679985744;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Zms3f87kgqq/O54u/ZeUMcCMrrmOfOC/TKKWRsysbBY=;
        b=L83sjWQIVYxyit9rJ2Icowbk1Y+vtYb0qSPkJG5BdTHLar5gM+Q1ApzieEPleG+mot
         AfZRi3hmp2AtDhe0ZXJK2L48/Vqsgkyb5HAEMaGg0CKlc18cdeiCO9SJqPVxgxc4m5mP
         amMca7xp5CcRzIMVtTrU/GK0M4JguTbXPKULIx71tiz4eacroqtpTQ4iZwgK+GqBGo3k
         sz12vRfLRj2xEur+EdXWROpdWd083B08IcJ64o7oL1bxZk2j4t7cKDQ4UXXYjrKe6EBb
         T65dPqNOL3XfanK+2ZpJCqoMiFNox0AjYXQtga5xEjvOnW0vYa3DdXKyxuucwdNwnWG0
         jJpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679985744;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zms3f87kgqq/O54u/ZeUMcCMrrmOfOC/TKKWRsysbBY=;
        b=cN/9mdoY3l6oLbCA2tPCHrCMnObGXDCkpWhm/aelBuCy4YNVcDf4oE+/2ek78/3SvJ
         rcBAAYlMdyD5w4xE2icdzPuRmq+CdMzlTWpK8SxUCyf2qqTWOeiH3qVQRZ1Xv4sphCcL
         bBuWWOm8dgKeWOOkSmJCcc2TEI126D/a6q4uqji3X5X75pOAumYY7r4JYUOJUyuSr6Ie
         wuX7ymDb22+8ueATfcfEBmfZIm4W/+AVKcptGephwJNERFSXpdc04fKPYw/E1ahmWm5M
         13VmDXQwImeE2loS1i0ymbZxrOp6Yw8OsK7NMGisWDRMnUe3vn0T0OYijEJRvdhffGRE
         povA==
X-Gm-Message-State: AAQBX9eBTrawe3a4cmcqT7naOIrBFPYe6BJeHP5bOJSEEJMsCjza1TmF
	ruO8YthVulx+NCkrihEjCzJ0AA==
X-Google-Smtp-Source: AKy350bbscTch9wCANshCju8VYq8/rJEvvHED5op3C72ZbWe+OpnvYBFwEZrGUs3c4fwuYCtL7cGLQ==
X-Received: by 2002:a17:906:ecf1:b0:932:c1e2:9983 with SMTP id qt17-20020a170906ecf100b00932c1e29983mr15165299ejb.15.1679985743864;
        Mon, 27 Mar 2023 23:42:23 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:9e92:dca6:241d:71b6? ([2a02:810d:15c0:828:9e92:dca6:241d:71b6])
        by smtp.gmail.com with ESMTPSA id jz15-20020a17090775ef00b009334edaed98sm12659815ejc.50.2023.03.27.23.42.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 23:42:23 -0700 (PDT)
Message-ID: <5d83f4dd-0baf-41fd-d16c-0723543aa084@linaro.org>
Date: Tue, 28 Mar 2023 08:42:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] dt-bindings: soc: amlogic: Drop unneeded quotes
Content-Language: en-US
To: Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230327170222.4107746-1-robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230327170222.4107746-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_234225_251857_8D4D2672 
X-CRM114-Status: UNSURE (   7.50  )
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


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
