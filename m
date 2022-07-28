Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C0B8C04A68
	for <linux-amlogic@archiver.kernel.org>; Thu, 28 Jul 2022 11:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:To:From:References:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VPXRn0l6SrTvvwDTpKJCHQIcFK45qDdRyiLOPfZjKrA=; b=OLIJ0wAkkpe1XB
	G6kCX6cZvlgQ0YNjmoQFoLQ+VTyFrmE0uK3Pvk62l4cWNXyX58b+psLr8jGu2cnvs9BV1z5rSIUPO
	BJSV1+VuQqU3SolU0qRcGG8/unJucMqtm/N/94c0w8D479dD3aZll46VMmaDfizuiO+HfWfSNYnRH
	JI4hoUTbJbeYX6p5NBiGi5NgRREGxbKNcA+5iH7hsU5xX1uLK1JywoFMhBpqbz/ZbUezFqzZsra53
	G49wvJWzb4jr/cobbWnc9WvzScMqb/5Tg2mBr01HfAWme5kfBQuI3lRNsuQ/TayVVeclxKx8hntnm
	ixGYvX+P5JbFEWneDVvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oH22A-008uMR-2D; Thu, 28 Jul 2022 11:50:30 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oH21x-008uFC-Ft
	for linux-amlogic@lists.infradead.org; Thu, 28 Jul 2022 11:50:19 +0000
Received: by mail-wm1-x334.google.com with SMTP id r1-20020a05600c35c100b003a326685e7cso3094209wmq.1
        for <linux-amlogic@lists.infradead.org>; Thu, 28 Jul 2022 04:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=references:user-agent:from:to:subject:date:in-reply-to:message-id
         :mime-version;
        bh=FxwqpjhD9/gLaQrnTT9TOXORIlpv5bjNu3/8g5til8A=;
        b=nTEylWFWV5aRYXQnjm2kiRjVJlk7CEQjzrUBHIDJnxn+cY0Vj8Q7ezPN7FgIiJK/+v
         ine2IGE+ebrioKCcdP9pPI+ICu9WtJvFA+PUXlNmr8SoGEJwVEgcyeHUlpHnXNjI/HmY
         pLvlZNwoi1m0h5/WHucjBDABR1SPLS8arubysiloaSV92rt9yiaiMG3l9yCH5l/aQ3/9
         s+IwJzB984E9vKSpdLwuxLICOc1sgE4UtWWOy3UrfagJPHpMHyDvMoK4x3Cyq1tORPeE
         gbi0d45zdtr7iycIpE5AhCbM8wEKpE9OrycAhoQLkNBUjTUoAZMsEcibmKdyhO0fjDjX
         21yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:references:user-agent:from:to:subject:date
         :in-reply-to:message-id:mime-version;
        bh=FxwqpjhD9/gLaQrnTT9TOXORIlpv5bjNu3/8g5til8A=;
        b=BUkmbcdUcYOWqyS1FpmrW7rxwpLWhHInOVFT7BbamQ5E9++/9obV2j1LQcQhV+/Rmg
         xqnXh4uWA8ezQ0n5ckxguPFUr3+zL2lsRMhXgiY9dV0YFpfNnV6NJTxtBj23SNLQyLbh
         B1RDkTfInqRw0f6jjMz3YuZJDyrPY2BuPjhx0RyrP+DhvLHZSu5dQCK+troajkjDusdM
         PMUVqwU6J66b22M2T5ZBxCEFaHtposDNJrDKtfWtXT9Hxr4+aIEXAA8CY20GVy8ihMk2
         qn8QTCi+vO8+Igr5lwKR1xvtPcxgO7iRZvmZTH1CeUF5CwpA7Efk63LO03MjmuwYI/Ii
         HDwA==
X-Gm-Message-State: AJIora8TaHGoHGG2EESkVe0nlS7BHoiZxwK009fwXRelJ+XiuZ1+wnUG
	6xZjOLINjKNkzJElm9Frgh73dQ==
