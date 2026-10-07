Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37089CC6B1A
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Oct 2026 17:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mcSS2A6b6BTsxjhiueKsd/DRxFOWlXXbZ1VwXi2oCqE=; b=G8BKCQCS4zn8PI
	AHVgBj7ds+6qW8OdiNMk3vCe7zYx8u/v2OaVP5TBiEhV/rmpeX3hbhLHWPVVLKHscK17I/fVyQO+p
	JfXVvf64nkOGCbDp6OAHn5E0I+sGxCSFhgQYocptQs12rV8/cAjUwEDW+tchbiSKKiGhZRBlIBo1I
	9oAbjxy4NqPASBz0HuVB6QIva9jkXoYZysQhcOn/BFJ+Ijxq2aq1nIrkeqDs9QcdkyNT5+tiRdkf8
	r0Bi2Lqo8Ze0NpG32Wb6jRc8WZc5K3oWAG2NwcNVS8YpNm1fP6Rz07sSMLKsQCFzxhXGjg37hJzPv
	ci43MXGD8hw3fKgL50cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGgke-0000000DmXQ-0Pmt;
	Tue, 13 Oct 2026 17:57:24 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGgkb-0000000DmWE-0HZX
	for linux-amlogic@lists.infradead.org;
	Tue, 13 Oct 2026 17:57:23 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 763F01A1216
	for <linux-amlogic@lists.infradead.org>; Tue, 13 Oct 2026 17:57:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4BD5660362
	for <linux-amlogic@lists.infradead.org>; Tue, 13 Oct 2026 17:57:18 +0000 (UTC)
Received: by mail.galae.net (Postcow, from userid 0)
	id B200E11D718D8; Tue, 13 Oct 2026 19:51:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791914237; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=Tfz1erK3QiFzyfQaqlvLpSAXIu/f1XaMusQf1OpEuA4=;
	b=2oyTQFt64rd4EbA9KCeaG50tW4Dm5Dy9RxCmHAA6FMrtWI1gwH/wIex+HmgZqoJ+0sx3Sj
	DOXGiLZVHe5Y/66wsYfD+n1vAhjayTmNljsNOMHSeU6ZJt5V0NvjKoBpEqSlLxacH+xiXF
	+NT4GrsZEz/JzyaHERo05SGYqjV9XZBSYyEMWVsWNq/cL7eeE5M19FdF7VfjvY5OV/kqgo
	69Dv0UB0rpGYl+0xyK0h508Hg++oKrwhndsLKIWSSxNx48Rm38i0r+9M+WjX53MvBkl90w
	GyaY4TpuAnq0zgss+G8Z0hc8m7VW2fr7d3HMdYPmX+GocJwD8UCPlKKC9MXkvg==
Authentication-Results: mail.galae.net;
	none
Message-ID: <ea812192-184b-4726-9ff4-abeca3a3b498@bootlin.com>
Date: Wed, 7 Oct 2026 11:36:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 4/7] net: stmmac: dwmac-meson8b: add support for
 the Amlogic T7
To: Lucas Tanure <tanure@linux.com>, xianwei.zhao@amlogic.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261007082627.63807-1-tanure@linux.com>
 <20261007082627.63807-5-tanure@linux.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20261007082627.63807-5-tanure@linux.com>
