Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63A1ACF34C1
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Nov 2025 14:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i5aXjNeVYSidOlbeH54IyeI6OtaESVLVbWJQpxC056c=; b=gDcwOEtIBFeTcK
	4sAFp5FNWrZTEjNRbVCV5L45XtpKZ90wQovqy3Spe1crPBIt5F6ibo6Y49tsEPjqfvd2krAkwKUAs
	bjYz9l+uXIYgPRJKneVWDH4UF4Ov6URyHZOrkIoaN7ypg3STS3OcKXr7DGELGDtmI7ZSX4fBedjK4
	mWcOLRA8FwGcQPfaZIL29hWqKKuPSwxt/gbrved9J+stBu1YIPA6FeSDrs2acGrE6/4TndGzmcC3w
	WZ7e7DJvIRYuD/DZGlAKWkVuqOpHq0PgEIZE4BwJNbjncmI3gkbucB3Ru1C6v8p+OybipQ6mh/bp0
	OIMvOwlUjFlAU0E+OHeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLjTO-00000003POr-3Z9Z;
	Wed, 19 Nov 2025 14:47:54 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLjTM-00000003PO7-1rCM
	for linux-amlogic@lists.infradead.org;
	Wed, 19 Nov 2025 14:47:53 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-477549b3082so56219255e9.0
        for <linux-amlogic@lists.infradead.org>; Wed, 19 Nov 2025 06:47:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763563670; x=1764168470; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QeQ7og2zIf2WaBP3fNWtUSnP+euy7z4uHI8eX0I9W/o=;
        b=Rlav3yVjrvezV4aaUmj/pOMk2eXJGGLkIrilP2ft+0NsG9MsTGOOJu8GQaOcKUSTuv
         4T0qxVhCY8dc5NnWAdh5cugCo2K1vXwoSQEMeQ0a7T9POZ6+PxPufze+wJLfB3EHbvt4
         uQPk02mzqP+Geq9BV2Q2TnuctZjJ+6t9WUM44274CvDZ+bEeVA0j2pOHWkYFjeBI0UU0
         KlMscBuaAHVzxZW/PqnlcvCgUWv3D6iFDpXj+M9Kv4qe7ZKOzKsYfQ8l/sSJhSD2il9F
         pZDYslB/0Rp4sXrw+EoMEfSYQTgHIt9HnqZMOyIvJSKfFbeLMIlY+W2ojKAVbrD/zMnd
         Mr8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763563670; x=1764168470;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QeQ7og2zIf2WaBP3fNWtUSnP+euy7z4uHI8eX0I9W/o=;
        b=mSVhdaJ82AZysftNpcSCzKa1VEzyHvqCXVzlsf+mIJVCvR1e/IUENTotwA7xjY1hnc
         JS2OA8/+f5iuWbI+/nvOSL+X8Wfr2ddPIu0x7b52ueqEulycBeHE+YiLC+JgHInJ2tAa
         fLeGTiFFf8OSJp02WpAFz5g+Z3Ima/98XXc9smpJXjXjNYDCeOmuNWlPo/2gw+yRNrFt
         eqJufqq6Ug6WytITqyoazckIyxjqv6L1ikPbHLiHj8CII1KRNw/2pEr44wSHGaGy5YyN
         djqgHVM/N+f/t0NEKXEk2lVnf0fvZSiMIUEvBmLlNZkbvSfBGW5b8KNQm0IlRI3zBwDr
         JTgg==
X-Forwarded-Encrypted: i=1; AJvYcCX9CzrMk3q+8lqkV2ONvEa093fpOavq2nPenO7CcSIj+B77/QCBsnsAmgXvwI85lLL5Ka+VEJiO6jojXLDi@lists.infradead.org
X-Gm-Message-State: AOJu0YzwJXDEBoMgKhaWy3zk0kvTdjMPtvefFjwxqBq+g+RBpkPAjac8
	nKiN76drvjBpmLT+jZXJ0YxVqEQmudjPrpQyuNSu5XHQocDnXhIQtK2TofwZBX9dAww=
X-Gm-Gg: ASbGncsBxKigQaecz2cJ4EHG2P6G1KIEYWF1c0aVgsZLwLHR247l8MDPKEt5++8Wpah
	I4BTSKDRgFnxqVlxeHnImbYw4MB/l3TvQF1//fUakoO4C/mwwKz2diCqpiadUsj/9a5XePuiX4J
	so0NpfCPtm5LiFvjygWK2sJ0XrflUhIRtY+K2IUM/cJcYG3Fm4CsAW7G9z8JPpuRaCVioqpfWXE
	i7BglVwuRm9AxeK21B/s/GajW0prCp0hiX+GErNTKfhd/penD6HRgsnFETTtSbPeNeTfcGexIq1
	5Sl/un5D5yRNk8r3iopnH0A0hmVCRlygMTaHn+M5CjDgMBN9KxM+MV+6aeJIeQbG9xfgx5SWAS9
	A5CNggVbkJ/WARyoCloQUzPBr4VuxCKBr8iQElgG+33OKNi4xBrva3Urq47oKGSTuDi15IcrH2k
	rY4Tpj3nJnrsaKUfiyscnirkG3vkN9bA4=
X-Google-Smtp-Source: AGHT+IE+tE828EFZZvZOt5BSe3ijLR8pMVOobVWe9YorjUhOAYJSEIXeL1tJpdukzaJzd5dVtgQ6Mw==
X-Received: by 2002:a05:600c:1d19:b0:45d:f83b:96aa with SMTP id 5b1f17b1804b1-4778fe51e63mr185910855e9.7.1763563669904;
        Wed, 19 Nov 2025 06:47:49 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477b102bc9csm53729505e9.8.2025.11.19.06.47.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 06:47:49 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>
In-Reply-To: <20251119-soc-info-s6-s7-s7d-v3-0-1764c1995c04@amlogic.com>
References: <20251119-soc-info-s6-s7-s7d-v3-0-1764c1995c04@amlogic.com>
Subject: Re: (subset) [PATCH v3 0/5] soc: amlogic: Add new Amlogic SoCs
 info defines
Message-Id: <176356366923.77927.3381277328480983792.b4-ty@linaro.org>
Date: Wed, 19 Nov 2025 15:47:49 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_064752_507765_A14FDEAA 
X-CRM114-Status: UNSURE (   9.09  )
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

On Wed, 19 Nov 2025 10:52:21 +0800, Xianwei Zhao wrote:
> Add more Amlogic SoCs info defines, include S6, S7, S7D.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.19/drivers)

[1/5] dt-bindings: arm: amlogic: meson-gx-ao-secure: support more SoCs
      https://git.kernel.org/amlogic/c/1d80bed4e35710287c584f998e51980a34fb3a4e
[2/5] soc: amlogic: meson-gx-socinfo: add new SoCs id
      https://git.kernel.org/amlogic/c/ba8abbdfd09e64f51ead8b86afc6b586505919b4

These changes has been applied on the intermediate git tree [1].

The v6.19/drivers branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
