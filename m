Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19754C4167B
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 Nov 2023 12:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W114qJJvtf60QP+8FejazsAEVaJXqIjF8XOVYRCI/6c=; b=t/M0+tSBlLnqyr
	spSh83NJC1E+jKvVwugQDOxgqPipIVwGFl8f3jlDdrcPeJgiH4KeKcKtSJ4qiOyMrUKMcAZHjARSp
	WOwFQNGd+eGThcVJmZFtQgnrafPfhmYgpoxnMS6InN8VBVOVUSfGHlqLyyzb3qwvzFDAdG6tGZlig
	Cn9bK0Nm1HuZAeewRraZ/YaX2NIPqZ0xizyK+00ugWI2+Gam0yjSe7T3uI88wx2Ut/Lpm7gQQ+tA7
	cJGNJ8ci2FCnfjVL662DPM+UkAAgPugFrtF2q1zHl25H11r9OYVTl1t4Ta/7oV0eEW2P8/qPJUNpj
	MVycHwd6p0mO+SD1Kybg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8Jdl-008JAc-2y;
	Wed, 29 Nov 2023 12:26:05 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8Jdj-008J9L-1N
	for linux-amlogic@lists.infradead.org;
	Wed, 29 Nov 2023 12:26:05 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-33318b866a0so399539f8f.3
        for <linux-amlogic@lists.infradead.org>; Wed, 29 Nov 2023 04:26:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701260761; x=1701865561; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qVd0mk/E8WAISTN9cwzB6Xw3Z2qd3DG26hbJb8vpXqs=;
        b=iSu9DPPFzL6dPNGkXTy4/um2HRI2f1ZF3FaXOwzHCwYb290gns8jt3/fVdgKxACLWr
         dZ9mKL95Bd6SPBXZwjmvjdGQOGje2xdntDi7oLou5azNLjI7+/8VRpfX662Zz+cGjTET
         disnd7RqcPKE4HGajqSgdO2vCyAKgPktqR9tI5Tf/PDnzEMmWH0aavJyf557CWgNa0iJ
         OlTTM2JSu28fBFMsp5yKHZSRvEsOe3T/ifAdKD8qiOdisAylJb9FGFXjvRATKYgS+mxJ
         YfVwtrgOvNq8QJNwKB8cwrNg2tY3x4VNH+io0zYLanZMifgO+KvCN9zr4ywH0emQEUUO
         tC2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701260761; x=1701865561;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qVd0mk/E8WAISTN9cwzB6Xw3Z2qd3DG26hbJb8vpXqs=;
        b=Fs7NO2Mg4Y1Iv/taJ5/OGpnavnZAeNyLyTdslNcorP/GXfnFjYX7lMxOrjB4PLRcLn
         AHBpw5Ix0fFBJRW81d0cGqoZwx5lLLeZLy5X7nU84ubs+egLoXF0onQaodvreFMRDuOW
         3rhoNoAp7J7yOjsnhrh/RX2soKfZgZ0m3Gm80MJDMtzp0+IYCRzNJcMZCtWZIfjBPQDt
         ibEvMV/vhFRWR3YH6ZY2yRIJfNSxosLBDGli7/LWBm5se0EeofhWo6coW1VVacFYIbxv
         8ZNRQIZol2hIugMHkaHlSt6Aigc378npQov2UgWCBiuydSkj5lHeWkjPyQp3NDOlSFkm
         03aQ==
X-Gm-Message-State: AOJu0YxU/nokmG/7GTV+g0CN0FG/sbD8Qy0EVpt+M1DszfioDtHrjAdU
	6/RTTkJJAw7dUvx63io7MIb+oQ==
X-Google-Smtp-Source: AGHT+IHQ3EA5vBpnyDFB4fnqV7h4/enCyNJtRFRN4wtxlHs+OMVVOZDfwzbw0/OUV/fl7njjlBzgEQ==
X-Received: by 2002:a5d:46c1:0:b0:333:1077:b35c with SMTP id g1-20020a5d46c1000000b003331077b35cmr3785511wrs.47.1701260761421;
        Wed, 29 Nov 2023 04:26:01 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id n8-20020a5d67c8000000b00332e84210c2sm15542543wrw.88.2023.11.29.04.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 04:26:01 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh+dt@kernel.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 zelong dong <zelong.dong@amlogic.com>
Cc: linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 yonghui.yu@amlogic.com, kelvin.zhang@amlogic.com
In-Reply-To: <20230914064018.18790-1-zelong.dong@amlogic.com>
References: <20230914064018.18790-1-zelong.dong@amlogic.com>
Subject: Re: (subset) [PATCH v4 0/3] reset: amlogic-c3: add reset driver
Message-Id: <170126076055.2880660.13057388884278592366.b4-ty@linaro.org>
Date: Wed, 29 Nov 2023 13:26:00 +0100
MIME-Version: 1.0
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_042603_487268_058D6A31 
X-CRM114-Status: GOOD (  11.99  )
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

On Thu, 14 Sep 2023 14:40:15 +0800, zelong dong wrote:
> From: Zelong Dong <zelong.dong@amlogic.com>
> 
> This patchset adds Reset controller driver support for Amlogic C3 SoC.
> The RESET registers count and offset for C3 Soc are same as S4 Soc.
> 
> Changes since v1:
> - remove Change-ID
> - run scripts/checkpatch.pl and fix reported warnings
> - sort dts node by base reg offset
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.8/arm64-dt)

[3/3] arm64: dts: amlogic: add reset controller for Amlogic C3 SoC
      https://git.kernel.org/amlogic/c/a5468f5ea9a01acf29d02745abae7b82482989d4

These changes has been applied on the intermediate git tree [1].

The v6.8/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
