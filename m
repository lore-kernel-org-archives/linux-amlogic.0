Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04705C2BBCA
	for <linux-amlogic@archiver.kernel.org>; Tue, 25 Jun 2024 13:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8WC19vP7e9GbTCdiLaMOIBSj5q3Dbw0I3eQ8ZFVrnlA=; b=b5va9vp08a/R4Y
	lt6C/dPjEWyD1cfB6LQLMgE3NTPiezSv/gzwtyO9vbgAwP2XnFdZkcGo9K90KK6+BQJ9CsWwLajjG
	NSK6PGkbKkKQtdUhMDsAwCW3nNt1OEefrBQyD2t3WBmA+S4YHwBcmu9mVzjtH46yELviiIhoN1LnF
	kPePW8Y3ClzY6syLjOBdXVknHIpFhISFu8PiRTsoSAZYpf6v7Q45G8GYmHLMUkESxhvJepcb3VlWM
	ye6UZTu1i6vSGl7BRYjo7RJWtVZzVz0jnFbVUi/n0uNS4bMdWlbLXsrgFdllRNDEmGpVL+O7hAk4f
	dPvwHqXaLFSs9WK+V3Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM5xU-00000002v51-0ieN;
	Tue, 25 Jun 2024 13:11:40 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM5xQ-00000002v3y-2lJv
	for linux-amlogic@lists.infradead.org;
	Tue, 25 Jun 2024 13:11:38 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2ebe0a81dc8so71689151fa.2
        for <linux-amlogic@lists.infradead.org>; Tue, 25 Jun 2024 06:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719321095; x=1719925895; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IIrvv9/kgtl+q9BfLGhefIkibZLSWIG4PIciMEcuwN0=;
        b=TZveiR21He1bE+19OgI+fqFDR3qHiUCD0xYzzuuLcEOjY+o1EVEPQsNRq/6a5fFL/d
         4pvblEDAIc8y8jeaU4rLdYfOawzzk67OV8NVvnNUMI4mBQ/Xg0zDKk+pBtcHbOeKZXUa
         erFWGxUuHBs/ZtahVE68CIYXmettcMbHuCdQLwEujDRDtAt5HNQt19vMtDd6FSGZEaq+
         TaelzOW2cBXFKS5MdHsrTr9QRErkDI0bQ9XERHTR4+rwZnPPuEMPv5VWTwy9T74PLcQU
         yrN7HWwp215AJzSn/8VHmt5dkHZZ+8Cvr4DolKHyw02T/ffTinjbW1uiL2ddGKMYgEdF
         g2Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719321095; x=1719925895;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IIrvv9/kgtl+q9BfLGhefIkibZLSWIG4PIciMEcuwN0=;
        b=j5kAGFKwPg5H/F3NfWpq59jLw/Ezd5Z9pNBUvich2Mx2uaeIRME+JzPKktbinaieU5
         F+vnFk0BkEkqO3h2qjD6J7ck9Beg1WNEhwVb/kCYI5gd1qdUUBRaKpTFJpr3u3YgouFq
         bhDnJpIwCJraonH5uwwoRB4iiPK/1P9J5eFP+yzZ/bPBLmoVU24l8UKMQmoW5ZteSTJr
         hLPsfd13rJgnRb+noQ5PrGZ3u+ojDsqtaaxG8P4kkLzq0kbfb/amZhCDMDhP7leFF0W5
         SOM/UzHJUQT59oUK8cvK4uspeCXSS20cmUwGctvPnIa3TWGgvifo4RGZtQmor7UeYT89
         BcwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdMUED5InOGE5prRXrT7lvpIv2oTMAVkSoj82ZsrvzMy6y3TGS0jW+uHhu6uHxDcEAZa1wjrhJjVI9V5HJgTZhXznAoodlaFuM36Sf0kY7MkI=
X-Gm-Message-State: AOJu0YznwglCxB3yFaGZqAfq8/L/f0BfSadIDuLjGlyBZhKECXkXwv0a
	CoR2Fi3FGLgc5qY1DSWcHFZV1tFprsIvAKwCtKAdnoo9yhs58JMO6HmOU+slDjw=
X-Google-Smtp-Source: AGHT+IHzlTnRQJf2hehRs+SAvaVmz31wHZ2bP1o/glDmxazjuRiH2gBo9PGqG3oH4PdEOEf5iSt3Lg==
X-Received: by 2002:a05:6512:3054:b0:52d:215b:9028 with SMTP id 2adb3069b0e04-52d215b914dmr63320e87.60.1719321093032;
        Tue, 25 Jun 2024 06:11:33 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4247d0b62basm216005375e9.8.2024.06.25.06.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 06:11:32 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
In-Reply-To: <20240625115443.934763-1-jbrunet@baylibre.com>
References: <20240625115443.934763-1-jbrunet@baylibre.com>
Subject: Re: [PATCH] arm64: dts: amlogic: g12: bump spdif output drive
 strength
Message-Id: <171932109224.875193.12156641833117245401.b4-ty@linaro.org>
Date: Tue, 25 Jun 2024 15:11:32 +0200
MIME-Version: 1.0
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_061136_749245_B29E2E2D 
X-CRM114-Status: GOOD (  12.43  )
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

On Tue, 25 Jun 2024 13:54:41 +0200, Jerome Brunet wrote:
> Spdif output currently uses a 0.5mA drive strength by default.
> While the result depends on how the spdif output is hooked to
> rest of the system, this is a bit weak and signal quality
> may be poor. This was reported on the vim3l for example.
> 
> Increase the drive strength to 3mA, as used for TDM, to be on the
> safe side.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.11/arm64-dt)

[1/1] arm64: dts: amlogic: g12: bump spdif output drive strength
      https://git.kernel.org/amlogic/c/84f6ab5fedf735a447080e2fd286eff9859cd199

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
