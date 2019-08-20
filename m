Return-Path: <SRS0=f3iC=WQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE026C41514
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Aug 2019 20:23:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A17E622DA9
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Aug 2019 20:23:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RWWbnuNT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="OGAbSMzO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A17E622DA9
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CIupaMM8sAq5s/ieT3KGi5qVIlQ5fC/Ajut2VeoYLBo=; b=RWWbnuNT9IoCIj
	LSS90Arl/ebSjq4bzhDRBYHME4+3AMlLWmqFanIEtuWgo7RKWNL68kqyqF9NgJFbw+aIQOsA/Lgop
	x8J5osvzK82haWx5S5a7sn5LABC+q0u1YNh59fiRqp0YM4Hknh5N9IbvCcRTl9KkzLzVrqj7Xeymc
	dY4v1YIhM2Lb6sXlL00xHtbC5VtO2jFwRb1jbWiQDvofI0+jLvVWQGT7v+BH/elGC4giV/VR4PoQ6
	gX9OeSYmcfzoa8PXzLZApNOyk0oSvA4XuS3AQojadRkdBNJp2JJyh42UbS9k/p/5vKIFZ1puGCS/k
	BYxi5KXkrWWDfFy0chcQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i0AfU-0001ww-3I; Tue, 20 Aug 2019 20:23:48 +0000
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i0AfR-0001wH-Nq; Tue, 20 Aug 2019 20:23:46 +0000
Received: by mail-ot1-x343.google.com with SMTP id r20so6284499ota.5;
 Tue, 20 Aug 2019 13:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GbUoCPU7dhXf7N3yPBPfTHh406LSiW+lJWVrE8Nq7yk=;
 b=OGAbSMzOjAbjHAbArYLwGOOBuIe1MwU/DH+/1Vbsw4e+kllSEenQzS2cZArmeVohAE
 CU43oYPAQ6BjsZPPrI5mxNcdRN6bJT2HT00jCo72QgokrkYVLHZXX0drcM0HnFroIqPm
 dVo7kCSPcC9nuz6R37G4BkMXvX+yZQ5ipvGeDGq/ZWgMzS0AO+kB/5L+w9pwkSGoXYVU
 iP5f/26eR4VdKNiy+RYYC4TRb1WEGQctHFo1XNgq+lmdGHpVk6GacSHraqOmXDoJfNt/
 8tFFTOVt+ZjLWTUuvpU78i1Pq3LUVFn6MgX6sLYfkl3UrA93+GahMO5w81QOQ7VjwPJc
 X+eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GbUoCPU7dhXf7N3yPBPfTHh406LSiW+lJWVrE8Nq7yk=;
 b=Dg/O4IwDS7KX66oIzPR7nDfyLapta6QUHQjjmAIbVUXFUICwLQVoHacjRAUpayXdvf
 GOUt35UJ0acvLb+zHIz6Lq4yBQPkdhW5y6Vjj9tptxjGacvp0cz7bFbmNKDYsdrCHDmN
 omtralBayE6omDnOeyRJtEOYAEaKWf9mli0hs9+7quOnchIXsb8/3xekoys1FXmhpI/9
 KMvRa6RhMIYD/TV/cK04kRZWwzCYc8RbcOmqxxAOyc08M7xc9jP33f+RMFuTIXg9+CVz
 BPU9G3c2ZcoDPBGL7SKfxwNBjxTns1y+VUFGG+eLG/qlXFeUKIX6G7A/kdJ06fZgdnaI
 KlEw==
X-Gm-Message-State: APjAAAUgRTwuKAAX0cGSFGpm3DZN5Xq06wzQksyCAlSp32B4SF7/cSC5
 Yj+7xmurBqUQ39AbZPDkVa9dR+oI8iXci1dz/Cw=
X-Google-Smtp-Source: APXvYqwlEZEWByUwf102QXdWmV49xzyNpn8RmWiw+ptTx1FS1uGyVOZLkcZ3upU00U++IgKBTHK9rcUxJIz24/UHbNM=
X-Received: by 2002:a9d:6c0e:: with SMTP id f14mr22570884otq.6.1566332625047; 
 Tue, 20 Aug 2019 13:23:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190814142918.11636-1-narmstrong@baylibre.com>
 <20190814142918.11636-14-narmstrong@baylibre.com>
In-Reply-To: <20190814142918.11636-14-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 20 Aug 2019 22:23:34 +0200
Message-ID: <CAFBinCBPebpiKtMv3KuKRHsp3puZqAUeR0+V6d3k6gAX2ZNO5Q@mail.gmail.com>
Subject: Re: [PATCH 13/14] arm64: dts: meson-gxbb-p201: fix snps,
 reset-delays-us format
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190820_132345_803145_82385B22 
X-CRM114-Status: UNSURE (   7.49  )
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
Cc: khilman@baylibre.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, Aug 14, 2019 at 4:33 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> This fixes the following DT schemas check errors:
> meson-gxbb-p201.dt.yaml: ethernet@c9410000: snps,reset-delays-us: [[0, 10000, 1000000]] is too short
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
