Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5B94C61D97
	for <linux-amlogic@archiver.kernel.org>; Wed, 22 Nov 2023 17:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ECurI0sK/w+XTf0mQ8tIPw1/PPH+J/oStZ9/xZNPgr8=; b=TVJaEk/jlIM5MH
	1pzr+PaykBzB5I0QSRbQZwkVDWfdScBwcL8hcQIpI4XUlUC/ngP3sgU/3IL4W5KDWepoOQrcEugqF
	CNznfrdNvnP/8vrYetMb+nhG9+q49LxcCgMboogD/X5C9S0Ct4J089K6LavCN5tu8R3uop01Ptjc8
	FiEfvemD9BTGoBJJZ6tUTt+qp4oo2vY1K+qwhXHgKVAkYDQhZRBnwVADwtKrU/IxYvVC4ewOn7bNR
	Zk7sPcCHIeC207Sn/aNbDcwoPJaO/klZeK/mAF2cpZeH9va0oV6JYmZ4VYpKvqtBqAIF8bYsIrNGr
	qdK0IuHDOjCvn2Iw4m2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5qrn-002dY2-1j;
	Wed, 22 Nov 2023 17:18:23 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5qrh-002dW6-2q
	for linux-amlogic@lists.infradead.org;
	Wed, 22 Nov 2023 17:18:21 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-40891d38e3fso32346615e9.1
        for <linux-amlogic@lists.infradead.org>; Wed, 22 Nov 2023 09:18:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1700673495; x=1701278295; darn=lists.infradead.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=EhO7+CVm1m1oUE9z/3Z07Nkno2ujdBPUPga6VKMIC2w=;
        b=nYkBgQN7rrROcOZuQhNfxAxfWdW1EtihL+UW6ty2q7Xe73DPhDStkd5EIWrOZFyOxh
         ibRXarFsKxOrz+bVR1PSGl+ethLoMzhAg5T1NCyxm/E/KMp8pnI1i4SeJkYOjJkqaUFz
         K3zfY9SD/RYkxC46CRbFfT/CaY2FSztZ1ulaMXGMZFvXbWZgfaYZaQsB1tNR5S8QNbYm
         6U82ww00XWZmC0g57ImqY8FtS4u4p7+2G6capRhlIDV+PH0I4trWufRvJmzYfz/2warn
         i7Kisi5x6ivA5MvlckVzKze0Yfjx1mjrAfEUvPnZOWrPc59kASrrdKO7PrkG9cJPrrO7
         Ow/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700673495; x=1701278295;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EhO7+CVm1m1oUE9z/3Z07Nkno2ujdBPUPga6VKMIC2w=;
        b=PbrkJa1OJfbUaYeKMhVKp0ADNyccykap1jSEOAqf2xYNcoU078Z0Ij9sYitUF68JaB
         xRzqWhZOjiTmyg9VbX+K64KyDpBKbuiBdrwd2bDUNIRY2gEnuLU9i8S3E4AJcsj9dQ3W
         S4SARm2h6xIVT9vgIGJ3E/gw9w/fe2WXIzwFr4lDGtkKXkFNGzq1p62VkMte1182DAcT
         ff/QVG8RpTfp1y9Fn87aRvt6wCRq67YkQJzFXE9J7m6XMkL3ELNvBI33w58aXcuiOgNd
         Gtl4A6s0OLxU1x3v0no0HV/SUHLPCjE49M6YX3gLLEJj4wDKLXOv5sl+hdd22JFNIrJs
         jZyg==
X-Gm-Message-State: AOJu0YxtvnoQljFDTftlfb04rKIwa1s0r+s/oBnFZJZNrkMUwwWGaJRf
	03kCsFdNYXi44v7eUDPdVTroZQ==
