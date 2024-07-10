Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF6CFC3DA42
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 Jul 2024 07:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j8MhKuPeyVQAWSfw6BsqdR+IlgWsW4szsYHhuTZMlRg=; b=r7FdIgGcfOkpec
	LuNguallhDbFNOkh8K84VMianSIYrQLKwmYuUaBMR9CrHrLrSaa6prUa6uN6WCdcIxiX5OhQmFudy
	6vTS10l0gHCIeoV4GxXCoWMyTTCHunnNm9GRcQXiJYL3Qz8jwCW5kpn7cGbMelF15k76i7lJuRvUj
	l661NuJ8BWX0JXs2PphrNTNv5/tw/VS6brASWtAS2xh1b5cwIOQDl030OrPd9CCvW5Ha1TJX/hDnF
	9rK3GC0q/cDAkL6QkkBoDmuqzSfIDXLVTQsYvY/4wDDhvDtFw/otYS2Rb2x+rF0aCM0mW1bTTKTYX
	6D/yRWMIi+QB9QkFmzZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRRxM-00000009lgI-2iGs;
	Wed, 10 Jul 2024 07:41:40 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRRx4-00000009laP-1CBp
	for linux-amlogic@lists.infradead.org;
	Wed, 10 Jul 2024 07:41:24 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-367818349a0so3123912f8f.1
        for <linux-amlogic@lists.infradead.org>; Wed, 10 Jul 2024 00:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720597280; x=1721202080; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BsKkA5+o8cIHzcUHIp0+w252IM0bp/4uWhC5/Umf21Q=;
        b=OOEAttkp9Xi1jxJROibV4fTsdv6tWZVZyuVqpC8dDsBRuH01Py5Z2XdEL/BuLE6Lyy
         ntkSyc+nVaRGO4xIEWjNmRXq/N09kuKaq/M2nE2o3U2oNd4ZvUAYgmsqDK0IREHPEdS6
         mqR0Y1ED1IgnltbOYM8OVyIvVWMaKfXIY5EOWmVUYwh8ygRr6TC1N6d+x4eWI8J3F3u3
         fD9OR9JXd++Wi8qScB7rkTdEV6WvAeNZUCU4LzMyrqNd7DtUURwkZyzqkXxg5JNBneCJ
         R6GHSvdRlzUZJTqaqBizJgeX3+Olsf7DPLx+qkRcbfkra8/FxNtIoLIMoofQaJyJ82iw
         MwOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720597280; x=1721202080;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BsKkA5+o8cIHzcUHIp0+w252IM0bp/4uWhC5/Umf21Q=;
        b=dRJu8lDpnqJWCbul/Cs91D6HtKm+MqwiaHj1xRjQ8VhLLU/VyHWSVsxEH/ZSyC2wjJ
         Cp0W7BnusrV66ZKIMcdtz4oD9GpY7tMsfTVxRCd4znwR2/UmvrMWFNHa5/QBz/A+6azL
         l4GwwOESGUNq047CKa7fr3ATfVI7yk3mSC5eWWLM90EW9uCHJMKA0vsMpCZ2l0D0aPo/
         J7MVtldpRnq/967ZWUAjkY6IMkfXtYBh/hap9BFgiGiYbUdLcpOj5ColjXd8RlOfN0l5
         GeCmVfEpvHGvgn4lkkbeiM+Lo7OPJYpVtv6Mp4Y/ma1SMP9lihtaK1/rwqUBIdTQBdpV
         imxg==
X-Forwarded-Encrypted: i=1; AJvYcCWkWAuIEWYfCYK7LZ2mOUZw0rH+zueialilWbGrSVZG5KLcOp+5q5/vy0ih/UtdG+6mEvKOvqSufQEWkF0aX0IqflM4TKmGpUcgl4lEUnHiRZQ=
X-Gm-Message-State: AOJu0Yzk+yPwlqQqG+WGFGTMmJaFqOBWt3DeAJ/bre4eN4YCpjPi5M36
	ImyQtMQSqQIWLCQAZy7KvbtLYlsSg6cm9wsdNy0BMqfSVK14Zb512bVZmWHyjhs=
X-Google-Smtp-Source: AGHT+IGddrOSocTC3Aibp1Vkqu1Aje6/Ock0VDU/08zMxBW1iObesEMZ5KiX9KO+LVhFoCxjz3qx8g==
X-Received: by 2002:a05:6000:2cb:b0:367:9088:fecd with SMTP id ffacd0b85a97d-367cea46e00mr4261777f8f.7.1720597280243;
        Wed, 10 Jul 2024 00:41:20 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cde7e095sm4527144f8f.23.2024.07.10.00.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 00:41:19 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Huqiang Qin <huqiang.qin@amlogic.com>
In-Reply-To: <20240709-a4-a5_watchdog-v1-0-2ae852e05ec2@amlogic.com>
References: <20240709-a4-a5_watchdog-v1-0-2ae852e05ec2@amlogic.com>
Subject: Re: (subset) [PATCH 0/2] Watchdog: support for Amlogic SoC A4/A5
Message-Id: <172059727940.1289531.15312201454629239383.b4-ty@linaro.org>
Date: Wed, 10 Jul 2024 09:41:19 +0200
MIME-Version: 1.0
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_004122_364831_886090B8 
X-CRM114-Status: GOOD (  10.53  )
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

On Tue, 09 Jul 2024 16:48:24 +0800, Xianwei Zhao wrote:
> Add watchdog for Amlogic A4/A5 SoC.
> A5's watchdog is the same as A4's.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.11/arm64-dt)

[2/2] arm64: dts: amlogic: add watchdog node for A4 SoCs
      https://git.kernel.org/amlogic/c/34b60b78550eedbb596274f0336d1f86a80fcd19

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
