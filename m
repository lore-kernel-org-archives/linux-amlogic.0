Return-Path: <SRS0=vGGV=G4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAB6CC433DB
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Jan 2021 18:43:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 97FFA2063A
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Jan 2021 18:43:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 97FFA2063A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qJaDC0iVHi24g10pndsHMuGDfSRvKse3QmVe9bKyFxA=; b=FtFvOr0T+A4JPYN6qgbDYE6jug
	//sXhFqfzF55+J9SCxw/9EDNPiPAfy0LB33TBJsfshe5vUyUtQDrmZPpAY+/jncVWbXftg5fqtiEZ
	+KobtRZ6Ppu4c+cSm3FYLKNk+LpiZo75d0fHB0RWINzYBB6tmVp1bLWNDMfqCe9UjboTlNPfRYFWi
	p95Ou6CT+YJCzzXDE/KQngzA8Y+F7TC1aJnVKJsH3mM0qkcl6nZiqSYs3L4ztTIM6jn+Iq9j9E8DT
	ybss9rwUiv+rAILO8e7UFRdxpFZ3CAgWSkSpQpxr2r8t7FK65tD+bdifPAkT+PxTtNx7oPX1/2mJa
	BZV8W5Zw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l46pw-0000AP-11; Mon, 25 Jan 2021 18:43:40 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l46om-0008Bp-J2
 for linux-amlogic@lists.infradead.org; Mon, 25 Jan 2021 18:42:34 +0000
Received: by mail-pl1-x633.google.com with SMTP id d13so2456002plg.0
 for <linux-amlogic@lists.infradead.org>; Mon, 25 Jan 2021 10:42:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Q1SeF2s/DOLhyrOyKgBakT7b/doGN2Q3Ae7/R3HebVk=;
 b=o+tw8sjX0uJ14bRLrUXrIfbNecZ0kkQ+N/BxD4ZeO4jVV3Znvyq5q5Yl/uTUTTljS1
 478N/0lEuiof0nTnC0w37vPwmZgwIciGZkYgCLBhkW8frsQtI/4Sf/+iu4rOD99wsP4u
 KdziPrhQgzsWwy8nryVzz2dsYQKt3hCMfjLE0BTybUhhoLlB17Q1/azYDIve2iEqqOp6
 e+3qaUGBQuXiu0+cK5aqQgQ8cCdWH3KYIvUvKyd4db3nXMNayV8VSiQftrfG/Kj9MF8t
 z3NYTtuSCuAItS4AoSZTsRf58wxnRMC1R61Uvb3Yc/JBwYOTv32h/O79X8m+HUdH8rmK
 zQJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q1SeF2s/DOLhyrOyKgBakT7b/doGN2Q3Ae7/R3HebVk=;
 b=qs5CoLvmMwSC30CJkwnsHNWu5aaDor44A15vRF78RP8Sn8PMsUlF0gdqG1aHfrCaRR
 EqxxmZ6mUSFOPVIsQZ7KW8GYhulPRUZvsY7FkjpYmLA8QghUqJZN3gtgY6eHLA24+Req
 TRlaeTPidcIujjs2CqjkD4k09vR07ynEXw1BHN8DtTC3fN9uZTDoYzboo1WABnUkB16r
 CxTTgBoqb+8jD740nRFf5wpcU/a+R+Gd7Tu3hV49uruuhBZyNs03Go1Npy2gxRwEB/TP
 kYNVyOtvXjAWgs0DxIo9NFO/R1mGJqkNrAvNMLFupzvLabAM1Uad9GJjGjmgfvNpp5PH
 LP3g==
X-Gm-Message-State: AOAM532KQjWbo/X48VdCTnvlyqd2s2fZ4folDoVpkUYwvlJV8UBfcqkJ
 7pSUBh7yiXoK7/XsN5FJw7Z4nA==
X-Google-Smtp-Source: ABdhPJwjCcv4RRP9CigW3gQV1lycuRcJwmMDSLYrsymwEU6kAYy+01iyMr5Zb7AiKWIUwTUT9ji2gQ==
X-Received: by 2002:a17:90a:7d08:: with SMTP id
 g8mr1623836pjl.180.1611600146133; 
 Mon, 25 Jan 2021 10:42:26 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id w20sm18981643pga.90.2021.01.25.10.42.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jan 2021 10:42:25 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Christian Hewitt <christianshewitt@gmail.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 0/2] arm64: dts: meson: add support for Beelink
 GS-King-X
Date: Mon, 25 Jan 2021 10:42:20 -0800
Message-Id: <161160013614.17631.15425630960344817638.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210119145734.12675-1-christianshewitt@gmail.com>
References: <20210119145734.12675-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210125_134228_698113_0E08998D 
X-CRM114-Status: UNSURE (   9.69  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
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

On Tue, 19 Jan 2021 14:57:32 +0000, Christian Hewitt wrote:
> This series adds bindings and device-tree for the Beelink (AZW) GS-King-X,
> which like GT-King and GT-King Pro is based on the W400 reference design.
> 
> Changes since v2:
> - shorten audio card name to GSKING-X
> - add Neil's tested-by
> - add Martin's reviews
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: arm: amlogic: add support for the Beelink GS-King-X
      commit: 39f5e36d5d2b5cae17cfac1f2cd038f0f8bc834b
[2/2] arm64: dts: meson: add initial Beelink GS-King-X device-tree
      commit: f3d4ad4f106e21161d232c41a6676416e2498ae4

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
