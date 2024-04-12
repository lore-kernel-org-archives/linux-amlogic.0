Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CA75C4345F
	for <linux-amlogic@archiver.kernel.org>; Fri, 12 Apr 2024 13:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z5BNa0ARg09PAKPuwyzGbsK3yrHhZTt587kUNjgEfhg=; b=2iGdMx6jX8nj8i
	1AlESJIUQQ+r0cRW8ugHnXJudPy/2/J/10DWuU6g7JVKtRbm1w01f0steT4U2+m/4H2z6WG2aegfF
	4gL3eeCEr8q2WeFvtYO3iM7hlvPUvI763ipIcP5Quy02WGkq0Oy/X55bE5WHBXsi3ZyrjDjEUMxq+
	JgQE5M7dwaMS8/JtWQAVOtY85dXEvQ71avekFFoVmp3RsXKrjdlpSyO31i9Og6iRmO36U/jgzWxdg
	PkrCK7k6mKFwtTTSXVXsFCpQlWKwV7wrGoslcJkpksquV1r6pQDAdjWJ+5x9ghTfw+0FbxuD9GI3/
	wxG1ElgNwumaddl2Eb6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvGjO-0000000HGQD-0dyA;
	Fri, 12 Apr 2024 13:14:14 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvGjJ-0000000HGOi-10zg
	for linux-amlogic@lists.infradead.org;
	Fri, 12 Apr 2024 13:14:11 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4180e7946c2so1721395e9.0
        for <linux-amlogic@lists.infradead.org>; Fri, 12 Apr 2024 06:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712927647; x=1713532447; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RH18SrMd/y4JjJ7b5pFwPelRx1az3iZoiPbP291BArw=;
        b=XE3J2IHesHHoxXw3WSuc+g3ziXAg6r+Gtb3lKJm/eOLir1XfPHh75tf4Y0tH81Oyx4
         E2MRONECvlfmOsBkI6PYY1xsoG2vkq0qcM+/xvFH9pCLZBitKPlQnwaruLO3GGK4Z8BA
         zHIl08r2pUXDDnw5pAZELEygdPYKiz99VZFpFmfC5qx8SX/3mVf6/s/Pyffkh/yHfPy9
         mFkzFf/W673mgBHGBTfrpXEUkirRLWVdjXpEUZ2HemPMTThv1O/YWzrXVoUozmnX7sXR
         squcjTE/DAd+ucmlzjWeNmdIdNuogVysmMphHIhkL0NMioUP6D3PXNNDeFiB5ITBGL/W
         OLFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712927647; x=1713532447;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RH18SrMd/y4JjJ7b5pFwPelRx1az3iZoiPbP291BArw=;
        b=m1GLUU7hLWQM9rLcf+Yx/GyOdTgAtgef9UERcuNvcl37D7xH2C0FmxWd6/WDznRVQ3
         kMHp3ALc6illhLT0Nap6UmeBZoIHnJzX1ZPZmqeBdhhIqFrxL0sIZSfu5t6uFqunYEh4
         JB4Rq3DZjunsLUyg50c0j5dYfsTdlWcO2GQpr71j4CvysgwgKrbm+i2J7vqu6tWoogi7
         a34G6942BPL46rioYLhKC5Lbmr7YWdSGZ7EgESkvCY+G2hTp55XBHoOA25VuCBCyvdhD
         zCPal2fgscsK5Cvw/SipVnWnQ25sHVh9lsF/QjfanUJgl2rAFnfc3Z8gbmE/C2NKUoGv
         TUzg==
X-Forwarded-Encrypted: i=1; AJvYcCU22g12LJPmjhjQnTHqWNVTAXhe7uEM0/6NEm6juWJ1GEILjqfgygGEoXp9/f+44mszaulu21cfAJdn4F+8IOww2bmD8/ZATszNW8Wf09Z8Ef8=
X-Gm-Message-State: AOJu0Yz68znXc/bC8nwbgo06He3AwuRYEEdJqU3EtzpXU6VmznzLLN2E
	6P9kTEqjLz38B2ILNs0GJ6WrqxtGpr/V6Fu0XTvfuyo4X0WyJsus+37IRtEOBNE=
X-Google-Smtp-Source: AGHT+IFTeG5T6c3kUpQBmoojixRUDv73esoWnMSch/lx2a71iqWniDXUj8ZnnLLFy1S+Tl+cSCNsNQ==
X-Received: by 2002:a05:600c:c18:b0:418:cd0:d8ed with SMTP id fm24-20020a05600c0c1800b004180cd0d8edmr629322wmb.41.1712927647557;
        Fri, 12 Apr 2024 06:14:07 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id n3-20020a05600c4f8300b0041627ab1554sm8826376wmq.22.2024.04.12.06.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 06:14:07 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240412-fix-secpwr-s4-v2-1-3802fd936d77@amlogic.com>
References: <20240412-fix-secpwr-s4-v2-1-3802fd936d77@amlogic.com>
Subject: Re: [PATCH v2] arm64: dts: meson: fix S4 power-controller node
Message-Id: <171292764682.2837390.10687361550734492802.b4-ty@linaro.org>
Date: Fri, 12 Apr 2024 15:14:06 +0200
MIME-Version: 1.0
X-Mailer: b4 0.12.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_061409_839216_93DDE5AE 
X-CRM114-Status: UNSURE (   9.52  )
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

On Fri, 12 Apr 2024 16:42:30 +0800, Xianwei Zhao wrote:
> The power-controller module works well by adding its parent
> node secure-monitor.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.10/arm64-dt)

[1/1] arm64: dts: meson: fix S4 power-controller node
      https://git.kernel.org/amlogic/c/72907de9051dc2aa7b55c2a020e2872184ac17cd

These changes has been applied on the intermediate git tree [1].

The v6.10/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
