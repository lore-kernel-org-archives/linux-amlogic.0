Return-Path: <SRS0=tbsV=6E=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE2DDC3815B
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Apr 2020 18:12:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 574822084D
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Apr 2020 18:12:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lgEnft2f"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 574822084D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=davemloft.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	From:Subject:To:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+Z17Q1/XEXnQifN/xo95JF6gb9Tpruuqi80RGpK8IHo=; b=lgEnft2fEOIs6u
	YDk6pzyXuy1FzEEpwBQ6MD3bg8pPxWISCYm5PaISoBN/pCzKPlNMJMhwS4wP5wC0ojhF/T2+W3vRI
	G6cELOKQT6ditVxetUqrzBh12AngDREIfyaQ5TItuR7SdZZ2LmgxxgvAMnj0zopVKsYHXCofhJOu7
	jw7Dlyl5DqNvjqyaLpdPU2d/s0xEi8Zeok3MV/rrIHapc1ojiCfb0XD7/bXGG8DjLmU5D+KiACpyE
	ZoctUX/zOlieRWB9LG/tDwLEDEJCSjqW84n/lPL/37dEIlqk1RinQAdgRQYCksbSKtzc5+oSdoJhU
	Gtf/mIidVvc1uzYYdluw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQau6-0004Pl-DC; Mon, 20 Apr 2020 18:12:22 +0000
Received: from shards.monkeyblade.net ([2620:137:e000::1:9])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQat9-0003wO-4g; Mon, 20 Apr 2020 18:11:42 +0000
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id CB017127D487D;
 Mon, 20 Apr 2020 11:11:12 -0700 (PDT)
Date: Mon, 20 Apr 2020 11:11:11 -0700 (PDT)
Message-Id: <20200420.111111.1335274381489892106.davem@davemloft.net>
To: maz@kernel.org
Subject: Re: [PATCH] net: stmmac: dwmac-meson8b: Add missing boundary to
 RGMII TX clock array
From: David Miller <davem@davemloft.net>
In-Reply-To: <20200418181457.3193175-1-maz@kernel.org>
References: <20200418181457.3193175-1-maz@kernel.org>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Mon, 20 Apr 2020 11:11:13 -0700 (PDT)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200420_111134_921329_175AAF69 
X-CRM114-Status: UNSURE (   9.01  )
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
Cc: alexandre.torgue@st.com, martin.blumenstingl@googlemail.com,
 netdev@vger.kernel.org, stable@vger.kernel.org, joabreu@synopsys.com,
 khilman@baylibre.com, linux-amlogic@lists.infradead.org,
 peppe.cavallaro@st.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Marc Zyngier <maz@kernel.org>
Date: Sat, 18 Apr 2020 19:14:57 +0100

> Running with KASAN on a VIM3L systems leads to the following splat
> when probing the Ethernet device:
> 
> ==================================================================
> BUG: KASAN: global-out-of-bounds in _get_maxdiv+0x74/0xd8
> Read of size 4 at addr ffffa000090615f4 by task systemd-udevd/139
> CPU: 1 PID: 139 Comm: systemd-udevd Tainted: G            E     5.7.0-rc1-00101-g8624b7577b9c #781
> Hardware name: amlogic w400/w400, BIOS 2020.01-rc5 03/12/2020
...
> Digging into this indeed shows that the clock divider array is
> lacking a final fence, and that the clock subsystems goes in the
> weeds. Oh well.
> 
> Let's add the empty structure that indicates the end of the array.
> 
> Fixes: bd6f48546b9c ("net: stmmac: dwmac-meson8b: Fix the RGMII TX delay on Meson8b/8m2 SoCs")
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Cc: stable@vger.kernel.org

Please do not CC: stable@vger.kernel.org for networking changes as per
netdev-FAQ

Applied and queued up for -stable, thanks.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
