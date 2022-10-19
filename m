Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22FCDC4332F
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Oct 2022 07:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qa1KR+Dw9LzHIsqSpQcywxJvxM4Xx97WQ4VSWKdA4Yw=; b=UcWTtDCBUqjb+gLQxr23ZmEtrN
	RFsUs9qmEzTq8a1AeYBVSwBOowUSxski6VCmUEPBEuvUGrw0lv3wpIFAWhawVSTTFi3c6kLuQwHwD
	576aO9T/Y0DEyOIQcp6Cx8Q5E4uan5OhbPK1nIN+Sl38UJ8sq6WRmw/6LcikBwItXq1fEKxyHwsi0
	N7DF3Ohc9Tr+sMiFDYFikU4sM+jokoSdZuxjAvqFSL3TTDrqJsD2saBp7F5Ly40F0ObI5Wrjs1I9b
	D/Q1iBC06RaT6O8PK8yWtgWgOveRs3sDBRk2TagKdEa0u5DTQZqkicW3nPssCVmNdvxQVcDobVaXB
	bZwa1vcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol3Qz-00GAAa-IV; Wed, 19 Oct 2022 07:24:13 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol3Qw-00GA8b-7c
	for linux-amlogic@lists.infradead.org; Wed, 19 Oct 2022 07:24:12 +0000
Received: by mail-wr1-x430.google.com with SMTP id a3so27526588wrt.0
        for <linux-amlogic@lists.infradead.org>; Wed, 19 Oct 2022 00:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pO5JseBz8j296HTsa3kKnD9/F7eh1kiGFetG6YGNQSM=;
        b=A/dTZiZGo87ELII687rFcq19EVEWe04nVPcMeBcmzA9KkKv8+iQGGIr3k4oPKMQkqK
         KnCnooJ7BEGW2zyS6gsC0AwJ8f7t3hSWDzRBD8KDfaRSJhL+Ou/aNNq2l0FHqutjgboE
         v2uiYoPrLAC88MPy5iiLVceaAFVZ81yzdfP0BwQdFyPAw9NqwC9hvHv4LMx04/gc28v1
         nMxBEMdkmU+li7gSQXHOV71y1PB3hT6eZAPUpXwR0VCJ+F6GJraRC5X2DrZ3RpuPsMqA
         2gOCqy7JPIVVjII+brkNwo77xieGLstZOEOFhC1DAGdlfcujziYCTVHkQuobSOv9sVkV
         394w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pO5JseBz8j296HTsa3kKnD9/F7eh1kiGFetG6YGNQSM=;
        b=I0EoA8fip0x17amGvfeblWIg8j1psz0AvfFIIT01NsgXvMDpKxZ8yRpwhIMZkjUXBl
         xZu01WCzMtmX04uLrPjcp5GdhLuQ4vX0WDTHKRlwQ97pmomCd9L+FAHBJbJC6FYR5doJ
         iE7UBxlT3HUSaQM57wnHKxqX0X0aaYSrUMr9VjDsd+rMdaj33v+Vr0pT5yKNnkKwxZBf
         E5MeG1cKMkBNEJD48CK4uPX2HTtuF4W2dyUD3YaBwzVIhkSsu6xAxIkUM53JM3mq65Pl
         YiV5Pgjh4Oyon0klG1XAnzeV8ePm99noMAhyW6UXLuQDaZT0tqfDv8UldDrT0YWDs2/t
         FjxA==
X-Gm-Message-State: ACrzQf12Bx9BH3nVOGSbkqOgm2YfY6erO1CplFWV21T/OfFCg3pvVjCl
	2dbonZIOkaVFcOHp9gr7PHPqGg==
X-Google-Smtp-Source: AMsMyM41BG7VmonFRVjNhVfV/BEj8FDJYM2MMC9XYIyg52OWiE/yTm381JfFpSAthVXGpTfwKDZ6bQ==
X-Received: by 2002:a05:6000:1102:b0:22e:529:a43d with SMTP id z2-20020a056000110200b0022e0529a43dmr4122710wrw.412.1666164244704;
        Wed, 19 Oct 2022 00:24:04 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:b15b:4b56:592a:c397? ([2a01:e0a:982:cbb0:b15b:4b56:592a:c397])
        by smtp.gmail.com with ESMTPSA id z9-20020a5d44c9000000b0022917d58603sm12975630wrr.32.2022.10.19.00.24.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Oct 2022 00:24:04 -0700 (PDT)
Message-ID: <c0f22ea5-b094-d477-e6e4-c509945587e9@linaro.org>
Date: Wed, 19 Oct 2022 09:24:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] arm64: dts: meson: Enable active coling using gpio-fan on
 Odroid N2/N2+
Content-Language: en-US
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Anand Moon <linux.amoon@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20221018195122.8877-1-linux.amoon@gmail.com>
 <CAFBinCCqXBk9Xq0k=NA3zGi8spwyPQN7dMVWcjE+pXkXYf+FKQ@mail.gmail.com>
Organization: Linaro Developer Services
In-Reply-To: <CAFBinCCqXBk9Xq0k=NA3zGi8spwyPQN7dMVWcjE+pXkXYf+FKQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221019_002410_355104_6082BA3B 
X-CRM114-Status: GOOD (  16.86  )
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

On 18/10/2022 23:16, Martin Blumenstingl wrote:
> Hello Anand,
> 
> On Tue, Oct 18, 2022 at 9:53 PM Anand Moon <linux.amoon@gmail.com> wrote:
>>
>> Odroid N2/N2+ support active cooling via gpio-fan controller.
>> Add fan controls and tip point for cpu and ddr thermal sensor
>> on this boards.
> In the schematics for board rev 0.6 [0] I cannot find any information
> about a fan connector.
> The schematics for board rev 0.3 [1] on the other hand document a PWM
> based fan connector on page 16.

It seems the fan connector is on page 41 on rev 0.6 and it seems to be the same.

> So now I am not sure whether your patch only applies to certain board
> revisions, the schematics are incorrect, etc.
> 
> Can you please provide some details about the fan connector on
> Odroid-N2/N2+ and which hardware revisions are supported (and which
> aren't) by your patch?
> 
> 
> Thank you!
> Martin
> 
> 
> [0] https://dn.odroid.com/S922X/ODROID-N2/Schematic/odroid-n2_rev0.6_20210121.pdf
> [1] https://dn.odroid.com/S922X/ODROID-N2/Schematic/odroid-n2_rev0.3_20190117.pdf

Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
