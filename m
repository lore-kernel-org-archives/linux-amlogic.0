Return-Path: <SRS0=jO5x=WZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E5D1C3A59F
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Aug 2019 12:27:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 155C92339E
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Aug 2019 12:27:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MzL3Mbx4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 155C92339E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LBjTbxX373udNCiNXLfceNpWygCxkBkRI/EiE7uJ19M=; b=MzL3Mbx4qLfyKz
	mOssf0FB0Ouu51GPfarrPFa/lOeOFTwDO815yi/HXWwB8415fDZlicVlg7EZSZXjZswU4836nKyeS
	41kcHmN6EE7AAUUTrZsT2cYFrNZfs+jQPvhB/kpPlYqBsv+uAI8+oqHQoosvnkurbEXkbNYfcZuft
	zNJ6X1jRFXHnhbgCMMfoDVhysu4Ax5pHeg04j1yCVDZq8aIloLrgqQejViwwoUA7n0P6qiShx1A+b
	KItA1C2GxQs3rwUQsxc/rdX3zmcJCh7qsE/lSz9xBIIAAExeKLNdgxp3rXNXU5PLSqAztpDyHXBvt
	W9k36mQOLyvxu0pcHy7w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i3JW5-00048U-SY; Thu, 29 Aug 2019 12:27:05 +0000
Received: from mail-ot1-f65.google.com ([209.85.210.65])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i3JW2-00047i-O4; Thu, 29 Aug 2019 12:27:04 +0000
Received: by mail-ot1-f65.google.com with SMTP id o101so3168015ota.8;
 Thu, 29 Aug 2019 05:27:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=JISakUM5CfOU3yuiNb3Jx9kDoSgKiU08qnHS4spuyBM=;
 b=uMx9T41sHl//nY5JJ9Y8T3Put5bPxr0LgMqkAglGq7uqr9th4wDOOtFADiqIT+0wfM
 cfEAIk+lp2pPPC5wJjAIFnhRZczDi9rT1Nl/G6SpM8IZVoPI1xDrwCYwwomhAsJUMI5g
 hoVCIHpRphZFBV8458/yce/QOk5E/bATg2p1zqQ8MmyKCx8T11oH3+MZvgIKpf/ThNxb
 MjY0heclaxMkUF7klrWa7L+bD9427dq/CaLkrv13E8lNdvt0jUgRdYrIOw3Ba2h4+Jcn
 lkXJ+2b2qPet2VzNpk0jRULmQAGfiR52yi4NfYGxko86uUOrv2G1octTEI9DTl2yxUFp
 zxBQ==
X-Gm-Message-State: APjAAAWsdXCsvPh2k9vhFOwn5Mkf0ABWqc+76x8h3t/XlKKBNB4wWMqF
 B51VktLE8VJn8lw9Vb5dyw==
X-Google-Smtp-Source: APXvYqxQFzYed8B8VKY779L9N8Rwlqs155UUnDupIGmcQZ1ooy42GSMcysJRv7n+ECaVUK2B9ONlyQ==
X-Received: by 2002:a9d:7dc6:: with SMTP id k6mr6756221otn.99.1567081619385;
 Thu, 29 Aug 2019 05:26:59 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id a94sm708682otb.15.2019.08.29.05.26.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2019 05:26:58 -0700 (PDT)
Date: Thu, 29 Aug 2019 07:26:58 -0500
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v3 2/3] dt-bindings: arm: amlogic: add Amlogic SM1 based
 Khadas VIM3L bindings
Message-ID: <20190829122658.GA10660@bogus>
References: <20190828141816.16328-1-narmstrong@baylibre.com>
 <20190828141816.16328-3-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190828141816.16328-3-narmstrong@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190829_052702_787978_D759D69F 
X-CRM114-Status: GOOD (  11.53  )
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
Cc: khilman@baylibre.com, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, Aug 28, 2019 at 04:18:15PM +0200, Neil Armstrong wrote:
> The Khadas VIM3 is also available as VIM3L with the Pin-to-pin compatible
> Amlogic SM1 SoC in the S905D3 variant package.
> 
> Change the description to match the S905X3/D3/Y3 variants like the G12A
> description, and add the khadas,vim3l compatible.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  Documentation/devicetree/bindings/arm/amlogic.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
