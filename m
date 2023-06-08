Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E922C7EE23
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Jun 2023 12:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gcQ09Mhn1ACusMG+6Cq4UoyHV5F69SDW68/IoBlIBh4=; b=CJEKRwBqUqGrJi
	++bn9ddBT1n6F0g91g0IssAb2HIK28z4v4xWoMP1SFkS/qBJIKKESp8asWW6DyLhViOTqY5JdvcAC
	XdFvW39x0aBJYbZoNxbAwUZWUwNMrCmPrkBRffwi3BhiFUvskUpsYUGIcYdcXQxIe2Y4Z6CimtQPi
	h8t2cOEn0oIi5VZrQj6z9RNQIWHoAxhA+BE52JuXu5iWGL4lOFUr6MiZwhe4Qq1FkTYPn/PfCxiTe
	Uk7xA1QF2hKaz943YIt9XB+UqY7qMaWP1jSJdithTxPSBMIpE4ExfVAFCCrn4bottb1fVdWuzTHQp
	3HgXPugoRh45O7CyIhdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7EKJ-009Fd2-1w;
	Thu, 08 Jun 2023 12:01:15 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7EKF-009Fbk-2J
	for linux-amlogic@lists.infradead.org;
	Thu, 08 Jun 2023 12:01:12 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-97460240863so100854066b.0
        for <linux-amlogic@lists.infradead.org>; Thu, 08 Jun 2023 05:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686225669; x=1688817669;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZSfpWD4teVA0PB2ivylgMo2dut6dNPatdLRqxIkNQ+Q=;
        b=WoTNi+ai6NsW8KPLL3LglJc2enfwxbm4PzanNJzUP2kSg8rIB+8VAY8VxVGA8oHiBd
         aCpp7uniWV9tqmT9LxQoBX4diI+7/0VA1bGTXiIVMFDUryAz58F2dSqdQFRzIabkPtNF
         VNDGsZdS4ps1dVEBvYR8lsGyNwWK8Cr5ApUpLqNehriyJel3kUoJJ4shO6wHVkQ+dqCR
         5GmbTemDGR1vowPNxXZAKpRwY6gSO8OCu2T7G2gMkP5bSNHDgfEzSpfwaO2tfbHmy8p0
         xl0hr55EF2E2bIm4H1u8jMtYiKhvJtQItiOUuEnIMdZDwtYP2m7Z6v2WJRZ/sjvFcGRV
         hzXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686225669; x=1688817669;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZSfpWD4teVA0PB2ivylgMo2dut6dNPatdLRqxIkNQ+Q=;
        b=WTbtq6tnFfqCkyceg/xqcTEod1RgwEeXTsccG69Doq7NU90JA9sD/9oA+1W+EDqEQn
         O6vFtAT/nZaJcxIc87I5hJ3lNXunHypIO7OHpos+Rypz7Q/MCRVCk89+zGAMUf6lNBqv
         7pz8Iu1kGiD5G13vm5p5brooa85KrCoVMTwmXq8x6NjtsK1iaXHoeYA09B71+UPyOX3i
         4DtMyUbH85DG1LPhNh1vrG2v0ITVqp2QRuX2nbd4WJV5XyXuETf64/0DrsAcwEme+LD5
         TAN60BF3s4xig/qiUvxnu5K+ANtzhYtZvnZ5LACEZFXClWYs2UiTiXmjD4edi6AhKW68
         uezA==
X-Gm-Message-State: AC+VfDwuSnBYNyj/jKqwplReK77NGwI+mhO0bMyAy5rEWvjJgyPTBg/O
	/C+xycn5UXuYjfiFBG9SSLkMvw==
X-Google-Smtp-Source: ACHHUZ64DPz/2YQ7ZsaUzDtgwN8iEGLtqsNJZpVuVaw6nlFGzaquFSCCNzMzj3L2VCS98bdm8s2DJA==
X-Received: by 2002:a17:907:a413:b0:978:9011:5893 with SMTP id sg19-20020a170907a41300b0097890115893mr3107734ejc.37.1686225668903;
        Thu, 08 Jun 2023 05:01:08 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id gg24-20020a170906e29800b00974638e4a98sm610936ejb.24.2023.06.08.05.01.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jun 2023 05:01:08 -0700 (PDT)
Message-ID: <07c455ff-c44d-891b-e2ef-e5cc612975e6@linaro.org>
Date: Thu, 8 Jun 2023 14:01:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v3 1/2] dt-bindings: nand: meson: Fix 'nand-rb' property
Content-Language: en-US
To: Arseniy Krasnov <AVKrasnov@sberdevices.ru>,
 Liang Yang <liang.yang@amlogic.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: oxffffaa@gmail.com, kernel@sberdevices.ru, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230608044728.1328506-1-AVKrasnov@sberdevices.ru>
 <20230608044728.1328506-2-AVKrasnov@sberdevices.ru>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230608044728.1328506-2-AVKrasnov@sberdevices.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230608_050111_787665_947325EF 
X-CRM114-Status: UNSURE (   7.32  )
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

On 08/06/2023 06:47, Arseniy Krasnov wrote:
> Add description of 'nand-rb' property. Use "Fixes" because this property
> must be supported since the beginning.
> 
> Fixes: fbc00b5e746f ("dt-bindings: nand: meson: convert txt to yaml")
> Signed-off-by: Arseniy Krasnov <AVKrasnov@sberdevices.ru>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
