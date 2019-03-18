Return-Path: <SRS0=lgrq=RV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E771C43381
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Mar 2019 19:39:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C896920828
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Mar 2019 19:39:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ibRm0fh4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="CYPvVvt3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C896920828
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wWmP7q1G/XyiK+n5cMhOGc1c4TEEI53hv6zUojxQulg=; b=ibRm0fh4zj9Qeq
	TBzchkg5Dkvv3EJKoHSFlYCCryuoicGeLTuMzXAmRTgZ6f4JzzFF630KwAmjsZklJztWghgtzYSdO
	MGk3CSDcXb5MHzFT70TEn6JHfTVbUh/6NouyYzs2i2rbcUgbn1etBpS3mrYoJZV1WvNKwe/pzdfbd
	LIPF+wyd9dL8Py0KCPcnvfkew0Z+4T6kqf62/koCg3wIE1qxQFOEW9lhgaeGxP3pmT+OIZmj3+OKB
	fJihRvexQKn1dBMTm26BXnDoj7KFC2vs2DeBnB4A+MbXiLAJ7YvQNG/bzSSsmhK/hrQSHtqHEwRdN
	O1/9300di3tf1F6XWLww==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h5y6O-0003Yf-VB; Mon, 18 Mar 2019 19:39:16 +0000
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h5y6K-0003Xr-1n; Mon, 18 Mar 2019 19:39:15 +0000
Received: by mail-ot1-x344.google.com with SMTP id i12so15490326otp.12;
 Mon, 18 Mar 2019 12:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BGgCTUc7PrXmapvItTm0TAlgoUUh0KcB9uVn9jFtG0M=;
 b=CYPvVvt3z++hs3TSLs3l2bTThrnLI5zCUXwJN83g3VKx5McM3ZX8X0RRyotRdVMfPx
 6006NnSj8NioxaVVRoiFZsq3wovAt7PfPK6JpC7t1QrrEVr0tEGaRkdkjV96WHVvV8tf
 Jaq4TnIoc+qGsc99LfcfRBRQ5uf85b/De4jDMrirHX6VlsqkwZd/X7HIG9Cv6ElcabPG
 Mx9Ou+E9npxuBPNbbbcMrBLBdbX8nrcfMaKTcamzDwu28VQkYDwR7DAFxkndvcWt+FEe
 izlE2QKG+a+xuxWjEG5Vg0inkJfrRbadLHa0EIJkKfWah5QKr6zRfwtLUe614vfca8W0
 NThQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BGgCTUc7PrXmapvItTm0TAlgoUUh0KcB9uVn9jFtG0M=;
 b=EiRG1YLkFvkt27YjYIvSTm1NGhAX8e5YkoXrrupML4tf+0+MubwsLpHdArRFctGDTs
 IQzd6me52B2M4nd1sl4Y9tsO/px0G7N4+YfStl52M1HtwF0WqgpKDONNse0JQ7I5URkx
 RCtl6nbjRVPu96+LkfBprxZQrvT2pCZb+5YmKHJy3T8TbmPCs11KydXKTmP7L4SDRVvN
 VdH9xtimj6A3Kq/okSd1d1ZW62sFivDRrGwqJAZrW4V355qftfyStga0g1WRHp/GArYl
 m/d1vFRf3WcTA4gJmJnjB5CqkD4OsCsaTnzXHwEvWfJaF6IYVowgnAtKjeKaV3pnsS1m
 cF6g==
X-Gm-Message-State: APjAAAUnim2aTDwF6Ns+SI0i8CZff6jtyQK36uHFtXhsV93RA8EFnRLA
 XblQ2/yHr4FL7UkAzQDwI7W/06njLXN0iHDugdk=
X-Google-Smtp-Source: APXvYqwlaG7jOkef9H61Qc05HXQmeQ729Rr+O+UCrs2UYzLUnZs/un+Ha1yR8cfKcddzpzmghrHcUOZxUPfBy5TzzxA=
X-Received: by 2002:a9d:5906:: with SMTP id t6mr11957242oth.308.1552937950723; 
 Mon, 18 Mar 2019 12:39:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190318095851.4062-1-narmstrong@baylibre.com>
 <20190318095851.4062-6-narmstrong@baylibre.com>
In-Reply-To: <20190318095851.4062-6-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 18 Mar 2019 20:38:59 +0100
Message-ID: <CAFBinCDvvpn3xXvUvb7wXvEj+65XnT5Dms=7152qNu2FcCwxRg@mail.gmail.com>
Subject: Re: [PATCH v2 5/8] arm64: dts: meson: g12a: Add UART A, B & C nodes
 and pins
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190318_123914_058899_92ABE291 
X-CRM114-Status: UNSURE (   8.06  )
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
Cc: khilman@baylibre.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, Mar 18, 2019 at 11:00 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> This patch adds the 3 UART nodes in the EE power domain with the corresponding
> pinctrl nodes.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
