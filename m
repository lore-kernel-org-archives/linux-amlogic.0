Return-Path: <SRS0=a8bK=FL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 445C2C433FE
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Dec 2020 21:26:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C739D22202
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Dec 2020 21:26:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C739D22202
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:Date:To:From:Subject:References:
	In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=u8JB2c6CyeU3dk4ZuVjTKFZP00nOT14QgUvRoOB24y8=; b=3XG8kvhO6EQyJKu7ATrRZqq+s
	DLtHTS3h1ljJd7M/68jrA7h2Sf/LTs9GtEuD0ugqYf9SlQsjg+6N2NMbmgxLdNwSSN97Mh2P1BIK2
	F0BVOgMsuEDEG/wsR1S6YG2FmM7kCQX6zej7ctk8tI5E5b/W+HBqK9b1wsvIFu8cQKCK0gGODxKyD
	pqUBDKxZGhI1AtEAh8bfQ942zxUVC1YpWrp+CjOuC1z2WkW2yLj3p4HiAKws8NI+Z1yc4L6byVsBJ
	A/AuwmKilf7+pHxYsfT68U+8M0TsmoVmse7im1fXHSSAiwmT4fIHldWyX4l3NbIP79U4qcAryg2At
	EI/delmfQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmO1Y-0006Pl-Qd; Mon, 07 Dec 2020 21:26:24 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmO1X-0006PK-Av
 for linux-amlogic@lists.infradead.org; Mon, 07 Dec 2020 21:26:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607376382;
 bh=UQLaibMgpyMvr32nuqQHPcu4qUSJSpj3TApSORzRpYM=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=sCKOZGQwawg3hHnN1AVHz3SbrWRy8TX0HURsSa/VyKUp7STCV4N3sHzb7F01I4QAU
 Qk60siVJfyCj+cIIj4uAx/ikffa8ZUO2+yx31fosBbBeTqRy/qQtTL9mvXl6o6G2wo
 a7qqW2cqvDxfB35Jihuc1rVa5XqaXXcvzOFVIX2llvuPkpro5CyThPXEsE6M62kkvw
 Wr9Zaf2sBn+DIJ0oudWm0dGr1fTjNMXLHg2tsEQnegodGBHOi83iLFA5cE9pXk99BQ
 RR9h147N+z3JOgR2KlRVLSw5jOEL3ZXu11tFOFvqzIgiKBX5wCgapZfZBAB74KIQiu
 oUVLz4YtiT4CA==
MIME-Version: 1.0
In-Reply-To: <1j360kp1zh.fsf@starbuckisacylon.baylibre.com>
References: <1j360kp1zh.fsf@starbuckisacylon.baylibre.com>
Subject: Re: [GIT PULL RESEND] clk: meson: amlogic updates for v5.11
From: Stephen Boyd <sboyd@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Date: Mon, 07 Dec 2020 13:26:20 -0800
Message-ID: <160737638080.1580929.6951606729739105639@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201207_162623_466334_632214CB 
X-CRM114-Status: UNSURE (   9.02  )
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
Cc: linux-amlogic@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-clk@vger.kernel.org, Kevin Hilman <khilman@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Quoting Jerome Brunet (2020-12-05 10:00:18)
> Hi Stephen,
> 
> Here are the updates for amlogic clocks for v5.11. This is based on your
> clk-hw branch, instead of the usual rc1, since it depends on clk_hw
> stuff you've already applied.
> 
> Hopefully I got it right this time ...
> 
> Please Pull.
> Thx.
> 
> Cheers
> Jerome
> 
> The following changes since commit e6fb7aee486c7fbd4d94f4894feaa6f0424c1740:
> 
>   clk: meson: g12: use devm variant to register notifiers (2020-11-14 12:58:31 -0800)
> 
> are available in the Git repository at:
> 
>   git://github.com/BayLibre/clk-meson.git tags/clk-meson-v5.11-1
> 
> for you to fetch changes up to 88b9ae600138baff18c7f4c4870622584acc6111:
> 
>   clk: meson: g12a: add MIPI DSI Host Pixel Clock (2020-11-26 15:25:20 +0100)
> 
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
