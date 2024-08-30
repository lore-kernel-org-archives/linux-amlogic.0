Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4724ECA0EEC
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Aug 2024 08:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kqYUnhpy7IBXkFztqKmaGMBDqA9YgbPhlXsvlXf54a4=; b=bBa+eyQwvcUTo9
	N9niDv6KhWpGvzUNaOaR6Qq8mndbomS0B1vku86CSqglY36icOMHNXVrwSiYNqskc2jWsKIuzBOQb
	yzazHkXfVsWcPpQmF33G+ksS+CdSShU8qalmV0yelzt5ABXcbtnbsmoZKQke9P+miL9ZrYpcB440p
	ZmAZD/Y567+IswH/dLf2YwSRADMdwggGKAo1JDlRP4kDT+zUqXQO3lMm642mIyRfQRYw+N5cYTMYe
	ujOcB6NxPweZg69l335pBXZZiTcXOP2hwANlDi1dHZs0PZiE149h6UwJDhdXh1bUuLyl5O1HamUaT
	A0DNsRFWwI3kb9q5WYVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjwnR-00000005IJC-11u7;
	Fri, 30 Aug 2024 08:15:53 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjwmd-00000005I0e-39KL
	for linux-amlogic@lists.infradead.org;
	Fri, 30 Aug 2024 08:15:05 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-428e0d18666so12817625e9.3
        for <linux-amlogic@lists.infradead.org>; Fri, 30 Aug 2024 01:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725005702; x=1725610502; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TwEbYTlIGuEKRIfnYKcbOmgEE1eULYFkwpGJpyvLzJI=;
        b=cBR+hwiIcCgrO5NJQV79/nj+r4qFj4MY3CLNGgRk9eQVSgaFvUN/XX89Mkk2f62Ugz
         1ptPLO7tyoir8T+ht5+KW5uJeiVa+ar4cCYFYcSYHUFtBf6MnAAlnpwbuh93PCVi3SYM
         VWVHNkgJWOBUFjHnvoeTziLB5r2qfeMg5aPyORvWZMutoZO8s08EWYWz3j1fjL14w7SI
         Y2qUFNnYDOIxPz1fKijB7WNshU26h+RhbL7WGYLHtk4CONEoLleBHr1AvlXGqtmRO8bX
         ReZzEf01fnGaom0zb7wVLw9ybXZ3Ir2zpmWEQaFWpPHmDltIV2J8Nerk84GYGTqzmDb0
         EBRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725005702; x=1725610502;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TwEbYTlIGuEKRIfnYKcbOmgEE1eULYFkwpGJpyvLzJI=;
        b=lMDBCcidAYiYFZ9V7B+hp9OdzTQITTyx0vtHReYfz62oQ4PjqyNzGjZxd/ghIh0rt2
         4qzMoeG0umxNl7LvfY87JGgz5m5J4D3SKMoluAb+4XWbqgjDx4TNQf6O1YmEg57BMUbB
         TFqXi5ceTONMQC2shKZerh8LAC7IY8Q159BWCnsrGWZd9JCZbcsknG5ayGo+9g/aPnAV
         82r9f5PKBJwtxcVucv7M0eWD8H++q9JHeJqjZv5+ggRfxGBvhxpuZekkXhcUj4lvYBtd
         S3bPkpZqPRC4MXaUKCZ7BFilqx5N7h2vqacruoIHqQll+tteLMZ9eOLcW9gHb+z7fHaF
         VPLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEeItiWwbIIkiB32wr/9fl9KA+yNkQDoQ9Be2hzv7RM1g+E45l0n7RXOBLsvXCvYadGb9/xh9U/k3SdPC5@lists.infradead.org
X-Gm-Message-State: AOJu0YxDqGl6xv5YFgr0xDbqYLi1N+CseczPkZIrFf6aKTG3FwF4Ww9g
	k6rmxKRpTuK/H64KawmgO4uJfz1kSTCq9TiBIQdU6eLZjg5j7rv0ekjK3QhjyE0=
X-Google-Smtp-Source: AGHT+IGlVWCwctNLM1H849kElS12n9ORO2J3+8cTg/CDN3AGEVqfp3UvIq1xbGyrpDfqOXMmx4PQYw==
X-Received: by 2002:a05:600c:3b93:b0:426:5e0b:5823 with SMTP id 5b1f17b1804b1-42bbb44114emr11034305e9.34.1725005701276;
        Fri, 30 Aug 2024 01:15:01 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3749ef8113asm3269284f8f.89.2024.08.30.01.15.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 01:15:00 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chuan Liu <chuan.liu@amlogic.com>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20240830-c3_add_node-v4-0-b56c0511e9dc@amlogic.com>
References: <20240830-c3_add_node-v4-0-b56c0511e9dc@amlogic.com>
Subject: Re: [PATCH v4 0/3] add some node for amlogic c3
Message-Id: <172500570043.143584.9400880712807220818.b4-ty@linaro.org>
Date: Fri, 30 Aug 2024 10:15:00 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240830_011503_863569_D6978F62 
X-CRM114-Status: GOOD (  11.21  )
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

On Fri, 30 Aug 2024 13:26:07 +0800, Xianwei Zhao wrote:
> Add some node for board AW409 and support board C308l AW419.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.12/arm64-dt)

[1/3] dt-bindings: clock: fix C3 PLL input parameter
      https://git.kernel.org/amlogic/c/4ccba8cb2c5ca573d9bbf366e7d9d5e9761518c0
[2/3] arm64: dts: amlogic: add some device nodes for C3
      https://git.kernel.org/amlogic/c/520b792e83171efc8ec0b004412b44dabc044de0
[3/3] arm64: dts: amlogic: add C3 AW419 board
      https://git.kernel.org/amlogic/c/d4bd8f3023b68f72431e05ec6cbc793519b449cf

These changes has been applied on the intermediate git tree [1].

The v6.12/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
