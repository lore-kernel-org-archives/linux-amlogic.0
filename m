Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C4BFC07D5B
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Nov 2023 08:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tDN1ZTkmSykTTXG+PVpTBey2x2oVUnIsNvIuRlvayxw=; b=c4Z2ZLIFrGF2MG
	PJAu15Me2Q3e3eA4XbGLIJEm7A5Xtk5ug81GexWR5DMj5MIU43kvVNSuYnAJDoeqIfEPxvuzyYMZO
	HWvSwpDLrxgPnWE/BiuAiDuW/1CtP7J7QcXwVB06oLUZBkKSNo7DRy9qZs+RguUBayExhAC6PcPkY
	1YN5LaZXN9LO7EdtafSxFphcespU+sarckwTk3Loy6AZm0ULSD3sptk0Gr74h7afLBQi+5mPX2V2r
	J1iPLMFjVo9FE/xVsl0KXFgxdiF64h1p/vIiKhAaxtFAtKZ8KHCKg/YwjPq8wujEjVCYY4I9fj92t
	R+NLprRrOpnLWMY9v5hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7WqE-001oal-1m;
	Mon, 27 Nov 2023 08:19:42 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7Wpe-001oNU-1D
	for linux-amlogic@lists.infradead.org;
	Mon, 27 Nov 2023 08:19:08 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-507be298d2aso5316952e87.1
        for <linux-amlogic@lists.infradead.org>; Mon, 27 Nov 2023 00:19:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701073142; x=1701677942; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DatyrqYzt7l09gkz3RwGC/LqPoXrHevVF//yl/kf7UA=;
        b=gfkHLcRB4KfIul6Ljcu2tQuawq54HPySodFfhlZNQVW+y8aQKhnVJbOc1zBV8dsgmS
         hiTYYcWUptbFEzdt+iBY8v6Gv9nHzFit3rIpEdMHDcs1zQCzvMfNve4N8joZKUaLvaSa
         +wTxpXuh0/4k2ZbT2ltF7RtpLsHNX08m4lvve8TuQb2L3lqWSkdJNsfsym/vVd6k6JuY
         Q4GxKj8mMVS+rBlSEt2B6nXBMQBnNIbzzSEaFHw8Flp2UAQHye564CdAgc/sU+99WWds
         TSX6HUkkcub658toXsF/e+tKtBownwp5agJDXIwUN1Gz+pXMxrpAR+F24l2LTbSCvlQt
         B4Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701073142; x=1701677942;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DatyrqYzt7l09gkz3RwGC/LqPoXrHevVF//yl/kf7UA=;
        b=Kv3CIbjeEVGDAcWkP03Q2EWH1ti12EklYSpOs8RgyQPwcorKA6qP+JHTn8nJFd/nOb
         Vn31quWahvLKD2mcEPEjLMCueUdDTw9UkMY9qxJfNl9iZ4KM3BCRqg+10nKuvAcA4qEu
         lWMY15IkYe6dR4qqTsiN9RO7zO7ZQDiygk0ARG0FHZ6Xqz+GnSJFKFFv+hhKOimjtcX+
         EeydyfqoXcUKTL7YZW51gRfpzz1hShiG7m7sDLouCOD9jMHBhiEcSc3fpMgQcw/LcP+Z
         hMJV4ijjsHVxW0+Fs3LenkNyC+VQnENwVI9NDJNZUcLERijkKdRMTMjYgY/15lsvp0kn
         2tUw==
X-Gm-Message-State: AOJu0YzHJrlzmxVSiThaRa8dkWGHDR0Y4JEsZlriCCAgiUXHvTOrdnDB
	q0Nr7JwY/EylVpud8jg+Y9fO9A==
X-Google-Smtp-Source: AGHT+IGo5481lkWUQv34iJL0VQEkk+omxRs5PmyZo2My6DNUSZUJm3rCn/6nN4sI8ZpCCdAy1HtiIA==
X-Received: by 2002:a05:6512:3751:b0:509:4c7b:c734 with SMTP id a17-20020a056512375100b005094c7bc734mr5900453lfs.20.1701073142535;
        Mon, 27 Nov 2023 00:19:02 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id be7-20020a05600c1e8700b00405442edc69sm13516568wmb.14.2023.11.27.00.19.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 00:19:02 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: wim@linux-watchdog.org, linux@roeck-us.net, robh+dt@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 khilman@baylibre.com, jbrunet@baylibre.com, 
 martin.blumenstingl@googlemail.com, Huqiang Qin <huqiang.qin@amlogic.com>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20231027104358.342861-1-huqiang.qin@amlogic.com>
References: <20231027104358.342861-1-huqiang.qin@amlogic.com>
Subject: Re: (subset) [PATCH V3 0/3] Add watchdog support for Amlogic C3
 and S4 SoCs
Message-Id: <170107314169.1083800.14516457377836864819.b4-ty@linaro.org>
Date: Mon, 27 Nov 2023 09:19:01 +0100
MIME-Version: 1.0
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_001906_662857_719F531A 
X-CRM114-Status: GOOD (  11.90  )
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

On Fri, 27 Oct 2023 18:43:55 +0800, Huqiang Qin wrote:
> Amlogic C3 and S4 has the same watchdog controller as Amlogic T7.
> 
> Changes since V2 [2]:
> - Modified yaml document to ensure that dtbs_check passes.
> - Added a patch for watchdog support for S4.
> 
> Changes since V1 [1]:
> - Added C3 compatibles, with T7 compatibles list as fallback.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.8/arm64-dt)

[2/3] arm64: dts: Add watchdog node for Amlogic C3 SoCs
      https://git.kernel.org/amlogic/c/a30c7a73b0ad50c40c01811fa23e74764c3ba007
[3/3] arm64: dts: Add watchdog node for Amlogic S4 SoCs
      https://git.kernel.org/amlogic/c/2d66f91208d1174eb8ad29706e8bdfb587a34d5c

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
