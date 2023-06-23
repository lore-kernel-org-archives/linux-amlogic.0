Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DD26EB64D7
	for <linux-amlogic@archiver.kernel.org>; Fri, 23 Jun 2023 08:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7deDKUFT3VjnJ3tYZwm7S7VdPZIt6bZFqSeU7AkOsiM=; b=e6O3u+qqGXw8PY
	bUZsJKzHpW/rnepEphaGT5nQy7TYkQ7++M8oFPj6hqhJ7b8rRv5IfixEb5W9/HNoPgKYbPmyor0st
	1kBGtCa1zwI9sk/dEyJ+6Dy8II5Let2p7wWW086cCtpzTeVCuS4Hxo330qyuLfxA2rAsn37osyGdl
	NxHqnaXL3NbGO7lkeUDCicpgAuFY1n1E5veMtgBxE2LgVWDwQf1BfGLhySH5agtV6Trl3vgNtQuik
	H8//8u9GFokKHyh8Ni8Yattv5lfaksqyPZoySxNUcxurXI1vLC3DtljIh1q0JW5Oss65d4E4fgRGt
	LSHoV5eZdkVYnUU/INcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCcTv-002xQa-26;
	Fri, 23 Jun 2023 08:49:27 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCcTt-002xPb-0L
	for linux-amlogic@lists.infradead.org;
	Fri, 23 Jun 2023 08:49:26 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2b45c289615so6537731fa.1
        for <linux-amlogic@lists.infradead.org>; Fri, 23 Jun 2023 01:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687510163; x=1690102163;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/IzfcYheaY+2C+iIc318Id9jWD6NV9kWYTmaOaEJS2M=;
        b=zzEUF2UF3JFf8oHM+EKmxuv5eKaSXKD8Qi+k7j6+qovaDPyFIqhU3QO5PK87uU5oHn
         YSvH5mqaaGibj81PaPDlxCxqp6y+yC8fJShSXFD/IdpULUX90KlZV40Nb02yxw9v+B17
         E6nXeMxwUZ+riq/kQ33uEX9BZn1XMGB7xOqlzacRiX8C+OD+sBbXS3Rf+ehF1nBRs1fv
         freuuzcN0HfXJ1vVSAVaeM7yTLcqIC1zxivfrdHmpFqQFX7EUfhlBCGihbbKZCXWqjP5
         v7EYftAP1rLOuUw0xr5xVFFfGEJQ8FgU005wtw5ttTUKFZCJlGyNePfMtNZhVrwUnN+R
         EVLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687510163; x=1690102163;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/IzfcYheaY+2C+iIc318Id9jWD6NV9kWYTmaOaEJS2M=;
        b=TJNcKsMxYykOYov50coOR/NNyvB+u+vT+FW8yipYr1dXLY4+nh3rBT9B9aoCMhjnio
         OrWjXVBw5NthjPdDrjIA+ftpmBQ6rIQHdP4Xm42dZyqIbhLSlb60u78IuVHyZc3ivgz2
         D69oC/x/PH8kXqjXnoPVphsoBxKF/hleKEMcZotfj/E95GrnHhoZC9EWizyDwH73w9Hc
         r4Iwh/sZR0KTQkPsCTAue1wwwVkQlRmQXiaLoxoIJGX7pBAOUWOTBNh7/TMWI3+2IW2i
         JktlFczIjbmw/bnTl69O/mObYMEQIl8C6mM1CNXEEvFSQ31TNJDtVGNoAvMyFNNjvlkr
         yyEQ==
X-Gm-Message-State: AC+VfDy0HHIBgXvaoV02H6pLQZ83TfS6fSG2OrwLTbVn0YKVkrAomDz7
	7ahG8U/KDrtS8W4JmKrxoI/Lng==
X-Google-Smtp-Source: ACHHUZ6mnR6rzsfYwn2q0DIgVHx/H1L3imwZXf3H/3i+ulHmEW0dBIa+wPeJj3bXztcczdpDWmJQYw==
X-Received: by 2002:a05:651c:14e:b0:2b4:7559:f240 with SMTP id c14-20020a05651c014e00b002b47559f240mr9906581ljd.6.1687510162992;
        Fri, 23 Jun 2023 01:49:22 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id c17-20020a056402121100b005158563be4asm5006927edw.33.2023.06.23.01.49.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jun 2023 01:49:22 -0700 (PDT)
Message-ID: <dd5d7bc8-5ded-ebfe-48a2-55e330cd7544@linaro.org>
Date: Fri, 23 Jun 2023 10:49:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v1 0/6] arm64: dts: meson: a1: introduce several
 peripheral IPs
Content-Language: en-US
To: Dmitry Rokosov <ddrokosov@sberdevices.ru>, neil.armstrong@linaro.org,
 jbrunet@baylibre.com, mturquette@baylibre.com, sboyd@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, khilman@baylibre.com,
 martin.blumenstingl@googlemail.com, conor+dt@kernel.org
Cc: kernel@sberdevices.ru, sdfw_system_team@sberdevices.ru,
 rockosov@gmail.com, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230607201641.20982-1-ddrokosov@sberdevices.ru>
 <20230623082201.7tfnpjvwi22omleq@CAB-WSD-L081021>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230623082201.7tfnpjvwi22omleq@CAB-WSD-L081021>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230623_014925_171522_DA0E4514 
X-CRM114-Status: UNSURE (   7.24  )
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

On 23/06/2023 10:22, Dmitry Rokosov wrote:
> Hello Neil, Krzysztof, Jerome, Martin, Rob and Conor,
> 
> Would you please review this patch? The latest modifications enable CLK,
> EFUSE, USB, SDIO (WiFi), and UART (BT) functionality on A1 boards.
> 

It's not a binding...

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
