Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70B97EB64D9
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Jun 2023 10:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C5TUkfJp9d0xCQ7MS6Zn9nuVvaC609OGT33yN1tW2fY=; b=KH/POHA+u/XIan
	umoiMOOyl/oWyGYyY/cVrN1yHtnCJun28fKY1Ue4Plyr5hZN69QDPJ41j+uylBcCmD7wru7Pf0uDD
	KeDA+2CPsfTaJRppa1p2UOzDrHoMK6B2je+MWNZ+wAdRyVlZREJSygS/r67KJTpm3ujbifuLQdwyJ
	jQyd36KLknn82PoGu42OCzxLkB6zvpgdblWSRpyaW0E8qgRQOdHPjBXA47O+WiJkKO0QepeDp8skL
	VUKsIwjXAb/J0iHieYCYHCDRyDHR6ts63kVy/4YWI1wf6UcHICpsfuZWL4wVkNRuNoVokcuVOjjac
	dk7uJCb800udTlKmVVqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qE665-00Cul3-0W;
	Tue, 27 Jun 2023 10:38:57 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qE661-00Cugw-38
	for linux-amlogic@lists.infradead.org;
	Tue, 27 Jun 2023 10:38:55 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-31114b46d62so5094386f8f.3
        for <linux-amlogic@lists.infradead.org>; Tue, 27 Jun 2023 03:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687862330; x=1690454330;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L3/MOT3CxJP5aM43slBN/qL4mRnfKkA3+j6y3t3wdsI=;
        b=SNVEZn4YAshZWJkE5Xn3Rts1zVDViGXdYvpg8JlQ1fRu31LeJb4zaWDgZZF6q4IDmC
         MgZ4ZwCxNHqwxrTcyY1NEcE24HQWhSpcykJLgm6qGgmSW8YqdU90qGDYFUHv4Eouk5MB
         LJb/Ouhut7rD152b5qs1RQahkPkz53NQ7p4YssaRYKxu6pVMqetZh0X8JFd5G9HvEFU0
         VBuKdnQEOKamBLtrTvoO1Q/WjBO2YcFJUh6TMI9pXDkbRtrZG8RbIfS6YEBMSKzIkdEU
         QdcMxTeHUQSuqmj4bbg9vHXmNpCXA5R+f/og/pE/tUbzmf4RbuSJO4+qyF8VzZMtfmtC
         GePw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687862330; x=1690454330;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L3/MOT3CxJP5aM43slBN/qL4mRnfKkA3+j6y3t3wdsI=;
        b=fQUiNJVL27P2dogaSLIERpUO1l+oNw8E40Y+OqG5Jtceiz8tOBSkEf3rvYt9sUfA1r
         ARyXlOicKpuBrXLlgfNWvW6QWc5gkCHSzwnZKsuLmW2RSyGUdqtZlv0pea1QRtSUyF6c
         X8hoeEn4KxdU8KPB68BQ3BRcELFPRyG+Ka0NSDikzuBvE1xe3/NBLZF8qTBUl8bpNQ9l
         53lSC9UVGha2T46G6DztofcpM0ZzM0ft+eesfjLhVnsTTyesmTb0zG5s5AOXTjblkmvG
         HJLqVQlW1QnHxhitEg4RCowMCIt3QXT+i8mvZ4J1UkvJ6c3Pl7nX7av1b7gM1PGIeuFf
         k43Q==
X-Gm-Message-State: AC+VfDx5c3OXshYVJRFtTVt8ze83MKpYYBPr8xUp1lz4MbCvufb4mUzB
	h4R5yE8kHzRoCb6FIbaIelwoNQ==
X-Google-Smtp-Source: ACHHUZ4e79OUOLu9PEPPro9WRy7ixp8c2KMi26jFGQRDOhcDgBTcT9WDuKo2QJW4bgA+8onCjmpIgQ==
X-Received: by 2002:a5d:5752:0:b0:314:216:5797 with SMTP id q18-20020a5d5752000000b0031402165797mr691620wrw.15.1687862330016;
        Tue, 27 Jun 2023 03:38:50 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id u8-20020adfdd48000000b0030ae6432504sm9932105wrm.38.2023.06.27.03.38.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jun 2023 03:38:49 -0700 (PDT)
Message-ID: <6b001578-79b9-6bb6-4420-bae4a27d0fa8@linaro.org>
Date: Tue, 27 Jun 2023 12:38:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v6 2/4] dt-bindings: serial: amlogic,meson-uart: Add
 compatible string for T7
Content-Language: en-US
To: Lucas Tanure <tanure@linux.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Nick <nick@khadas.com>, Artem <art@khadas.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20230627091007.190958-1-tanure@linux.com>
 <20230627091007.190958-3-tanure@linux.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230627091007.190958-3-tanure@linux.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230627_033854_043190_98A4A970 
X-CRM114-Status: GOOD (  11.83  )
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

On 27/06/2023 11:10, Lucas Tanure wrote:
> Amlogic T7 SoCs uses the same UART controller as S4 SoCs and G12A.
> There is no need for an extra compatible line in the driver, but
> add T7 compatible line for documentation.
> 
> Signed-off-by: Lucas Tanure <tanure@linux.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


This is a friendly reminder during the review process.

It looks like you received a tag and forgot to add it.

If you do not know the process, here is a short explanation:
Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions. However, there's no need to repost patches *only* to add the
tags. The upstream maintainer will do that for acks received on the
version they apply.

https://elixir.bootlin.com/linux/v6.4/source/Documentation/process/submitting-patches.rst#L552

If a tag was not added on purpose, please state why and what changed.

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
