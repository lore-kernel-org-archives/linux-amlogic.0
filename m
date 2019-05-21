Return-Path: <SRS0=vjLk=TV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41BA6C04AAF
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 May 2019 08:08:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 142EF21773
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 May 2019 08:08:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JC92sZ0K";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="jSm5ZYDH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 142EF21773
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y83jGAUSaAUu1Uypeh8BYUey8plTS2dCej1hEh/Cb4o=; b=JC92sZ0KT2uE36
	VQllCNj7alzYcvJXRDDgNJ08zcRtvRBVxnPGX/RxAvdZf3LBD8C9AplWL6Vl5LzGQVTJ47d5HBz8z
	9Fx6oHkIqZinWIQQwzQEWnvsgrszUZ8kaDh18V5G5br4pFJPwzktuRxy0TzeL+U4fhi3QnGlyAsob
	GCWuI3z/zG8wEZK9/EdEO49aL2aGxZlDLvXe0afpXv75DGbCjGyP0Lsqj0tcXFwqc78UEOTO0rXow
	BYu/o2uPbvV+jEjd4ourjXE/cmX5lLVetbb5WseveB6fT0JAlFcFb2RQL2k+uZEsJNqV9DeXSqw5Z
	12KIPhHl+OWm0zAhSXfQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSzom-0001Ft-FM; Tue, 21 May 2019 08:08:16 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSzoc-00016Q-3I
 for linux-amlogic@lists.infradead.org; Tue, 21 May 2019 08:08:07 +0000
Received: by mail-wr1-x444.google.com with SMTP id f10so2012764wre.7
 for <linux-amlogic@lists.infradead.org>; Tue, 21 May 2019 01:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=06+DCEbyMY34D3BOjzKRvN7V1nIU5XaEGS8h9soAWyg=;
 b=jSm5ZYDHwpEZV6Lzr77c04c2MsvRIb8GM2tdOjIu3a2j2Kuvh1LWiDWnldvzLDlnBj
 HPNkQsMMobx1yQDQdatXHtT/9sX8GU5yKkLkVHTt0+p3194e/HDjg1nkNJ7XKxTEGBga
 EcdX0Gfgcbm7mFDeTcViHTODqK/m48MVMH4N3DoATpMRcUxtLdFW1jVevWos//50lGmt
 0K2J4UrYGQVYEM9PI67EJdGFvRMoJKYo7J4Ki8Pz132sHFpC62odL2CfXsm2CARdgey7
 WOCYjTdhVfor+T3w+k4roiYmD3KjwBpH4OaDtikgsMElU8vUvadU2JYcpC3mlr3miOh4
 +NTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=06+DCEbyMY34D3BOjzKRvN7V1nIU5XaEGS8h9soAWyg=;
 b=p4RumVM6YGkHFYMDWu84ZQ6MYHmVewyFv6x4ayHLwcbwjOi3AiVgQROJzI4gO7HkrR
 WH/lCv0o3k4zQxltae7N4/4Wj78TQFLvtWGDXd/j61ACHajAIT/Yo91ccj48XgR8uXHR
 XyVHGWqDUsaT0Eip3P0sKa7Gydl1wMbA5nzbG5eFrYcauw3A/d5wd1wqDfDJdOnIP0pm
 MgLKdAgZdWFZB3SPBgjfE0wkA1O1FvhydPv7RELmvmh8Jy3CXnq4nW6N7D5YdbhqKX+b
 nJz32tpZB1AmCoyTcePth8bq8kW5Uho+qN1Yj2vKSpS09QCW+2KovstQoanT+SmKHAA+
 bVtg==
X-Gm-Message-State: APjAAAVKDyPvnl8fmyDiWJrX8Nv9W6NYPI/PQe0FsdbL1S8T2NqhkT6r
 Baow6QghTLRJIEFINKddH8dMGXzBZJX37JaD1OcO/w==
X-Google-Smtp-Source: APXvYqy1XwQ/YD98w6cEQSPMGYKJYFFqtxnEz9VURWZ8UkMaYFj8x70GVpHFVifwBScAIxHO6A61uC4G2dXRZMxc1kg=
X-Received: by 2002:adf:dd51:: with SMTP id u17mr44688507wrm.150.1558426084074; 
 Tue, 21 May 2019 01:08:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190520194353.24445-1-martin.blumenstingl@googlemail.com>
 <20190520194353.24445-3-martin.blumenstingl@googlemail.com>
In-Reply-To: <20190520194353.24445-3-martin.blumenstingl@googlemail.com>
From: Maxime Jourdan <mjourdan@baylibre.com>
Date: Tue, 21 May 2019 10:07:53 +0200
Message-ID: <CAMO6naw0Fe9g4pTODFs8TfcWBWO8jdf2EOB2ZAhyebqmfMWg9w@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] soc: amlogic: canvas: add support for Meson8,
 Meson8b and Meson8m2
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190521_010806_275528_4C6E6373 
X-CRM114-Status: UNSURE (   6.19  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, May 20, 2019 at 9:44 PM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Reviewed-by: Maxime Jourdan <mjourdan@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
