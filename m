Return-Path: <SRS0=GL6B=QQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D706C169C4
	for <linux-amlogic@archiver.kernel.org>; Sat,  9 Feb 2019 00:04:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 500BD2177B
	for <linux-amlogic@archiver.kernel.org>; Sat,  9 Feb 2019 00:04:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="let40Gs+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="iERiP2gI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 500BD2177B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=91xGD0fCPfr8CUIYHoVLHw46r4RlZemOZoOajUXwnlw=; b=let40Gs+7R39Ss
	08k1Q0DxYx+uE33XjTImaJifdrVbwjds0BZ//efnx893H4WwfyHDqN9G77Dw5ZoMm10Q56kXw7wvP
	H6lNdiUW4HgxGdYsVc2jpeLvzflS9AFhQRI0adH7A147SrGNx3OlJfYc9r7OgZFN/TDN6Gi5OKO49
	4mvmXhWkIUAMiUNsbecF4/3ZIqB4s0MyMpuYo885m03xHTQhJBJObb1KvFfHJrcTnntHuQxxPnwqj
	KlmJdVAWfHTiiWc9ItC/1VPrCJzuxrJP/xfJH4U6hmompUH7x4V2rm/TtZPb/UhbuItfBmxR9HZds
	ZWugYnm7UnCsBqy7I2Gw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gsG8U-0005Pj-0M; Sat, 09 Feb 2019 00:04:46 +0000
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gsG8Q-0005P6-2j; Sat, 09 Feb 2019 00:04:43 +0000
Received: by mail-ot1-x341.google.com with SMTP id w25so8754592otm.13;
 Fri, 08 Feb 2019 16:04:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BRbSVSMAAjLz79nFPURIfjFzOJxrbDjbmCLm4dxSPuo=;
 b=iERiP2gIYG+8Y+P6PHCJpoPfXd+Km12rUAOxPepG583EWT2hGOb2CbnlTXEuMoys0u
 PaifffNYcOFSN55Awz2Sl76hdxWJD6jdcOoVX/UaO+rL5imfcSHJZkbQxuq+0EVtQtBH
 8Y4FZoh5mOUc+IYzhbfWaDSQJCGGnxF+tT7cSfkoWC0eYZdMuG5rMgfn0rYqvL5JA9nu
 mnjo1tNhOub11vfz+P6YO+Fxzfb5/6wcBVyhsZYsCQ5G9BdplaAr3A8HcsI2drpXmW0c
 RaUNOiRIMN/QMYmCyxMVvTOp2h7XVbaQcNtf8RIoPED1kmyJs4KwzbpXH5AdWur2kVAM
 MT4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BRbSVSMAAjLz79nFPURIfjFzOJxrbDjbmCLm4dxSPuo=;
 b=lVlXejpGm8VxMHwUjGQ+QA6W8laikUM+ofi4p32PWX+iyqGbmAR5pM7M4ER+NJwqpx
 gT8d13yemw8y+9o7ZvIYin2KfzEpl4jcuNlwayMm6OeLQSavPVoK/DvoRsvFhJpUKNqo
 wF5xwqZ8KYdVZ5MX1XqRSsbpV9uh6+Cq5KKpxfv2XdMZB29Kr0JD4y4oeEWkEjGzA1HM
 c1/nheh48Z/4NCb0IaPeWaXkIwKjJ8EW1AaNdJnI3WL9R6YdQpfWJSEoU2+s5Hl9c3/w
 hnG1p0B9V+MOkCW7owb/haRiXJNrxnIEUxiEjV2VBlvBS10adDi8CqyRFVeCMo2vzyec
 3RLg==
X-Gm-Message-State: AHQUAubKchDWzUV1CB518gsCxGIfCKyNh+4AMWknvw6PHrmOKbfFnM9X
 Klmw3VfrF74ta4ZBv5iQLWo0Rj6FdLDv2y8+e24=
X-Google-Smtp-Source: AHgI3IZJ/+56P9Q2b5cGshNPs+AYBn1bpODpXSRsY7iNg9HWaqcyr035L88biBurKAaCB6SDdpOz/ysfQFNk6S3sQWg=
X-Received: by 2002:a05:6830:2010:: with SMTP id
 e16mr14993174otp.86.1549670680878; 
 Fri, 08 Feb 2019 16:04:40 -0800 (PST)
MIME-Version: 1.0
References: <20190208144226.15102-1-khilman@baylibre.com>
In-Reply-To: <20190208144226.15102-1-khilman@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 9 Feb 2019 01:04:29 +0100
Message-ID: <CAFBinCBwjsoo5Q9D=tyUpCa4f=XZc_EX7UMwYyy4v4Pkr=6_6A@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: amlogic: add amediatech x96-max
 bindings
To: Kevin Hilman <khilman@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190208_160442_618921_299984AF 
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
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, Feb 8, 2019 at 3:42 PM Kevin Hilman <khilman@baylibre.com> wrote:
>
> Add new vendor for amediatech, and initial board: x96-max
>
> Signed-off-by: Kevin Hilman <khilman@baylibre.com>
> ---
> v3: fixed the SoC name
>
>  Documentation/devicetree/bindings/arm/amlogic.txt     | 1 +
>  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
assuming Rob is fine with having vendor-prefixes.txt and <other
binding doc> in one patch:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
