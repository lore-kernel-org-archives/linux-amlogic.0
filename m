Return-Path: <SRS0=6y+j=TL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 975CDC04AB1
	for <linux-amlogic@archiver.kernel.org>; Sat, 11 May 2019 15:47:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6972820989
	for <linux-amlogic@archiver.kernel.org>; Sat, 11 May 2019 15:47:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iWMW8Yir";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="W8NR9LnI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6972820989
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sHO10PP4LNBzq05bu38E8CrC5iExHqeC2pRLnfPAot8=; b=iWMW8Yir3ucLoQ
	RPU3VZvHchKrhlvyVH5kwScUvpl2+O3yKQmz4Ju8U4K05a71+bm86k9v7secs2TERyI4Ra85zsI1y
	XnX0PbW1Cu1sxs7wX32DpGHXxUOu4ckrlh0D9LYojspj8wdFiHG5jtJIpnAAreJuD2K2/96vAjcsJ
	UyPTneEVbW/vqlkZdJIVY5GKrV4B/pr8SNL+HUE58r5Lc5Y+wZCxF0D7U5aMDQE6LqZQgemfxl823
	ykR1wPTIlcMhpGoZGfn3jP5OT+nHfyZXBnWXl/W9vl/xZdLLADq6gVxlaZ/TVkT4BAMLyPX2zPTpm
	8I0AerNIaSppDX1v8VfQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hPUDD-0006BK-CR; Sat, 11 May 2019 15:46:59 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hPUD9-0006As-Ij
 for linux-amlogic@lists.infradead.org; Sat, 11 May 2019 15:46:58 +0000
Received: by mail-wr1-x441.google.com with SMTP id r4so10771985wro.10
 for <linux-amlogic@lists.infradead.org>; Sat, 11 May 2019 08:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=9EyAvll/ATAIGdWTAfOnNvm6AJWZDwOSY5TYnJ4aLu4=;
 b=W8NR9LnIM746OC6UAr+I4/mwaTFWbv/cXM9gmgPM3KoD0ltprY3CktFRo2rAiOPbfr
 4VhYGiIKa+rfIYOCCPIx4IMHeveJirtAo3Ya+zx7+TstMMo14LBljvp7nPdgFK5M1Dyp
 wyGi0Mft856R9ZsfcbaAH+AnJr6G6SzFMSCtQ3FtYpRO8Ucn56f2eiZTa+32s0+Luat2
 WObr+TQMnPFKjqYEK6SUC1Gtw47yjmdPe70Rz8jDksZKduyeield1foYZhD+qWaeewTb
 lZEVwyr8ulZWRoKyFgqd6DdaueObW7u5l/7YBjzndbwKzWQzW4AQ5ODiRidBxSk/pFBI
 y5zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=9EyAvll/ATAIGdWTAfOnNvm6AJWZDwOSY5TYnJ4aLu4=;
 b=EBf5R8ffZrN/8eq+XF4NLHSXfaP6JJx4udCD9vYekGKwmlue0hbJQNJmxuO0VallDq
 bsRon7nsEHudZkkqbwq93vRpXEN8341VNXw+/L3po2IwqD9uVpBUQYVJc/FIa6nsdXRU
 OhTFWaY1y4f38qFQJZUkW4Lq2h7yzbupyYP9Rnvk9EqOjIZbk5EcqtS5ETdiZcWyeUdu
 ZI+vcg9UDnHmVZPku0AKw8lvSJz+DQMWlWhcgAUpVZgJAfvKP/uQgb7QPrP1y6mcsWDK
 kgGN8zIrDM0icSo8SQOpJzDJL6XP7kbO8HPAxMwfjvQNJ8UogMB/3Ajit7+/cVW2xF4T
 CWBg==
X-Gm-Message-State: APjAAAW1A8tPkfW+9ZTee9n6URAv30wdXz+w5Ow46fD+YNChbW3Hd5ST
 bEXiN6v8Y92D9/qcHh7iPWDihw==
X-Google-Smtp-Source: APXvYqxB8d87irChUP/Gna5KPAG1k70rARyG7XAXhFYcz1xreLZlylj5y6uj22gjPVvPo3HoulXyHA==
X-Received: by 2002:a5d:50c7:: with SMTP id f7mr11637247wrt.95.1557589613287; 
 Sat, 11 May 2019 08:46:53 -0700 (PDT)
Received: from boomer.baylibre.com (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.gmail.com with ESMTPSA id y6sm11486952wrw.60.2019.05.11.08.46.49
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 11 May 2019 08:46:52 -0700 (PDT)
Message-ID: <bf1360ab62a4e7bd3928052ebb6c969e8059f29e.camel@baylibre.com>
Subject: Re: [PATCH 5/5] arm64: dts: meson: sei510: add network support
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Date: Sat, 11 May 2019 17:46:45 +0200
In-Reply-To: <7ho94ac4jn.fsf@baylibre.com>
References: <20190510164940.13496-1-jbrunet@baylibre.com>
 <20190510164940.13496-6-jbrunet@baylibre.com> <7ho94ac4jn.fsf@baylibre.com>
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190511_084655_665225_0712D603 
X-CRM114-Status: GOOD (  10.01  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, 2019-05-10 at 15:45 -0700, Kevin Hilman wrote:
> Jerome Brunet <jbrunet@baylibre.com> writes:
> 
> > Enable the network interface of the SEI510 which use the internal PHY.
> > 
> > Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> 
> I tried testing this series on SEI510, but I must still be missing some
> defconfig options, as the default defconfig doesn't lead to a working
> interface.

That's weird. AFAICT, the net part has hit Linus's tree.
You should have everything needed by default, the mdio mux has

> default m if ARCH_MESON

> 
> 
> I tried adding this kconfig fragment[1], and the dwmac probes/inits but
> I must still be missing something, as the dwmac is still failing to find
> a PHY.  Boot log: https://termbin.com/ivf3
> 
> I have the same result testing on the u200.

I don't any other patch pending for the network of the g12a.
Maybe I've done something wrong while rebasing. I'll check on monday.

> 
> Kevin
> 
> [1] amlogic network kconfig fragment
> CONFIG_STMMAC_ETH=y
> 
> # following are needed, but automatically enabled if above is set
> #CONFIG_STMMAC_PLATFORM=m
> #CONFIG_DWMAC_MESON=m
> 
> CONFIG_PHYLIB=y
> CONFIG_MICREL_PHY=y
> CONFIG_REALTEK_PHY=y
> 
> CONFIG_MDIO_BUS_MUX_MESON_G12A=y
> CONFIG_MESON_GXL_PHY=y



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
