Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E39E0C05027
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Jan 2023 10:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9o2S5e1hf8fyFYkqJqgtHTWVvXTI0MknwO7dYvhQzSQ=; b=sy4kR/hW0h8jOI
	wBQCUmRvdaZBKpH9+4T8OZni7yuQ9T3wzdUdEBEOmdftA02ZfMEeWCHOizahUV3v8g3eEP6VfqYQS
	lYFt2BU5lJiPsG+e0DYhpDSA1ECpBV1Vm5LG2VMNiL0H2UCrwgHEJ+YIMxXNek9e6FCvagGB/rf4g
	c2M349cq9aJs02w6ALdFchlJh5sMnKkJjiU91kYh9A7Y+GOVLvXj6ZXGcXURSaifdV34t6w7OJpcK
	KVa7Pm9gS5S1S1EOx/NwShOk/xa7YYCeqdwPuhIegSBDidlPY54hmAybK0BxsTSIwq0dKefZ9399c
	VtCqVMJNgG7tRJdOrNmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIojI-009ptU-5b; Fri, 20 Jan 2023 10:34:40 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIojE-009ps1-KJ
	for linux-amlogic@lists.infradead.org; Fri, 20 Jan 2023 10:34:38 +0000
Received: by mail-wr1-x433.google.com with SMTP id r9so4439877wrw.4
        for <linux-amlogic@lists.infradead.org>; Fri, 20 Jan 2023 02:34:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7fX3mc+YjogrHVXWeOExgCkZ7irYgZc44evQFqB4yXo=;
        b=PQ+4/QX3edZkW5nktjCeiKQaqz0s9TS/A8qsSGn6w1OQ+ZVmrRriq8YMBak2Z54Ofr
         lLYZVDz9l1MSh5zzLN6BKLZCLIVhlu9jba7pKTEwmcBy2AFk+4km153z1vmeGyVdJkoQ
         b8yir85UiHur5T+tl1wLLzc5R2bcIGmIXRSZCTDWfQUanGseYXvSlroeLIfry8COw9y+
         2alAwGuL/wyfKUq3+qLgxF9fv8C+rsMH7cp1UUaRn07wTMP5/isxzsycrHUlir5cChZr
         cFBb+qrLZfuGEct1qoWmhMc3UwSwhCL2ZTjZ8d1gRFQArp0fGyp7GV7l5XyBTmo2D61Q
         Koiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7fX3mc+YjogrHVXWeOExgCkZ7irYgZc44evQFqB4yXo=;
        b=MIGg3Jox+jUierHhrC8eciGboB1E3543Q0i3aBBryxmY8foaTGKCw/B/Uwbp+cWT/P
         NiT/dHydaVqfT80YTmjGCby0HLc2O3Oofax07YXfyR6NhBqQ0n/5K2alTXZpegUksBLT
         IBRbaAyTab/Y7pwLeisbVPL7a2jUSvZD247cCx9S9SvnQzFxi2LeE6OWKGiuyzuGJdCi
         ffcnMpmSxiBxzeYZwAe8g3l9NaF9v6Jh6QNUfXSXZkLgQS1XSyIXEWZLyKCub0FuqieV
         shlj0MlfEvsPXOwfrMtWBDqlw/ngjykPztukrsdmJEp7RdXLfNkPzzV2vXIJiCWyle8c
         erLQ==
X-Gm-Message-State: AFqh2kpLaQF04E9kTcQCuMTaK0txBSD091u4YOmbFH7Jdy0xM+DcjZHS
	qKdpYEgukMy3ooPyxdSNehUDVblZgCt6xVUt8Ek=
X-Google-Smtp-Source: AMrXdXuVVyvDKmq0gNU0v15CB00d8cMIgLXGZEAJOfCKktaVVtiDtnaGGFK6x9zyYYxgTjm3AZYaTA==
X-Received: by 2002:a05:6000:1085:b0:2be:4e3e:fa0f with SMTP id y5-20020a056000108500b002be4e3efa0fmr3966527wrw.71.1674210875141;
        Fri, 20 Jan 2023 02:34:35 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id a1-20020a5d4d41000000b002bdef155868sm16140191wru.106.2023.01.20.02.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 02:34:34 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230120072108.138598-1-krzysztof.kozlowski@linaro.org>
References: <20230120072108.138598-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] ARM: dts: meson8: align OPP table names with DT schema
Message-Id: <167421087432.1116851.7586477497533295504.b4-ty@linaro.org>
Date: Fri, 20 Jan 2023 11:34:34 +0100
MIME-Version: 1.0
X-Mailer: b4 0.11.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230120_023436_713768_52C9BBB5 
X-CRM114-Status: UNSURE (   9.48  )
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

Hi,

On Fri, 20 Jan 2023 08:21:08 +0100, Krzysztof Kozlowski wrote:
> DT schema expects names of operating points tables to match certain
> pattern:
> 
>   meson8-minix-neo-x8.dtb: gpu-opp-table: $nodename:0: 'gpu-opp-table' does not match '^opp-table(-[a-z0-9]+)?$'
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.3/arm-dt)

[1/1] ARM: dts: meson8: align OPP table names with DT schema
      https://git.kernel.org/amlogic/c/5f4416849f0e2909189263ab76a1dd533f597d72

These changes has been applied on the intermediate git tree [1].

The v6.3/arm-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