X-Last-TLS-Session-Version: None
X-Rspamd-Queue-Id: B200E11D718D8
X-Spamd-Result: default: False [2.40 / 30.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DATE_IN_PAST(1.00)[152];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[netdev,dt];
	BCC(0.00)[];
	DKIM_SIGNED(0.00)[bootlin.com:s=dkim];
	ARC_NA(0.00)[];
	RCVD_COUNT_ZERO(0.00)[0];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[linux.com,amlogic.com,lunn.ch,davemloft.net,kernel.org,redhat.com,linaro.org,baylibre.com,googlemail.com,gmail.com,foss.st.com];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	MAILCOW_DOMAIN_HEADER_FROM(0.00)[bootlin.com];
	URIBL_BLOCKED(0.00)[linux.com:email,localhost:rdns,localhost:helo,galae.net:url,davemloft.net:email,linaro.org:email,infradead.org:email,baylibre.com:email,bootlin.com:email,bootlin.com:mid,bootlin.com:url,lunn.ch:email,st.com:email,amlogic.com:email];
	TO_DN_SOME(0.00)[]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_105721_406625_F5747D31 
X-CRM114-Status: GOOD (  22.56  )
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

On 10/7/26 10:26, Lucas Tanure wrote:
> The glue registers on the T7 are laid out exactly as the G12A ones, RX
> delay field included, so the T7 can reuse the G12A settings.
> 
> What it does not share is how the controller reaches memory. That path
> runs through a pipeline stage with a gate of its own, and no other
> device has any use for that gate. Nothing claims it, so it is switched
> off as unused and a transfer that has started can never finish.
> 
> Without that gate the controller cannot do DMA at all, so it is
> required rather than optional: a clear probe failure beats an
> undiagnosable hang later.
> 
> Assisted-by: LLM
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Lucas Tanure <tanure@linux.com>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

> ---
>  .../ethernet/stmicro/stmmac/dwmac-meson8b.c   | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
> index d73dfd0ac167..dd10d719ab84 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
> @@ -81,6 +81,7 @@ struct meson8b_dwmac;
>  struct meson8b_dwmac_data {
>  	int (*set_phy_mode)(struct meson8b_dwmac *dwmac);
>  	bool has_prg_eth1_rgmii_rx_delay;
> +	bool has_pipeline_clk;
>  };
>  
>  struct meson8b_dwmac {
> @@ -402,6 +403,7 @@ static int meson8b_dwmac_probe(struct platform_device *pdev)
>  	struct plat_stmmacenet_data *plat_dat;
>  	struct stmmac_resources stmmac_res;
>  	struct meson8b_dwmac *dwmac;
> +	struct clk *pipeline_clk;
>  	u32 tx_delay_ps;
>  	int ret;
>  
> @@ -485,6 +487,13 @@ static int meson8b_dwmac_probe(struct platform_device *pdev)
>  	if (IS_ERR(dwmac->timing_adj_clk))
>  		return PTR_ERR(dwmac->timing_adj_clk);
>  
> +	if (dwmac->data->has_pipeline_clk) {
> +		pipeline_clk = devm_clk_get_enabled(dwmac->dev, "pipeline");
> +		if (IS_ERR(pipeline_clk))
> +			return dev_err_probe(dwmac->dev, PTR_ERR(pipeline_clk),
> +					     "missing pipeline clock\n");
> +	}
> +
>  	ret = meson8b_init_rgmii_delays(dwmac);
>  	if (ret)
>  		return ret;
> @@ -521,6 +530,12 @@ static const struct meson8b_dwmac_data meson_g12a_dwmac_data = {
>  	.has_prg_eth1_rgmii_rx_delay = true,
>  };
>  
> +static const struct meson8b_dwmac_data meson_t7_dwmac_data = {
> +	.set_phy_mode = meson_axg_set_phy_mode,
> +	.has_prg_eth1_rgmii_rx_delay = true,
> +	.has_pipeline_clk = true,
> +};
> +
>  static const struct of_device_id meson8b_dwmac_match[] = {
>  	{
>  		.compatible = "amlogic,meson8b-dwmac",
> @@ -542,6 +557,10 @@ static const struct of_device_id meson8b_dwmac_match[] = {
>  		.compatible = "amlogic,meson-g12a-dwmac",
>  		.data = &meson_g12a_dwmac_data,
>  	},
> +	{
> +		.compatible = "amlogic,t7-dwmac",
> +		.data = &meson_t7_dwmac_data,
> +	},
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, meson8b_dwmac_match);

text:
Return-Path: <netdev+bounces-342293-maxime.chevallier=bootlin.com@vger.kernel.org>
Delivered-To: maxime.chevallier@bootlin.com
Received: from mail.galae.net ([172.22.1.253])
	by 9e7fea892943 with LMTP
	id 6Pb+AwAVxmrwWQwAtaWaaQ
	(envelope-from <netdev+bounces-342293-maxime.chevallier=bootlin.com@vger.kernel.org>)
	for <maxime.chevallier@bootlin.com>; Wed, 07 Oct 2026 11:46:40 +0200
X-Original-To: maxime.chevallier@bootlin.com
Received: from smtpin-01.galae.net (smtpin-01.galae.net [51.159.2.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.galae.net (Postcow) with ESMTPS id 622F411D500EF
	for <maxime.chevallier@bootlin.com>; Wed,  7 Oct 2026 11:46:39 +0200 (CEST)
Authentication-Results: mail.galae.net;
	dkim=pass header.d=bootlin.com header.s=dkim header.b=nmCoNw19;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1");
	dmarc=pass (policy=reject) header.from=bootlin.com;
	spf=pass (mail.galae.net: domain of "netdev+bounces-342293-maxime.chevallier=bootlin.com@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="netdev+bounces-342293-maxime.chevallier=bootlin.com@vger.kernel.org"
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com;
	s=dkim; t=1791366399;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:
	 list-unsubscribe:list-subscribe:dkim-signature;
	bh=z20W5mUIAexQAlTa3dlGNHHX48Yvv7PgJnJT1HAMI0Q=;
	b=1Qk2GDiHDvFKZ6ihtLBFzuZEmhFK/QC9l1TaZ5zWHlJs57LE76Kfva4JF2LIff8sxSsWAe
	oE4HzvJxP7u0CIfIzorUbxv5wcX6cSmy9PBZ3aF+h1vjzs7yC5D/eJGB7aHEGIfaGcSo0J
	WjAKO6X9UV3BTzYAfzeXns78MC7Z5aTR5xEv7CgosnDwUhRgROO/dNGZy/qMVpoohwK4/5
	SWHbgnire83eFqvrgQAC01Pgw5XnjwpQuorjlsdpz7uek69FAPCnWwuBF9EuAcWclaNnsI
	XhlY7Fp8U8lp5QISr5xIpCcDPs7pkFqtBcARvn25IfORQK9Lj5Y961aU5cyMvA==
ARC-Authentication-Results: i=2;
	mail.galae.net;
	dkim=pass header.d=bootlin.com header.s=dkim header.b=nmCoNw19;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1");
	dmarc=pass (policy=reject) header.from=bootlin.com;
	spf=pass (mail.galae.net: domain of "netdev+bounces-342293-maxime.chevallier=bootlin.com@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="netdev+bounces-342293-maxime.chevallier=bootlin.com@vger.kernel.org"
ARC-Seal: i=2; s=dkim; d=bootlin.com; t=1791366399; a=rsa-sha256; cv=pass;
	b=ocdmi1yqM344Yn2tyZeGPLuUbC/kJAToWdvU5CyNWpI7vfcW4HHPnXydsHs2/jdOjVmLAu
	NJrWT6weV2d7f6cP+8xKcBbwvRqsEvLLHvSsyVxkSfU6JTumomJ6lUSw6UAvJof3PgZvOU
	md0bdjbKSHzPk6l936Qq1qiA4B3NgtHn8xKIksypIhzyhXycecgsyfZf02mmWJ/kYILlut
	xrlfqt0wt/Ie3S1pJe78X37QQWzKdajtIMsRMp2ofM8AEGNdC2B8OCm6o4zDF6xbeYQzlT
	T/ln3IeCh2lOVMlw5AwF4K0ZBecY0unhzO/LqoWPDxe345d7evAjCstTWj9ITQ==
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by smtpin-01.galae.net (Postfix) with ESMTPS id CB1E33429D1
	for <maxime.chevallier@bootlin.com>; Wed,  7 Oct 2026 09:46:38 +0000 (UTC)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 99DB73FDE1
	for <maxime.chevallier@bootlin.com>; Wed,  7 Oct 2026 09:37:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AACA446062;
	Wed,  7 Oct 2026 09:36:55 +0000 (UTC)
X-Original-To: netdev@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27AB3911A9
	for <netdev@vger.kernel.org>; Wed,  7 Oct 2026 09:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791365813; cv=none; b=Z1AkR384S/eKhCvrd2lcsn1vwwehYV9nNwns2kL0rnTBPshevv42mZdGcHyyUintfFAjUyRkdUKaiugg5vHAUrYLnQghIgX7XZH+gggaBttdQqF9TI/plmUut12Tg9OAY13pFixgkqC2lJ/rJZ6AutDda4AWrFvidhqb2Wzjw5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791365813; c=relaxed/simple;
	bh=6wlmBMug/czsODO6BZoaF+On6U3jjQlKqBL1Nax9BwY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AyhAxiKXMS1IiXj1XE+m15A9A08ZWh33OQOFiwiq3dhx4aVFd00lKd2x8B+SsG6DtpEaruwcTqRR7F6bZwMv8llC8ST/v+MFsEhdmTRJcDsWV8qYT6Xgr9lpeR4Qylf3wgPnX5Ht+Y0xhrl6blnquyLzxs9h+qelH9P+flUIOOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=nmCoNw19; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 0042D4E410C6;
	Wed,  7 Oct 2026 09:36:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C77856074B;
	Wed,  7 Oct 2026 09:36:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B0F8B11D500A5;
	Wed,  7 Oct 2026 11:36:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791365798; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=z20W5mUIAexQAlTa3dlGNHHX48Yvv7PgJnJT1HAMI0Q=;
	b=nmCoNw19zCWapbVTqYNds9xg5iZW0txeUyi5eiclFAlFGe9N5b4Tp0nLOm2JZDfObXI7fL
	cimytk5ukcnLEGqUTOVRang3096yrnQDeuwLER4drGFJlNhpFZXnbK0bsb8uinteL2ULal
	1mGRVJsOGE0SbYWh/NbKAjebJlH9jFANexFuP1lAKPVYDDWdNsGXw86Tumf66UakPUsJbz
	89bP900/JNv4FcIfqzRfATbNmoz9+c1Elip9aOXoIKUM770Az6L2YGKg9hHubsM46Kca1b
	q/HAd48+3OZkLvkEIIqg5E+XFYQS5pDDX15GI/o1O8pCayMLceTwNWXDziL+Tg==
Message-ID: <ea812192-184b-4726-9ff4-abeca3a3b498@bootlin.com>
Date: Wed, 7 Oct 2026 11:36:32 +0200
Precedence: bulk
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 4/7] net: stmmac: dwmac-meson8b: add support for
 the Amlogic T7
To: Lucas Tanure <tanure@linux.com>, xianwei.zhao@amlogic.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261007082627.63807-1-tanure@linux.com>
 <20261007082627.63807-5-tanure@linux.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20261007082627.63807-5-tanure@linux.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [-2.08 / 30.00];
	SUSPICIOUS_RECIPS(1.50)[];
	IP_REPUTATION_HAM(-1.41)[asn: 63949(-0.40), country: SG(-0.01), ip: 172.234.253.10(-1.00)];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	BAYES_HAM(-0.00)[24.47%];
	URIBL_BLOCKED(0.00)[linux.com:email,linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bootlin.com:mid,bootlin.com:email,bootlin.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_MAILCOW_DOMAIN(0.00)[bootlin.com];
	MAILCOW_DOMAIN_HEADER_FROM(0.00)[bootlin.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[linux.com,amlogic.com,lunn.ch,davemloft.net,kernel.org,redhat.com,linaro.org,baylibre.com,googlemail.com,gmail.com,foss.st.com];
	MIME_TRACE(0.00)[0:+];
	BCC(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-342293-maxime.chevallier=bootlin.com];
	RBL_SENDERSCORE_REPUT_BLOCKED(0.00)[172.234.253.10:from];
	DKIM_TRACE(0.00)[bootlin.com:+];
	DNSWL_BLOCKED(0.00)[100.90.174.1:received,172.234.253.10:from,212.83.136.155:received,185.246.85.4:received,212.83.139.233:received];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maxime.chevallier@bootlin.com,netdev@vger.kernel.org];
	ARC_SIGNED(0.00)[bootlin.com:s=dkim:i=2];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[netdev,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DWL_DNSWL_BLOCKED(0.00)[bootlin.com:dkim];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	EXTERNAL_RELAY_AUTHENTICATED(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 622F411D500EF

Hi,

On 10/7/26 10:26, Lucas Tanure wrote:
> The glue registers on the T7 are laid out exactly as the G12A ones, RX
> delay field included, so the T7 can reuse the G12A settings.
> 
> What it does not share is how the controller reaches memory. That path
> runs through a pipeline stage with a gate of its own, and no other
> device has any use for that gate. Nothing claims it, so it is switched
> off as unused and a transfer that has started can never finish.
> 
> Without that gate the controller cannot do DMA at all, so it is
> required rather than optional: a clear probe failure beats an
> undiagnosable hang later.
> 
> Assisted-by: LLM
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Lucas Tanure <tanure@linux.com>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

> ---
>  .../ethernet/stmicro/stmmac/dwmac-meson8b.c   | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
> index d73dfd0ac167..dd10d719ab84 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
> @@ -81,6 +81,7 @@ struct meson8b_dwmac;
>  struct meson8b_dwmac_data {
>  	int (*set_phy_mode)(struct meson8b_dwmac *dwmac);
>  	bool has_prg_eth1_rgmii_rx_delay;
> +	bool has_pipeline_clk;
>  };
>  
>  struct meson8b_dwmac {
> @@ -402,6 +403,7 @@ static int meson8b_dwmac_probe(struct platform_device *pdev)
>  	struct plat_stmmacenet_data *plat_dat;
>  	struct stmmac_resources stmmac_res;
>  	struct meson8b_dwmac *dwmac;
> +	struct clk *pipeline_clk;
>  	u32 tx_delay_ps;
>  	int ret;
>  
> @@ -485,6 +487,13 @@ static int meson8b_dwmac_probe(struct platform_device *pdev)
>  	if (IS_ERR(dwmac->timing_adj_clk))
>  		return PTR_ERR(dwmac->timing_adj_clk);
>  
> +	if (dwmac->data->has_pipeline_clk) {
> +		pipeline_clk = devm_clk_get_enabled(dwmac->dev, "pipeline");
> +		if (IS_ERR(pipeline_clk))
> +			return dev_err_probe(dwmac->dev, PTR_ERR(pipeline_clk),
> +					     "missing pipeline clock\n");
> +	}
> +
>  	ret = meson8b_init_rgmii_delays(dwmac);
>  	if (ret)
>  		return ret;
> @@ -521,6 +530,12 @@ static const struct meson8b_dwmac_data meson_g12a_dwmac_data = {
>  	.has_prg_eth1_rgmii_rx_delay = true,
>  };
>  
> +static const struct meson8b_dwmac_data meson_t7_dwmac_data = {
> +	.set_phy_mode = meson_axg_set_phy_mode,
> +	.has_prg_eth1_rgmii_rx_delay = true,
> +	.has_pipeline_clk = true,
> +};
> +
>  static const struct of_device_id meson8b_dwmac_match[] = {
>  	{
>  		.compatible = "amlogic,meson8b-dwmac",
> @@ -542,6 +557,10 @@ static const struct of_device_id meson8b_dwmac_match[] = {
>  		.compatible = "amlogic,meson-g12a-dwmac",
>  		.data = &meson_g12a_dwmac_data,
>  	},
> +	{
> +		.compatible = "amlogic,t7-dwmac",
> +		.data = &meson_t7_dwmac_data,
> +	},
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, meson8b_dwmac_match);



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
