Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC949C48297
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Feb 2024 13:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F0Q2X+6yYuNKLZNmvTBQt4TUfa+9T9aVVs9uv/mh3MI=; b=tmOuu5EHCrKO1X
	q9dhaYyhC1yM8pMksdzXiaShaS1FkLBhVYGGzr2Pf/AZbFKB8yiJsWYgzUpNyb2qUaxbKTfuQHtvg
	jeyYGa0npve8MpEFvuDrs72Ewfwww7yikyFk3f5+NtiEEc8Mq6eM3stPMAiprbPwA9uRAzS9yypO2
	dNYUtyYj9jUWUSUVTawwPyKj8yBvbM/ipvZGc0NMrvmDhH0cpOz6G/572gtHCFQm02g37ynSSczs8
	JeEg/9f1wgdswih6/t/mLxUAr71pD6cgvVoZNbLXvxWxJPpJKlfEdK3wXfmSR6Mp9X1pKwSPGJY+Q
	4mwjckRxa3tkKYgfsU/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXLP2-00000007hv7-0YBr;
	Tue, 06 Feb 2024 13:22:20 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXLOy-00000007huI-1mjH
	for linux-amlogic@lists.infradead.org;
	Tue, 06 Feb 2024 13:22:18 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3392b12dd21so3130116f8f.0
        for <linux-amlogic@lists.infradead.org>; Tue, 06 Feb 2024 05:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707225734; x=1707830534; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hZET8UHpomiSVDi6jNs+3hwJMcCpsOpOjFQwgddf+0U=;
        b=caeqoSfvDwCelKOBOG3d63f2LwwiZfYryZkDmePDNc8kgWeT6kHXpG6Lp0rsnW8gHL
         QuvLwEolldpxxkTbTEiLadXcPjljwrimx3jtlJX2roFbWNTlkKeyurpFEo1gnEudCHtK
         2YbwHqU2SsYR8E+FVyCsbJCT4d0YZsLjxzPVf4AJIpPTL+qiX4Nu8M2wZ+nwdZbBcNTs
         nFO1eNVxyTrOC60EsWqkoe3haXsos9YpRhRYZzGR5D+Th0QrZ1etFUve9XG7mzKwo4c/
         Aj1D4aj1nWMGIKIFX3TzMjlatu08WqYkwWFSR3IX7+SjZLN8t9jRKlMIZiEH36iCdwuI
         89Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707225734; x=1707830534;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hZET8UHpomiSVDi6jNs+3hwJMcCpsOpOjFQwgddf+0U=;
        b=ho61NoaHhW/A+z+c8BknNBSeDMkXvooeyd+miWDwoJY/3//7nkuEq0aJeL5Iyfrsy8
         TGJxQpgMIrcJAcLXd8Sc0LGwEuRDKSJ0HjukupI29DaRQ3xbD6jjH6lWoC31f9Z06EyX
         bX1tzQhEyAl94q7Fabe4ToawxDYHfEdVftO2K7a6VYPfpOZkHI6DiYElu4j+XIXRjZqC
         FGSLsCqKiNhB+PimnAUusEtKDGT+16rYs2nw2j2pXUil1QLJFy960MrUsGOzSDj8Q/yE
         BsuHT0Pc97DITtOvc4CeHrp5wZecccYAtb4s6uuuvyoh3LRzXqrvTaJ1Y5hbQz/wg3vy
         bwwg==
X-Gm-Message-State: AOJu0YywHNsQk8rDoIZ4YtQV0kkeXf4wA7SHM01J+/P28II6CPrNV4zN
	fExJM6JdsVwd1vwU3K0Tpi0oVoQSAocroUWZ/gh8UjocpyEqFQiZnDIU1g7UJV4=
X-Google-Smtp-Source: AGHT+IH8koYSJXBs+e1hZ3HVMAQFrNXfypAYHvz3ktEK2pkW+M+DQ+8P+O9hyMjo8//zk0PUOMgNQw==
X-Received: by 2002:a5d:6907:0:b0:33b:4818:f438 with SMTP id t7-20020a5d6907000000b0033b4818f438mr1152449wru.50.1707225733421;
        Tue, 06 Feb 2024 05:22:13 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXC+4l/OP7Cfwm9/z2yVKN7sRyQG1Ph3XcCc4N9Jw76qHEl1UbPHCAiIJu7Me5I2G2XRCFWYWWn8GxoxMVXHLFwxcWX3+RE1mR1ByNCrBrLFSL5QEVW1X9mJsl7wZAemJ3Owx/Q0iiZcK6dciA9Pq1BLIIaA7u5a2XwAsoHE6+wcXfQnUMIYQT+dImozQzeQ88lIm4EtPKPBJ9nwoBoNNmjdSMQlCvY+8x7QZPKURXEXqU8A+671ceQP9o7vpPDLpjvbXSuqgPssd5IGMG9fBd8xU/PXcZNivSjE4zrF3WgggEqjNGwXMSGfS8DwfYeoX1KmS56f5aH1jMutsanDwz9MvSsQpWrfQ8T0GhX+XgjiMLsunxVVepvrRnzAuS0
Received: from [192.168.1.20] ([178.197.222.62])
        by smtp.gmail.com with ESMTPSA id h6-20020a5d5486000000b0033b421e651csm2097109wrv.37.2024.02.06.05.22.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Feb 2024 05:22:13 -0800 (PST)
Message-ID: <b69a2132-25c0-4acd-808e-d134f5034e58@linaro.org>
Date: Tue, 6 Feb 2024 14:22:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1] arm64: dts: amlogic: Add Freebox fbx8am boards
To: Marc Gonzalez <mgonzalez@freebox.fr>,
 AML <linux-amlogic@lists.infradead.org>, DT <devicetree@vger.kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>
References: <8c865c62-cd80-4c78-9fc5-c85491c037ca@freebox.fr>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <8c865c62-cd80-4c78-9fc5-c85491c037ca@freebox.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240206_052216_518575_9BF10983 
X-CRM114-Status: UNSURE (   9.34  )
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

On 06/02/2024 14:12, Marc Gonzalez wrote:
> From: Pierre-Hugues Husson <phhusson@freebox.fr>
> 
> The fbx8am boards are based on the Amlogic Meson G12A S905X2 SoC,
> and the SEI510 board design.
> 
> Signed-off-by: Pierre-Hugues Husson <phhusson@freebox.fr>
> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
> ---
> Request For Comments to spot obvious mistakes before formal submission
> NB: on IRC, narmstrong mentioned:
>> adding dtbos for variants seems to be the new preferred way to handle such case
>> the fdtoverlay utility works well for this case

Please run scripts/checkpatch.pl and fix reported warnings. Some
warnings can be ignored, but the code here looks like it needs a fix.
Feel free to get in touch if the warning is not clear.

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
