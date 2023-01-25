Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8885C38142
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Jan 2023 00:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YOiXktUdDw8v0hTQ+HqTUGQqzNKUfI+Mtsj6spwXhEw=; b=qS1iV4bsuWGDlc
	HAPg4ElCybA2ljZrfczQ21Ap7yQqipe1mfSEO1DataRSv5ADO6gtzk3jFMQJexHOg0SRVPpwro6vl
	mZyFPxwwtX/8VeCnPsj16yqJAGKiTv2pJmuZNfLr78OlWmGNEK4Hz0VhusQQPT5aZA+L5B9aRistE
	28Y6Pkifx/bTpVgNSkqcB5agQO+vWKAo4FmKwUbWvTZX4BuUO7lREVZvzmZ+QUBLl0hD3GAOc8IEH
	1maZZj2VB2mIJ2SwNpn7KPNAfZoKpeiirAk8lBMOHnun8LIdzy9YVuPkvP59QEytpuBHUHFLz1LVY
	fyJnYYyH5JrCmCiKUZmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKTcS-005h4q-ON; Wed, 25 Jan 2023 00:26:28 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKTbm-005gmh-O1
	for linux-amlogic@lists.infradead.org; Wed, 25 Jan 2023 00:25:51 +0000
Received: by mail-pl1-x629.google.com with SMTP id z13so16401493plg.6
        for <linux-amlogic@lists.infradead.org>; Tue, 24 Jan 2023 16:25:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=KJMUKY3zTm6MQ75YsWGgU7PFwk59bDePXFG7Ge9OoWk=;
        b=2dvCJGjmKzjH5V+egK2r6k3mPZ+wGtMTgrO0Y2AJ45jUrZ0yMxzHpiQIUfptAPk60n
         Juv6Q35aZPqcb65MkchVgu+O+rtZk+Ny2siEy8W/B6z23DjZ5r8DfZ/OIlg+ztDxnBSW
         KNmYf+j6nj/OJnAXzzAtePu+0N16HCQYZtpotShZ8WSlpljP/xltsR79rLXdS/1onXHN
         KLSvPwFuhgNK46cgaVGnFT2GI8AgLN3FCpzmQYk7wf7xrMOtOrOAxuTuSRSWu9mk3Esj
         CpGVyfFDKFULiVnp1it+3Z9s0n0BrV88V/gli060MyahP435OSCf4kEznfhZs0R7q/Rb
         Clrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KJMUKY3zTm6MQ75YsWGgU7PFwk59bDePXFG7Ge9OoWk=;
        b=eL6TyHi0Yz+bmInI35qV/DGGRj6yNZAmvGBT9AvFNrHkmjuPg+hsbbLV8rULoUQZTz
         d+B+3y3goL1YRGmNCg3ath9Ria5K9YLLOcRktfxWosrVBjBrveAwF6xO9es5o9vKDp/v
         xDT2gvJVZUqen/xpeoRkZxCGdbg60rJcbVjyHXPRz3LyHIedgz3FK1qj5QT9NMhCas06
         GqTCxyMpyt72YMyefCFnhs8KvqfVAsSASehtXMaNZpcrnlQ6SpQUTj+LsNugKWYOAbVU
         GGzdIl0gUly4Gq2ACqPhslvYK/AluAADrU9x3MZQFOunjJRHhgIoElqlHQ1kh19BAxxh
         T9mg==
X-Gm-Message-State: AFqh2kopu7As7dVBJcgJC0n7aUX8Wtsdt1kLKd+oH9ruhiwdx2dN/bj3
	6e0aip2y1wJx78/z5CmGIqu3rA==
X-Google-Smtp-Source: AMrXdXtUJ8P23fSUzQuB7DsEKfl2XNjY2yacBcfoITkTQ3RLFH0GLWO5VixcRx4bdkAn8A0w2uskdw==
X-Received: by 2002:a17:902:e8c1:b0:192:ac33:7f91 with SMTP id v1-20020a170902e8c100b00192ac337f91mr26672038plg.69.1674606345169;
        Tue, 24 Jan 2023 16:25:45 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id d9-20020a170902854900b00186b3c3e2dasm2243159plo.155.2023.01.24.16.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 16:25:44 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Yu Tu <yu.tu@amlogic.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring
 <robh+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Jerome
 Brunet <jbrunet@baylibre.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>
Cc: "kelvin . zhang" <Kelvin.Zhang@amlogic.com>, "qi . duan"
 <qi.duan@amlogic.com>
Subject: Re: [PATCH V6 1/3] dt-bindings: clock: document Amlogic S4 SoC PLL
 & peripheral clock controller
In-Reply-To: <9c34a8fc-de76-4beb-8841-9bcfd1a55cd1@amlogic.com>
References: <20230116074214.2326-1-yu.tu@amlogic.com>
 <20230116074214.2326-2-yu.tu@amlogic.com>
 <02b6b3a6-e2ad-8cbc-fa15-fbd2db6ada64@linaro.org>
 <7c0133a2-ea4d-645e-3df2-2bb832bbd498@amlogic.com>
 <7hwn5jqrxf.fsf@baylibre.com>
 <9c34a8fc-de76-4beb-8841-9bcfd1a55cd1@amlogic.com>
Date: Tue, 24 Jan 2023 16:25:40 -0800
Message-ID: <7ho7qnh33v.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_162547_075121_3D200C4F 
X-CRM114-Status: GOOD (  13.83  )
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

Yu Tu <yu.tu@amlogic.com> writes:

> Hi Kevin,
>
> On 2023/1/19 8:38, Kevin Hilman wrote:
>> [ EXTERNAL EMAIL ]
>> 
>> Yu Tu <yu.tu@amlogic.com> writes:
>> 
>>> On 2023/1/16 16:29, Krzysztof Kozlowski wrote:
>> 
>> [...]
>> 
>>>>> diff --git a/include/dt-bindings/clock/amlogic,s4-peripherals-clkc.h b/include/dt-bindings/clock/amlogic,s4-peripherals-clkc.h
>>>>> new file mode 100644
>>>>> index 000000000000..bbec5094d5c3
>>>>> --- /dev/null
>>>>> +++ b/include/dt-bindings/clock/amlogic,s4-peripherals-clkc.h
>>>>> @@ -0,0 +1,131 @@
>>>>> +/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
>>>>
>>>> Unusual license... are you sure to license the bindings under GPLv4 or
>>>> GPLv5? Fine by me.
>>>>
>>>
>>> Yes.
>> 
>> The rest of the bindings for Amlogic SoCs are GPL-2.0 (without the '+').
>> Adding the dual-license for MIT seems fine, but adding the '+' is
>> curious.
>> 
>> It would be helpful if you could please explain why you'd like these
>> bindings to be licensed differently than the rest of the SoC family.
>> 
>
> I actually refer to the previous g12a Soc.
> https://elixir.bootlin.com/linux/v6.2-rc4/source/include/dt-bindings/clock/g12a-clkc.h
> https://elixir.bootlin.com/linux/v6.2-rc4/source/include/dt-bindings/clock/axg-clkc.h
> [...]
>
> So if you think it is not necessary, I will delete the '+' as you 
> suggested. Don't know what you choose?

Drop the `+`

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
