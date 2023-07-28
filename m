Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAFA8C0015E
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 Jul 2023 19:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HXsMYd2rJEsed6KgR9cRezBWP/NZ+vczQRWbwKzAomw=; b=kv+xnrIUX8iRm5
	dcquTlDZQr10yRGsErUaggtjT00PfXwhbvZUo4aMsrxfTPWWTjW7cEJnxNstNZu41twT3Cdj7J7Oq
	MOMBUaApr5soUjNrr8rmgjAajx6Gx5+eyUL/7I9uQSMrTmZ6mHyMUeRLFojhX5LpRsm65ITexCuaF
	bhripFXyQ4JZZZyiJ1rRFtfOKZdbBoGUGZCVWZoYD3L5LQLttnQMWXIeYKEU6xbabyWkgnfohitP8
	y1h+RicyVvrgfsS3fXlU7SdZnfEpovwjy3PavLjPDqKO3mPDU/rboIcPKFerg1C9r63IuPgP2q88J
	Ez0872zpktyROcv+iJjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPSnR-004jGV-3B;
	Fri, 28 Jul 2023 19:06:41 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPSnO-004jEh-2G
	for linux-amlogic@lists.infradead.org;
	Fri, 28 Jul 2023 19:06:40 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1b9e9765f2cso15249875ad.3
        for <linux-amlogic@lists.infradead.org>; Fri, 28 Jul 2023 12:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1690571195; x=1691175995;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=NF0r9eMdsRlfx+fQNhsp0XsqZFCxcupFF3OG9UsICFo=;
        b=cmdPjnKZGl31IJIA7yqBzK039eXHjdL/oax5B08GDm2piQtz8J4/mxsW9NeOL/x1+t
         CvN/XCEeMge+mNEXXjV2jCCW/x67qrE7pVUVSVdrlxG6NcCo0YMevdqz0LFz27HbiOV2
         ng1WrFQrHvQw5mdPdNkQpYoM7SQI6zNln6248JVTfvcPQ2soODtq6r0UjFnaHNWvPuiY
         qxPIcU/4saAIRjZVfzTrEH3a/Yzvz7mU84cAQhFjGUcjWkFeHjGZkmGQMuEDtX8x1L7V
         XnOorLhjCtv4GF8qVWDtyXB1aRz9cEFz5hmfH/k/gDnZaTYGAGFiI7ThocBh6BjyZ+4e
         fXDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690571195; x=1691175995;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NF0r9eMdsRlfx+fQNhsp0XsqZFCxcupFF3OG9UsICFo=;
        b=gG3Zt3mBP1ScQwiKKXrAPiRm/BaV439maCNMbqBJro7injoJFWDv4UcH6WiNQHI6TG
         QjBCYlEy5hhuggOBlaTlqb/tHYmmLuk36wBJ8upACeFUmvF23C6YYhJXp0fdcsK6yxDp
         AE18CE2opKFY6C54SxwXRnlEU6xj4pirzq44twjTImA9BBkB7POsay3WE25Sk3rEdNdh
         YSdfVbtIOG8dW0v+c41WqlV2lKjvJxFsyFokttQYW+VGwkD+Vv2HWsWO5AwdVE0FBX2z
         L5fANA03kKuaiKmUACKoN6cF5FRNIiDrQ+l9eIoFVJ1aEhF9ej0A3oH1e+nlDkgQgf7l
         6WFA==
X-Gm-Message-State: ABy/qLbvoxUxN2Uj/Fov3oAQcj/zPNj350pJ+MmbfUT7Hgf3Pexm9XCL
	wAJqa+pnzyfEbqRiOLT4gGg0lA==
X-Google-Smtp-Source: APBJJlG6XFoP1LhFMTBznXGOJwP8YxSSulmHWjhYJ1NDAzk8KWNKByfw3HTiT206vlHYDjBoVhy7Yg==
X-Received: by 2002:a17:902:e741:b0:1b8:28f4:f259 with SMTP id p1-20020a170902e74100b001b828f4f259mr2501220plf.69.1690571195271;
        Fri, 28 Jul 2023 12:06:35 -0700 (PDT)
Received: from localhost ([75.172.135.98])
        by smtp.gmail.com with ESMTPSA id h13-20020a170902f54d00b001ac5896e96esm3901266plf.207.2023.07.28.12.06.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jul 2023 12:06:34 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Huqiang Qin <huqiang.qin@amlogic.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 neil.armstrong@linaro.org, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, linus.walleij@linaro.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: Replace the IRQ number with the IRQID
 macro definition
In-Reply-To: <9da24c47-341b-1581-0043-a6c1cdce462d@amlogic.com>
References: <20230721073214.1876417-1-huqiang.qin@amlogic.com>
 <20230721073214.1876417-4-huqiang.qin@amlogic.com>
 <7hcz0ei9r4.fsf@baylibre.com>
 <9da24c47-341b-1581-0043-a6c1cdce462d@amlogic.com>
Date: Fri, 28 Jul 2023 12:06:34 -0700
Message-ID: <7hh6pnhn45.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230728_120638_737525_24049DB1 
X-CRM114-Status: GOOD (  10.94  )
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

Huqiang Qin <huqiang.qin@amlogic.com> writes:

> Hi Kevin Hilman,
>
> On 2023/7/27 6:33, Kevin Hilman wrote:
>>> Replacing IRQ numbers with IRQID macro definitions makes node properties
>>> easier to understand and also makes GPIO interrupts easier to use.
>>>
>>> Associated platforms:
>>> - Amlogic Meson-G12A
>>> - Amlogic Meson-G12B
>>> - Amlogic Meson-SM1
>> Does this mean you tested/validated these changes on those platforms
>> also?
>
> Amlogic's G12A/G12B/SM1 have the same GPIO, and the GPIO interrupt number
> is also the same, so I only tested on the SM1 platform, and the test results
> prove that these changes are good.

OK, thank you for the explanation.

For future reference, this kind of detail is helpful to describe in the
patch or cover letter so maintainers & reviewers better understand how
the changes were tested.

Thanks,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
