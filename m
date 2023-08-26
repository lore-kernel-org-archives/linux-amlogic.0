Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0093C83F15
	for <linux-amlogic@archiver.kernel.org>; Sat, 26 Aug 2023 18:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3xAJUmm8OeL2528YQI5OautEc2p6p/eq/GRL+Na6eUo=; b=JlIYHk1ooR7RzQ
	tJlLrwcORusymQVq1H/DLfL4LORXswKFM1zAQ0vwu66Xries6RabGEQU147b7kCXNXd4d4V3mJNxb
	ap4DtjMlqlpHnqSajnb2N0NCMzEqT4svUO6MYq+sxycTJSrC4gIL6o/WZfy3Uw+0Cnkx49E2hbbBE
	SOKBnhpAvcsqZ70bBJjUo5hEU+mH4HseuXSBNRuIRht4QdqxT6qM1u09uD1jL56xRD7MLBUjGcpHW
	zdXnrXHw7a5H4768I7Dj+gZL5KEcN4oOKiIXPqy5G+SIA4u+zRbcNLStJAmtnNIzw8+jc+6XvT0zV
	zuOqXkxVep89z95ScZIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZxaI-0076kb-1Z;
	Sat, 26 Aug 2023 18:00:30 +0000
Received: from mail-lf1-f45.google.com ([209.85.167.45])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZxaF-0076jg-16;
	Sat, 26 Aug 2023 18:00:28 +0000
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-500a398cda5so3090368e87.0;
        Sat, 26 Aug 2023 11:00:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693072825; x=1693677625;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MfldtvrAuJXHHb5YdlTT28beoBEStiZCLf3yLGm9mkM=;
        b=RFluCIzdNAIC9Q7J2BIcIPENmLF9vGjmrvVCc/ToFbrkuOqspyl8usvzY5w7+oPDme
         yzK61/rK6GRdyNRUzLOsnlNaHaxZOn1X4BVjHdXcQmJdHF4+tq5BgI92nGRJxoI0KGKf
         FiuseEOUW+PE3CobNWx/1fOHJaw3ZPxvQBUCLJSjl41b8oDQpfCvaoRbLle+MThPAup9
         pnIPTibVW6o4KLTgDYV+rxwPKi6K37b7v9gtzoe84KaC8Y21uoS4LceBgLahthAB5utO
         tOOKNY51Vt6C18JCckzKM01B2ne1Whbxk5pVOukutJbVpnFHW6TNlX9I2C8M7NwUhXIZ
         X25g==
X-Gm-Message-State: AOJu0YwLJFzNW6DHaMD+k+UGLb3sNjgc7ErbYjFmbyo5fJdcPFXobDHE
	XMQ+y5mLb2ZctPPU4Zy/p3s=
X-Google-Smtp-Source: AGHT+IH1WOvT0NGceHmGAKCM7QAa3fhBuR37Tm/+KdIWvwvD6FLGCpXWO46SHSa1W672f1U0zEmHtw==
X-Received: by 2002:a19:6d1b:0:b0:4fe:1e69:c37b with SMTP id i27-20020a196d1b000000b004fe1e69c37bmr14503959lfc.10.1693072825001;
        Sat, 26 Aug 2023 11:00:25 -0700 (PDT)
Received: from [192.168.86.246] (cpc87451-finc19-2-0-cust61.4-2.cable.virginm.net. [82.11.51.62])
        by smtp.gmail.com with ESMTPSA id s6-20020a1709060c0600b0099d45ed589csm2434635ejf.125.2023.08.26.11.00.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Aug 2023 11:00:24 -0700 (PDT)
Message-ID: <3c286d68-b1be-41c0-ad72-544a1a60a3c1@linux.com>
Date: Sat, 26 Aug 2023 19:00:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 4/6] dt-bindings: power: add Amlogic T7 power domains
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>, Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>
References: <20230824055930.2576849-1-xianwei.zhao@amlogic.com>
 <20230824055930.2576849-5-xianwei.zhao@amlogic.com>
 <20230824-easiest-donated-6c0fed4e88f0@spud>
From: Lucas Tanure <tanure@linux.com>
In-Reply-To: <20230824-easiest-donated-6c0fed4e88f0@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230826_110027_376591_D09C7D1D 
X-CRM114-Status: UNSURE (   9.04  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On 24-08-2023 16:07, Conor Dooley wrote:
> On Thu, Aug 24, 2023 at 01:59:28PM +0800, Xianwei Zhao wrote:
>> From: "xianwei.zhao" <xianwei.zhao@amlogic.com>
>>
>> Add devicetree binding document and related header file for
>> Amlogic T7 secure power domains.
>>
>> Signed-off-by: xianwei.zhao <xianwei.zhao@amlogic.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
>
> Thanks,
> Conor.
>
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic
Tested with Vim4 and all works fine.

Tested-by: Lucas Tanure <tanure@linux.com>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
