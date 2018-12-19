Return-Path: <SRS0=yw6d=O4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A2F5C43387
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Dec 2018 18:55:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D6772084A
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Dec 2018 18:55:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iOlPuk7k"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D6772084A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+ShOYGXHOEQcHpbGrpY5w/IBGXcpgOiq+4EmIwS/khI=; b=iOlPuk7kCOUYk2
	Ut9QF9GtLvgdFVAfCBvp/bJCpHY3HVYmPXw97jgVbqlfRKZZSvrt2VvKtfOnGSEU2P27//VevdRnT
	GHIOfiQEx/RUeQAFLk9qVrr70soxPJJYcZkBF23r7bRBPZ1MGd+mxvs0jj5hrVbU53zUYaFhT8g/k
	hkBMl/OQEz5iXxieKp4E01z1iXCJtoV/lAG8TDWF58rimO/Fn+DveTqeKetw5BVppKbE20flX/e74
	I8a4xwkVkj/khXD/8JyNlO9MqcxZ4DghBUowojLAmrC3n6anwEMV4x8HYd9X/jFDeSZ7dbrxJFvH3
	atyqOpkaqY6B2Z3wg7Xw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gZh0V-0000Xv-Bu; Wed, 19 Dec 2018 18:55:47 +0000
Received: from mail-ot1-f67.google.com ([209.85.210.67])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gZh0S-0000X1-NC
 for linux-amlogic@lists.infradead.org; Wed, 19 Dec 2018 18:55:46 +0000
Received: by mail-ot1-f67.google.com with SMTP id 32so20035499ota.12
 for <linux-amlogic@lists.infradead.org>; Wed, 19 Dec 2018 10:55:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=7HUiX94SswtmPoBx8ulvQvKbQnVaVrrXa2kPGfNaJmA=;
 b=RbgWK7sNGWF0H635gWxmebMgweLW53lYzFivH2MeyRyLzpCP3nwZlh3iiApAHj08xj
 lP94V7TbgwZCs7Os+ZYwsL0Terd3RKetzSUcE1dtyb5773FTcB9ApZme3R9aTR3tkRTn
 pkFOtn1Kh1ksgp3CKViYsgOTQYObwXzQ2td/8BTIQh5AlZWPKwlceBUaMbS/a4dkrJ2K
 30vl4kJf+8RliWnkpuXOUwgSSOBek2QDDV37MpJf3CaZ3Z24nLGJa+uSWhTTZS17xT4D
 zXxZmbljvb8bi3QRMyMx9TEtBL64rbrK5Z2mq6p/kmMMa8G36sghM2XRdoF6M3L8VQbh
 42Lw==
X-Gm-Message-State: AA+aEWZWnvXwD3umPEAC1volh/Jlx48oMh/7LuAvPJjMO/wldXj/OpcY
 lCojtgs9tSMw3nqHtrPcYa58Jxs=
X-Google-Smtp-Source: AFSGD/VA3IeSpI4dOqWG8JdMkU6bNwBHLzrT0RuSxICdlpmpsZ16HctWXin0Pkg413rmy4udhGa0eQ==
X-Received: by 2002:a9d:5f06:: with SMTP id f6mr16508683oti.258.1545245733637; 
 Wed, 19 Dec 2018 10:55:33 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id m129sm9265078oif.50.2018.12.19.10.55.32
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 19 Dec 2018 10:55:33 -0800 (PST)
Date: Wed, 19 Dec 2018 12:55:32 -0600
From: Rob Herring <robh@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH 1/5] dt-bindings: clk: meson: add ao slow clock path ids
Message-ID: <20181219185532.GA23002@bogus>
References: <20181204165310.20806-1-jbrunet@baylibre.com>
 <20181204165310.20806-2-jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20181204165310.20806-2-jbrunet@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181219_105544_760500_01D66E77 
X-CRM114-Status: UNSURE (   9.74  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 Carlo Caione <carlo@caione.org>, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue,  4 Dec 2018 17:53:06 +0100, Jerome Brunet wrote:
> Add the CLKIDs for the slow clock generation path
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  include/dt-bindings/clock/axg-aoclkc.h  | 7 ++++++-
>  include/dt-bindings/clock/gxbb-aoclkc.h | 7 +++++++
>  2 files changed, 13 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
