Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5227CC61D97
	for <linux-amlogic@archiver.kernel.org>; Wed, 22 Nov 2023 18:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/XYkWHbB5+7CdU6fBL/d4ZmFUqlN0a1vGPQcEi4IKbE=; b=2L5oMt1ppGOsN6
	IRlGZmslHVM25HzipKm03U0pnfxT8NHfYPPuLOWt7lDSdmton+eZ7s7cPzX4KX7RJovXn8PiblPc6
	gfF7ag0jtKoRVcKrlA7ILJ9zkt2Xjy6eI3rFxlxb8CS/IsktilgeOJcVH4fA0pUuB7tbJCb0kMLz7
	K/QPNCQ1VFs9aKup23g730YSMsmYfgjmyBRMsQOWGBQg0Ek+TDYdqGJGiq5Lcz5U28WMukEc2oc2G
	YM0Op9cE8PLZL9At7jklWOlSYsVVPFCj1FDyiDpTGs29hgKoWoKlj5g6j3ZazKLNCIWF6UUUpfVld
	gmviRL3GmJ7+BG5kEO7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5rev-002lZq-15;
	Wed, 22 Nov 2023 18:09:09 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5rer-002lZH-1s
	for linux-amlogic@lists.infradead.org;
	Wed, 22 Nov 2023 18:09:07 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-50970c2115eso10117505e87.1
        for <linux-amlogic@lists.infradead.org>; Wed, 22 Nov 2023 10:09:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700676542; x=1701281342; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=61r2bcwQoi4CJDk5SqSdw7/KG0QOUiAzIJy8fZUsQUM=;
        b=VSv2d54zuiKzR96H2VHnzuU+SIt0lJLioEdpdp/g8RzgCPuN0xzGYTTuwxW7mPKH8k
         Ku+XOoSpbex+RPYyWTHeWdx/h82tEe1JpfQr48oM3Atn81i16dU24CIhX+iaC6UDEHUB
         bG95Wij4vYGWWbwGGn5JhqniM8CWEyMT/6mZrDISk1pC1iAlkhvgiIAW0NWU/EttGP6y
         Zu9JGCUaMjYNBVQGx7tEbkfyLeZ+vFxxmoBKTvir19YfIssE5xOepBH1KTOXJzpRC7cU
         pvR18sOJcYWHhYcow41vL3GKa8NoNpE29/HB5K74X/LtaqAh1uEA0BQ594tUPVWaIQEJ
         qcFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700676542; x=1701281342;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=61r2bcwQoi4CJDk5SqSdw7/KG0QOUiAzIJy8fZUsQUM=;
        b=cEmo8pj5Y4NRYklnaeMGlRNLOlY4F008SiPWORXClHGdmzDJ5EGDyv4jLVRxni+uVh
         L3uOMiC2sa6TVAPAu8uP3i/pFSoeVAcU73xe0lpWbxLZW6v8pMVO65AI9jRWjhMVDejw
         gdnVBEFkEbXy1OZqfz3dZWtS4gUwUfakJq8MvIjbk/Kfes9HjJr9yFWzQukWcMu38adh
         EZe9b0dbqU5xqeUcnoFTbwYJopPfKZEgefkhZSwmtX51sStb3nTgeod4RhYLoxnw0/nt
         6yASFifcTeKqa6ue345j+IHDCsWZNA3ETJE5rzcrPp1zPyG694+qHnH7ZqqUqYGHj4g+
         tzUA==
X-Gm-Message-State: AOJu0YzZH9NQiXa/rOPnVSy9QGB5Wet1NbnByOzoEu76n+mDDWAalSa1
	L0mnaTQKAMT7Uo79oE0Kp96P1Q==
X-Google-Smtp-Source: AGHT+IGYAXrwm5o+Py9/GZEWr7OBAZ6fBZTpyw9LdLv4PV+mfsjraxUvZ5ekZ4luKxlBbWY1Xn5K/A==
X-Received: by 2002:a19:6545:0:b0:50a:a95b:3c90 with SMTP id c5-20020a196545000000b0050aa95b3c90mr1875346lfj.47.1700676542402;
        Wed, 22 Nov 2023 10:09:02 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.100])
        by smtp.gmail.com with ESMTPSA id c23-20020aa7c757000000b00548a408f662sm52843eds.49.2023.11.22.10.09.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Nov 2023 10:09:01 -0800 (PST)
Message-ID: <5219b373-8b37-4f12-ad55-0984e3d84b62@linaro.org>
Date: Wed, 22 Nov 2023 19:09:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] dt-bindings: pwm: amlogic: add new compatible for
 meson8 pwm type
