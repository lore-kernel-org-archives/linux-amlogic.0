Return-Path: <SRS0=O/xb=RI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83319C4360F
	for <linux-amlogic@archiver.kernel.org>; Tue,  5 Mar 2019 21:02:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 509D42082C
	for <linux-amlogic@archiver.kernel.org>; Tue,  5 Mar 2019 21:02:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BbG9a5Lc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="qoV6uaaK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 509D42082C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uTBX46KJayRAwxraZSQEi88tRtEpsfup1aAeIEIg7M4=; b=BbG9a5Lc+s+R4E
	TuKlVH31LYgGl4VTwN1zw7z69QgLvwNrnQMRBeSCs+SsKGUa+XZ84V4HRABPTU10gJRYNezBDM5qr
	hPhbS5Cptx9WfAdGDHjLc0h9mF7CMF4h55qRt9JbjJ2rjwFRtTqeSWTIUxf4JwaCaspSbdgjPCMW0
	v5Awd5fVToN8kJQyZUiCLCB7MlsAzMoj+ed/akjfp6RopgpLiqFfm3m5Xqntnb01RJlseG3CzLMzM
	ENU5VZoMOKD3o6zys7tGss5C0bngbj3YxNZUp0Eyrw0VO89VWcISkA3/ohKX9XYNBU/0G3Y/PLB/f
	tUdcbOgfMdVN8BlhrCag==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h1HCF-0002NF-EA; Tue, 05 Mar 2019 21:01:55 +0000
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h1HCC-0002MN-1R; Tue, 05 Mar 2019 21:01:53 +0000
Received: by mail-ot1-x343.google.com with SMTP id t7so8691789otk.8;
 Tue, 05 Mar 2019 13:01:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pQxNOt7Dl/cW1ademESBOfmMiyHsuFlzWvnhwBEZDI0=;
 b=qoV6uaaKzb6LbYw679YS1Rp7x806UHwEheF9TeDFisLvCJUWBP4qle3cqi3bFAKVH7
 PvTmeG7qRquzuZzlEAO6Umu5koxp1+OBtj2hgj8a30A4LjHSgX2ykzDELWopddRJCAgX
 yq25YCqIoy9NYKxrNesCUXZgVOOcgMbloppEmoA//Evb2XrizEiKVNcMAI5Nz59SrVpZ
 +MiNqbEkg/g2cd/x0nZkBVysNbnXzM+SiG/PDxnf1tr8cYrkjY2Qzr1xLGua2MiZq7XH
 rABa79XULwKiwDPqkAElJJx8QQs1XCy1/T6f5oopiBSF/5EXfRKzJQ+VtTMEogmT2iAI
 +1Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pQxNOt7Dl/cW1ademESBOfmMiyHsuFlzWvnhwBEZDI0=;
 b=YlA22EjV4QMuktXd4Z59WPYbpG/wYwtIXsfPTC8xPbeTmUvXMh1feEBmYrfk8RSeNK
 kkPiojqm4uk3ZPym/Gf/ietbBbtrytdxi4AuZg/tLhK2Ip1jL1DzpKcdtW4k1B9iWA8W
 zZkUvN/WsDr2lZjFMMZs9wrfzZoolnPnvde0Yxss/ZvbEhi24k5QS7Wu6h6UZcyiak80
 FRZNCDHcbFZgIvXIcpSUyb/7KJiodjtBcP8osWrt30y/wNl9t/bvQZh5IlnWBDOaIE8W
 FBlSmVhUv1DpEu4osBHGDkppiFJwpt1OZWgW2sPIE7DqJIIjNVDE9gsZk/nji4nYRi5G
 gwgw==
X-Gm-Message-State: APjAAAWxRLWLEliNFw6FPySuubxPt46kXuxf2sRQlNiaie8BezgxSEUN
 f6BMUPw79v8S6+cqNkNh+fQ710+MHr1KBvL8ZWQ=
X-Google-Smtp-Source: APXvYqwh0EFjcTO32Iu7jLF7A++H1omTrsdnhrVXfIYwLrbcKiBm3h3lwnvsPYP1URFkDv/E+OOfFzk+0w6nyLlZ7vE=
X-Received: by 2002:a9d:5906:: with SMTP id t6mr2233013oth.308.1551819709301; 
 Tue, 05 Mar 2019 13:01:49 -0800 (PST)
MIME-Version: 1.0
References: <20190304111217.882-1-narmstrong@baylibre.com>
 <20190304111217.882-2-narmstrong@baylibre.com>
In-Reply-To: <20190304111217.882-2-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 5 Mar 2019 22:01:38 +0100
Message-ID: <CAFBinCA_bGFDOA5sLt26z++=LCtD_3xuaChQWDYJY2D0s2nHZQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: iio: adc: document the Meson G12A support
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190305_130152_109256_B398BCDA 
X-CRM114-Status: UNSURE (   6.84  )
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
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, Mar 4, 2019 at 12:12 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Update the documentation to expicitly support the Meson-G12A SoC.
typo: explicitly

> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
apart from that:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
