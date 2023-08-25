Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE9CCC3DA6F
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Aug 2023 12:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=euwl0PQ5feC9piiXsqKnAd4yC0OKFnQXAWjvabfvU3Y=; b=XTQ6Gur/Rto8H1
	OrMI1Lqkg7R7ZU+P4kMcRzNKn3BofJ6UTriBZhznV6XauBxy9Yv3F/RqTUO9BHQMgp5sjVziNujg9
	c15rxHPhAwOGXeqSsnoDN4UfRtdtgdn3+BprG2l8yNrly+84bEZ+4FStzjiz4IuxaZt/GjKLyQcqy
	SpkpL8NremlTddD/5KKQA2B5msaHwcvCroB+7Pm91aTJmRHsTmEKD2SxoYcwQRkZSf04ZaFgi8qFd
	HGl6XCtKsFY+9GJr37SFF1ynLf55iL4G+L5EgfRF0N+3zVyHkA+FA8UBwTLYQY8K3jW2eZ3YilOFf
	vuMoCUSbNnNv2prNgDNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZVXJ-005Kif-1D;
	Fri, 25 Aug 2023 12:03:33 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZVXG-005Khi-28
	for linux-amlogic@lists.infradead.org;
	Fri, 25 Aug 2023 12:03:31 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-4ff8a1746e0so1260030e87.0
        for <linux-amlogic@lists.infradead.org>; Fri, 25 Aug 2023 05:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692965009; x=1693569809;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=taeO1AEsh0uP1pYQ9HGpFayxmjVLAo8NHH2wQoNtLFM=;
        b=rWU4iDDCZLjgqVS9HLbAQ2EG6MMqAi5q6+Twqdz6EWhrB8VyvX+wp5GTV7qVtAA0wx
         brwTIf7sgBl0ZQDb03cMVwIcWUJThoC/yh3YMFX4oAZpSaG8Wkaq24H0R5Bj2dNCASj6
         B8TLEYAUnr+vmQWQCAJWD/i7B39IAY2w4udR+Mb7ayGgSPGUf+teUxI4RBkTdRzfxa3W
         dRwXisdZORU4D0SPEIGtnElzHfxi9+N2x4OV7AiuQ5raQ0DuWAvUG/NF4rTsJiR28mw8
         H1Odj3dvv2gZz7Zu2Twew6WeC6ii4iHrVFr9kJLrtvtFCQH9g9EWYi0ktLK+Q88crxLu
         VHFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692965009; x=1693569809;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=taeO1AEsh0uP1pYQ9HGpFayxmjVLAo8NHH2wQoNtLFM=;
        b=OGAVr1nbuzDDZDdevOZ0lhftzZz2D6VcVXbx3VSxgLQX+ff1aCm3UuE+9QQQsAX0QV
         61MgExNE4hHZsbdvxQPoHr0TLbxwkavnbfE48c7NBhieGCBQmLvzYHLqzePIWsrxotad
         mu/R/+TZ9+iMSBqc8XNe+h2f177+QUthaI4Wo9qrwy/zk96FNDmoBj3/tZ6cTSqtxjBh
         HeD57P7eAguMkjbyEzOr1irKBBZ6OSfEsHCGAbRrH2v8rhCJ2WgyknZWnn/7a4ozru+8
         SxkILKuOsrt394CZbZldJ987me1UN1uJXGtNizd/ua0sQd3uzYw6uPj7RdquRuS8kRrA
         yzQw==
X-Gm-Message-State: AOJu0YzM+1WmR7GhvQgZwQIyPHNhe0VZdeo1u0ua4X62445awj4C8qYe
	dtWlUT+YndNmPn10DlIsdjflDQ==
X-Google-Smtp-Source: AGHT+IHHPBfuWhEiDj0swCd1J9tLfn5NS1BOsfFV68R8Yh/Yt91I78MzNDbsdRnRJzelo10BvYmKmw==
X-Received: by 2002:ac2:5a5e:0:b0:500:761b:72ff with SMTP id r30-20020ac25a5e000000b00500761b72ffmr11352182lfn.55.1692965008885;
        Fri, 25 Aug 2023 05:03:28 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id t21-20020aa7d715000000b00523a43f9b1dsm940874edq.22.2023.08.25.05.03.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Aug 2023 05:03:28 -0700 (PDT)
Message-ID: <851aa91b-dda9-c2df-0e8e-66dec6756899@linaro.org>
Date: Fri, 25 Aug 2023 14:03:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 2/3] dt-bindings: media: Add compatible for Meson-S4 IR
 Controller
Content-Language: en-US
To: zelong dong <zelong.dong@amlogic.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Sean Young <sean@mess.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Qianggui.Song@amlogic.com, Yonghui.Yu@amlogic.com, kelvin.zhang@amlogic.com
References: <20230825115310.39993-1-zelong.dong@amlogic.com>
 <20230825115310.39993-3-zelong.dong@amlogic.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230825115310.39993-3-zelong.dong@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230825_050330_701802_959C690E 
X-CRM114-Status: UNSURE (   7.97  )
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

On 25/08/2023 13:53, zelong dong wrote:
> From: Zelong Dong <zelong.dong@amlogic.com>
> 
> Add new compatible for Amlogic's Meson-S4 IR Controller.
> Meson IR Controller supports hardware decoder in Meson-S4 and later SoC.
> 
> Signed-off-by: Zelong Dong <zelong.dong@amlogic.com>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
