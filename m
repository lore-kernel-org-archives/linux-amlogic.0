Return-Path: <SRS0=6rq1=3G=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E131C33CB7
	for <linux-amlogic@archiver.kernel.org>; Fri, 17 Jan 2020 16:36:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C6892064C
	for <linux-amlogic@archiver.kernel.org>; Fri, 17 Jan 2020 16:36:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bVt26rvM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C6892064C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ue9/kxKBLaUTa47tNBfexuBm6kWdaiPuu54OTC1E77s=; b=bVt26rvMgWxsp4
	0WlHL0GQIRcuOoFfUXJGBmvskjjXwaxQJkvPpny+kdaB3wc9V+magaSysDE+nebJgwqHhXZLtcMym
	rvQjaWkJCfkCnhWLO9ytW5XPpvZWlTFKsSdziKNRwv/IXxgczBHGdvCWTQxuLjsd2W8Q3oM5yualf
	bdZbkKLhCCjnGCqwl7HpS3PDEjYhbH4E/Ovd14f/yYAXJvm1fCojGYSSLz0qy+adzRC5l6xbnpvVj
	LZ7Y36dsmQzL4OUHsYg6f6upeYdIHv/HVM0gW8/EB2sh2Mydj3cZM4bxp8E8C0QWqabsDKVTk6pmp
	ys+rxb8kMWjnuoM2kwfQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1isUc7-0001jl-8Q; Fri, 17 Jan 2020 16:36:51 +0000
Received: from mail-oi1-f194.google.com ([209.85.167.194])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1isUc1-0001iy-JR; Fri, 17 Jan 2020 16:36:50 +0000
Received: by mail-oi1-f194.google.com with SMTP id 13so22667562oij.13;
 Fri, 17 Jan 2020 08:36:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=IewFuBKmGoCSK8RfRVXaLBq0CbcaGKATXKy1D8qkvcQ=;
 b=rk8ExYpxehrlQjKtGwwHrTu5TfJyKYPNLQSIVPbkOFsjXR+0VrO0uFtpBJpxGygwlJ
 cZoBSayMzvv7sa0fooCr2oftiEk/eaS/d2S9siC40YexlOtdoef2H3cty5yZXx5Ahn57
 9RfhulVRc8piEBzw1ggGPvIlW6YDq9BfpEKHBswDhRI4z4BYGQDWGyzUBxNHSasJwN6K
 XZ9rlN43fizqQm1X7Xm4W0miSYd4Xxz5zfeBtlwOx/wupCffrgSs4Hp2WgnpNZp1ZzRN
 NajWQkxx9WCZm3J+uSdnJKWR9MAPOQBtloBCP7BsFRpoOvCr250ouLda4oivOzgf463E
 TfwA==
X-Gm-Message-State: APjAAAX4Js2Jmz9YCyvKQUcgPwRZvK/7uyna/cW24v+eqX2MGL4ZXKlp
 +I7FriFNMY9W0vvLtoOa9g==
X-Google-Smtp-Source: APXvYqyOFq+xE1QS2BO3+poxNMtpcUaYiXNpuJ/xk/dtoMC4kTw/mVBLr9Fbc+codyaUFKv0ygnNUQ==
X-Received: by 2002:a05:6808:9b4:: with SMTP id
 e20mr3833973oig.37.1579279004339; 
 Fri, 17 Jan 2020 08:36:44 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id z21sm8975604oto.52.2020.01.17.08.36.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2020 08:36:43 -0800 (PST)
Received: (nullmailer pid 1692 invoked by uid 1000);
 Fri, 17 Jan 2020 16:36:42 -0000
Date: Fri, 17 Jan 2020 10:36:42 -0600
From: Rob Herring <robh@kernel.org>
To: Hanjie Lin <hanjie.lin@amlogic.com>
Subject: Re: [PATCH v6 1/6] dt-bindings: phy: Add Amlogic A1 USB2 PHY Bindings
Message-ID: <20200117163642.GA1636@bogus>
References: <1579220504-110067-1-git-send-email-hanjie.lin@amlogic.com>
 <1579220504-110067-2-git-send-email-hanjie.lin@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1579220504-110067-2-git-send-email-hanjie.lin@amlogic.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200117_083645_640005_158D615E 
X-CRM114-Status: UNSURE (   7.85  )
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
Cc: devicetree@vger.kernel.org, Victor Wan <victor.wan@amlogic.com>,
 Hanjie Lin <hanjie.lin@amlogic.com>, Jianxin Pan <jianxin.pan@amlogic.com>,
 Felipe Balbi <felipe.balbi@linux.intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Michael Turquette <mturquette@baylibre.com>, linux-usb@vger.kernel.org,
 Yue Wang <yue.wang@amlogic.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jian Hu <jian.hu@amlogic.com>, Liang Yang <liang.yang@amlogic.com>,
 Qiufang Dai <qiufang.dai@amlogic.com>, Xingyu Chen <xingyu.chen@amlogic.com>,
 Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, 17 Jan 2020 08:21:39 +0800, Hanjie Lin wrote:
> Add the Amlogic A1 Family USB2 PHY Bindings
> 
> It supports Host mode only.
> 
> Signed-off-by: Yue Wang <yue.wang@amlogic.com>
> Signed-off-by: Hanjie Lin <hanjie.lin@amlogic.com>
> ---
>  .../bindings/phy/amlogic,meson-g12a-usb2-phy.yaml         | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
