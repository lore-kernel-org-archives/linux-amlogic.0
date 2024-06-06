Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1260C27C55
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Jun 2024 09:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j2d97LHLj9YN26wA1wopaHJAArgychSQeBQzMcNqKVE=; b=mg26qF5eHhdYiI
	hkdw6RRHEY4AnEcbog33mjr/64xktk4VaONSr4CFuZoYy/EdjXjzC8cvENzX7qq3u+cD9YeVJ75wh
	etrp+d/erPhsuX9E2paQXW7EtNBH3BvE/VQtuJULYQHFSl/oDJX5COZ1E5H5R7nkW6AEpABcO177Q
	hjilNpkNbSEgyG+fsI+efxqYmanmlcItnfnnbtNJNScrhzGFpx3ObKT27he2nUU2xdcAnsLoTntDx
	98GhNfi5D1LD9MjHdHdaR5w+F3T8x6tqd3bUP1aZJMapgkNrUQ+T1sXa7VuLY3HmlhX2853NZKuMh
	quxUtyjni03jWfMDo+bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF9BY-000000093lr-16BG;
	Thu, 06 Jun 2024 09:13:28 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF9BU-000000093j4-1phg
	for linux-amlogic@lists.infradead.org;
	Thu, 06 Jun 2024 09:13:26 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-35e5604abdcso1150466f8f.0
        for <linux-amlogic@lists.infradead.org>; Thu, 06 Jun 2024 02:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717665202; x=1718270002; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W7rpMUxvdA5zrN/keRF1fVJunWjqm1VTxYEF6BZM7Jo=;
        b=Ad2yy4bz/xYdr5per7cV5HGy1Zl1q5MxOfkAceqf7y608DoH/ODH4gYzSnRulOvj+A
         gK9uyRy0OeXRKWjYDtA/1S53+3whmJJhhnJC7S/yGUYXrYNHyCubxtc7CZMjhQujBuTV
         VkVgqllNSys0xxrpq2RyQhnkdSISsqS1eXY2iEPv4k2sOca06NT6DMSQ2ScxVGTEeZH5
         NcFlooCc8eQQx47FHEXrfKjIY4HKuz+DjFF3s03dVdZUfWydTqv2+AxJOXnEqaOj6sSZ
         GWwj1By819N3nIs75Dd87n8EpMkDEDDv8JOHyQ+HW2cbTWWQ0GDRQI59QqxeZS18iXbq
         0VCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717665202; x=1718270002;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W7rpMUxvdA5zrN/keRF1fVJunWjqm1VTxYEF6BZM7Jo=;
        b=vroZucZ4sHyJFReMru+lDmhyYqziSrBqZ5h6GlbtkTVUGfddfcMIWpHppqB1vH5nya
         637QpkX7KjBZfM5hqeRuTPk9GIyf+Uv8kZPE4lP9ue+aAtgzF9X8HCXxvFGoA+zzqA4u
         AyHLJxsho3GgwmYIqDXrIiCyNdXp6fqbC/q6jnNlXlY6sdTWAXCr0f4g89YMX3EryzW7
         4RJ1zQBZBzr8tAshpHeLU+9peC/doj3tjndBwIy++Jtkkg58ZS9G6RTTzYISjdqBovIA
         En9EpUna9HCaum+GznU5DTTrCk5ved0u/WC6y6ggJd1Myemt9Mea2nVdPsCakKZLvAwh
         k0jA==
X-Forwarded-Encrypted: i=1; AJvYcCXJsaeQIAnTTTRS0CirtxZ9IoNDa32q7hZpSGcuKInH53QEJXJYaauigXC/l836KoCOEK0/UxSIWYg5JRMOhHyf3jQtRX7oOt6vlhp0tRrNyKg=
X-Gm-Message-State: AOJu0YyqbUwImg+JAlLJ1j1MQACv/Hh615W25/RJYq8aiF5dHYkmu3la
	TCNC3qrObEo/abTAclh2SYmXGoFlJMV5oieJd3n7MmulXTaCv7WaYTaEutc4fDs=
X-Google-Smtp-Source: AGHT+IFQKjrQYwhY3ByaB3QNZ5M/lCQEAWegoA8wwUo0uLlFLQU8G3ycDlNa4frEBxGxxqP5Z+Q2ng==
X-Received: by 2002:adf:ec4f:0:b0:35d:c0c9:ec14 with SMTP id ffacd0b85a97d-35ef0d844famr1864724f8f.19.1717665202384;
        Thu, 06 Jun 2024 02:13:22 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35ef5d66d01sm1027407f8f.50.2024.06.06.02.13.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 02:13:22 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <20240604084134.3315841-1-christianshewitt@gmail.com>
References: <20240604084134.3315841-1-christianshewitt@gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: arm: amlogic: add GXLX/S905L/p271
 reference board
Message-Id: <171766520161.3911343.1016095410760803619.b4-ty@linaro.org>
Date: Thu, 06 Jun 2024 11:13:21 +0200
MIME-Version: 1.0
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_021324_504703_B9348098 
X-CRM114-Status: GOOD (  10.79  )
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

On Tue, 04 Jun 2024 08:41:33 +0000, Christian Hewitt wrote:
> Add support for an Amlogic GXLX based S905L SoC and P271 reference
> design board. The S905L is a low-cost design similar to the P281
> (S905W) and is similarly derived from P212 (S905X). However S905L
> omits support for the VP9 codec and uses Mali 450-MP2 (not MP3).
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.11/arm64-dt)

[1/2] dt-bindings: arm: amlogic: add GXLX/S905L/p271 reference board
      https://git.kernel.org/amlogic/c/f36596adb56f0381c0c46c5fab23ffd201f7e646
[2/2] arm64: dts: meson: add GXLX/S905L/p271 support
      https://git.kernel.org/amlogic/c/f6386b5afa81724164263c30c48de733e0aab74c

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
