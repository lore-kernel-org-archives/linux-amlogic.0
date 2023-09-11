Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3913EE7FF4
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Sep 2023 15:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wg+iHudsW+mDRp/v2+BBOA+3iza0J50M31CNVmStZYQ=; b=BjWg5s32rG5HQl
	psono7eHqAk0uaxI0+njuTOs8c9NYgCxQ1jIxUvgocCYGJm4cIA+xyEH8icAm+J5d9WnIhPVFRGUd
	nuE/jKAXqjOHLL9/qOJIRlN8WUXSzEtBAbtZvHXAp7apG93Ga4M51AMpXHpHvD3A16kGlkHZfwAPX
	GsTMr2lEqAnpNbYqR6aZhTu1DA2N9F9bXJEiIG9fi+YgIH437s1jOBQletapqjmjr9EmuXxnBe+6+
	XQG3c8WgjIaFGQbmf7n0Ur+dWNF0O87fw45yzEpTiIdnpGO1mRRoh2ItQCDmbhOzSYRCdK/zs09Ye
	fgwbU4/aPLw0djjcgjWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfiXY-000pZx-2f;
	Mon, 11 Sep 2023 15:09:28 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfiXV-000pVl-1J
	for linux-amlogic@lists.infradead.org;
	Mon, 11 Sep 2023 15:09:27 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4018af103bcso28859635e9.1
        for <linux-amlogic@lists.infradead.org>; Mon, 11 Sep 2023 08:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694444962; x=1695049762; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bOYptsCrf1diNtyghWnfZLvZu7tELTtIDAUqFPNMvD8=;
        b=pXxfCxFcNXQBSEnfrpxXaPdHPITBuFoQEnmTYezFyzZgs3TvkYepa2kuntPN9mGKja
         To988DrRL/teezVm641gX1HC4HaEl7ujF8eyzaIYwTzQN5UKR368FhFS1il3gYXR1mMR
         AC6tyL3ZgNA6/E0PhgJCOLG5Kgj2eZvUvKlwcfXIrODqQRdPUsUCizhChIjV3o3TR4uS
         SrMvYjiY8MYrG2dyduSMzA0CLnA70s6P/pdbinAVwiyLaXuc0BSw7kgHCIBMFQKxvHzo
         RtFPzjxqWjMWXhu5/xxRtez8uUErU1EQeVJcs2utEOUhch3j7W5Qe1OlOqhqy1tCxIwf
         /NiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694444962; x=1695049762;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bOYptsCrf1diNtyghWnfZLvZu7tELTtIDAUqFPNMvD8=;
        b=kSwuzJJnhSxun46yHQPNAPArSjWkY4YeoQGEZx+PkVrH29Lpx1iaR6g0d+b91AjdO3
         8KNS96NobmCyarm8EAfUma5zwD5TW3IMASTdzMMOqR9B+4c0DhFhS7q9PEMwoV7xcfd3
         ElUKajxzwWYCn+mmughnXquSkLWZrLZ3H/MXmZa4E9id1JXsqF/3sm9v60CCQvW5PkUh
         qn/xFe8igF+EmVfjMkvx7qWoYq1VaiCyytTTQvsPdB9/sW3p/fIMEw2qGyCL/yBmgcvz
         a3I7Suy65I9I1vaznPIpQEAlrCTDm0h4hczJiRNzUWTCBHZHDLBi0fpE1cEH9PO174NG
         UVWA==
X-Gm-Message-State: AOJu0YylVHpjzOdlN4ML9AOYt1c5sg+i/vHj2Wah7I1f6hOXc5hTzIg0
	d/r+HnRuGhZRcr+9QQT32xRMhQ==
X-Google-Smtp-Source: AGHT+IHvwIKHqGYnGN3IiqndAH93l6WqVDjqInO1zvq/pqTFA0C05t49HJS1dXDWNdJXeVZleDHnqw==
X-Received: by 2002:a05:600c:2209:b0:3fe:1587:fdf3 with SMTP id z9-20020a05600c220900b003fe1587fdf3mr6762828wml.14.1694444962015;
        Mon, 11 Sep 2023 08:09:22 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id y18-20020a5d6152000000b0031f3780ce60sm10388691wrt.7.2023.09.11.08.09.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 08:09:21 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>
In-Reply-To: <20230911025223.3433776-1-xianwei.zhao@amlogic.com>
References: <20230911025223.3433776-1-xianwei.zhao@amlogic.com>
Subject: Re: (subset) [PATCH V3 RESEND 0/6] Power: T7: add power domain
 driver
Message-Id: <169444496123.3944766.3763051739383485051.b4-ty@linaro.org>
Date: Mon, 11 Sep 2023 17:09:21 +0200
MIME-Version: 1.0
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_080925_440057_E490C7C7 
X-CRM114-Status: GOOD (  10.84  )
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

On Mon, 11 Sep 2023 10:52:17 +0800, Xianwei Zhao wrote:
> First patch is that remove C3 some power domain ALWAYS_ON property.
> Second patch is that add driver to support power parent node.
> Third patch is that turn on power if initial power domain with
> "AWAY_ON" property state is off.
> 
> Other patchs adds power controller driver support for Amlogic T7 SoC.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.7/arm64-dt)

[6/6] arm64: dts: amlogic: t7: add power domain controller node
      https://git.kernel.org/amlogic/c/5355699dabac3c97492a30e6e01820fcaae11218

These changes has been applied on the intermediate git tree [1].

The v6.7/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
