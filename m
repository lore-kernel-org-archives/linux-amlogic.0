Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C837C48260
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Feb 2024 14:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PHfef9kRyDNRHdKJB2KXohCu87PofMkcfxRMR8CrZ+0=; b=tXj8jGgZus2Avl
	2R7QgwJsPl4Sraph5YHi4xH3wWTmxl7J9XCacYfwy29On+GM1Iq1w/frAjGbtd0zQ38r2ILzIDPET
	Zx4WnoI4I7y4dXwi81r/eNIxxtoC2DIlSy4CSanfZTmmNwktXDil5RjOsG/EfJLXtGk5Z6ilMmmRF
	23+523sgtAQ3CO4hwCwQFpIifV/vF6rfzCUcwXHr3fKivP3R6O/DGyqJXdEz3N6Xk09W7affTO6tz
	AoTMRSUCyprFfojXt+VTi7V3e5xXFxYCiliiLYEeE3l9Ki9wXUTmZ8NvgS8Tn+BLVhx6tkr6Es/WH
	i7nHnyg5Ka0zSA9ZTx2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZtWO-00000009SZG-48OL;
	Tue, 13 Feb 2024 14:12:28 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZtWI-00000009SXh-03yY
	for linux-amlogic@lists.infradead.org;
	Tue, 13 Feb 2024 14:12:28 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-511821e60c2so3599180e87.2
        for <linux-amlogic@lists.infradead.org>; Tue, 13 Feb 2024 06:12:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707833540; x=1708438340; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lSWustRDmVhI85u01lyQqqB4mJ3wL9eSszhFn4HC1ao=;
        b=lOYWW0zlLBB+vnQ5DtA5SweSWHhAKyFx+SWutcv/KgfFTeRSBQvC72qsn/8eiuwluN
         XHMT2dL/aBR8+CGg7mwVEIBmyRBHGFpbohUQ8QouC/g2qOY2Q6oHlgnN4p75sBzAR3Tc
         3yFihpgfPFZUOG9oN+35Q0wuh4BzNBex44m5wVLbnFSshY0CCuUWEiivXxKmeDZEQVSP
         eDmJoIf2J7Cqp52SWWNZoNpumUv5GpNkuTiEK5HCpHvIHuCWkePRIhMFvok46XmN9iyn
         gJBpMgclCKGcHJxnod1eVc7QxH4GNWoblTXiz/YMEYyMQ4XwsLn9hEAtPnIprChT4lUE
         VvYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707833540; x=1708438340;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lSWustRDmVhI85u01lyQqqB4mJ3wL9eSszhFn4HC1ao=;
        b=juWw0Ft+AkhUVOD6jP4fl744vLUxCif+v8nGXKgrevhcwW9eRVsx0H62E7XY9qtzKw
         Pe7Y7MCJjJJ8Z8xVUkBFmlqfXUkojbngeHH/I/OcgWyc/JQzvBfe6mUHDmJNDr+q/vEi
         mycPn6zs2saVDcfFiCEXGaJ5KABIO6Yvg6YPkXl+s9LfjAeabSiEm7ZmWb8enXc9sSeY
         1zST/KZo45xQcJxwiDVgU43HA0weJrrPYJ5V8PvhcImZNw6CT5Nl7J7iTfAVv3s6sI/y
         52CceJ38kyCkX43ExdRNqarVIvPKzvCgxpp8oFUWF2bb/eCNc0OP8ir6bc9c88dY1so2
         HaoA==
X-Forwarded-Encrypted: i=1; AJvYcCUckePoCZLF/mmYeORGgsfub3jaLIY+WXtLc1ccvzrnF2UTQL7nqmaS/l/kH08qMJZrTmP6fVOw6u7WhcXTNxXNPwEUZA0NLtID5cjm6zQblCU=
X-Gm-Message-State: AOJu0YybumJZvW47omH296iwaZWqiCi7gfUvcHYy25LLZxOuJQFyqUhd
	Gcf1mDqin08CWrA0KomAdYX253q0MgeXhQi8ManG6An+qiB/8FhXR7e1FqYycs4=
X-Google-Smtp-Source: AGHT+IH0RXvtarg8PiTzjsT8dyRdfoHqJN7gf3HiJFzN5ffOBI/fLoSctHHJmOsKG3UyVb2BurzMYg==
X-Received: by 2002:ac2:4c01:0:b0:511:6f43:b5d with SMTP id t1-20020ac24c01000000b005116f430b5dmr6072272lfq.17.1707833540065;
        Tue, 13 Feb 2024 06:12:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXyE5jXBwBdsO/mN6zCzhJ2ltNN6MZU5Yc50fynq7RyQmny8klhlyguMpzkx8YZi1vmFg/F8iKd8LsumsHaxIt43BxulCzzTOTojxDjrqrQa0zraMVf7G5t9CbpzUZPVklJOaIVwIxigcZe0tUoHjzMbZFUzLlpppGlTK+moRutjiLM8Tl9DtwrV65wy+DC27DveGYjbDWW1p8CCIkylqJMlaUcXMdl54mzjVaSclqBHuzY/vP6AVBtMAqXPXmTFvOImotAd2jTpo4j2aJuH7BsiNUMZKZelRNiKEepBTZR56SDUtU/lvUMtx+icAm/osVf8f17J02VgPfMV9yafuGY5RvhsF434tB2OfMiX0DC8gpYCvlJHHE1Y9463Gdf
Received: from [192.168.1.20] ([178.197.223.6])
        by smtp.gmail.com with ESMTPSA id v11-20020a05600c444b00b004110e8d605bsm4511078wmn.44.2024.02.13.06.12.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Feb 2024 06:12:19 -0800 (PST)
Message-ID: <ddff601e-d149-4894-84cf-0045b88c1561@linaro.org>
Date: Tue, 13 Feb 2024 15:12:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] dt-bindings: arm: amlogic: add fbx8am binding
Content-Language: en-US
To: Marc Gonzalez <mgonzalez@freebox.fr>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 AML <linux-amlogic@lists.infradead.org>, DT <devicetree@vger.kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>
References: <77edaf7e-aeb5-4fc0-8b69-85dcddfd5a58@freebox.fr>
 <8a148279-05e1-4f00-87c1-6ed9ed1cb3dd@freebox.fr>
 <959b8135-a687-4781-993c-5fa5ba3b9c8e@linaro.org>
 <cda7afdb-f75f-4376-87b8-882297f2657e@freebox.fr>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <cda7afdb-f75f-4376-87b8-882297f2657e@freebox.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_061226_496101_F1910D83 
X-CRM114-Status: UNSURE (   6.95  )
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

On 13/02/2024 13:35, Marc Gonzalez wrote:
> 
> 
> Looks like my MUA mangled the patch.
> Sorry about that, will resubmit.


I have doubts whether you can send proper patches for us with
Thunderbird. Even if it works, it's risky way and might lead to
unexpected issues. Please use "normal" process, which solves all such
problems, so git send-email or b4.

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
