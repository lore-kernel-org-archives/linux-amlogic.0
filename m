Return-Path: <SRS0=7V7W=DA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5E77C4727E
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Sep 2020 01:28:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 63E292399A
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Sep 2020 01:28:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gPupt9GT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 63E292399A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tF29fX/qHRJDx1Ih0S/wSJLMquT6vZfRdneQ8ZWDOwU=; b=gPupt9GTNsowmY6qhR8AHv5Pl
	cF3zAE+p8eX7vd7/vBThh7goJrf0yhx8QnFm3fpzQzsRCAh94uhk+g5RaL29o4KMESI9B/43/dJo6
	ZyoNtAvRhvbvENA+XiBE+4QqxQJEuvoHxtJkLjvsj8eq+lnb8C/Mt5yCL1PYCnw+/WEdOrkyIfj8Q
	VLwlKkPEOAbmd1HivN59kRtQPvvoLReIz3K8+dFVocl6rXTTbM15yiE0+WqrhuW4L1wp5U1RxhtPD
	PHrhee+0JjX8v1duQ7BZ/JfJdazWidb7fx4Ey6RzFcTKRScWpOyS4mmn55KPy0EQ0IYy/0KnF0Mao
	vIxqKx4oQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKtaM-0004NL-G9; Wed, 23 Sep 2020 01:28:42 +0000
Received: from mail-io1-f68.google.com ([209.85.166.68])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKtaK-0004Mb-R6
 for linux-amlogic@lists.infradead.org; Wed, 23 Sep 2020 01:28:41 +0000
Received: by mail-io1-f68.google.com with SMTP id z25so21913903iol.10
 for <linux-amlogic@lists.infradead.org>; Tue, 22 Sep 2020 18:28:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=GvvIo3jDY0VYkefQndKzNnYYk/UrLw7GL4P6C4Xiiqs=;
 b=ZmSPZlsgZXbtFS7edxzAlJFcl68sry1Y413o/NBVy3sMI5Nb2EOW+2PJ8Hy7wnTsvb
 RUJ9GFPBXwRhR7+RwlDDwQg5YnOfXCgEt07ukMLGj2LI5b2k/61HMlW3ByLhZaxuj+b+
 wC/pxjOXVcuGGYyu1bGJgkyDZej15cofp82ZcWxZCZGYFGSDFaePr/NLQShpbRBfyvRJ
 wyHon1K97peYDLne12KirXG/5G9L+wFAoIKjoQmRj+P+2dFFg/f33Wv6mBzjMzbe2+Ba
 UwA3WTLmYYJ8pkSqmCuS2DpiUVPa1R52dYNC/d45EGLw2ix9f6nc1g+/rQOIXLueLwRX
 4oIQ==
X-Gm-Message-State: AOAM531lKYO3gY74N5uOacL+h3ZaNNY/7q2FgBYGW4ew/EThoB74z1fO
 J37m72fvpa+mtcknnGa/pw==
X-Google-Smtp-Source: ABdhPJz5+rMpCYmHiY5Qrgls04pxpbzB3K5fYJBD9AXk28cIf/T7aHCIGDKW4YFqW+qS0OrsiGCiiw==
X-Received: by 2002:a6b:7112:: with SMTP id q18mr5543907iog.79.1600824520112; 
 Tue, 22 Sep 2020 18:28:40 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id y3sm2326804ilh.76.2020.09.22.18.28.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Sep 2020 18:28:39 -0700 (PDT)
Received: (nullmailer pid 3656746 invoked by uid 1000);
 Wed, 23 Sep 2020 01:28:38 -0000
Date: Tue, 22 Sep 2020 19:28:38 -0600
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v4 3/4] dt-bindings: display: panel-simple-dsi: add TDO
 TL070WSH30 DSI panel bindings
Message-ID: <20200923012838.GA3656693@bogus>
References: <20200915121912.4347-1-narmstrong@baylibre.com>
 <20200915121912.4347-4-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200915121912.4347-4-narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200922_212840_926336_C4FDF564 
X-CRM114-Status: GOOD (  10.16  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, thierry.reding@gmail.com,
 linux-amlogic@lists.infradead.org, sam@ravnborg.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, 15 Sep 2020 14:19:11 +0200, Neil Armstrong wrote:
> This add the bindings for the 1024x600 TFT LCD TL070WSH30 DSI panel to panel-simple-dsi.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  .../devicetree/bindings/display/panel/panel-simple-dsi.yaml     | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
