Return-Path: <SRS0=FFcv=4T=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7527C3F2D1
	for <linux-amlogic@archiver.kernel.org>; Mon,  2 Mar 2020 20:16:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F6B7214DB
	for <linux-amlogic@archiver.kernel.org>; Mon,  2 Mar 2020 20:16:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EbsAajRQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F6B7214DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rD1WC6XnaMJp06wctOyfjqeyDwmy3LKSqxPbUinpEFc=; b=EbsAajRQa/SkV7
	YUWFF7yZXlcno+s78gNi1Ob3QdbJ8/rjmudWVs8y51fbSjY688Xn0TFEGEyfWCVazT8qtugp6h6Ex
	/5wtsSp34tvb6Muppfh+4J2hfXA+aYlv781mMul7bkA4OGWRWWeDvGCV95KwxAvRT5CzHJp9Lmf0o
	r29I9DgWn9vmQNfSBAGF5bfvKlVNkSe69I9ZhDbdsypgVDAMELm4vWmci0cV4F3wHzHBgeG1IHpbj
	6eGMGC02nCIqM9z3+CLO0QmSMPmNOn0cjDoKplKjkZu2duXZbmbhoyOo/hZpczwFKvaGS8Q5AU5fn
	SbaLhM1Cd+e0+jvYNdWg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j8rTs-0004GF-2L; Mon, 02 Mar 2020 20:16:00 +0000
Received: from mail-ot1-f66.google.com ([209.85.210.66])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j8rTo-0004AC-Aa; Mon, 02 Mar 2020 20:15:57 +0000
Received: by mail-ot1-f66.google.com with SMTP id f21so558212otp.12;
 Mon, 02 Mar 2020 12:15:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Y8fx18mkjGrgWEeE52j2Dvkr7haAr57O85Z+l9O0SuQ=;
 b=NkrPjTWMzUfNnD4+OMVcC51QTgZSLzlfsiGNlYykZzRTtUTxmNVCci2k2Za5W8Fo8u
 2BacQi0uxyy8DQBiyHDqeHsXkigwhyoksPC9cyH9Xy+7k+lYD81uhtOhHGCXnVkgxSo4
 7AA97tP6VUTlG6v16smlkjcPcHUBUgY8EFiDmOuSq/T/EsC3nNtQNUf4TAn1j8DuFjdW
 +lMe3Mhpn6uxrDmoIGnkP+X+LytMoymUP/ArWRwlH43HPbtDQ29RDIHpGYbWcldxOxx/
 McIyFxflD5goydql8W8wLzzKeZ2mk9OAOd6kl6+3F0Gu8Y5HtNA938p2T85ExKWxQzp3
 dMFg==
X-Gm-Message-State: ANhLgQ0o8FVnNVNW16hjCZr1RFHgqcSLPWwctt7tSabs7C+xVq9diJ3U
 DNBpqKt+FTgtA+kKDG7j5A==
X-Google-Smtp-Source: ADFU+vtgqX6cTADKczY5cFP2sR6fKyifwr4RheTfsww81BtyoobjL4ONEbBcXkiHA69G160yLrxN1w==
X-Received: by 2002:a9d:5e9:: with SMTP id 96mr688518otd.307.1583180155388;
 Mon, 02 Mar 2020 12:15:55 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id p65sm6701124oif.47.2020.03.02.12.15.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 12:15:54 -0800 (PST)
Received: (nullmailer pid 22216 invoked by uid 1000);
 Mon, 02 Mar 2020 20:15:54 -0000
Date: Mon, 2 Mar 2020 14:15:54 -0600
From: Rob Herring <robh@kernel.org>
To: Jianxin Pan <jianxin.pan@amlogic.com>
Subject: Re: [PATCH v2] dt-bindings: power: Fix dt_binding_check error
Message-ID: <20200302201554.GA22028@bogus>
References: <1583164448-83438-1-git-send-email-jianxin.pan@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1583164448-83438-1-git-send-email-jianxin.pan@amlogic.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200302_121556_377030_F9C18074 
X-CRM114-Status: GOOD (  10.41  )
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
List-Id: <soc.lore.kernel.org>
Cc: devicetree@vger.kernel.org, Jianxin Pan <jianxin.pan@amlogic.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-pm@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 SoC Team <soc@kernel.org>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, 2 Mar 2020 23:54:08 +0800, Jianxin Pan wrote:
> Missing ';' in the end of secure-monitor example node.
> 
> Fixes: 165b5fb294e8 ("dt-bindings: power: add Amlogic secure power domains bindings")
> Reported-by: Rob Herring <robh+dt@kernel.org>
> Signed-off-by: Jianxin Pan <jianxin.pan@amlogic.com>
> ---
>  Documentation/devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
