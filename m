Return-Path: <SRS0=drR+=TO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16FF3C04AB4
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 May 2019 18:24:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E052D20881
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 May 2019 18:24:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PhNMMP9P";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="CYe+ksV2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E052D20881
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k9CmBOMknk/ienb8tjpGy0VtNEC2NXyequBVE5hnDBE=; b=PhNMMP9PJ6m3Q/
	qvTbzBciZIIPMN64Ut72BMBZ6HoGEAWtDZ9/YXT+ten2H1fjtqUjPnDNZB3NXFFENDcRp9Lwhzf2Y
	WPCDBns4PNpAceLjU0yaWsb4sMOFDtr1IsoSCHLVS4mePAREr47cFVdArw34dLp2f6iVXGkfEHvBr
	z4BL+58+gW8Gi3+Pb5Dmpuukp839KZA1CVsGbzs8ePi6r6EmFwuKqjJE3pYRF4jL1ZlVE1QH50Wuc
	nwgnSlmDCP/SoimX+8R95kwS46Rg4Bx/QhGY1pS3bFRnC17mNJQpRXsBZEIW4IbblOZMdqmQEbRqE
	HeFC8xstXMg4yXeHh18g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hQc6Y-0002Ds-8t; Tue, 14 May 2019 18:24:46 +0000
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQc6V-0002D9-8e
 for linux-amlogic@lists.infradead.org; Tue, 14 May 2019 18:24:44 +0000
Received: by mail-ot1-x343.google.com with SMTP id r7so11695561otn.6
 for <linux-amlogic@lists.infradead.org>; Tue, 14 May 2019 11:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=K6J8S1G1oUeNsO21G9dTvWZ7yrw8d+Sc+qmFLWzLEdI=;
 b=CYe+ksV2i4t0hrZM9i6qO8u4EWzJCoKreEJL7J8csh5q6BamJBq+VMmseJIOXVnafx
 awnucyvIDNJSIYz8kjI8AX1lZ3DXxj9ZF+qIGbm9gbeJrbQelanLhOeBH/4trStfvllg
 NdePzcLUgIx2HT85cSyRdi4r66Tw+xHUwYJzIX3mDZnvNg8KK/M10q9FmpvleijpZU37
 mm0ddsIRWqe3ueyJp15ZjulQfHhhI0U+nFJ+3exYfWjny7OMTy0gP+xqDQUj1YQXw7zD
 kcCz6A+xwXB+Z3wQehi9s19GvV4cPQIcyiSKEAt81DiOCh9fAg0El8h3mg/rEVYyXKr+
 bqVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K6J8S1G1oUeNsO21G9dTvWZ7yrw8d+Sc+qmFLWzLEdI=;
 b=ugLR+iWdlQ/lf2EJLFbOGXaJ9lYMw0Hozh0XXJyp7jB+07gXDqYPkepEFoTSeQDsPy
 J3LNwhRkw4X612a7l9p0kJjz4AZTGbQ9cyyinGB885idYnHPk1g/KrM4jocu4SR5vso0
 ATpTFDYhhwCwnFmoCjgP31qVuyT+iS/VlwdU+LFQP9VajaTk27IkewmolReRlg8Qrjcg
 uISeY34Sf7Hj5gJqVH5oYOJ4twSpZeqoDs/Y8Bz3VeeNxjtDCOuaAJs4Dm1RHTUzixvW
 mfXl6wwBmY/MACHhnt7S0y2CcRXAKlqmL2OnsLbUMmMYMA9XDj/Hh5NwT2L2MZdzFj9t
 MlNA==
X-Gm-Message-State: APjAAAWRsl6+M9aCpCsW/u3RKpW3VL2TE1bfNb0KN1WKwtjb5j7Wx3FI
 ABeHWHwwgaqxrtWfREXgHDHuwimTDc04Cs/E41I=
X-Google-Smtp-Source: APXvYqzmxaC0RQ97CjQ+lyytbY9vc2WIYQ1LcGILX0ZudiL4HpDZrSs1tUWgtk+2LYMebilQ5zrWQdpQFiHpciVbaCQ=
X-Received: by 2002:a9d:4586:: with SMTP id x6mr18052074ote.38.1557858279484; 
 Tue, 14 May 2019 11:24:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190514091611.15278-1-jbrunet@baylibre.com>
 <20190514091611.15278-4-jbrunet@baylibre.com>
In-Reply-To: <20190514091611.15278-4-jbrunet@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 14 May 2019 20:24:28 +0200
Message-ID: <CAFBinCD8BLQ-5pLs2-gbX87kxkWgTibtM2TZWKu88uRg2euzkA@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: meson: sei510: add sd and emmc
To: Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190514_112443_306248_75460D62 
X-CRM114-Status: UNSURE (   7.82  )
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
Cc: Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, May 14, 2019 at 11:16 AM Jerome Brunet <jbrunet@baylibre.com> wrote:
>
> Enable eMMC and SDCard on the g12a sei510 board
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
I compared the GPIOs with the Odroid-N2 schematics because I'm
assuming that they will be the same on all G12A/G12B boards:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
