Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 928C6C3DA7A
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Jan 2023 08:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xv2qrZF0Pwtd50qOS30nl+SBO+38bjOPXk6whUAYaTs=; b=oHqzKItLNjm9Bn
	klCqUlvYtSJ+vDhlzoScbGDoMGVb0R5WIklKEVU4Qtx0C/AEh0rgSHyNXi3Cb8NuIEzxObOeGGg5q
	ThBMVVVHj3MecMQSIfjvRffH1CueKlUexYx7lMID3UGzSXESzpACWm7BbZO1tPcE6oq1DNmA0dJxU
	zUsfTlHXjevsXtmcAiDqh9khc83jhWWuNMU2lZ56d7lo1vJEcZHFCSeGqf4dcFkiNgICRvKUlIZOJ
	3S3da1e7fDjoir/txIv6hTFeE5xa+0x6/rMsxzjCUTADMwNPuwLwCAXxh+lh+aJwq+dHJ0LyKpNoz
	NG/cwXS+BmHAubkydCxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDhhC-006TsT-KV; Fri, 06 Jan 2023 08:03:22 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDhh8-006TqW-Or
	for linux-amlogic@lists.infradead.org; Fri, 06 Jan 2023 08:03:21 +0000
Received: by mail-wr1-x42d.google.com with SMTP id m7so565258wrn.10
        for <linux-amlogic@lists.infradead.org>; Fri, 06 Jan 2023 00:03:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GdTbp5+s19z6xOIrGSm0AWNlvSPdQoT3fgQBRHWynZ8=;
        b=HdtgxDtcp+qmhtunvVEa4krxdhE1bD2D9V1brJd4//YASJasdkFXxzozQDq+TSP+p2
         PchoOTLpb4uG2V+Fh8VsTla7hs9JVwxHv8zHEFGXjOj9+vp2BGOi7Zq86GIagkS7lqK0
         vkpJTLOk+t2O1lv4Mq76zj/ER6kGOBrRZrmFy8GaJQbCEhKsvoi3H0FS75GsMfQDQKkJ
         tRMOvCMmWtErFgHoEcWVpPu9gupJCNUc+OxJG7+CQLAVXMXPXw4zGA/K8OxUyxEja9Bu
         sRdmQq14ZCMOuySmQCZHDw4MwXHF+nz6i9joutVIvSwPJwM/zdpCBAvhBwiRvr2G9i0g
         xmxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GdTbp5+s19z6xOIrGSm0AWNlvSPdQoT3fgQBRHWynZ8=;
        b=MM8JgKkh1gkRCTaGnYFfyEbl317yjfZNQvtxQgUm/3ahs1Ec2SPLT/TbKfWLSSZk2J
         D51qmM2ETxJrKF6Cn4CiOPecDSlUlVsSU5S+lX10cEBQIIb6jhMeNZyNvDFqxa2J3Jn3
         MaaF+0KP2d1KhKuBjNyuZMjBfkjLPMNsxVUT2+yFuZy0xpr/8/O4Pe0rF56MSfGGq37+
         eFc2Z+boE//btVgdvHp2W6cLcc225YOOtHrmER7funRToD/oRmi4j8zdbZgZ8c5XUhgH
         aQETQK/2Rj4w7d9QYW4ZHC80tA2k29+9UbzDZy1bSQYSYh3M5LE7C6LlP+soJniflo5Y
         0aVg==
X-Gm-Message-State: AFqh2krto7Uu/HPptwoVowinXK6QliSvueoq+sYQvqtll8Ml71+ZsAK8
	DF72wuD75dD2i20GTcwBT7DR/w==
X-Google-Smtp-Source: AMrXdXva7LAs7z+WBybbYgUkHs7KwAk0ersLzso70vDxDbG/S+oIJrflPqC8jAshxU8h7O7/03cBGg==
X-Received: by 2002:adf:e383:0:b0:267:b8df:932b with SMTP id e3-20020adfe383000000b00267b8df932bmr42520006wrm.23.1672992196622;
        Fri, 06 Jan 2023 00:03:16 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id j11-20020adfd20b000000b0024207478de3sm418101wrh.93.2023.01.06.00.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jan 2023 00:03:16 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: martin.blumenstingl@googlemail.com,
 Pierre-Olivier Mercier <nemunaire@nemunai.re>
Cc: khilman@baylibre.com, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20230105120206.28964-1-nemunaire@nemunai.re>
References: <20230104140608.28432-1-nemunaire@nemunai.re>
 <20230105120206.28964-1-nemunaire@nemunai.re>
Subject: Re: [PATCH v2] Revert "arm64: dts: meson-sm1-odroid-hc4: disable
 unused USB PHY0"
Message-Id: <167299219593.1508873.12756902119978009095.b4-ty@linaro.org>
Date: Fri, 06 Jan 2023 09:03:15 +0100
MIME-Version: 1.0
X-Mailer: b4 0.11.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230106_000318_882284_9C6592CF 
X-CRM114-Status: UNSURE (   9.39  )
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

On Thu, 05 Jan 2023 13:02:08 +0100, Pierre-Olivier Mercier wrote:
> This reverts commit 703e84d6615a4a95fb504c8f2e4c9426b86f3930.
> 
> USB device enumeration was not working on Odroid HC4 as both USB2 PHYs
> need to be enabled. This is inherited from the GLX USB design [1].
> 
> [1]: https://lore.kernel.org/all/20170814224542.18257-1-martin.blumenstingl@googlemail.com/T/
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.2/fixes)

[1/1] Revert "arm64: dts: meson-sm1-odroid-hc4: disable unused USB PHY0"
      https://git.kernel.org/amlogic/c/c45219cba101f32853d011da2ba46a1b2338dc4c

These changes has been applied on the intermediate git tree [1].

The v6.2/fixes branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
