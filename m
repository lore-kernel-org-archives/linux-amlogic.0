Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5E4DC433EF
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Jun 2022 08:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7Tmho9OetlgmbcZph3pfAmAoFAUrf3i/MZmHakX0sbQ=; b=mZt8KYJAdT1U3r
	I1qIy8cUr6ErjvsBLuhwVnDUDeQ7ofMvYfsMRXHnSgNro1uh+TofLTEgC8alWcTRMJcZAI7IWaSvd
	Pr0Cbt/BbjKY7LfNryFOD8vIF98UYieEBIQa8xLbJMIKGlIhSRqZGpYtmd2KNNec4Po71pA962qJD
	j570qLxRGLHLqlDYrrXF05ipob9LDWmFysl32+Gc4zlMKtvQuPzPBDrZuO6cEwXyIPucJ3TJrt8Ic
	b4QcDQwHMdJkTkgJGyMAiQeGJ3hnNkc7vVm+nS2IvLH0GxfGpupBnDr3sFgQtp04rk6ftYnKJx9re
	FXxmVTW+yjCtlaQHo0Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0fIP-002EVe-Hm; Mon, 13 Jun 2022 08:19:37 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0fID-002EOf-BF
	for linux-amlogic@lists.infradead.org; Mon, 13 Jun 2022 08:19:27 +0000
Received: by mail-wm1-x32d.google.com with SMTP id i17-20020a7bc951000000b0039c4760ec3fso3684817wml.0
        for <linux-amlogic@lists.infradead.org>; Mon, 13 Jun 2022 01:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1WMyctGz3kKdq12eI1+meTtyOevW4VDeNZoMvLfkg5o=;
        b=etM/cmhMDH3xgWDE2zxxotQPQhYQh6NtV/XaHpq675WE+WqrG3o90O3AjU1yd4RFDg
         c5fuoXnKAi4OPlWmhpiP0eWsko6iMG50MBtpYjBK7DNEAbt778t59KEa5VtVRWgWqXtC
         pK8SfF8m9UMH/crIArMU9H3zPJiFVoSmx4XymRCqYVpy13eybmSVxp5wt1GC+NoYPsJo
         rOcGyXS88c4bODnx2tPOSn9gU5QXBE7bEDwNYjgXqjMwCJqoH10vY7f+XSw6fiTbt6uA
         t1pWP5KyPGRe17GjzDuIDSR0tqv02Jfk5RXbSJCPIxaBEAyezjdq4da7j9tefkVffRus
         tyuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1WMyctGz3kKdq12eI1+meTtyOevW4VDeNZoMvLfkg5o=;
        b=S9mGuajJgPCaZp+GGq1eYJ4sl5MeAegAlzSSK8T+XHYO0m2elSCdhpuU4OaNgNpIfA
         r/cxQ4NaIRyLJq3t3b0cFlhGotrJftflxkAtoM/6tx2p8WYWeUHdmjuEPwNKV4fHAfwK
         RCcLtjGjh8hrHSi/OvFG82E70iLu4PZ5oCVaN8qd5b+N2DB/rsT3eVAteMbymtSeR5kg
         G7t3AUyLhThQax3SG4bSFCNhj/fmJpPNl/so4qC2l7VlHyWSeF09hdUhe8Six3sfD0QB
         yjnqGpkzuQrohg3JBXi0CAlMMiazb/iDu8OSfmRPcMhQtj4d+cKAnwyVNFEkVpAnzYPP
         qgdw==
X-Gm-Message-State: AOAM533JOlS81vgwu3KrrgUvq5rBpSUlfn/oKIUYBgMsq9YmQpVJdpdm
	Rdjdm1WMyEiIRm1/XKzQxK4ljA==
X-Google-Smtp-Source: ABdhPJyKP86sP8B3Fxw27KCYKVmgS8/s4wLD42HUHsqfz3Mq6/xBkDl04b3Gf1GNB/+glZYiu8VQsw==
X-Received: by 2002:a05:600c:34cf:b0:39c:4dfb:1398 with SMTP id d15-20020a05600c34cf00b0039c4dfb1398mr13315001wmq.133.1655108363092;
        Mon, 13 Jun 2022 01:19:23 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:44c0:66c0:e21a:482:575c:1c8b])
        by smtp.gmail.com with ESMTPSA id n8-20020a7bc5c8000000b003974860e15esm12385638wmk.40.2022.06.13.01.19.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jun 2022 01:19:22 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: Furkan Kardame <f.kardame@manjaro.org>
Cc: Neil Armstrong <narmstrong@baylibre.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	khilman@baylibre.com
Subject: Re: [PATCH v4] arm64: dts: meson: add gpio-fan control to GS-King-X
Date: Mon, 13 Jun 2022 10:19:20 +0200
Message-Id: <165510835715.1458195.705062163805484746.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220611170852.19487-1-f.kardame@manjaro.org>
References: <20220611170852.19487-1-f.kardame@manjaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220613_011925_468944_CE80318D 
X-CRM114-Status: GOOD (  13.35  )
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

On Sat, 11 Jun 2022 20:08:52 +0300, Furkan Kardame wrote:
> GS-King-X has a single speed GPIO fan which is always-on by default.
> If we add controls for the fan and a trip point,
> the fan stays off most of the time, reducing background
> noise from the unit.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v5.20/arm64-dt)

[1/1] arm64: dts: meson: add gpio-fan control to GS-King-X
      https://git.kernel.org/amlogic/c/b7bfbbbf72fcf95c9a58d6ad0e905de539fba025

These changes has been applied on the intermediate git tree [1].

The v5.20/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
