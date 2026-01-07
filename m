Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 775E1CFD637
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Jan 2026 14:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zeK8lUBzk0n/L0A7PWv6yBv/AqQMQJj9yhDkZclNQZg=; b=znRiJVKQSR4KOD
	2FBVznrOFMobbN1LO/Vppm5jow6Cohu2DrW9rhTyPR9X4H8MPHCU56cm8GRU7F+C0azkaeEhiTDAD
	iRuUrccaMZfWQ6iyUr+fqr/TbekvTbwGLSLkj7g/6YI3pGRJFC9wWTZswGbbpBCzpcE2F9K6/ehWw
	agPpJmg78ti0Q1DWHIVzjsFN6YzIEQMWTF0t9dyvZTrbn1p3PQK6JxvIDLWlgraboTKwG8FLWqDPz
	PdfoGmIVHhpQVS5VQKVQU1Zu8FiabKfpH58C5H2ih6sA2MDDTSdF4rPdKuCoJimN8GJWu/hlyvdIO
	qf4uTMfqvkU1cQhGFNNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdUBI-0000000F3PV-0Jnz;
	Wed, 07 Jan 2026 14:06:36 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdUBF-0000000F3Nt-2RS9
	for linux-amlogic@lists.infradead.org;
	Wed, 07 Jan 2026 14:06:34 +0000
Received: by mail-wm1-x344.google.com with SMTP id 5b1f17b1804b1-47d63594f7eso13057795e9.0
        for <linux-amlogic@lists.infradead.org>; Wed, 07 Jan 2026 06:06:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767794792; x=1768399592; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uPpS2fnpM+6YueRvKfiaJ+0mjmZ9bEndFXFtCoDO1IQ=;
        b=l9yN7MEmkV1826E5/bWehpvL7d95EESgW/u1dQU70ycl/34UW35XOlAHpKQ53HZj+N
         3VDNt7itVcqB37YaY6tc7rQ8HfyRCjC2x10L8e6fdaNUQdb+MZU30aM9jjXwNCvoF2HY
         KDtRvtq0lL57dwJKLA2ns1IJRf1gskj58PrFauU+QgWk3puooy+YBLPswmXU3LKDrNaX
         LwjD4Sx/0l8rLd2sQ1Y6HHen/kFnzDMhxZ+MX3xxelLKQgV7ztYay9LB0PmvgLCGMtic
         kmtMU6X/tCB07dJbII7At8adTUVNgCkB0WoT5E+82ZiudWsS9z0ytGa/tdi3aXvkjN9h
         8LWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767794792; x=1768399592;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uPpS2fnpM+6YueRvKfiaJ+0mjmZ9bEndFXFtCoDO1IQ=;
        b=oYMO03vGs0/pnuwl8JSMI021kG2E10Hb7d7sniD5COevW2fImXqc5G19oNROW08v5F
         eaYlubDb2sQmRDzUcR3cXgsJ6T2j69QL199cPEyysGgpv78g2HwK0PF02rb4JiCrbJ1r
         H/vMaGMNXf8NtrDYRF+U/eFw6LA/Vli/HmKS//KlJeEqZdgr/F9JyvvhBz6hKhz+F69S
         SK3yCv/hndLchcjpxOH2H6P/f0331D66P+EATVSpdsPsPioyJeNgakHuS09jrzdfYwjQ
         rDlrqYvt1xjS9fy5Fxobd7ivGtB/yDk3o0B/fHvP//chnBvWuO2wIMVAS/NCV1tUyokY
         NkJA==
X-Forwarded-Encrypted: i=1; AJvYcCWbUNoGGb+obc3UzJmpkFc4SweOyTUWc3QhITvweTAMM6KeNrJBHePSg5bzCKiTgMXa51kEByM+7poshRG5@lists.infradead.org
X-Gm-Message-State: AOJu0YxIQT5vCM1Y2NdFp0goaMx+jNMCTagkUT4gkN0Zi5lZwrHhwI5T
	6wWBlQmBDMhYrMcqkbOELiSTWEowtk71gFJmNe7vYUL02211b8SE2wovOPir7pWyPvtkmZQZYWm
	Xr9GB
X-Gm-Gg: AY/fxX4JmGtKHyrbfa18YTcCTrMZd0SEQ2Eaqfk3Ez9DVvOgwhT15J0AYGiQeJ+EdU0
	uZ7inqf21M+PRlQzsmbLA7dH/2iVpOuLmFqQJ1bm8tKxloL9CLomLn15qANfAMVOkjnRHUZ3AoW
	82BvO5OEgbx5zq+YYX2vgQPx4iRw70UTAcQckej/34UFJDyDXu7NFV50SwyIE+Q8X3O09dR3LNe
	9p6bbG3cnSn+qWGpEQJA0PSLT8xPkl20szF2PPo5PUnMGjtLfX9QhmNn6CfunMHaHXY1vgavRSU
	JvlghGHkUj1jk9avdoEPj5/RnQjdOCgRTe00Jkg+I43yczQ/I+HGdBRtB7oGbi3LWYiwU7qZsH4
	ZPowASLLGnc6WWgJJF1Nzs8kB/q7c/94hgYgVv95wTN2gHM9moqfmeIgDzq/JXV1vpex4P5cSeq
	GbjQbVtIvouQJRWRcSODn2A/ldo+wZQns=
X-Google-Smtp-Source: AGHT+IFKKkF2rQrNfKVm0xBIrXitMatKB3NKMQ4oAhrZw28JMRyqxQxPGMYW7R/yZLTYz1Z5w5dWTw==
X-Received: by 2002:a05:600c:a08:b0:479:3a86:dc1f with SMTP id 5b1f17b1804b1-47d84b41012mr26925205e9.37.1767794791482;
        Wed, 07 Jan 2026 06:06:31 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f41eb3bsm102686685e9.7.2026.01.07.06.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 06:06:30 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20251223152510.155463-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20251223152510.155463-3-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH 1/2] arm64: dts: amlogic: Use hyphen in node names
Message-Id: <176779479041.1564227.9998045080717551889.b4-ty@linaro.org>
Date: Wed, 07 Jan 2026 15:06:30 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_060633_645957_78619B87 
X-CRM114-Status: UNSURE (   9.96  )
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

On Tue, 23 Dec 2025 16:25:11 +0100, Krzysztof Kozlowski wrote:
> DTS coding style prefers hyphens instead of underscores in the node
> names.  Change should be safe, because node names are not considered an
> ABI.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.20/arm64-dt)

[1/2] arm64: dts: amlogic: Use hyphen in node names
      https://git.kernel.org/amlogic/c/125c3ceadfe02cd4917c5e0bb6707b37870449f2
[2/2] arm64: dts: amlogic: Use lowercase hex
      https://git.kernel.org/amlogic/c/7bcbedd64ecf5624583140faebfdb0e2e2f6b43e

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
