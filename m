Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBBEA606A31A
	for <linux-amlogic@archiver.kernel.org>; Thu, 22 Oct 2026 07:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3TOXUy64;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=P0fEnph8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rTNIZ6sv/xcR76biBfaaaw1B4AIvHmEvHxNJklRA7Sc=; b=3TOXUy64JVJx4o
	/x3iXJzPvrgNpl6IWDWuxyNRsM5cdVNtxD/Ol7zMnj69VMFvrcYm79k0B2CPPjhBtB6Qpiy5E+cqf
	3Namcpj6fAKKM9fG/LcyZKkyezwmAWeXtXMTyv6L9SfPblneEqu0e822ZZAw79EKTCkoYHZ0VCvB1
	WHjL1J1IyqOGq6bKoCk+vuv5slUo5+CDekOe5sNBowuu3yYE2VCiilBCjSmlGEqmL7vLJRcQuN+FH
	8w/EzdvRvZSXmroQ4zYBteHjplzpo+a6IE1vmJ1OcpIbpu4zbjl5mRtquqoSUoKqnQt1P/oJ7Sl0T
	PIu9x33HAl5qs6Pvd35g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJmzi-0000000DXrn-25FP;
	Thu, 22 Oct 2026 07:13:46 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJmzf-0000000DXrQ-1JMU
	for linux-amlogic@lists.infradead.org;
	Thu, 22 Oct 2026 07:13:45 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-48df54150dfso916649f8f.0
        for <linux-amlogic@lists.infradead.org>; Thu, 22 Oct 2026 00:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792653221; x=1793258021; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IhTnwyrV+10d78ygQYXl308AUWomjFkKSrLiwOtEx64=;
        b=P0fEnph8ipmMk9p7X5fn8ADbxy4bKXelT8a/dUmu1WiWNOvcksjodQQcrai0eZHG8T
         Kpk6mozrThRnj20AUgRHdoLUOVeW6KzipUetCGVvoE/GsUj3VAqXpF0h8C25D5YHygqz
         rmHmFokk8QkbAQe9wGPDhsbxAkKPqxG2vNMGFk5yi6MI8sBrofS8pIdmro1H11C6lcfq
         wHStUznygR+e4ZcZqUOjxBBcanlFNcJjgG92+zaxYnoWXfKFUBvf9SgRqRFBH7DEHeHN
         jQV7pkPf5GSEqAaHyI0Y16cr9XlaLLr4OEK/Ack5tJtE29wZmgQURYmDvVFJKJWn4apy
         tvWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792653221; x=1793258021;
        h=content-transfer-encoding:content-type:in-reply-to:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IhTnwyrV+10d78ygQYXl308AUWomjFkKSrLiwOtEx64=;
        b=xD4CGGqo/2cUKAfO4XuaGacqZP5zYoVwo7+MCrB90O4iX/5Cu3PZn8aU8G9LcBv5Bu
         jHtmXKj6Z5JDANZtKZ5g4AjVAXwTEnJbb+A0o8REh2LkeXC1ZEAjzwDYN2woKwJPxwvY
         zRUqDXrge7Nk2eekNMfAwK56mxrxl9aWgl3T89pgiSYtRiLSxeNpz5h5jRmVWiOms7CF
         TodB01jr9TPLuA745p2kx/LqUthYb1tw/JqFY/OhvMaTRY+i36YMNwul4DeNA3kbRIs3
         peuVJ9NZ+C6K3PIOaCMbv54m03yY9QSi/+uvVrWdnGDUrxLyqIrgpeHGUP0rHNF869cB
         mH9w==
X-Forwarded-Encrypted: i=1; AKwUvByO1sTlOzAB2XsXWUldwP74bibv3zBKaOc04F0URdMCFtPetd3kxZIOKqVFi269fJjKdHSaBJv5KUiaUZmG@lists.infradead.org
X-Gm-Message-State: AFq9FYIkt9Qz8351KBCTrFf6Gp+B0Yq5KTUseWqe7HknhRVAmDhJMx2J
	iQYwJvBokea0e/olThL1ymsxi11dWLGEm98QKkBgveWGyZXYQzdSJxOf/GxDPTvDyuo=
