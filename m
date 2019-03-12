Return-Path: <SRS0=/Yv9=RP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EA9CC43381
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 Mar 2019 18:31:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F2F6E206DF
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 Mar 2019 18:31:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XGJ2R+U8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F2F6E206DF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6NF75Vs6gA0heltPR3DKjK3jMQ+U7pOO6E52gjUkog8=; b=XGJ2R+U88w346p
	MkcPtV7Oa0VyHBdgZJLLamKB01uYlY77DRI+qkxPlnsGUpXm4Pgce6DVook6HEQTFmKtd6ZuBkVUs
	TV41amG+734U4D/X3qSD2iSbENQDYD3XHA1DoDX/DPFyoGyzVtnt264OcAxZP27cajVwtztFU4Zac
	6Zob3xyubsawAe33b8h+6PDU0W8jzBwpf/meGr5iNvXTb1qsDvOhZubRsMskkMdX7CgHX87IMEniL
	vMBLZpnxZ86/3u0aSxUPvTUWtWC6uOPk/M4cSmaTk0f5xCLsPyCRBLt5+5EBcldBN+UY3IIMg0uM7
	HJDENfRx0cv+stred3fQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h3mBt-0004OK-Qt; Tue, 12 Mar 2019 18:31:53 +0000
Received: from mail-oi1-f194.google.com ([209.85.167.194])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h3mBr-0004Nx-SG; Tue, 12 Mar 2019 18:31:53 +0000
Received: by mail-oi1-f194.google.com with SMTP id k11so2411150oic.7;
 Tue, 12 Mar 2019 11:31:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ouAdwyjr2qNz73G9CWAznr+5Z1iaBbbvv1n+gDGOhD8=;
 b=k0UW7ZCO5gzP6bbiFlHRTSXghVZKDw1Rk/3pGku/zuIHjUuJ1+lFNcbv71qEC4dFYW
 tlt9As7x/aMAyoyHPPollSRufszIVy1ipu6Lq//P7Ozz9zKZlr5VHsMGegmdH9gIMql4
 p+WzZwxHKy5Iq7iycdarBvEmRL7IfA7TGIMWHnQu5ikretDqPzlTBJrpfYefmC00yl/K
 IeAHbPQuhCgiT8lsXcm/iQCkdYDoyU3/DGI1/kP6RTafpwdWdbDY4+X2op52zOk1yp0U
 yoOol5d6+tOJjmyPwsNykvy0pgr/H91w67OoQ1j+dstshGIZqB1sUV7qJl43xKJRL5NP
 8ARQ==
X-Gm-Message-State: APjAAAVIEUT8+IXmo+dxyC78GtGWjrS7Ig0+ZvtVa59+SS2mdA+N+vju
 qiOHrBjcFBd2u9ljj74NqQ==
X-Google-Smtp-Source: APXvYqyeQ6z7T2ypLkim6JZe+hFYiV5XYZ8MBNryX7d2TJnTavvIy6x0/Qyeo/Y5TK2cUNtGwJAOiQ==
X-Received: by 2002:aca:d841:: with SMTP id p62mr2697171oig.56.1552415510881; 
 Tue, 12 Mar 2019 11:31:50 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id b7sm3569288oti.71.2019.03.12.11.31.50
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 12 Mar 2019 11:31:50 -0700 (PDT)
Date: Tue, 12 Mar 2019 13:31:49 -0500
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v2 1/2] clk: meson-g12a: add cpu clock bindings
Message-ID: <20190312183149.GA26591@bogus>
References: <20190304131129.7762-1-narmstrong@baylibre.com>
 <20190304131129.7762-2-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190304131129.7762-2-narmstrong@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190312_113151_926326_6F967042 
X-CRM114-Status: GOOD (  10.39  )
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
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon,  4 Mar 2019 14:11:28 +0100, Neil Armstrong wrote:
> Add Amlogic G12A Family CPU clocks bindings, only export CPU_CLK since
> it should be the only ID used.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  include/dt-bindings/clock/g12a-clkc.h | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
