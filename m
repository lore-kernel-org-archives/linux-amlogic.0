Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C2D3C3ABB6
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 May 2025 12:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7CLD+85rGwN2nr1o0pwDoCUJ2b+HXQbBGn/GFO9RT/4=; b=1/4KQchozk33xx
	2Y2wUjSCU7eu52NFI3MC04AakoK25jblERkYaLacOMtQeHWlMEBf0c/KqnkXMhC4ieg5DUzsMLUko
	6MTlp5S9q3ofFSbVlCzNQlkKWgQlegLFtZZpZkzQ7tqMPbh3nWqVVlejJyt3QdzuPBoaun+sapr8j
	AQHhYqdREvfldPFi2rXEqVKBxLLFlVZDjY3L9UCH/D/uUyYz59iqjCf22F3NzfIQyyCHyNNnysfNi
	RHEn/HTGHyUfm0ym+TKB35X0g1opftkb2kCCejD3+anrPoZeNZU+brMVtKLKoD/9Srvf3b8gQfWxB
	JL3AiB5eTRc55Hp5ppNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBv7P-00000007N5T-2YqJ;
	Mon, 05 May 2025 12:40:23 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBv3l-00000007L1u-0U0W
	for linux-amlogic@lists.infradead.org;
	Mon, 05 May 2025 12:36:40 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-43d04dc73b7so36900295e9.3
        for <linux-amlogic@lists.infradead.org>; Mon, 05 May 2025 05:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746448595; x=1747053395; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pkzP+m0O8sqA7PP0YLwDfiJp+rK3Zs28ikPtrX0VKU8=;
        b=BMClSzaMyNGIt99CNEohGXrTmBKR5SLk0BFzfXdygDplsZO2BmjhrkdsRKAKOzs//P
         bzSVowLLXM+059v/FczmLfVvXC+R3+GWFMk91ZCtuoRxAN0yoELiB6DS5gjkz1uO5XrL
         Ev9+UtFL40YyvxJAm7dK55rr7gNmu/O1YPbz9Sc7lpL2KOb1S/Lzr5At7GbJ0COo6Nq9
         n1B3m9KUMEC3+dFJ/aImtQPF2WmvusRNr25ex+7yWuzURGLU6kUdh+dFdYsaEnsIZEpT
         B43nxgukV8aiA/66C4iA92SiYcoH8q+bt9WRsbcmnESQg/g/xECpS9Tjs6BTI1xNGdGj
         K1ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746448595; x=1747053395;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pkzP+m0O8sqA7PP0YLwDfiJp+rK3Zs28ikPtrX0VKU8=;
        b=HoZrHeNVVPCRq5eV0HVNvp46DLxMjxFBVfxjDLQ+uoGIIUyJUBEplD5DeGZMpE2L6R
         Z+lrjeI+IxY94VJIKWtE4Hm23LZfPJ5OFojxDnMO17OHgu8QKEnq56FpCMor08v9j2mf
         Ag9kn40/MEUDf0+y+PnL6AuiwVM51S4kAOBL0ywHAaJaT3oe/sTfKZLGrAl44nz7szs+
         1jioUv8kdwrG1aD3Q02NNPKPmY8NZjKV3oOUREny0RzxyAgs50Hmx3GpgIwcUE5ezK+U
         +oAUkiXRbxV1+qN0zQslJLRLhScXWguPuJsH9pw5d0CQb7wJiU57HD3CN7d9bRru+kUB
         hYiA==
X-Forwarded-Encrypted: i=1; AJvYcCXlbVR/sVPU/IfpLIL23I0ycwY1LbkzF/w+qgxze/GXU7Ewo2qt10U1dJCJeXmshl5l47xmidDJ4o3hNW2S@lists.infradead.org
X-Gm-Message-State: AOJu0YxPmEJcOIi2Gt7qLcV9m+D6w51g8949Vhb0INDjGYBG8AGV/ELp
	9IGACfhDi8nWXGlrU323EP1+9B7lv4xjJNZO0v/KOubbMNA4BppdSaqXmNeOJTuIALRqPHpSoiD
	O
X-Gm-Gg: ASbGncvQ1Si9WxQUPjhO53VdLHBs4W4kha0Q8tBQE0ieM6OYR44upJoosJntNTWBtpC
	Wi/EKXfeRzw4oVFN38tR2i6pjlnno9Z5GFqnpRoIwImdG/KhFnHtbhVrdMwxkKUKU5R2eAmnbX1
	QZIHyE0R9diDxPCeyl6fW5BJ0VwyS4RvjFBjQbxkToNAzxPOVpfvYgeQ+CL7dzhajLNEJANu/dU
	y0/kpXkk1+o/kKDHZx/IjDAZOEgsF7397mjCMumpyta5S7+/mbndCpx/6GOII1+RzoVoHPGy/ll
	uaWSVtWuI3lL8af0Z8A9xsaBJqEOIhGml/QhlimPpkXkryjaT5z6bRL20uJm7Q==
X-Google-Smtp-Source: AGHT+IG2COW4gRylaTrNX3Gp5wWIIrkuAhTbqRncgXIIyfrr3eqB1u8KpMIP1+ZUs/fDXY7fXIMnZg==
X-Received: by 2002:a05:600c:5111:b0:43c:fb95:c76f with SMTP id 5b1f17b1804b1-441c96a2795mr42420605e9.9.1746448595319;
        Mon, 05 May 2025 05:36:35 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b8a286c4sm131072725e9.25.2025.05.05.05.36.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 05:36:34 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-amlogic@lists.infradead.org, 
 Ferass El Hafidi <funderscore@postmarketos.org>
In-Reply-To: <20250319190150.31529-2-funderscore@postmarketos.org>
References: <20250319190150.31529-2-funderscore@postmarketos.org>
Subject: Re: [PATCH v5 0/2] Add support for Xiaomi Mi TV Stick
Message-Id: <174644859409.1377721.14494389382281683903.b4-ty@linaro.org>
Date: Mon, 05 May 2025 14:36:34 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_053637_171564_5E4A80ED 
X-CRM114-Status: GOOD (  13.52  )
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
Cc: devicetree@vger.kernel.org, Artur Weber <aweber.kernel@gmail.com>, Karl Chan <exxxxkc@getgoogleoff.me>, linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

On Wed, 19 Mar 2025 19:01:48 +0000, Ferass El Hafidi wrote:
> This patch series aims to add initial support for the Xiaomi Mi TV
> Stick.
> 
> Xiaomi Mi TV Stick is a small Amlogic-based Android TV stick released in
> 2020, and known as `xiaomi-aquaman` internally (in the downstream kernel,
> u-boot, ...)
> Its specifications are as follows:
>  * Amlogic S805Y SoC (believed to be mostly identical to S805X)
>  * 8 GB eMMC
>  * 1 GB of RAM
>  * Wi-Fi + Bluetooth
>  * Android TV 9, upgradable to Android TV 10
>  * Google-certified
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.16/arm64-dt)

[1/2] dt-bindings: arm: amlogic: add S805Y and Mi TV Stick
      https://git.kernel.org/amlogic/c/4954ec9300cfe7ab6f1de1c93c56c236ac0a07e5
[2/2] arm64: dts: amlogic: add support for xiaomi-aquaman/Mi TV Stick
      https://git.kernel.org/amlogic/c/f5d4227c6dcab047579cca7b8e31a476ecdebf7b

These changes has been applied on the intermediate git tree [1].

The v6.16/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
