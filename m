Return-Path: <SRS0=iDid=3K=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C92F6C2D0CE
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Jan 2020 22:00:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DBBF24125
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Jan 2020 22:00:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="k9w7NlvS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9DBBF24125
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ekVAV99iWQVlbRt7K8962W/8EpfNLUKbNbgnfaOYkHM=; b=k9w7NlvSvZp+XS
	wrnD6IQuRhV9MuWVibQqq13HAPZXnnChYEOb2ojUUvYKtImUSC1WTxMSPfLaLWNwiw0CM20GWK2oJ
	Pvl8mtytAa0+3qQhns3QkdtP+QXgiIfKsfqYLOYaWJ5kUGe2s/MBiEZqekWLl7567M1Xc7oleG/vc
	IwO+6zxIzWq4vPS7yTq43ZzOp0pvsKbVc3/+vdVk0fzNZb2rPXNq0FGsCrOyVCpzRo1yqRrBUsxwX
	9VgaaCl9FoIGn1DgtFAa/iNhwxXlZAwSKjp92EXQPnCgtMh2bQCxF4g3oFsCR24hjB6rzziB9xHbO
	rMEgR3qp9u6wEzd1OqTg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iu1Zq-0005OU-Ah; Tue, 21 Jan 2020 22:00:50 +0000
Received: from mail-ot1-f66.google.com ([209.85.210.66])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iu1Zi-0005Fl-AL; Tue, 21 Jan 2020 22:00:48 +0000
Received: by mail-ot1-f66.google.com with SMTP id 77so4425665oty.6;
 Tue, 21 Jan 2020 14:00:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=YR+Zx3t0R9EtJawzXHJuAJ023/cuhAooUF5TnzNGC0s=;
 b=Pv5b42Wimm3Ng8iVwXGZJXw+LIF9XdW3AbDUmFJ/UTjY058UbP6ubviUvdGv1MeiDX
 KhSoUVkI8Wl9wsUSipLCjb8RRzmXVd+mbQm5mpclybN1cv2hxGryKDEetVuTMbOANF9C
 qqN08OU9noc9YSD6wtGOa9TUmFmpLm0DfJDYtfx4LIyBX1yO7jDSAAzCIquQrak0w0fD
 XtehxIpaFgXLU81aBPoLnDqR4LNSFerEPKXkL2af1rFDrvFc8jkqhY70fSdHUlSJUxpO
 jHp9sDfXfJbxsoPQjlxMSYXWP9+K1lzeqn2NU5RL342ELDvpTefVpLCBLHgKs/yNpfnJ
 iybA==
X-Gm-Message-State: APjAAAX3QvQg3b8jy7zvvjf2Vv5CcFeE2rroRIm3fae97OIDoNJskOsU
 t5CNGBL9UU7guI2veQuYPg==
X-Google-Smtp-Source: APXvYqxcLtKqgiW0rjqOQtnpGB4zMIDBsBFxY3KVfQ8Uv1rKit0T2fEj2ciq1t+IrUPzAInLx3dGkw==
X-Received: by 2002:a9d:588d:: with SMTP id x13mr5021535otg.6.1579644040203;
 Tue, 21 Jan 2020 14:00:40 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 15sm9071739otv.20.2020.01.21.14.00.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2020 14:00:39 -0800 (PST)
Received: (nullmailer pid 13825 invoked by uid 1000);
 Tue, 21 Jan 2020 22:00:38 -0000
Date: Tue, 21 Jan 2020 16:00:38 -0600
From: Rob Herring <robh@kernel.org>
To: Jian Hu <jian.hu@amlogic.com>
Subject: Re: [PATCH v7 1/5] dt-bindings: clock: meson: add A1 PLL clock
 controller bindings
Message-ID: <20200121220038.GA13566@bogus>
References: <20200120034937.128600-1-jian.hu@amlogic.com>
 <20200120034937.128600-2-jian.hu@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200120034937.128600-2-jian.hu@amlogic.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200121_140042_396520_F9579B0A 
X-CRM114-Status: GOOD (  10.29  )
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
Cc: Rob Herring <robh@kernel.org>, Victor Wan <victor.wan@amlogic.com>,
 Jianxin Pan <jianxin.pan@amlogic.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
 Jian Hu <jian.hu@amlogic.com>, linux-arm-kernel@lists.infradead.org,
 Qiufang Dai <qiufang.dai@amlogic.com>, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, Chandle Zou <chandle.zou@amlogic.com>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, 20 Jan 2020 11:49:33 +0800, Jian Hu wrote:
> Add the documentation to support Amlogic A1 PLL clock driver,
> and add A1 PLL clock controller bindings.
> 
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> ---
>  .../bindings/clock/amlogic,a1-pll-clkc.yaml   | 52 +++++++++++++++++++
>  include/dt-bindings/clock/a1-pll-clkc.h       | 16 ++++++
>  2 files changed, 68 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml
>  create mode 100644 include/dt-bindings/clock/a1-pll-clkc.h
> 

Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
