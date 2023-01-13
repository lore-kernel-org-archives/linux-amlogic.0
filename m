Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5954C54EBE
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Jan 2023 00:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=joBryb3TPu5ObrIFxkJK6eyjwN7oSkDX3Qe8PoP7LS4=; b=jxrdq2KsELkOIg
	NL+BJUQLmhbvljkW9bxyUzwc/AtdG6CpVfVFT84UVpP+GFfNhoMhstpbasRaKjBJDDLx0bHDEoPYg
	+kY50vlxIBWp4DbNQfCN5f4PrK5szMCEmDwyQLMhDmplMCZDAidDocdFw66J4xGIRRtv/9xF7MQQR
	yA1m/U3Q1K2LULbrwOwXAYqeP4Xg/4EdjsIpJtkNOeYt5XZr59lNZeZrdqb5EgDV1RQ8q1FUjdScC
	bU0iDtQQnUfSHo3XRB3fJOSfqT6an2uWCboQ/kkoMTWAhIjUfWCJ9xxTREr6BpI4ZlzhYJcZEwELx
	ASmPf5fg5yvfwiQ/zq1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pG7zv-00HaPn-GC; Fri, 13 Jan 2023 00:32:43 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pG7zs-00HaP6-Bz
	for linux-amlogic@lists.infradead.org; Fri, 13 Jan 2023 00:32:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B0513B815FA;
	Fri, 13 Jan 2023 00:32:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5939BC433D2;
	Fri, 13 Jan 2023 00:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673569957;
	bh=D+CLx71N7hh+aMCrNFwner/r2ssmRTSXXThuDIxd478=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=jY0ccoL8B48ZokoTeh5+PEtKN6kWxbJxS0xC7fk4NF+f0OyUPiKiZYDK/nOD14oid
	 tLz7NLzF3Tx0Xwg9MEZaKi2SudIgyVHThZJfATddeqtW/zbtKYZKlEdKnn/oKOUiWO
	 R/pgDXxWBTAeDYOJCK2j2rGbe+UOwXa26bbjOPXoTF2KxBtke+2UnxsnRHhmKn9O17
	 uiBWTtjprisS5+XIq8dEjy4bdTZInkEdsQTnAWM9QBXTFwkd5z57v4Opxh/A9QzWx+
	 y+TxrCELwlTHXPeWWjKpVnjYDdYmORSIanvLI1oB6z0tfPEy1vZIzjGuWMvCSydUIJ
	 WnrJCnWZMKtkg==
Message-ID: <b19614d43df2dbd3614b9241d2c3cfc1.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20221225212632.2760126-1-martin.blumenstingl@googlemail.com>
References: <20221225212632.2760126-1-martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v1 0/4] clk: meson: switch from .round_rate to .determine_rate
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, jbrunet@baylibre.com, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org
Date: Thu, 12 Jan 2023 16:32:35 -0800
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230112_163240_573397_C34C35ED 
X-CRM114-Status: UNSURE (   8.97  )
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

Quoting Martin Blumenstingl (2022-12-25 13:26:28)
> The goal of this series is to switch the meson sub-drivers to use
> clk_ops.determine_rate instead of clk_ops.round_rate. The former has
> lower precision (2^31 instead of 2^32 on 32-bit systems). Also the idea
> of the .determine_rate callback is that is replaces .round_rate so the
> latter can be removed at some point.
> 
> No functional changes (apart from the 2^31 to 2^32 difference mentioned
> bove) intended.
> 
> 
> Martin Blumenstingl (4):
>   clk: meson: mpll: Switch from .round_rate to .determine_rate
>   clk: meson: dualdiv: switch from .round_rate to .determine_rate
>   clk: meson: sclk-div: switch from .round_rate to .determine_rate
>   clk: meson: clk-cpu-dyndiv: switch from .round_rate to .determine_rate
> 

Acked-by: Stephen Boyd <sboyd@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
