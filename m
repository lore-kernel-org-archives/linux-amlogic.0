Return-Path: <SRS0=GxHq=RD=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1E6DC43381
	for <linux-amlogic@archiver.kernel.org>; Thu, 28 Feb 2019 18:27:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99A1C218AE
	for <linux-amlogic@archiver.kernel.org>; Thu, 28 Feb 2019 18:27:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NVkHCMuw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 99A1C218AE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VzpZhbQcKGwIf2Mhv0ojU8hK4RFshMSeTrhQy8ehaCA=; b=NVkHCMuw5FOV45
	gM8BX1uC3EQlVpXjQf9wpnTszBqgfWApsRtzaYvUEOfO9PDwWPphWm0u5f27L1y1d73QujsVL9Xzc
	k9GW8TR9e+9nZIt4EXXFcDNtRfIExoW9G0fTMzOle3/Ou2qdHmBo4nnOkuFRSsZ4HRaGJe3uuSjzj
	MALLnGQcVrIxc3zw2xn7IvMWuePnkhaREp+PNMpl0+Jnt7YCiJarWawe+oVMgeqw8DtgLs6pZXpac
	oRhiZApcXXBqFMFKabm2keA7tm2tzBcYtyNDCNc/7JmTzxoELXPDTIanWSLp3oC68mGQH1LSzU6bx
	9UniDtW3pLhoZ/U/KkdQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gzQPG-00046M-Aa; Thu, 28 Feb 2019 18:27:42 +0000
Received: from mail-ot1-f68.google.com ([209.85.210.68])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gzQP9-0003xH-Pe; Thu, 28 Feb 2019 18:27:40 +0000
Received: by mail-ot1-f68.google.com with SMTP id q24so18614675otk.0;
 Thu, 28 Feb 2019 10:27:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=xNovduMDo+bsSSdGYFMtjocQrj85X9mGKNQDCwYuzkg=;
 b=WUkP61x0nAWizB3pprhu7YGugpEUp5e8m5dJFB8J37/hauZEK/poKLUJixvjBnVi3z
 n6fvEU7hKrJKWIiRZDvigylLF8D4E/UwRr2vzyirZLasc2Zi/y/WND6IG2pwrdDgi/bo
 P1Ozi7bmqhOMQVP6rCnH7XFD7OJY4s8boqCDMlQ/YoLHcvYzWQH4+Xdm6Kss1ctu7w5Y
 N5AxIsHfxiPhvYCKB30kGPYEDrI2Le4feMpM4aUCdorhr3dRRwNJ9sO5hg3e/Nx7o2UV
 nG6jDjAIaO+MKo87Of5L1WVuLHFDXZmssrAjMYAwuYMmgjlYPGVQQ64fDnC73eKQ4xya
 Q9cA==
X-Gm-Message-State: APjAAAVhRBLZkMyIpB2e7VxZumyG/0Szcc7spHdhIAB72945E1l3Pz1z
 teeCX647Z1oUjabr59VLVw==
X-Google-Smtp-Source: APXvYqyNztIquLFpPlpRDDOooGeKjMhiVzNnt8fny7bkcGDxJPnYOcFHdFPJEM4teymiA5fIbja7Hw==
X-Received: by 2002:a9d:32e5:: with SMTP id u92mr681650otb.208.1551378454720; 
 Thu, 28 Feb 2019 10:27:34 -0800 (PST)
Received: from localhost (ip-184-203-129-180.hstntx.spcsdns.net.
 [184.203.129.180])
 by smtp.gmail.com with ESMTPSA id q8sm635449oih.6.2019.02.28.10.27.33
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 28 Feb 2019 10:27:34 -0800 (PST)
Date: Thu, 28 Feb 2019 12:27:31 -0600
From: Rob Herring <robh@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH] dt-bindings: clock: axg-audio: unexpose controller inputs
Message-ID: <20190228182731.GA25353@bogus>
References: <20190213095835.17448-1-jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190213095835.17448-1-jbrunet@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190228_102736_010481_461B2D16 
X-CRM114-Status: GOOD (  12.42  )
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
Cc: Maxime Jourdan <mjourdan@baylibre.com>, devicetree@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, 13 Feb 2019 10:58:35 +0100, Jerome Brunet wrote:
> Remove the bindings ID of the clock input of the controller. These
> clocks are purely internal to the controller, exposing them was a
> mistake. Actually, these should not even be in the provider and have
> IDs to begin with.
> 
> Unexpose these IDs before:
>  * someone starts using them (even if there no valid reason to do so)
>  * the actual clocks are removed. The fact that they exist is just the
>    result of an ugly hack. This will be resolved in CCF when we can
>    reference DT directly in parent table.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/clk/meson/axg-audio.h              | 20 ++++++++++++++++++++
>  include/dt-bindings/clock/axg-audio-clkc.h | 20 --------------------
>  2 files changed, 20 insertions(+), 20 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
