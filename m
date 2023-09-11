Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 932B4EE57DF
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Sep 2023 17:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HsDCuEcCCoXfMzz9T9phwC+ZDBzQH4WD+tgTBVQ9j0o=; b=wmCJzBXPSfR+y4
	9VRffOdcpQpcLysEZOLLaN4AvQ4fATh1/zLI0PA5XujNXC2hFxi25YCvBgQWr/qXd1GgUQ8zuI1W9
	8wuq5gP2UuCso7pVyF/Ws5kHYLiNu8UgPxbBnUqhtirrg5ccRjcoCFan1sOLEbiPZSOpKqnY14GMR
	C+bsODfyruJ+Oc0MgzuXtY25UcFStKr0xOGlMnqV1kc6fFUdGHkdc+gsVE6z867asw1jq0ofhIXnU
	4C2J9X+RSxG/TUo7lmfle/IzDx2bnwSprz3/hABqRxACz+UQlcOON2WBzAO3saloJsESl0y1yk2a7
	1wNn9HI8AkE4gJoXXLTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfkG9-0012Og-2O;
	Mon, 11 Sep 2023 16:59:37 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfkG6-0012OL-1N
	for linux-amlogic@lists.infradead.org;
	Mon, 11 Sep 2023 16:59:36 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-401b393df02so55054995e9.1
        for <linux-amlogic@lists.infradead.org>; Mon, 11 Sep 2023 09:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1694451572; x=1695056372; darn=lists.infradead.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=b6zpEfFwTnyi86KDgClkEQHR3xaNBEnZrwWpoCsbQ28=;
        b=CA0uYWQZuQfiQ9MzeUs6QmAIMUj2ttBrIPKhNRNNtmDnu17JiPJ+uR4yJZaGULokmM
         Kq7C3RjbWaPwZHmg2oHLQc+zLvBf45vk8wCA/slPGPV/LWvmIFhkn/LMQGrbOJkVqiHm
         YwaZhKzhMa5Yl5mtWfS/23tNFgueXOa1Sb56rcFNfuvx9wiB5+C3n93pz/tAexBMvYhL
         iv8YrNOTn/kpserSm++sjbSuzHCFAmVZT4Jaofsu87GiMWQT8MAGKSK3Oryun798qgr9
         nk+BSQPFUjukgCN1TmvzhEQ/GuVjiw9gExsYc36iofm+KkX6FXLT2WdFGalG9dxwqOMp
         jyzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694451572; x=1695056372;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b6zpEfFwTnyi86KDgClkEQHR3xaNBEnZrwWpoCsbQ28=;
        b=iTd87HJxUCsYggfcBiDP6NJniuZdWP1JpREVnXVMWJALUu3rwbzICioxzGtO34mZWX
         QE258Ysed8XJPNBPvVl7i1ZBktVIog9UFxrI3QYiUd4e95z2IWIF+T1408GLMkZLcscF
         I51eXX7ZsmIIYWDQWCJYdGwKYwGAhO+8ebkuz9N7BiY/KD+r2N1AydCROG+JxmJCXgQz
         exY0hU/7LyhBSygYOSWGcIOhITD9rWpC57D7trxq4/yM1BD8Rq+EvRPKdo1uCvwF9eGr
         HxZ80Q6+ks0vTQsc43iCubYDahwutcCa1Klj6K7MXT9b2xYKulqIcHFv0IztK7q6ksXs
         IKQQ==
X-Gm-Message-State: AOJu0Yy6Qyj86NwLZtTT6gesSQN3ljH524grIFxbHtdKrrmjW/YOz/mE
	jnirSvhu2xMUKSFMOk5orkRv5g==
X-Google-Smtp-Source: AGHT+IEd7G9QslE1ZtHxoDPCKdw54RbxizV0I6HFmOXEbzd4jr7xHnnQtJ22ouuYqItKPr+D/yJB6A==
X-Received: by 2002:a7b:cc95:0:b0:401:2fab:43e8 with SMTP id p21-20020a7bcc95000000b004012fab43e8mr9096813wma.15.1694451572036;
        Mon, 11 Sep 2023 09:59:32 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:55be:8f7e:5f59:7ed1])
        by smtp.gmail.com with ESMTPSA id r18-20020a5d6952000000b003141a3c4353sm10655684wrw.30.2023.09.11.09.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 09:59:31 -0700 (PDT)
References: <20230911154541.471484-1-jbrunet@baylibre.com>
 <20230911154541.471484-6-jbrunet@baylibre.com>
 <eedc9787-06b7-bac5-a1f5-ba07d23f4ac7@linaro.org>
User-agent: mu4e 1.8.13; emacs 29.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 5/5] arm64: dts: meson: u200: add onboard devices
Date: Mon, 11 Sep 2023 18:52:44 +0200
In-reply-to: <eedc9787-06b7-bac5-a1f5-ba07d23f4ac7@linaro.org>
Message-ID: <1j5y4g4pe4.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_095934_766325_83EB76C7 
X-CRM114-Status: GOOD (  14.85  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Mon 11 Sep 2023 at 17:56, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

> On 11/09/2023 17:45, Jerome Brunet wrote:
>> Add missing audio devices found on the u200 PCB. This includes
>> * Lineout connected to the internal DAC
>> * SPDIF input connected to a coaxial socket
>> * TDM input decoders allowing output loopback
>> * TDM A and B output encoders and interfaces
>> 
>> TDM A and B link format is set by the related external codec.
>> Internal audio DAC can hook to any TDM output.
>> 
>> This change does not include support necessary the optional the speaker and
>> PDM Mic headers
>> 
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> ---
>>  .../boot/dts/amlogic/meson-g12a-u200.dts      | 228 +++++++++++++++++-
>>  1 file changed, 218 insertions(+), 10 deletions(-)
>> 
>> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
>> index da66e2e1dffb..9abe37b5b227 100644
>> --- a/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
>> +++ b/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
>> @@ -9,6 +9,7 @@
>>  #include <dt-bindings/gpio/gpio.h>
>>  #include <dt-bindings/gpio/meson-g12a-gpio.h>
>>  #include <dt-bindings/sound/meson-g12a-tohdmitx.h>
>> +#include <dt-bindings/sound/meson-g12a-toacodec.h>
>>  
>>  / {
>>  	compatible = "amlogic,u200", "amlogic,g12a";
>> @@ -19,6 +20,22 @@ aliases {
>>  		ethernet0 = &ethmac;
>>  	};
>>  
>> +	dioo2133: audio-amplifier-0 {
>> +		#sound-dai-cells = <0>;
>> +		compatible = "simple-audio-amplifier";
>
> compatible is by convention first property. Do you have different style
> in Amlogic/Meson?
>
>> +		status = "okay";
>
> status is by default.
>

It look odd to me too but this was be consistent with the other codec
introduced by the change being fixed by this patchset.

>
> Best regards,
> Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
