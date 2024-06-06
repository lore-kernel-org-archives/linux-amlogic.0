Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 977CBC25B75
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Jun 2024 09:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PVRccn0WHnC0Jg/dJYNnhFdztaWsRETWsByIsjb9GsU=; b=ykLIzUpG0gcR+Q
	/4zVG3dsm9HTFgq2Id+tgPPsfuzg2aQJzvwl3NQIvZLviR6MOOt7PrBlEADqsMBKlZ7x820A6oIgq
	FUaY/FmUcktIkMDjSWEgvnYVagPYcVHP3Kmi6hOloBPynFQVvaoeY7FDumJm4aPSWjc5SuD4Dp17R
	AeSx7q0klnFV5Xix9nVeFIBxfikzBAJkujc3scss4HtkoMQTsVi4WBzGcVUnGtQuUigkUf4JIRZ4D
	OFS+jQvgyKAa5QLbuI5Ex+hhcsqHCvgPpTpHWjUqNwygsEGc8kHOZR580K1fEWbg8ONg6sy6/sbvK
	WABlWaClalh+x8meUqFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF9BX-000000093lj-3dEX;
	Thu, 06 Jun 2024 09:13:27 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF9BT-000000093ij-3c8u
	for linux-amlogic@lists.infradead.org;
	Thu, 06 Jun 2024 09:13:25 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-52b9dda4906so1007430e87.2
        for <linux-amlogic@lists.infradead.org>; Thu, 06 Jun 2024 02:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717665202; x=1718270002; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l8XpB9v83VyPuuQdMulEgHFlBA3mzFMN9vIEdPPQdzQ=;
        b=DomvXez61COBYmnNX58dJs9DgEKvlgBE1JHywZE+PNsPPTfdf8PGGXGcQUUaR6GGW9
         6HBkhA8TEAlBMOsPPFUO3Zp3sx4U5fSHIQv8iBU/G7RiA7dQGRNJ+Lh+T1jPxgeMgYRc
         kX4iUK0m/pqgZz1EafDnyshFRVrzdIIQQCYB5cUiP/p5W2hPobN3AUQ14HW7ow5wvwjb
         BtG6bFEETTyyS6HWG9LvmtY6zyXX4Yc1/lLC7hiTMHlKnFLj3H2HlqZu1pJqbpiIWWNM
         ZjI8hXJFfauzSnrTFhLVPlQj8T8043bM5vG90nPyGCJ9I9cOdAh4UtBg6KOrl1R5xj80
         ZABw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717665202; x=1718270002;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l8XpB9v83VyPuuQdMulEgHFlBA3mzFMN9vIEdPPQdzQ=;
        b=rWqaBrJBlKmO+Ur2eocnE8nrTvLhX9axntoRvMdDJ7l8gIpiFSIfmE+KnPwHB2/JYh
         tJfUG2nCyWP40p/jTlWyvx6b7koypzWDI8lsOY6nPr7M5WgqUkVuBDRngT8OBHi+49mn
         rX+K0w0/8TnUmmW0/T7akEqTZGxSIzLHn28O+dvdme+/MhpuHBHWP7cWnjeHIcOIOAj2
         Zj9FulT2lWZwn6j/QS83tydyN0+VjLrVbopETX8ZgCYelxfH31FEh1ogaX5cgIjeSgxO
         DZ0oyO6S6Ws56QYJrbtDumDZ6Pg4aPMVTsoLMuqy3LUoIqpWgDZ9fIWNBuQWwVRlFfy8
         lxHw==
X-Forwarded-Encrypted: i=1; AJvYcCX0ki2b2vUGyfeRQ6e6eGinmZjSGI5VQe84jNZlNx6a+npOevtTvx5byAxzYnX7BwPUZfDZPU0vg5/Wtm8N9ZiW4035phFid8UbJKURy0SJ5XU=
X-Gm-Message-State: AOJu0Yw748LgYArDp2K0bw6Yvn80qxf8VzPfBD3T2E4FQP3ZPlICRQYS
	ayRAV4N1SHvVwXF92/O4mmqQsoLVEEFzAgwap0B90Lx4WKaI1KAmUDskbTFs0g3AZAsKeUK1eiG
	i
X-Google-Smtp-Source: AGHT+IFqolBgjPb1yWWf0ytpdS7ylHHarzNbdgoMc38k4aaIgXcMNql57H+efViwpESPzqw6RAKTdw==
X-Received: by 2002:a05:6512:3f03:b0:523:8a79:21b with SMTP id 2adb3069b0e04-52bab4ce48cmr4559162e87.11.1717665201463;
        Thu, 06 Jun 2024 02:13:21 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35ef5d66d01sm1027407f8f.50.2024.06.06.02.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 02:13:20 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>, Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Dmitry Rokosov <ddrokosov@salutedevices.com>, 
 Igor Prusov <ivprusov@salutedevices.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20240528133215.2266419-1-arnd@kernel.org>
References: <20240528133215.2266419-1-arnd@kernel.org>
Subject: Re: [PATCH] arm64: dts: amlogic: ad402: move thermal-zones to top
 node
Message-Id: <171766520046.3911343.14113541266786791367.b4-ty@linaro.org>
Date: Thu, 06 Jun 2024 11:13:20 +0200
MIME-Version: 1.0
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_021323_974101_8CE751E1 
X-CRM114-Status: GOOD (  10.72  )
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

On Tue, 28 May 2024 15:31:59 +0200, Arnd Bergmann wrote:
> It appears that this accidentally got added into the spi node, causing
> a warning.
> 
> arch/arm64/boot/dts/amlogic/meson-a1-ad402.dts:119.16-161.4: Warning (spi_bus_reg): /soc/spi@fd000400/thermal-zones: missing or empty reg property
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.11/arm64-dt)

[1/1] arm64: dts: amlogic: ad402: move thermal-zones to top node
      https://git.kernel.org/amlogic/c/6c9b5ba73ca77ef3863cda6560856fdfe7dc237a

These changes has been applied on the intermediate git tree [1].

The v6.11/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
