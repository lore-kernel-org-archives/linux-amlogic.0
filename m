Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30FE4C4345F
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 May 2024 08:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sFzytF7irYHGSjqMG7JaCYbg1rOOtX3pA/LXdn+1XIA=; b=aFC3NwppE2rwQj
	a0Vf1aXsVW+5AnKZe6zNMvo4luc5lLExL6fFXq+0QvmLFVKV5L9uwFX6FU3cYdbvw0m0mVh7Delqu
	TN5iZNOr/j1B+n201NxOvY98h+vQiAO3h7U9tm0ugpLvM/jyiStW2tAzeEx0FOT3txLZRDTEU5wL+
	phOINP/RKFbZoeIwQwgd+LAvP8/4XZ1Q0dLiBjDjuRg91/+gUfShJNu29fZQmvMa+U2sYI27yNV9Y
	zYm6g/oHQEWSbIh+kmJA/DEV0abBA91xojJGE6jlU9bu+QXRgOPGYVTKrH8msH4cZwXtk6nBoKnvw
	nh3IQNlGgLZU8V2PV5Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2oD5-0000000Fd9m-2eJB;
	Fri, 03 May 2024 08:24:03 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2oD3-0000000Fd80-1KSG
	for linux-amlogic@lists.infradead.org;
	Fri, 03 May 2024 08:24:02 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-34d9c9f2cf0so2830161f8f.3
        for <linux-amlogic@lists.infradead.org>; Fri, 03 May 2024 01:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714724639; x=1715329439; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=et6LYnCnjjrqaS0ajC2g4eAsd21FS3OIwXp1rsweKIM=;
        b=sZGR9zHWtWNZARnhwT/+q3JYjuur+LxarD6Z0NCOvoaCpID33ATDgW2RMWtw2GNzlP
         2p8wK2K7BoR3TV5nnawxIUbyMCl/DUeycHthAyTWdmY36yvs+u4HKlRRmmzWbN4md4ti
         lTjCdad8vhGiUYpVS7vsqZvB3ipkF7lOYGiSKy7r33bUnCGms/zcHwBSpCgaZA85dwLD
         EkXQIDU0rfrfisbS5QyyJG8HmTuNao50AH6CPRAMEIJtlN00RX+AAgG4h99NG5zG6HxG
         kUv3H1NtkmSlgmfm7wNOOxrTJujQYM7kd4rKGOLg4HHD0R0A7VZGqDM+i7DGRe83/Mlj
         m03Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714724639; x=1715329439;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=et6LYnCnjjrqaS0ajC2g4eAsd21FS3OIwXp1rsweKIM=;
        b=Xt+3VKGzTsHACQ26Ka8NsrTazBzTVi4tVXsUMsWMmuuO01uEc/3zRQQ0hK9OgVIxKe
         6PqISLKeJ2e0LDjnZXdvI6RD8aGZTExcL61+/qe4pa7KjM++x5A6H3O78rerp6VYj7hX
         KztKhPH911cjCa/hRb+5zq7pN34cIqr/UW9uAoRp/ZmIV+Bn6GBe0mi2G7Le6tNZ9GHa
         o/FOISDFClWtbL+jcxJBVpnhifXCVLf7Re1GXpS7njYaq6CsIeSgIlOixgRiJ+ID5M3I
         Yo0Kity5UKt29qyXGFDaaltJEyJUx9HNPBM3s9rjwcZ0Ev3iA/wYsotxSaPtztRLsgFG
         HSaQ==
X-Gm-Message-State: AOJu0Yy8kTr61yayLn2rZNCWWEwb+Q3jp8ZmQxIHHlw1oqavwvOfeQkl
	0vQAuqXrEC3+p6/Gf/koLHzrzuYiRQjBWHlxyIgYeN00hv2782NzHfX60YGf+0s=
X-Google-Smtp-Source: AGHT+IFbJvf/A1i/LY+L7YNCn2NMJ6Ar57AENdV/ab6ZsQGTGBVmw4kitluYmeYo8l2QW3VK+WFZ2w==
X-Received: by 2002:a5d:480e:0:b0:34d:ce14:c419 with SMTP id l14-20020a5d480e000000b0034dce14c419mr1886518wrq.7.1714724638437;
        Fri, 03 May 2024 01:23:58 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id s3-20020adfe003000000b0034e8a10039esm136834wrh.10.2024.05.03.01.23.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 01:23:58 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: linux-amlogic@lists.infradead.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 khilman@baylibre.com, jbrunet@baylibre.com
In-Reply-To: <20240422-amlogic-v6-9-upstream-deconfig-dsi-v1-1-01511908477c@linaro.org>
References: <20240422-amlogic-v6-9-upstream-deconfig-dsi-v1-1-01511908477c@linaro.org>
Subject: Re: [PATCH] arm64: defconfig: enable Khadas TS050 panel as module
Message-Id: <171472463780.344144.1485415806892562407.b4-ty@linaro.org>
Date: Fri, 03 May 2024 10:23:57 +0200
MIME-Version: 1.0
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240503_012401_364436_8D163F0E 
X-CRM114-Status: GOOD (  11.37  )
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

On Mon, 22 Apr 2024 19:18:25 +0200, Neil Armstrong wrote:
> Enable the Khadas TS050 panel driver as module since it's
> required to use the TS050 panel on the Khadas VIM3 and VIM3L
> boards.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.10/defconfig)

[1/1] arm64: defconfig: enable Khadas TS050 panel as module
      https://git.kernel.org/amlogic/c/fb73c312a939cfcf9bae0d88fdb382516b424e50

These changes has been applied on the intermediate git tree [1].

The v6.10/defconfig branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
