Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94E49C433FE
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Nov 2022 12:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JdKZYJY6jrkFL2YbovuTK5MdEVzbC8kHJPWf/dyf7M8=; b=Z/O4sSTxFZ4XfK
	nRC4CMcZ73O9vMYYiwc03ib0/U9BIaKfoJL3PjUqdm53DaXoju6dsUQy4VCuIBDVx3Zcr2AY1xHK1
	Mb8n+P6mkhtlGQgW4ziEbLqRAwjxCB/TGZab9RGN++FIcdKonr+VQ4QHrGoDS5ow343der3awUve0
	TCPvR6dv/ZUgodUnBv+BR5AwdXHTAULUgM/h2SOU6oexITaF4Sm7hsQUEo2UIjxZj8pANNBmA+DtL
	qSwcg2JSms7BLVMgiZ6GvOoFHP3OUOlTkyks5p6fN6oeEVBWfIcXcnd9gPFopLWthia7jjVTDeyK7
	yzAJVv6w5EqKe74xkkng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouvKT-00BA6k-O5; Tue, 15 Nov 2022 12:46:17 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouvKI-00BA49-GX
	for linux-amlogic@lists.infradead.org; Tue, 15 Nov 2022 12:46:07 +0000
Received: by mail-wr1-x431.google.com with SMTP id w14so24049316wru.8
        for <linux-amlogic@lists.infradead.org>; Tue, 15 Nov 2022 04:46:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mlZD0Z2uZ+ThYG4e4r6CMcbbN5g4YL6Nxz6PbfmS5NA=;
        b=Yb7kmLhGhyYiM5Q8MgXeUnKQK4LE6+7zq57DqabdJ26qf7EizBpTbfxYyt6TRJRH7g
         iMCvzoK2Hjfv9V7SD/2dgd+0NrOlZpVSIb+Zn3bOFrYEsCltvvivgOVnvZHW2Vddxaiv
         yU0lMINmERm0Hi8UK3OClxCtltTXYgQXZ1argRqmb5aLQjZMBreAsiXddyMR/8RCYvBY
         3fNB4/DBNErdX2p4BFu0nX1Vd777tDlL6VbsuFetwlpXVkLNDEN3bumcqizBZBBfFpIE
         w3O/cx3oY8iFEFI1tbqApqu9NRxlKlB/MP05CIZN+Palc9NZo/G3fpcB0HUppPqPB/pz
         hlVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mlZD0Z2uZ+ThYG4e4r6CMcbbN5g4YL6Nxz6PbfmS5NA=;
        b=yxyGHTfjAVok9o9ofCf03FDq9mTvvUbM5B3LfBZNObFOXkmns3yOFqZtcZN2tUHqvV
         SJwyC2bEp31SGA+r+7oKcGa/H/ceoMJCj96nzY+gRF7v0iNcoXCtxDvPiGjEbe1qIXMA
         IY9JSkPjdYWHwYZXKNA6UuKuzq7i8o8hTtpTbF8KNGHgCoJdinHCtPJiMktEMHcyMImP
         oIKHSjoapybg0vlQ0QVYtMj4yJ9ZSmOMTmpyshVUQolbOc4QGRjrJUXJNkBvB1LwIzaE
         X6/2P/x68NitTVlBI5idCcaYeuxV07OkKBEm/+ya87gSdmUvR/Vn33F+Ie3TJF9UKhdm
         Q7tw==
X-Gm-Message-State: ANoB5pkLWY3BjxYLmIHtjpDsNZkICRGt1lDXbczEVQx0H3Uk1yYlUhbU
	UFTlwGO3Kr5xocdIE+BSKlkDqA==
X-Google-Smtp-Source: AA0mqf6vybVgZNApQBaGCsmb/WmoxQCxkT1rPljAJ3wbuzXcligL+cMP8YKndcURsBFb7hNRAA9EBg==
X-Received: by 2002:adf:ec10:0:b0:22e:48ee:dc64 with SMTP id x16-20020adfec10000000b0022e48eedc64mr10465784wrn.319.1668516363574;
        Tue, 15 Nov 2022 04:46:03 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id h5-20020a1ccc05000000b003cf7292c553sm15100857wmb.13.2022.11.15.04.46.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 04:46:03 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: linux-amlogic@lists.infradead.org, Jiucheng Xu <jiucheng.xu@amlogic.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Cc: Jianxin Pan <jianxin.pan@amlogic.com>, Will Deacon <will@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Chris Healy <healych@amzon.com>,
 Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Kelvin Zhang <kelvin.zhang@amlogic.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Chris Healy <cphealy@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
In-Reply-To: <20221109015818.194927-1-jiucheng.xu@amlogic.com>
References: <20221109015818.194927-1-jiucheng.xu@amlogic.com>
Subject: Re: (subset) [PATCH v9 1/4] perf/amlogic: Add support for Amlogic meson G12 SoC DDR PMU driver
Message-Id: <166851636240.2706970.5044622392336607391.b4-ty@linaro.org>
Date: Tue, 15 Nov 2022 13:46:02 +0100
MIME-Version: 1.0
X-Mailer: b4 0.10.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221115_044606_555772_28F19525 
X-CRM114-Status: GOOD (  13.00  )
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

On Wed, 9 Nov 2022 09:58:15 +0800, Jiucheng Xu wrote:
> This patch adds support Amlogic meson G12 series SoC
> DDR bandwidth PMU driver framework and interfaces.
> 
> The PMU not only can monitor the total DDR bandwidth,
> but also the bandwidth which is from individual IP module.
> 
> Example usage:
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.2/arm64-dt)

[4/4] arm64: dts: meson: Add DDR PMU node
      https://git.kernel.org/amlogic/c/90cf8e21016fa3864a311622f6162fde13aaaf23

These changes has been applied on the intermediate git tree [1].

The v6.2/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
