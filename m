Return-Path: <SRS0=LTpV=IG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21316C433DB
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Mar 2021 17:39:26 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C55E6652A6
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Mar 2021 17:39:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C55E6652A6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QPgx3MgmBS8R0iwjU/Tox6fF5gcllsQKtofbM/Uu/h8=; b=ZCmhIYgx5hbA+ei/Y2BxjYK0c
	T9O8gaszUWSirMz6TeMs4PAqexIb+YA9RcEICi2ifEybTLsliArCINmmmfONPHnWZii0ayB2x15lf
	XWw5VG+0zUbJNd/ez91MS2lcNMZbBs0uahlSrloI164PgrdVJMu3z1IfwlUwzxqHuN17ugrvSYR6L
	YraRclPumQ1oCGhasooKf2dB8O5ROCz4/uksnasTmaH3uoYPO+0jzixE6LAecotYlxizZc1ZoSPvp
	CtYtYdTWiE7oKfo82qFQRrv8c7CHH60HXVNWEVp4TMQ7PLgBQKf+mt8r3wktjqlx516hMm8Gyr9Bj
	ujZD1ZT/w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJJqi-001Syc-7Q; Mon, 08 Mar 2021 17:39:20 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJJqU-001Srh-Vi
 for linux-amlogic@lists.infradead.org; Mon, 08 Mar 2021 17:39:08 +0000
Received: by mail-pj1-x102e.google.com with SMTP id
 kk2-20020a17090b4a02b02900c777aa746fso3549783pjb.3
 for <linux-amlogic@lists.infradead.org>; Mon, 08 Mar 2021 09:39:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=hUCvK/I+zgUewNk8E2scyHBkcJ9RAyOMA/sKBoxnDw4=;
 b=fHXmGRBN1mCiws4dt5VljccU5Kx8Q2GwWwzjmlREjQv9f31rgqothtHBT2MZCaAGP8
 x+m4Ra8lvqyZIXh57Ku8/zGff/aucTCiELnx6RmIqQaEqUDeZ2eqd1mdOSbPxKtZUt7L
 hGgUS0n2KQ16nEwyVGaGuyx/FwFbla8rIHJX/SCMge2wntOR+40FI691JTb7MqdFC0XG
 6PmH0sz1zzWZJ5tvnUT2vWsiYmKArqehM2VwzWnNXRxpRTSMeVLiJXZYYz6EqhwdcwQ5
 5y86NSDN9kGCc8wMghxt2gGaD4vvK1sCAktXgmjHACGgARLMPKtvoosmSnA5Nqg86Vcs
 SHdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hUCvK/I+zgUewNk8E2scyHBkcJ9RAyOMA/sKBoxnDw4=;
 b=Si3eNnZf1MK1whn5tBxT7sa63LAN4N6fWpTlhB7CO3RCxDPcSh6AxtgOMqKQSCuZRk
 PZt/2nM1He8+ONKhlKZAKMTw7rgg5au8AJ8T37FKE6Ao+5nv3jKXPxhJDTmuY82UFTpk
 nM0PH0wnpKJtRQo/pGmTGcaKjNSG02pk1msRTfmyhm2OWgITCxHyEEhg4HdOW10Y4wVh
 4mi9Rzl4WgoYfvcdBS8IeM/2NtSuF6mvfwtrlpOWFpuLELQGaCb0+8WdFoudyIZGWKuD
 npEaFhvnmb78lF0uN94guJBgaNT6W8VdrD6ilngnK4fdoH1QRA2PoJZYw6btEc0pTZQa
 ZFTA==
X-Gm-Message-State: AOAM530njwVKbPKUe5m3WOmg7uAbc1N8LBWUVcnSWp9H66iK9LUwWDlt
 kGuvaUFL3WnAuvDkvXltJNU5/A==
X-Google-Smtp-Source: ABdhPJzC2/eu6E4CQbyADDmbk/3ijOnoW08IMivrr8a2H9j48dNkZ2wVa6e6b3tyZbILc7r8PR300w==
X-Received: by 2002:a17:90a:658b:: with SMTP id
 k11mr16781689pjj.92.1615225145512; 
 Mon, 08 Mar 2021 09:39:05 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id t18sm5226942pfq.147.2021.03.08.09.39.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 09:39:05 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-amlogic@lists.infradead.org,
 Christian Hewitt <christianshewitt@gmail.com>,
 Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 1/2] dt-bindings: arm: amlogic: add support for the Minix
 NEO U9-H
Date: Mon,  8 Mar 2021 09:39:03 -0800
Message-Id: <161522513396.14471.6052884995015954642.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210201210508.1528-1-christianshewitt@gmail.com>
References: <20210201210508.1528-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_173907_232814_82865B91 
X-CRM114-Status: UNSURE (   7.97  )
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

On Mon, 1 Feb 2021 21:05:07 +0000, Christian Hewitt wrote:
> The Minix NEO U9-H is a small form-factor Android STB based on the
> Amlogic Q200 reference board with an S912-H chip.

Applied, thanks!

[1/2] dt-bindings: arm: amlogic: add support for the Minix NEO U9-H
      commit: 15c4dd131ce576f0150fadf7a3264c865b051eba
[2/2] arm64: dts: meson: add initial device-tree for Minix NEO U9-H
      commit: 0e9fed92c67cb886b3308df4890126d75db2ad67

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
