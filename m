Return-Path: <SRS0=kT+d=VT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0DE8C7618F
	for <linux-amlogic@archiver.kernel.org>; Mon, 22 Jul 2019 22:12:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 71A6721900
	for <linux-amlogic@archiver.kernel.org>; Mon, 22 Jul 2019 22:12:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SkDKyZ/S"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 71A6721900
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oznlKZSh6i1cbgfmq6lc1lXwT8XkRt70CbeA/K4equQ=; b=SkDKyZ/Sw6HeBr
	NF93aHlLr3p2d39NoXFPCn9SVpqPBMc/AfueZhyhKkgz/oVNDQM9+7hn4eP9rHi7riN1H12db++1U
	TKemrJhq2rXmnQPoDDfQGtuqyM0IKgLjPxD+qIpp7S8zfNoDETR54m/THSaY3K2QxnxaaI/n3yHOu
	SQN+Favd5daxInQXDZuO3SOb8Y3auGlzLvXn0zZO+r3Uz+FtxjUYO+KsWpP8DqzsgyEotqDNcIgEt
	h5hAEY9PKJDaXw4BmBKSHHy7CUHjM2NlWMHQkAa1Yft04WKTX4dAbd+2H+RIkxnLs0umcn/QVhwnx
	bND+sVbaMTElfKc5faOA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hpgXs-0006KR-Uv; Mon, 22 Jul 2019 22:12:37 +0000
Received: from mail-io1-f67.google.com ([209.85.166.67])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hpgWv-0005qy-SQ; Mon, 22 Jul 2019 22:11:39 +0000
Received: by mail-io1-f67.google.com with SMTP id o9so77566136iom.3;
 Mon, 22 Jul 2019 15:11:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ZZjeYarbm2uHTbPqEU/SfJr1OMvMhmzpfbxIokfphLg=;
 b=ef5vPuQlpbO0UGsT8w75iGFGzqwSlBzvfWU7LgtYX3NYqQDYKZfehpwZfZOqS/qR4T
 F0gJ6wHdita6Pd+10SefG2EVJJ/yNrN7HcLe8dmnv0Z2woF977hU7apmF08+qHp/vxvz
 g0jjHiDq5jQc+EQreAGfwB1jbeOAROXCRVNvtCQAZzp6Qz6p+UUJiAPZpKIxvxANMpGl
 mODhPsN928Q4Ke4Ki2C5i0mqvWmGTOwdYYGwbn6Tbhp9X9aMYDNSrPrTtRJQ8GjClnre
 FYaViAwUG6MgCbrdie4bLoYpEFgLuwDMvg3CYkgqv/tbFwTAuLDH5HYevzzPrsLe6oh2
 shJQ==
X-Gm-Message-State: APjAAAWvmGla7dbm2Bozxdqa6T/BnEebBPEfy1S69uIL4NjAzu9rsrm8
 mYUukQV/7F0eWC9XLyxsjQ==
X-Google-Smtp-Source: APXvYqwybodqBsnRMzwxflKMmSxt7BwWQbvI4+93D/Ql0XrEVFvtTEtzmr5T6L7GyUnVm3y5riatKg==
X-Received: by 2002:a02:a581:: with SMTP id b1mr4163149jam.84.1563833496727;
 Mon, 22 Jul 2019 15:11:36 -0700 (PDT)
Received: from localhost ([64.188.179.254])
 by smtp.gmail.com with ESMTPSA id p10sm58670815iob.54.2019.07.22.15.11.35
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 22 Jul 2019 15:11:36 -0700 (PDT)
Date: Mon, 22 Jul 2019 16:11:35 -0600
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [RFC 07/11] dt-bindings: media: meson-ao-cec: add SM1 compatible
Message-ID: <20190722221135.GA32382@bogus>
References: <20190701104705.18271-1-narmstrong@baylibre.com>
 <20190701104705.18271-8-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190701104705.18271-8-narmstrong@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190722_151138_259848_7740CD08 
X-CRM114-Status: UNSURE (   8.04  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 khilman@baylibre.com, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, jbrunet@baylibre.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon,  1 Jul 2019 12:47:01 +0200, Neil Armstrong wrote:
> Add AO-CEC compatible string for the Amlogic SM1 SoC family,
> a derivate of the G12A AO-CECB controller.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  Documentation/devicetree/bindings/media/meson-ao-cec.txt | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
