Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 253A0EB64D9
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Jul 2023 08:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sgxcvE+OPkInsE3EXkW/VCOTj3UfsNyiRA81CBiOiM8=; b=eVhjTJkBMpAS+h
	79ooKLNUQ/ZpbMXOiTo+WxSgNsNgvMMvphVhuSf0n7VSAgj1W9FQ5MDPGHDJjg5LNupiG6qm6CqP/
	xN41GTCprfuvWKT5zJ558HFvt1S58s5qQSk/KJmy9XJ0956RjbT9NUYLPP2ZC/cEdfM506W/odS0x
	hRE4U3B2QREiZv8UnzH58csXKwDx71MptXAulKKuJ9I3p8RLlisCeASXI6sK4cr0OkRZr6BBM12GE
	2Bi30cjKbX2A/Yuujg8GnOnHRLHAAEejotXEUiV++Bvz4RJPlqVpB/f5OEB5gsu60XHX+s6xnMttn
	wSFTgIHvjo6qwtRVuF2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHJzZ-000tX4-2t;
	Thu, 06 Jul 2023 08:05:33 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHJzW-000tVK-1L
	for linux-amlogic@lists.infradead.org;
	Thu, 06 Jul 2023 08:05:32 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3fbf1b82de7so2717245e9.1
        for <linux-amlogic@lists.infradead.org>; Thu, 06 Jul 2023 01:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1688630726; x=1691222726;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=zJHWi0dKqNhNEFb0P2yrmf3OGLkGZqjsHWf4Z19C/yk=;
        b=Zp3D4DRuWFgPbPNbJZaRkRdVCKJUNLkXwvScJ0MfjjHchKBoNAA/6/G3t0ovPvhY+3
         mn5ax++SedHlInpD2KmtCLfUsuda8Y5nHRUf+7LOtyT2l+YK0AMmil2DjZSXT8dFpfB5
         mPl+ScXd5+w+ElzZtEVTeznnIsSQjFtdyccXhpYCN1XC7Q/tYUEQccI70NenQ6ebuA4M
         DBSJSnhv9aQl4eHzsMjzzpUMNS+BIBvj52ba1pP/P/pNchFduVSe9sbQOHKMhyChUkNn
         9qcHWOuYskJLZBFv9zzA7Htp/1wlk2GFXHt5EnDcOJOBDJVErkHzS0637m8E0eASFzKQ
         QD4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688630726; x=1691222726;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zJHWi0dKqNhNEFb0P2yrmf3OGLkGZqjsHWf4Z19C/yk=;
        b=ggRXVJTPafezaxbidNCAl8VlTefeNS8kQdQtYG8O06+s/sJVs/cqYecucV0jwWb5mG
         r/kYNTHIcWUvHM9SUD4dZE9FJexYBujeVkQIRLfF172sG4/Qy4i2EDzPn6W6ragBEo7H
         jGl920KjLKIn8MYOfT8ba/LsYINEaufuFQZPle12BjGHlBZo5z745miTJ7cJrj4g6tHo
         XwG8CblDV3L2TvJ7/Wdbmr1dUsnfcng9I2zkcoPFF0APnuoAAkYpfVbGcU2GaTC6vwme
         H/3d6Cf9u6xWiDsyGXjUvaBvfvMsMXsFKFLvE8WVmU54JHK3yDPuxXAA94YNkl0jZHZP
         yanQ==
X-Gm-Message-State: ABy/qLZa7O0K3uGo6fQlKiPNF3b2x0Sk5cKImUmqGB8yJ3Cd/B/09Phh
	i/RjdIqZdCpLXdEQkjI6OZQZ4g==
X-Google-Smtp-Source: APBJJlEYhCxm6pyqAs9nqvYnWqjDAvElsQCZ7tCEFYVVzKXx31jc4bQGlKqT2o4Gce1OGcJdhpmu7Q==
X-Received: by 2002:a7b:c8d4:0:b0:3fb:e1d0:6417 with SMTP id f20-20020a7bc8d4000000b003fbe1d06417mr4265922wml.19.1688630726546;
        Thu, 06 Jul 2023 01:05:26 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb0:4a33:b29e:11b3:752b])
        by smtp.gmail.com with ESMTPSA id 17-20020a05600c22d100b003fbca05faa9sm1315735wmg.24.2023.07.06.01.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 01:05:26 -0700 (PDT)
References: <20230705-b4-amlogic-bindings-convert-take2-v2-0-22be915ddc3b@linaro.org>
 <20230705-b4-amlogic-bindings-convert-take2-v2-2-22be915ddc3b@linaro.org>
 <20230705195631.GA1732680-robh@kernel.org>
 <1jttuh5www.fsf@starbuckisacylon.baylibre.com>
 <e1e12c86-da0d-0ae0-0542-86bdc4c81bb3@linaro.org>
User-agent: mu4e 1.8.13; emacs 28.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring
 <robh@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/3] dt-bindings: clock: amlogic: convert
 amlogic,gxbb-aoclkc.txt to dt-schema
Date: Thu, 06 Jul 2023 10:03:32 +0200
In-reply-to: <e1e12c86-da0d-0ae0-0542-86bdc4c81bb3@linaro.org>
Message-ID: <1jpm555ut6.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230706_010530_463023_FC6AEAE2 
X-CRM114-Status: GOOD (  13.89  )
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


On Thu 06 Jul 2023 at 09:51, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

> On 06/07/2023 09:15, Jerome Brunet wrote:
>>>> +    then:
>>>> +      properties:
>>>> +        clock-names:
>>>> +          minItems: 2
>>>> +          items:
>>>> +            - const: xtal 
>>>> +            - const: mpeg-clk
>>>> +            - const: ext-32k-0
>>>> +            - const: ext-32k-1
>>>> +            - const: ext-32k-2
>>>
>>> As the names are always the same, move this to top-level and just set 
>>> the length here (except the constraints are the same as top-level, so 
>>> you can just drop this if/then).
>> 
>> If this is done, aren't we losing information ?
>> 
>> For example, "ext-32k-1" would become valid with a g12a as long as the
>> number of clocks is alright, which it is not.
>
> How it would be valid? It would be fourth item but only three are allowed.
>

I missed that the order in 'items' mattered. Thanks for the
clarification.

>> 
>> I'm not concerned by the automated verification, more the information
>> provided to the users, which we used to have in the txt format.
>
> No information is lost here, unless you claim that entries are entirely
> different?
>
>
> Best regards,
> Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
