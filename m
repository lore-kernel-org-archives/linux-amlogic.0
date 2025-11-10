Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19EB0CCFA1E
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Nov 2025 08:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ns34BLiQ+7Sw9L329biqHvZMy8dzyKEhbwTQNk9vZi0=; b=f/S07AkX3/QkCE
	Ey4Zxr9KmFwQotp0mWgsQYG1XlfZ7sKt++r2tPJLmDiWfFG9MqlV/VPGO4Gz+lwJO3IcVcza8Qo4S
	agjcfX03y1sq3ZThw1I7QMA2BSaQKO2X4isL1200Soluy0Pv7UtofyC8qbUUIk+v2WcLsW6KN0WfV
	+mR6xMCBYx2Ciswd2pLQ6FLa8lyh0Ru5cJRNTEOHLAl/RahnZkArIv7Oi3ZKlim2+wBGftnrH0LnL
	AuC40u7yZ8z5DHWiXzcoWECODn63+CgKcc1uWKVtQvoGmfJMnEd7jcMf6Ehieymkov1Cm9QVia3QX
	3JNlHswSxFzD8X0BXFOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIN75-00000004y1n-0Qin;
	Mon, 10 Nov 2025 08:18:59 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIN71-00000004y0f-1JiA
	for linux-amlogic@lists.infradead.org;
	Mon, 10 Nov 2025 08:18:57 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-477632cc932so10054545e9.3
        for <linux-amlogic@lists.infradead.org>; Mon, 10 Nov 2025 00:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762762733; x=1763367533; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Ow0jXvjkh77pOXWIP6I5DYsF4xpz6igLz3RhPzX2Hc=;
        b=cVtERCXGVSYvsdxIWSxBizOKYPj8a1/IhhgYbsmwAa8dp5pbxQLzGTQ4er7M6GE0T5
         FbWo4a9zl4F3UokSKFCYNcDjTgQeMWEBSni7b3XwU2zIKmoUXIUW/m+bfapsN7g1p0Eo
         UOsxnUwmIMPUzj1Pt3iqN05ho4DM3QyZGCcMEdz1cRaOmW4yXlbQiBMd4+EZKI0isYRk
         StQ2kb+JoBZmFGdJ2Q5wCz24TxDkGXG3h986ldY9UzUhk3JrajZjEyDDhGQijzHU7RKU
         cggOpEhHOJUTLPsgRMoEs+K04sNTHMcVOQT7p57A+RvBdy+p1ElINlgP1eQeZ7WZU8Ti
         Y/Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762762733; x=1763367533;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+Ow0jXvjkh77pOXWIP6I5DYsF4xpz6igLz3RhPzX2Hc=;
        b=jjtf7Cm2KbUZ4eSHwI7MnQ+f0S+RVj5r4wijQxRnwWrE+Y51DazviMSVdeqKZ6g1r5
         rLG7ok7n315whaWKz7rNWKXu7M/stxzz3KRv2CnfYAvqYKjaOK1xpPDEgPD9tjSrdLy1
         QzPUfCSxOxJY4lbRHoTZxMB1DUv3DuaRa43qdDe3KnJD8FTIEp+sowNtDKKMpxK6Os8g
         ap3mXqI+Y7JtFJTI/dBDHAbvURqkW1oZPEe7mMSWN9cLtgHaML2f86rEBc1AeOhTjtcP
         fbLODVrxF6YlYoJaBoILxgLp4ivuvteIuvRnJ2l1SXCPS1B6m6S/c9lWx4cuxIkvvglJ
         JOKA==
X-Forwarded-Encrypted: i=1; AJvYcCXIZgd2Tv/dhvBXZL14WRRnUzVVfn5HKyvfi7PFG4PakxbvTbcef/2WEv1u1+ihaKgua6nC6Y6roYOyluxJ@lists.infradead.org
X-Gm-Message-State: AOJu0YwbTzZPkqJNaz2+Pu5MyZ2HEmIboaOO2P8k4KIz8ZBaKF8LWwhT
	n7B8yyYth9o+RAUuuyEnISynLf858RPMULvSFEGFhaeeGb/wLNsoiPXzb1cf+BJhfRY=
X-Gm-Gg: ASbGnctU0emCLG84PWdyMS3nwDDc5yQ42zqbFIj4OUkmhiZvTIuVF3w+uXvAxAJjpDJ
	P9OciHc4Ihymi0zrZNXiJOcI7/8/dNb9Elb3NItLO341SVuiq1sSDQYKHX/h6tq9pPuJmhtGIFa
	hzopvksjvOze6suD4+BnOTum8fvsQt/9ffB8ReRD9MyKDc+Wehc3WD2wOPvWdOFKGVFXCNHLgfY
	VJJW4s3ldCDQoYBs3kbUm2+fwp29p3kIZV5QUkOG0GAjVKcoZOnPm/eE6K2qatfxbJGbDVl36jE
	NWg9O7sN5oCm30/Hd00bnaZIo2o/bKoqVAcRw8oA1ekRZta1A1QcHOQKHXPndAdYokIC7svDraL
	6FAwTZ05ahU8sgSBatVf5NjGKvijOBfi4gInJ98oS3qm2AOCKhC+RqT/t0MJP4iE1XimDaidUNq
	1DNQhlyHfu9W1V0IfbbsVz
X-Google-Smtp-Source: AGHT+IFNAJ6Bn4FpyZtFF1NnxwYE2SjgYr7mpYVD4++XybQIbWpInXbD7iemC8JYoesp/8+j6x9DXg==
X-Received: by 2002:a05:600c:4fc7:b0:477:6d96:b3dd with SMTP id 5b1f17b1804b1-47773236f6cmr51381675e9.1.1762762733314;
        Mon, 10 Nov 2025 00:18:53 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4776bd08834sm192070105e9.15.2025.11.10.00.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 00:18:53 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Bjorn Helgaas <bhelgaas@google.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Hanjie Lin <hanjie.lin@amlogic.com>, 
 Yue Wang <yue.wang@amlogic.com>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Andrew Murray <amurray@thegoodpenguin.co.uk>, 
 Jingoo Han <jingoohan1@gmail.com>, 
 Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, stable+noautosel@kernel.org, 
 stable@vger.kernel.org, Linnaea Lavia <linnaea-von-lavia@live.com>
In-Reply-To: <20251101-pci-meson-fix-v1-0-c50dcc56ed6a@oss.qualcomm.com>
References: <20251101-pci-meson-fix-v1-0-c50dcc56ed6a@oss.qualcomm.com>
Subject: Re: (subset) [PATCH RESEND 0/3] PCI: meson: Fix the parsing of DBI
 region
Message-Id: <176276273239.834148.1225755186046227156.b4-ty@linaro.org>
Date: Mon, 10 Nov 2025 09:18:52 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_001855_462770_F29403D8 
X-CRM114-Status: GOOD (  12.83  )
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

On Sat, 01 Nov 2025 09:59:39 +0530, Manivannan Sadhasivam wrote:
> This compile tested only series aims to fix the DBI parsing issue repored in
> [1]. The issue stems from the fact that the DT and binding described 'dbi'
> region as 'elbi' from the start.
> 
> Now, both binding and DTs are fixed and the driver is reworked to work with both
> old and new DTs.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.19/arm64-dt)

[2/3] arm64: dts: amlogic: Fix the register name of the 'DBI' region
      https://git.kernel.org/amlogic/c/8b983ae355aab50942c72096beba30254c5078bd

These changes has been applied on the intermediate git tree [1].

The v6.19/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
