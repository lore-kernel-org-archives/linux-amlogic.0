Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B6D3C05027
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 Feb 2023 20:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iq3JuqRcx+33qcq0fNsTILA0pUbgEUsmHVmd4muF1sc=; b=iperrWG4ZMs++v
	obHTpxcd+PACJn92x4gmrpj5rhaSegl8pA2cu1xpkHRFRSL7nmouZfh6Vv6QCy4x6qpUCImFDnjA6
	3iFzqrZBX6cYV4GE1uT1LC33X7slRfefd4LRNI0FFtfgK3WchzQ/rRIqqRUdxjM+BlJvBgtlltSkr
	1j8cGFrdUjHe2byCw9w/IWIZG5gCNm+V0U4hvYk7vHTusRjcNk03pNFIl0CVKBooJODjqVeACX+Yi
	iP6Y5WHPFEbwZKuLlth+DBm881eOAwPT1FwQW0nmVSrS2s5XlkwFgT+yd3MnV8Oyg4odyDDhRgpGB
	U3q0eq1skg/mOOqOr3tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pO2fG-003VDi-Nn; Fri, 03 Feb 2023 20:28:06 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pO2fD-003VCF-W8
	for linux-amlogic@lists.infradead.org; Fri, 03 Feb 2023 20:28:05 +0000
Received: by mail-wm1-x32c.google.com with SMTP id k16so4748299wms.2
        for <linux-amlogic@lists.infradead.org>; Fri, 03 Feb 2023 12:28:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OcaR471TXAjGr31MjNbqXuBFmDxa1S6cNX7l4YGYmRI=;
        b=SezcXEcWF/dRKemlQQqQWL8NAYRbNZuSckOdAlUWdAlQWpoWXU5+usWAHMA82BZBLg
         CXMBSlZbEGaxjypt6Nfl0LkI9duN6m5fNPGEgGmIGAZOb5oCE5TO/Od8nQwCnEPL40N0
         zbUDICs8/GZ8i596nTr05XvUC7rjuRvdgdoAkptotziPI32OLe9w9GB3a75qEeMMne0x
         UeQMPNIIWo2T08GbT02VdVoXOskEeQOdTZohR5myokK1bR3slxoQ7DzJMiGISiAKXEuk
         5d6EiVdMUeAWT2NKr/JXCVXQ6bLsF6Hnct6TneOHGvketNvDbD5c9etecDSFFEnA+AJj
         EcOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OcaR471TXAjGr31MjNbqXuBFmDxa1S6cNX7l4YGYmRI=;
        b=LNjiwPAo7auvDeWGGNLYCHtofw32pgNUdSfQVtV489Dmnm5OY6rRPSVfwvVgyPMquf
         IsZKUDCIQ/VRtQI7s9lftkg0W1+dUl8LqsXOJue5hAAFwT/U7cAS51f0uTnjw/mE1euT
         PTqO/yfBdCue3ulUd3LjgJIo/fmFN3yCKbBANcEtx9Uz8mGjLD3C0yjrl+dfLtMvwMQy
         Vf/oYgtATN5/cWu2v6mW/3ZlNlHP7O8Jqko7mvHirWD8SzgKjpyMtyeDdCHndUYXZtDg
         WA5Mlec1v5AdbVfhCAIeLs73DzEsdbwFV2uCKqlI8lz3pao1iwMI7XKXAos9N7+Ye5NF
         gM7Q==
X-Gm-Message-State: AO0yUKXulPZW2ysr/og6e9Wdh9y4v7amfWJtBeo3Fmin47t/W3ArhV6s
	bIrRjp7EP044atCSe9N9SF+VNw==
X-Google-Smtp-Source: AK7set96RpaTqpX9Bfu005sId7DrlnJXnLTXqwwUkaTAzF2cO0cHdxloiYdhXNMOBbDNxsyHPR3krw==
X-Received: by 2002:a05:600c:1c06:b0:3d9:fb89:4e3d with SMTP id j6-20020a05600c1c0600b003d9fb894e3dmr11971335wms.28.1675456081778;
        Fri, 03 Feb 2023 12:28:01 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id q9-20020a1ce909000000b003dc34edacf8sm8466662wmc.31.2023.02.03.12.28.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Feb 2023 12:28:01 -0800 (PST)
Message-ID: <79474344-0bf1-ba0e-6bae-0ccb4e3a3aee@linaro.org>
Date: Fri, 3 Feb 2023 21:27:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 9/9] ASoC: dt-bindings: meson: convert axg sound card
 control to schema
Content-Language: en-US
To: Jerome Brunet <jbrunet@baylibre.com>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org
Cc: linux-amlogic@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, linux-kernel@vger.kernel.org
References: <20230202183653.486216-1-jbrunet@baylibre.com>
 <20230202183653.486216-10-jbrunet@baylibre.com>
 <f229e181-c56d-6ec7-2a1c-754690f70438@linaro.org>
 <1jfsbmn7ql.fsf@starbuckisacylon.baylibre.com>
 <fede7119-4a9b-76a1-ae1a-7af5dd8d1032@linaro.org>
 <1jbkmamtfg.fsf@starbuckisacylon.baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1jbkmamtfg.fsf@starbuckisacylon.baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230203_122804_085385_43234C22 
X-CRM114-Status: UNSURE (   9.06  )
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

On 03/02/2023 20:34, Jerome Brunet wrote:
> 
> On Fri 03 Feb 2023 at 18:59, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
> 
>> On 03/02/2023 15:13, Jerome Brunet wrote:
>>>>> +          Multiplication factor between the frame rate and master clock
>>>>> +          rate
>>>>> +
>>>>> +      sound-dai:
>>>>> +        $ref: /schemas/types.yaml#/definitions/phandle-array
>>>>
>>>> Old binding was saying it is just phandle
>>>
>>> It is just a phandle but the bindings used to have problem with phandle
>>> that had cells.
>>>
>>> See:
>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml?h=v6.2-rc6&id=d031d99b02eaf7363c33f5b27b38086cc8104082
>>>
>>> Was it wrong or did the situation change since then ?
>>
>> Then define it as having cells:
>>
>> https://elixir.bootlin.com/linux/v5.18-rc1/source/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml#L42

Eh, it is already defined, so my advice is incorrect. Drop the ref and
define maxItems.

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
