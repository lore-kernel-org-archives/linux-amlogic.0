Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F55AD29FFA
	for <linux-amlogic@archiver.kernel.org>; Thu, 15 Jan 2026 08:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=22LVg6djCPq8vHU8559y9I3mL9TJjxElbEdI0X3bWdg=; b=IJr13PdjPcJ3EA
	SjeeZzt3zVZZ52HNpmUor68ydAUL7dibVyJiEDIGcTXdzf7PHKe/tNkehsXlCA+QJBsLQgwKXGdUd
	TqaLbc0SwLVPtwuD8tErjfwVZdRyks3o3Dy7+6PuVR3fFu1iMUbLj9ORs6MVDxvcEao6deX4gobd6
	ViaW2qHvtxbHQOdahNFNEo4sgINac3YsWGpWMd+wJBOgGlZJJBqkb66gyB5UFS1lfLfmD6AnaUZ/p
	mr16a7/HKpX6u8IOTwpPmJ/tscg5vHFQ6BOwhJ0/l/DBtp3mZO4wr64w4FSvMLgZcI//wSJSBn/t1
	6RFTU0QRVPM1awraABSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgIN6-0000000By6Y-28qE;
	Thu, 15 Jan 2026 08:06:24 +0000
Received: from mail-wm1-f65.google.com ([209.85.128.65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgIN4-0000000By5i-2baT
	for linux-amlogic@lists.infradead.org;
	Thu, 15 Jan 2026 08:06:23 +0000
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-47ee2715254so2639075e9.3
        for <linux-amlogic@lists.infradead.org>; Thu, 15 Jan 2026 00:06:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768464380; x=1769069180; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5whZZY0NFTuaVPJTKC+j24tM3a2qyIAuO69Q21m6x8s=;
        b=oC//F3DW5A6xSr1NmNlMgcEig94QueIriAwkOqR4n0k+Z0/HOILTjOuFOLWFT2kPIF
         aGF+S7+F8ydKKVCrnHvEu+u4hqFh1E2/qTm5ndLUn33jKVwT6nrqsTEe65QWmJ4UC6yt
         xqAGM86bCtwgTtEpmqihA5CbbYSUKeXOS8HXDLznvYW32EKg+5X9pq5Z/YHeJvX9NukB
         s61dZxJuQwzb3bf/3594O52ifFKkTMG4GneOe34rdgiJAlfHRW7bLJtJ79aOxsnyx4aT
         TjwJeRCx4uPTP2Z31nbPoCj/pFiczLyyTF4SbSk/91Q4U0k3KUa3VuWe6na1ZxzxTF9x
         xXpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768464380; x=1769069180;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5whZZY0NFTuaVPJTKC+j24tM3a2qyIAuO69Q21m6x8s=;
        b=pxHJK6Aw5G9wnrjb1byufnocVuKLIDyKdaFu8LbGnwL9s2M/yu5596YFGa4WpW4mFt
         +pK7fZCNafwEp1KpEbTLg32h9to+T4VM3wED7UYFj5b6aNHhxXV95RIk4hAF7QlUZJ3Y
         hgtTOjNoDyL7yQRt+i7v+n37N30beA/YdCSaQtla1FfuV1JJfsltftBVOiKlPfpo/GTn
         q/RGZtOIFb8ggO6dpMFW0/qTqIr48JoyVtnWx1JJd5BuXURWOGq4JlUS4DtZErvAMoNm
         ehxMzLKdZsb/j9bdWsh2DMWjwiS5gJKukNB2e0FyvngX4eR5Uj2YOyGXzgQYYMccH8aN
         tn0Q==
X-Forwarded-Encrypted: i=1; AJvYcCX3YKGfZzi8uSqqaIGUNogdPyNSZDVW8u2x/0714vT0EPUMBsLUGi0zQeXh8cTG270dcHkccn1vkfoZd60k@lists.infradead.org
X-Gm-Message-State: AOJu0YxDilfY1X+LaLq/OVyiGgktFYnDLBC5SI7a7PVzlToniT/A1AOQ
	p0tE61qeJrLTHn6ELzeA95+m6eXlxa5xdAhCskjbeX6rxd7Mh1PPt4DF60N7fXCfJfU=
X-Gm-Gg: AY/fxX7qJiu0xTpmvowE4PWmkmNvf78sqqfHyXvBSDhk6CpbcnXmICktZW2ohwZTBb9
	04plcfRTr4ceY1pmhYB+Kku7+ULPW/br9UqXGEQPdjvYiTI18hGIA/ky2mkKa2OxONQSZG+i2er
	SETSuDU9emAiNDufH0MDdg6yUs4wvkHGOI1h4m6ISMtwFFIPR4GITqel8za2EDz9fKJPW1JVHz+
	Wy8c3P+Y1Rj2wuGilW5SjGGTaSDV36DhH0KVZtRlGhmDouP+WI+HLGDCoAORDZSOv/OOEuRwh/z
	su6pCom7BNbTn68ZpusP6aqwz1jBCCmQ2Icgle6BXbM2QJuQe9uai1ijA+o2ZuiJLEKZ4K1U/po
	l24muo4M/LJdXH8N/4wVKIt3IXo+Pdzyt/HwV1UCXnco/2C+vji9972s2m5Mz0UUm8nakzVyBmQ
	KYcIz5IrNun1Aw+ti/3tY489zkygz5rKinx3tqqf5OuA==
X-Received: by 2002:a05:600c:314f:b0:477:7991:5d1e with SMTP id 5b1f17b1804b1-47ee335fb15mr57018655e9.25.1768464380292;
        Thu, 15 Jan 2026 00:06:20 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f4289b789sm32875245e9.1.2026.01.15.00.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 00:06:19 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Ricardo Pardini <ricardo@pardini.net>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260114-arm64-dts-amlogic-radxa-zero2-additions-v1-0-8b5cdf328fde@pardini.net>
References: <20260114-arm64-dts-amlogic-radxa-zero2-additions-v1-0-8b5cdf328fde@pardini.net>
Subject: Re: [PATCH 0/2] NPU and i2c3 + FUSB302 addition for Radxa Zero 2
Message-Id: <176846437964.1204537.11505642254935473121.b4-ty@linaro.org>
Date: Thu, 15 Jan 2026 09:06:19 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_000622_673213_2379E4B9 
X-CRM114-Status: GOOD (  11.34  )
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

On Wed, 14 Jan 2026 23:48:35 +0100, Ricardo Pardini wrote:
> This series adds a few things missing from the Radxa Zero 2:
> 
> 1) NPU (etnaviv), just enable the node, similar to what was done for VIM3
> 2) i2c3 (also exposed on the 40-pin header) and the FUSB302 at 0x22
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.20/arm64-dt)

[1/2] arm64: dts: amlogic: Enable the npu node on Radxa Zero 2
      https://git.kernel.org/amlogic/c/29deec49146162d06b17739c627d062191e03814
[2/2] arm64: dts: amlogic: add the type-c controller on Radxa Zero 2
      https://git.kernel.org/amlogic/c/8f5aa8d444d1d200715c36a8f072054a49bfb410

These changes has been applied on the intermediate git tree [1].

The v6.20/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
