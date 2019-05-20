Return-Path: <SRS0=EW34=TU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA7FBC04AAC
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 11:25:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0B4B20856
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 11:25:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dL1oiPQh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="KH9eQMCg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A0B4B20856
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8JULPtrw3WSrBxtJHznt8Zhi6usUpOnszdJJ9IWZ9vw=; b=dL1oiPQh7BPSnl
	WG24OaHDTsSDA/u8pnkcI57JHgBShTZZNKDkkRxukiQ6dTPPyF5xS/LEgepgQWeZzf4GaOBnfk1bQ
	4B12PlPj01aUmuSU5IaSWVhRZhue5AP1oxygV0WiBLeG80+PkGzAi8kIQ1MeuEYWVhPCDUCw//Y8r
	7kV3WYgQoh3mFtBfE8szxNNTjgSEBc/xq1ZvJqjNBCSagBN5O8dVxhoPETTYqFZ9h7d1iqZtnFPq7
	ri/7txrw8FAHsavcmHdjo+1nNa9ZO4sZjg8O0dYNIjl03LMxwYayAxWmJnyfHNH9V5hhBIJpdlhTi
	x4l9KxQv4dOA+MywpntQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSgPy-0006fk-Hm; Mon, 20 May 2019 11:25:22 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSgPv-0006ee-3Q
 for linux-amlogic@lists.infradead.org; Mon, 20 May 2019 11:25:20 +0000
Received: by mail-wr1-x442.google.com with SMTP id h4so14169754wre.7
 for <linux-amlogic@lists.infradead.org>; Mon, 20 May 2019 04:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=jjlgRqd7/3GdbXtzivENZGFK0W6UGcne26rpZyW4X3o=;
 b=KH9eQMCgAcp+vePFV58EJikabmf6tk7CPaw16nowcMlcJ9rfsp+jqtVbW4ziTIqtJn
 pWBQacIbPY+n191m2WqHswFszkMDXBbauB4/HyE6ZwSzMGnaDM8mc8BC2ItArt3r48p2
 hDW8UVhT/aOcBwNkv3AV39O5SBWYxCLPywsppIcLpCzNlu/SO8Kh6XrvNVW+vDf3BVGO
 dgf7CDa6gkuA6sajvyDCOePcqFxpVeLPk1UFIDhhneZxknvlnqxb4xVh9g1wgPR2ykgo
 bBj2h5PQdq+NXx0DTW2epwkjiXbsm30gJiyeKCUH09+ynK2MOyTfMXH1G5PwwvMSpl9b
 Ihnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=jjlgRqd7/3GdbXtzivENZGFK0W6UGcne26rpZyW4X3o=;
 b=WKXmzzXaUIV4rrDD9212P6e/dH18kaGCOAnL1mT6YGuLPkHWrcPBHhcTOqQStMUWrH
 MtEjT/BvArr2ismbCxa5QlKPITq6JQpixcMSGTQ1KsZ1k8HxetbdY/7VMtsLPY+ntEvJ
 2Tbbc6JVZ+ADga5pYWk46zWzB0HWFScrE0KYmWlXxcs5aKFNyYfU8jakOeIj3YHl7zpe
 t/TlpIuNh3vpRQbgoLTGBO0IG9+Q4T+9xyXwjCcznTfrRvaJJxImztVu+/4fwfnJ9LMF
 k4eXW2CbZQrjWbvWnU30I+D53/mU+YTCuReJX7xSa5Ez1CDqBjaXold8D5547ucGZkc1
 A/5Q==
X-Gm-Message-State: APjAAAWWJ1wkEeVAtQ9WkPyhkniFbuMUwnsl/NheaMR/GDAQasAKy7yJ
 T0at8QgM0tMmL8xw5aeU369b3g==
X-Google-Smtp-Source: APXvYqwD19LntnajDRGhTBQ60xM1YyUoHyMgHC0GjSUru7HiinTiDHC+FsHKj7HQJg4LRDftmwD8dQ==
X-Received: by 2002:a5d:624d:: with SMTP id m13mr45190092wrv.305.1558351516800; 
 Mon, 20 May 2019 04:25:16 -0700 (PDT)
Received: from boomer.baylibre.com
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id m13sm15690440wrs.87.2019.05.20.04.25.15
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 20 May 2019 04:25:16 -0700 (PDT)
Message-ID: <fa275d9d4a451d6ef5332a6836e8316c5644d913.camel@baylibre.com>
Subject: Re: [PATCH 1/1] clk: meson: meson8b: fix a typo in the VPU parent
 names array variable
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 linux-amlogic@lists.infradead.org, narmstrong@baylibre.com
Date: Mon, 20 May 2019 13:25:14 +0200
In-Reply-To: <20190512194300.7445-2-martin.blumenstingl@googlemail.com>
References: <20190512194300.7445-1-martin.blumenstingl@googlemail.com>
 <20190512194300.7445-2-martin.blumenstingl@googlemail.com>
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190520_042519_193150_3BC9B1F5 
X-CRM114-Status: UNSURE (   7.48  )
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
Cc: sboyd@kernel.org, mturquette@baylibre.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sun, 2019-05-12 at 21:43 +0200, Martin Blumenstingl wrote:
> The variable which holds the parent names for the VPU clocks has a typo
> in it. Fix this typo to make the variable naming in the driver
> consistent. No functional changes.
> 
> Fixes: 41785ce562491d ("clk: meson: meson8b: add the VPU clock trees")
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

applied to v5.3/fixes


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