X-Google-Smtp-Source: AGRyM1v0j0TKqWnZsAUWLQ3B4oY6N7U+8YetS6WSCx/Q+1LpG7g7jTIsnd/U+8JWEBXprZeoB78iww==
X-Received: by 2002:a7b:c453:0:b0:3a3:1c65:ff97 with SMTP id l19-20020a7bc453000000b003a31c65ff97mr6046013wmi.180.1659009015199;
        Thu, 28 Jul 2022 04:50:15 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id o5-20020a05600c510500b003a2d6c623f3sm5639135wms.19.2022.07.28.04.50.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jul 2022 04:50:14 -0700 (PDT)
References: <20220728054202.6981-1-yu.tu@amlogic.com>
 <20220728054202.6981-2-yu.tu@amlogic.com>
 <82e3fd36-df96-a555-4cea-47fabd26502b@linaro.org>
 <74cd833a-4773-eeb0-80aa-75ea1cdc093e@amlogic.com>
 <39395257-703b-a5e9-17c3-80f79f67fdc7@linaro.org>
 <ff582551-9661-4404-c00e-853bc60907cc@amlogic.com>
User-agent: mu4e 1.8.6; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Yu Tu <yu.tu@amlogic.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring
 <robh+dt@kernel.org>, Neil  Armstrong <narmstrong@baylibre.com>, Kevin
 Hilman <khilman@baylibre.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Krzysztof
  Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH V2 1/3] dt-bindings: clk: meson: add S4 SoC clock
 controller bindings
Date: Thu, 28 Jul 2022 13:48:14 +0200
In-reply-to: <ff582551-9661-4404-c00e-853bc60907cc@amlogic.com>
Message-ID: <1jbkt9focq.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220728_045017_543869_7323D586 
X-CRM114-Status: UNSURE (   9.86  )
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


On Thu 28 Jul 2022 at 18:19, Yu Tu <yu.tu@amlogic.com> wrote:

> On 2022/7/28 18:09, Krzysztof Kozlowski wrote:
>> [ EXTERNAL EMAIL ]
>> On 28/07/2022 12:05, Yu Tu wrote:
>>> Hi Krzysztof,
>>> 	Thanks for your reply.
>>>
>>> On 2022/7/28 16:41, Krzysztof Kozlowski wrote:
>>>> [ EXTERNAL EMAIL ]
>>>>
>>>> On 28/07/2022 07:42, Yu Tu wrote:
>>>>> Add new clock controller compatible and dt-bindings header for the
>>>>> Everything-Else domain of the S4 SoC.
>>>>>
>>>>> Signed-off-by: Yu Tu <yu.tu@amlogic.com>
>>>>
>>>>
>>>>
>>>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>>>> index c1abc53f9e91..f872d0c0c253 100644
>>>>> --- a/MAINTAINERS
>>>>> +++ b/MAINTAINERS
>>>>> @@ -1775,6 +1775,7 @@ F:	Documentation/devicetree/bindings/clock/amlogic*
>>>>>    F:	drivers/clk/meson/
>>>>>    F:	include/dt-bindings/clock/gxbb*
>>>>>    F:	include/dt-bindings/clock/meson*
>>>>> +F:	include/dt-bindings/clock/s4-clkc.h
>>>>>       ARM/Amlogic Meson SoC Crypto Drivers
>>>>>    M:	Corentin Labbe <clabbe@baylibre.com>
>>>>> diff --git a/include/dt-bindings/clock/s4-clkc.h b/include/dt-bindings/clock/s4-clkc.h
>>>>> new file mode 100644
>>>>> index 000000000000..b686c8877419
>>>>> --- /dev/null
>>>>> +++ b/include/dt-bindings/clock/s4-clkc.h
>>>>
>>>> Filename with vendor prefix, so:
>>>> amlogic,s4-clkc.h
>>> It's fine with me. It's mainly Jerome's opinion.
>> To clarify: I understand such naming might bring inconsistency, but we
>> want to bring some order in the bindings directories. They keep growing
>> and at some point the model names might start conflicting.
> If Jerome agrees, I will change it according to your opinion and make
> another edition.

I'm aligned with Krzysztof on this. Please add the vendor prefix.

It was mistake to omit the vendor prefix. Unfortunately, I don't think
we can fix the old bindings now.

>
>> 
>> Best regards,
>> Krzysztof
>> .


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