X-Gm-Gg: AYBFou3+wHXj2KvcPqSzbl1ClktzUXlZGr4oJH3wr4+bVAX8rJlaxyj/B/uXnurpZED
	Z7i+hXk2nNKBOjKUCZgWWm5xlgoHKFK0Je3UarRNSmV08UgOvNEbsq8U2Pmup6d7v1FuHHUHlLg
	lD8lwT+69FRDe4q5OfvD6k2ErJwc82jEZuBZYddHx+ZGZwZIhaJ5GdfpM3vNLf+Uv2Tvb5kOuuS
	BMgcluVoj4A40YuJeigm4BIQQfKC0ZoGp6AO1G/q1YTDQn6QsxW9kIpJj1mozwZYApNvQvYG/Nn
	gcUtGTqQS7mokwxZ1OZnGUNkL+I5GaHLdOOBYkpzcncQ+WMa8VLfw/XksUKit6JgOFg+rxVOOOx
	fONHuJJRX9H91K74QFMm4NyXjrCKNT2g+N2Ft0E+dhPnW33B8S9z01KqTRSa5UuiuS9ZyOoZB5b
	SoX3T68+43TGjYNoj6PJfQ7qfhY1/y4iRaRAkuJEM2cGDh/WzlRtPQZp1jtWHLOqxvo9ehwaTLW
	FU4Vb97V0kb1OU3hZ1l6kHCd4zSOJ6tJ4AglXzxVY8dDn1eVofiRdM1rRkP
X-Received: by 2002:adf:efd2:0:b0:48a:efed:ac97 with SMTP id ffacd0b85a97d-48e264f06c6mr6394983f8f.33.1792653221001;
        Thu, 22 Oct 2026 00:13:41 -0700 (PDT)
Received: from [192.168.3.100] ([37.103.126.255])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e254f093asm10940668f8f.4.2026.10.22.00.13.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 00:13:40 -0700 (PDT)
Message-ID: <45986fce-98dd-4df2-bcf5-6a0de7e41ca0@baylibre.com>
Date: Thu, 22 Oct 2026 09:13:39 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/7] ASoC: meson: add AUDIN driver
Content-Language: en-US
From: Valerio Setti <vsetti@baylibre.com>
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org,
 Jerome Brunet <jbrunet@baylibre.com>
References: <20261018-audin-v5-0-4b8cc13a1b22@baylibre.com>
 <20261018-audin-v5-4-4b8cc13a1b22@baylibre.com>
 <sashiko-outbox-176054@kernel.org>
 <257ab6d8-4990-4e58-9eaf-9cac3cb29b01@baylibre.com>
In-Reply-To: <257ab6d8-4990-4e58-9eaf-9cac3cb29b01@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_001343_367859_7EB16C7F 
X-CRM114-Status: GOOD (  11.06  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/20/26 3:02 PM, Valerio Setti wrote:

> Finally the question. As I said, since the issue described by Sashiko
> seems a bit hard to hit, I think the fix can be postponed to a quick
> follow-up series. However if reviewers deem that it's absolutely mandatory
> to fix the issue before this series lands, I will either prepare a small
> pre-requisite series or add a new commit to this one (I would like to
> know what's the reviewers preference on this case).
> 

Never mind, I decided to follow the correct way and sent a separate 
patch fix for this yesterday night [1] :)
[1] becomes a pre-requisite for this series and, once merged, all 
Sashiko concerns about this series should be resolved.

Sorry for the noise.

[1] 
https://lore.kernel.org/linux-sound/20261021-gx-formatter-use-spinlock-v1-1-71ebc9224c03@baylibre.com/

-- 
Valerio


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
