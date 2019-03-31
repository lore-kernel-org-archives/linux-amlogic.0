Return-Path: <SRS0=KZtH=SC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BD5CC43381
	for <linux-amlogic@archiver.kernel.org>; Sun, 31 Mar 2019 06:45:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A42220850
	for <linux-amlogic@archiver.kernel.org>; Sun, 31 Mar 2019 06:45:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DVNo+SaO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A42220850
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:
	References:Subject:From:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=NqSGXwVWRpPLSw0X/0v/CYPwg4NPvcd4sEWACZ3yCz8=; b=DVNo+SaOLVxBwN+kfU97Qs7lfW
	Z7INm33tgyCpoH2WfgwZhLxwaAJnqDyM/hn+yqgi2TcO0VyIu4MLev+n073usK/dN9fnARe4qtho5
	SIo+6l4a863241PAD52qw7Mpvuc8S6IzSkv5AzG6jq+Or6WySu4XxSPP2b8/dHLhBBr1q4emYS+pT
	i9PiY2AZeOe7jjmOGbfoTiso7gyjTH/GoYuxEq+o/epXZdMig0HSohHtPyOfXzc/qe9//d0qnssOx
	bke6vvjIHjlZ97QST/MnQU6Cnz5KczO+REGJcLJDefyIn6CFWOYy9Xv4rRHfM0qp49YF63MEGWPpy
	+gv4m7Ow==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hAUDE-0002xK-M1; Sun, 31 Mar 2019 06:45:00 +0000
Received: from mail-pg1-f194.google.com ([209.85.215.194])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hAUB0-000140-HJ; Sun, 31 Mar 2019 06:43:10 +0000
Received: by mail-pg1-f194.google.com with SMTP id v12so3174184pgq.1;
 Sat, 30 Mar 2019 23:42:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:from:subject:references
 :in-reply-to:cc:cc:to;
 bh=vSXDChUhILRmmgCN3ZahXVED8oDDAFSXQLLAtQEKHiY=;
 b=NoDkzXcQgHTXHJ3pcqnpM9xnHSjzrnByyb/aTOoBdoWhDF6w8DFNQGbhINY0yA0q7U
 O097yFpQ1bsWZoylJgzl2djN+Ph0WTvq4lHKtPAAJTDFiA2TQV2vNyCSYf/esF35bMUM
 Dcb6TPovA+k+3fbVs12OhYO/4Fb5a/fYpc8yGURPxjUeBt4ILezdfEtqirzifs8gDlnD
 IeypGY+tbwduHKnqafwn/IhsSLezok/985sW5Yn1EOL7JqxIWA0WTIuxe6B7+xnTHsDl
 lcGoZQRa5rzoRqY1nX69Lj2Lj38eIb0hMnOmgVNO4FUMFb0HFuMlcJ4pn59hTUURAfYd
 TwQQ==
X-Gm-Message-State: APjAAAUXO4EZuxEEHfsNpOxHVoimi7p7N7y0UHfaFDhG6wkoB9uXySgP
 n9lgZ4aN8gaeVixkId5zjgxRhWnnSw==
X-Google-Smtp-Source: APXvYqxnHwA+BapEia7iN6WSAoOOGnY6YwJhsBnHs8WmiyiYHAIcrr9zBWg7UNFdW5auUBLJ4OIK8Q==
X-Received: by 2002:a62:70c6:: with SMTP id l189mr3964121pfc.139.1554014561867; 
 Sat, 30 Mar 2019 23:42:41 -0700 (PDT)
Received: from localhost ([210.160.217.68])
 by smtp.gmail.com with ESMTPSA id r8sm8787780pfd.8.2019.03.30.23.42.40
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 30 Mar 2019 23:42:41 -0700 (PDT)
Message-ID: <5ca06161.1c69fb81.bf261.7caf@mx.google.com>
Date: Sun, 31 Mar 2019 01:42:39 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH RFC 5/6] dt-bindings: arm: amlogic: add Odroid-N2 binding
References: <20190327103308.25058-1-narmstrong@baylibre.com>
 <20190327103308.25058-6-narmstrong@baylibre.com>
In-Reply-To: <20190327103308.25058-6-narmstrong@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190330_234243_120763_2032914C 
X-CRM114-Status: UNSURE (   7.50  )
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
 khilman@baylibre.com, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, 27 Mar 2019 11:33:07 +0100, Neil Armstrong wrote:
> Add compatible for the Amlogic G12B (S922X) SoC based Odroid-N2 SBC
> from HardKernel.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  Documentation/devicetree/bindings/arm/amlogic.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