Content-Language: en-US
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: neil.armstrong@linaro.org, Rob Herring <robh@kernel.org>,
 JunYi Zhao <junyi.zhao@amlogic.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-kernel@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-amlogic@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20231117125919.1696980-1-jbrunet@baylibre.com>
 <20231117125919.1696980-3-jbrunet@baylibre.com>
 <170040994064.269288.960284011884896046.robh@kernel.org>
 <4608012c-059f-4d6a-914b-e85ad0c32ff0@linaro.org>
 <1j5y1wg3sb.fsf@starbuckisacylon.baylibre.com>
 <2e7a65da-5c1d-4dd4-ac69-7559a53afdf3@linaro.org>
 <1j1qckg21u.fsf@starbuckisacylon.baylibre.com>
 <94e69281-93e1-41cd-9cf5-81cbbc15572c@linaro.org>
 <1jwmu9et6j.fsf@starbuckisacylon.baylibre.com>
 <2bbc2031-89d7-42e9-828e-068fa06eabf4@linaro.org>
 <1jo7flerag.fsf@starbuckisacylon.baylibre.com>
 <2d9c4c93-6cea-4a44-9093-c1fd51d0a21c@linaro.org>
 <1jjzq9emga.fsf@starbuckisacylon.baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <1jjzq9emga.fsf@starbuckisacylon.baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_100905_628730_94DF139A 
X-CRM114-Status: GOOD (  39.11  )
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

On 22/11/2023 17:14, Jerome Brunet wrote:
> 
> On Wed 22 Nov 2023 at 16:46, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
> 
> 
>>>>>>
>>>>>> Again, where the "v2" is defined? Where is any document explaining the
>>>>>> mapping between version blocks and SoC parts? Why do you list here only
>>>>>> major version? Blocks almost always have also minor (e.g. v2.0).
>>>>>
>>>>> Again, v2 does has nothing to do with the HW. Never wrote it was.
>>>>> The HW remains the same.
>>>>
>>>> Don't add compatibles which are not related to HW, but represent
>>>> software versioning. Software does not matter for the bindings.
>>>
>>> What I did I explicitly what is recommended in Grant's presentation from
>>> 2013. 10y old, but I assume slide 10 "Making an incompatible update" is
>>> still valid.
>>>
>>> https://elinux.org/images/1/1e/DT_Binding_Process_glikely_ksummit_2013_10_28.pdf
>>>
>>> Breaking the ABI of the old compatible would break all boards which use
>>> u-boot DT and pass it to the kernel, because the meaning of the clock
>>> property would change.
>>
>> You broke U-Boot now as well - it will get your new DTS from the kernel
>> and stop working.
> 
> U-boot will continue to match the old compatible and work properly.
> When the dts using the new compatible lands in u-boot, it won't
> match until proper driver support is added. It is a lot better than
> breaking the ABI, which would have silently broke u-boot.
> 
> I don't really see a way around that.
> 
> If you have better way to fix a bad interface, feel free to share it.
> 
>>
>>>
>>> Doing things has suggested in this slide, and this patch, allows every
>>> device to continue to work properly, whether the DT given is the one
>>> shipped with u-boot (using the old compatible for now) or the kernel.
>>
>> OK, that explains the reasons. I read your commit msg and nothing like
>> this was mentioned there. What's more, you did not deprecate the old
>> binding, thus the confusion - it looked like you add entirely new
>> hardware (although you put "deprecated" but in some unrelated place, not
>> next to the compatibles).
> 
> The old interface being obsoleted by the new one is mentionned in the
> commit description, the comments in the bindings and the bindings itself.
> Thanks a lot for pointing out the placement mistake. I'll fix it.
> 
> The commit description says:
> * What the patch does
> * Why it does it:
>   * Why the old bindings is bad/broken
>   * How the new ones fixes the problem
> * Why a single compatible properly describes, IMO, all the related HW.
> 
> This describes the entirety of what the change does.
> That seemed clear enough for Rob. If that is not enough for you and you
> would like it reworded, could please provide a few suggestions ?

You did not deprecate the compatibles, so this has to be fixed. You put
the compatible in some other place, not really relevant.

> 
>>
>> Anyway, the main point of Neil was that you started using generic
>> compatible for all SoCs, which is wrong as well. I guess this was the
>> original discussion.
> 
> The whole reason for this change is to properly describe the HW, which
> is the 100% same on all the SoCs, or SoC families, concerned. The only

You still need specific compatibles, because the hardware is not 100%
the same. Programming model can, but hardware differs. Many times
engineers thought that devices are 100% compatible and then turned out
they are not. I am bored to repeat all this again and again.

> reason there was a lot of old compatibles is because it was used to match
> data in the driver (this is clearly wrong). This data would now be
> passed through DT.
> 
> I have been clear about this in the change description.
> 
> So why is it wrong to have single compatible for a type of device that
> is 100% the same HW ?

Because it is generic, not specific (you match "foo" against "bar" SoC).
The chapter from writing-bindings you referenced earlier mentioned this.
You need ability to add quirks and customize for these minor hardware
differences, even if programming model is the same.

> 
> It is lot a easier to apply a rule correctly when the intent is clear.
> 
>>
>> Best regards,
>> Krzysztof
> 

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
