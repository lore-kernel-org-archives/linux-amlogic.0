Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC01BC001B0
	for <linux-amlogic@archiver.kernel.org>; Wed,  9 Aug 2023 21:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XrdpGePfP0wcNpJ9eUVA7eEX2YqVvh8X7ZWZ1ATaF3o=; b=XpaUPQOZ3bjAdw
	O/lJrfUO4QMyDalcnSmumBt08vDQnPGfr9fORH0qIEDYrRALld7evG6UChI9A4XHPKPeNgZaQAppm
	VAw/c8H6UYWXe8SgRPS6sthcdJs9acTMcjlAzel3RfuhSVYBCSbhkMkQVRJ6ix+Jrg4bNoTo5pxs7
	2uSePVkWIsHlkzo5QzkioJ858IRJhcGbCWDaxfT1mtwGM4oik/7Ju6K+nxThrFRzUrhkRMbf+oET0
	cQz4MD0z7D2QpajA7eAiCLoYh479uLRrtaOwNNo9nwo7bK5jqApmmtMBPiLZKKcbUl4ObtPeD51/D
	uZwVg3ol1QeuaSdG0Jrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTqYe-005sMq-0o;
	Wed, 09 Aug 2023 21:17:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTqYa-005sMQ-2p
	for linux-amlogic@lists.infradead.org;
	Wed, 09 Aug 2023 21:17:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 69380649FD;
	Wed,  9 Aug 2023 21:17:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFE38C433C8;
	Wed,  9 Aug 2023 21:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691615846;
	bh=deWueVbxWNfNyWjFH5/yNRM4pNhZhG/SmAXIlvbz0Rk=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=uM3fOpNbqfnWEAvJRsNzIMCebgtkrqWI2RuhX/x0lodSjbfbP1A6CL46Pri8+XOBD
	 POjlVhH+tYQ0pihO84nmwN4ky+07NYPD2vetdWdYV1QJTnXGPrOBjqA7bbD2VXV9fj
	 g+Q9GC+Go1GuwPXNXXn6JGJLBp7ctaSA9Fn0qrjBuIrv6/7Ri4TVBgUq7SeKMuTYhj
	 vA2ymYrbZrgnBI4jdS1B9aBYW+H/biIgOReFcUb+9HpcANg95UB1qUkblcpcgiaeYM
	 EKddb2Yv5gRtH5a6IZNwQvMjSlTfMsOV/IxAfgHYZ5PJFKlca5KpGN+T1jTFN3YCAt
	 q7IPcELhuRYeg==
Message-ID: <d7f3c1fef7293d7da69620bed31d77a3.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <1jh6p9o6cl.fsf@starbuckisacylon.baylibre.com>
References: <1jh6p9o6cl.fsf@starbuckisacylon.baylibre.com>
Subject: Re: [GIT PULL]: clk: meson: amlogic clock updates for v6.6
From: Stephen Boyd <sboyd@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org
To: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 09 Aug 2023 14:17:24 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_141728_977589_8C179908 
X-CRM114-Status: GOOD (  10.11  )
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

Quoting Jerome Brunet (2023-08-08 09:09:24)
> Hi Stephen,
> 
> Here are the amlogic clock updates for v6.6.
> It is mainly about dt-bindings this cycle.
> Instead of exposing clock ids as needed, it was decided to expose everything
> 
> You might notice a patch on amlogic,meson-gx-hhi-sysctrl.yaml which is
> not a clock controller. This syscon mainly hosts the gxbb clock
> controller. Neil asked for this to be taken along with the rest of gxbb
> clock schema to make things simpler. No risk of conflict there.
> 
> The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:
> 
>   Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)
> 
> are available in the Git repository at:
> 
>   https://github.com/BayLibre/clk-meson.git tags/clk-meson-v6.6-1
> 
> for you to fetch changes up to 4d023beb3998a775dc5c3aa2c22efd3435e061e1:
> 
>   dt-bindings: soc: amlogic: document System Control registers (2023-08-08 16:09:37 +0200)
> 
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
