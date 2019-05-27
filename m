Return-Path: <SRS0=xEjq=T3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B7C2C07542
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2019 18:24:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCE48208CA
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2019 18:24:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jb1kZl0F";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="gXbrkZHe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DCE48208CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1qdYoN9t6+uE7D5d41C59tGsr0pBrOW7zokrs2CvCMM=; b=jb1kZl0FnX3tCC
	LL7BRSoK5R6q9sofYbtgJiFLJMaebQlACXlrLZzmLs4n4kNeO8ieoD25CJ9/XtFEcCNNosldzlAMk
	jHfLld6S8Kir62YMMVIVE0f/DnHB2K5R4ufldrYjIQSgCE4XjNxk8PDUU78N5gXbFEtsdwKRLfjQw
	9HhiWxR44H1eRaUCjwdzwFyHuLMXVuOehqoZtEhcNXqCGF5IuSte5+ZsiLakq942miqdDeIojm4DG
	/KyU1IMvdh0aa0PGyQD4r4IalUX8PHqSISlp6/EtVgWeHXATbKlVCtRDKOi2K4JD4oXHBHontY1Cb
	RvDyBX3DWgxDqVJXV03g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hVKHv-0005KW-LT; Mon, 27 May 2019 18:23:59 +0000
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVKHs-0005K6-Rd; Mon, 27 May 2019 18:23:58 +0000
Received: by mail-ot1-x343.google.com with SMTP id s19so15537853otq.5;
 Mon, 27 May 2019 11:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yAp05ZteI172+2ehJDHx5CjetukVgwIirAu6MSeV5Bc=;
 b=gXbrkZHeoUgjKSE7PIBXVYeuyn93nqDPVilRWjegA9vEdkVjJKpM5Dp8XcYoYu3P60
 2giEMyye9CnFMs4k6l4Zb8ONeJZofSJujLVuioZWKtcl9X3VDmaIGZR5jFWf8g2jWtyM
 PhtdgOcbrJeF0YCo4lC0xAWPDy68kwPqvx2RiPJ9cTUbePW7R/nMC2SBZfWf1qCsWPLo
 9XnAlOHhUd/ETM4QBLX8VZ9KK/SKJNZRDpuety3LopMHVSftzcyG2mOkncv0/K67gS2v
 VbrUy1W3wzKZzeBe7blRPay9GZeW5Pa2qc0ORlNgCdk0raPeD+fKgV++Qp/2LTYsrMWD
 xfiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yAp05ZteI172+2ehJDHx5CjetukVgwIirAu6MSeV5Bc=;
 b=HQMRXli229vBCt+Wi39Jg4qxRTfR+3xHk7qMqlebjRhsEV3ZQBGVPoZsKqfPUlsuOZ
 Eaem1cX7ga9kFVajVx8mkgO1RO02Ds+9Ywx1maebrMFqI3bfdxwoFV21LHuCyYXK6enx
 Cbt3FAcGyu7qSf8jyKDffREy8cUdjbsh/X164LbE66rAqBcwMRiIZak6Zjy2UaE9HNUx
 SWSSd6F/RtiKaZq3rSTkjtSeN0WOrdZIqKRFuL30A5x78aDx02RJJuWRNBTZcA8TIC0a
 f/6sBiV3OzkFrQ8nNZ54vlyPqJ2GBl/GOyF0fTq1rnw46IE6PZuo5k4olkrsPU2dpVgF
 KBoQ==
X-Gm-Message-State: APjAAAVQVxbX12fmDWbK0tajT7l0s/Nsdgsm52MFhs+Akf6EUhEGvo5d
 Fjp2gC4k9vUfluOYcybQAPRe6KHlE1NJ3ApZW+Y=
X-Google-Smtp-Source: APXvYqysIaOypAAttCGsEzcLi66R8e4Aznpcqh9wB/pRH/Lk/MVeM9y6pA18bswmjtVq11U5LXpfUShz+nKPjQWx0/Y=
X-Received: by 2002:a9d:32a6:: with SMTP id u35mr61348755otb.81.1558981436041; 
 Mon, 27 May 2019 11:23:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190527132200.17377-1-narmstrong@baylibre.com>
 <20190527132200.17377-7-narmstrong@baylibre.com>
In-Reply-To: <20190527132200.17377-7-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 27 May 2019 20:23:45 +0200
Message-ID: <CAFBinCA=habC6ytrMG2HYw=e-ikmNNgy5jzUswZ-44K76r8LeQ@mail.gmail.com>
Subject: Re: [PATCH 06/10] arm64: dts: meson-gxbb-vega-s95: add HDMI nodes
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190527_112356_892038_E10A0E4B 
X-CRM114-Status: UNSURE (   7.07  )
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
Cc: khilman@baylibre.com, christianshewitt@gmail.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, May 27, 2019 at 3:23 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Add HDMI nodes to support graphics on Vega S95
>
> Suggested-by: Christian Hewitt <christianshewitt@gmail.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
just like on all other boards, so:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
