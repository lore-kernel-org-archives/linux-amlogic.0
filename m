Return-Path: <SRS0=/cGg=OX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B31E0C67873
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Dec 2018 12:28:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F6BF21473
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Dec 2018 12:28:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jGW3/vVJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="gsRMXNia"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F6BF21473
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sntech.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rRlLAxqODQgHz0LwLtS2F9gQYhguNTjUuzof6tPNENY=; b=jGW3/vVJGGlp4p
	PNmCvaE8WRzelM3SVEeMbObC046vPc+cSw7MdvzswYyiWK9HSzMXodO+ESSXN8toREydcK7Bos2+E
	DgcG1g8kmNLaK5TfRNjZMQYwT2X1uJvPOCXwdR9a2pejtOgZDUNK0EIs6endIyQshWLHoztnAeDHE
	Z4vg1O1pVkhBr9OLwc2h0E8tbCsO4G9YRG+mFlcfyOPVy8ZCWRvcyrKualvxvrv6eA1XAsQ7DM/fu
	Bsapi9694vZNJU2uf/Zwu1QBpv8dow02X+/8XCHrRu6tB/XkazJqLhv+zeR8uaDY0Pui9AG88+XdP
	UNmtVAy1AYrmNt1JN2Zw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gXmZS-0007Ak-Pj; Fri, 14 Dec 2018 12:27:58 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gXmZQ-0006Nr-NY
 for linux-amlogic@bombadil.infradead.org; Fri, 14 Dec 2018 12:27:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+mCEU7WDCuZu5Ipf17Cqkecqv8W2ezaFquscnK2LgOo=; b=gsRMXNiaWUGMGEUW+9Ve2YL4aM
 18yFAMfR3wpBwZUQhv6eqeIMlzh9mpCGmnEjvJvIgPmOetxLep3joNLoMarnQVA6qgDOwbrK/Zqe/
 4OaelQnpU96tUtoRa30c5B9VIiQSPgvyLTghvMkRrTge4ywf2nM86fWxkuEu88GJgBIRwYgL5Ye4U
 aXwryQm7yFFfC2xHqF0oOaaDWSVhAZnsATXKlPbLnkKP0A03Ch0hEVS//ivK2v06CovnIlRynUtk6
 nX8VK6If23saPVkfzzaEaBUON4i24rQWP8tIrzAQrHxzF0nUl5Xw4bmSMP43LaaCdqwFJ5q+himr6
 O7or7Q5w==;
Received: from gloria.sntech.de ([185.11.138.130])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gXmKh-0006FF-QW
 for linux-amlogic@lists.infradead.org; Fri, 14 Dec 2018 12:12:45 +0000
Received: from wf0848.dip.tu-dresden.de ([141.76.183.80] helo=phil.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <heiko@sntech.de>)
 id 1gXmKO-0006V2-GU; Fri, 14 Dec 2018 13:12:24 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH RFC v2 1/8] drm/bridge: dw-hdmi: Add SCDC and TMDS
 Scrambling support
Date: Fri, 14 Dec 2018 13:12:23 +0100
Message-ID: <2505786.uGvT2qSv2r@phil>
In-Reply-To: <20181130134301.17963-2-narmstrong@baylibre.com>
References: <20181130134301.17963-1-narmstrong@baylibre.com>
 <20181130134301.17963-2-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181214_121243_877478_20D586DC 
X-CRM114-Status: GOOD (  14.27  )
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
Cc: architt@codeaurora.org, maxime.ripard@bootlin.com,
 Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, a.hajda@samsung.com,
 Nickey Yang <nickey.yang@rock-chips.com>, Laurent.pinchart@ideasonboard.com,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-amlogic@lists.infradead.org,
 Huicong Xu <xhc@rock-chips.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Am Freitag, 30. November 2018, 14:42:54 CET schrieb Neil Armstrong:
> Add support for SCDC Setup for TMDS Clock > 3.4GHz and enable TMDS
> Scrambling when supported or mandatory.
> 
> This patch also adds an helper to setup the control bit to support
> the high TMDS Bit Period/TMDS Clock-Period Ratio as required with
> TMDS Clock > 3.4GHz for HDMI2.0 3840x2160@60/50 modes.
> 
> These changes were based on work done by Huicong Xu <xhc@rock-chips.com>
> and Nickey Yang <nickey.yang@rock-chips.com> to support HDMI2.0 modes
> on the Rockchip 4.4 BSP kernel at [1]
> 
> [1] https://github.com/rockchip-linux/kernel/tree/release-4.4
> 
> Cc: Nickey Yang <nickey.yang@rock-chips.com>
> Cc: Huicong Xu <xhc@rock-chips.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

sorry this took a bit longer, but I can confirm that the 4 relevant
patches (1, 4, 5, 6) at least still provide 1080p hdmi output on
rk3288 (with internal hdmiphy) and rk3328 (with external innosilicon
hdmiphy). I don't know how to test newly added features, but at
least the patches don't seem to break existing users, so

on rk3288 and rk3328
Tested-by: Heiko Stuebner <heiko@sntech.de>




_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