X-Google-Smtp-Source: AGHT+IFGdEFm+aNRJMiaufK8tp1EybalqBvtuMK496Fp/eAzQQiZ+CFnVm6AN+L996HflL2LKvAZfw==
X-Received: by 2002:a05:600c:5102:b0:405:3455:e1a3 with SMTP id o2-20020a05600c510200b004053455e1a3mr2350009wms.17.1700673495188;
        Wed, 22 Nov 2023 09:18:15 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:d0a1:9a3c:4f4b:fa20])
        by smtp.gmail.com with ESMTPSA id n5-20020a7bc5c5000000b0040775501256sm8791wmk.16.2023.11.22.09.18.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 09:18:13 -0800 (PST)
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
User-agent: mu4e 1.10.7; emacs 29.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, neil.armstrong@linaro.org, Rob
 Herring <robh@kernel.org>, JunYi Zhao <junyi.zhao@amlogic.com>,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, Thierry Reding
 <thierry.reding@gmail.com>, linux-kernel@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-amlogic@lists.infradead.org, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH v2 2/6] dt-bindings: pwm: amlogic: add new compatible
 for meson8 pwm type
Date: Wed, 22 Nov 2023 17:14:56 +0100
In-reply-to: <2d9c4c93-6cea-4a44-9093-c1fd51d0a21c@linaro.org>
Message-ID: <1jjzq9emga.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_091818_117190_6A93BB00 
X-CRM114-Status: GOOD (  31.14  )
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


On Wed 22 Nov 2023 at 16:46, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:


>>>>>
>>>>> Again, where the "v2" is defined? Where is any document explaining the
>>>>> mapping between version blocks and SoC parts? Why do you list here only
>>>>> major version? Blocks almost always have also minor (e.g. v2.0).
>>>>
>>>> Again, v2 does has nothing to do with the HW. Never wrote it was.
>>>> The HW remains the same.
>>>
>>> Don't add compatibles which are not related to HW, but represent
>>> software versioning. Software does not matter for the bindings.
>> 
>> What I did I explicitly what is recommended in Grant's presentation from
>> 2013. 10y old, but I assume slide 10 "Making an incompatible update" is
>> still valid.
>> 
>> https://elinux.org/images/1/1e/DT_Binding_Process_glikely_ksummit_2013_10_28.pdf
>> 
>> Breaking the ABI of the old compatible would break all boards which use
>> u-boot DT and pass it to the kernel, because the meaning of the clock
>> property would change.
>
> You broke U-Boot now as well - it will get your new DTS from the kernel
> and stop working.

U-boot will continue to match the old compatible and work properly.
When the dts using the new compatible lands in u-boot, it won't
match until proper driver support is added. It is a lot better than
breaking the ABI, which would have silently broke u-boot.

I don't really see a way around that.

If you have better way to fix a bad interface, feel free to share it.

>
>> 
>> Doing things has suggested in this slide, and this patch, allows every
>> device to continue to work properly, whether the DT given is the one
>> shipped with u-boot (using the old compatible for now) or the kernel.
>
> OK, that explains the reasons. I read your commit msg and nothing like
> this was mentioned there. What's more, you did not deprecate the old
> binding, thus the confusion - it looked like you add entirely new
> hardware (although you put "deprecated" but in some unrelated place, not
> next to the compatibles).

The old interface being obsoleted by the new one is mentionned in the
commit description, the comments in the bindings and the bindings itself.
Thanks a lot for pointing out the placement mistake. I'll fix it.

The commit description says:
* What the patch does
* Why it does it:
  * Why the old bindings is bad/broken
  * How the new ones fixes the problem
* Why a single compatible properly describes, IMO, all the related HW.

This describes the entirety of what the change does.
That seemed clear enough for Rob. If that is not enough for you and you
would like it reworded, could please provide a few suggestions ?

>
> Anyway, the main point of Neil was that you started using generic
> compatible for all SoCs, which is wrong as well. I guess this was the
> original discussion.

The whole reason for this change is to properly describe the HW, which
is the 100% same on all the SoCs, or SoC families, concerned. The only
reason there was a lot of old compatibles is because it was used to match
data in the driver (this is clearly wrong). This data would now be
passed through DT.

I have been clear about this in the change description.

So why is it wrong to have single compatible for a type of device that
is 100% the same HW ?

It is lot a easier to apply a rule correctly when the intent is clear.

>
> Best regards,
> Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
