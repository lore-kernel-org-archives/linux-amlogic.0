Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95A4CC5B543
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Jun 2025 13:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cb6a2ywCR3TNpcyZsGoqHYeJuPIWIrViDSZBavmh7wM=; b=ZQVcVnuZtvI5AU
	E/yzE0i23EZCabXaWy3kghUxDD4xSOJ/UDtpY4WLQjpiHLpahDZrYshxWHKInIsyF7oEmqIR0RaZz
	UaUTdr56PssrutoQictjPXoaCsAzX28Lafbia0GFq1/eQMgdZh4Mi7r8ePC06Ron4z8gqv3UG9X0a
	8l2ei0nutdA+r0SO9DF+OqTjzseXoz6PwJyPVa1L6xF4OC8zYFIhyPrmcB+N0sziWiRGCop+KY3Kj
	VojMac8uuOQV8Fp401wb0sZ6CiSR06Pz9+KegcR7B5pQDiY5W0vPZ7JNdyhmJ6+O2erSfQnlMG+do
	umRU7xCTBN1x9CprHdbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOyb8-00000006sLE-1ZkS;
	Tue, 10 Jun 2025 13:01:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOxup-00000006kMn-2ufE
	for linux-amlogic@bombadil.infradead.org;
	Tue, 10 Jun 2025 12:17:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=yJibE8vzk8gYYAz656wGhXQdfbfshNUam9Sx/5ZqBBA=; b=od2Wn9gT0YWUR12UdzJt+iEKgM
	WDUQ25PALmtz92CkHzwfvb1XyCV2bnXTxjDI5DE68Cc3/HaCQ6gbgdtq7EwoPGmTBHqakjPZTp4kk
	514QNoUSrVDs8nC8SWySw5zo1M8t73dSwdJijUSgZjTn8CTOS1xXG8yH4KuXf3ecMmuk6RhE69Gdh
	FqGQE345Y0FOnAD9QxeTD1CygNB2WI2VJnZGgrP65JXz4+tG8ls+rOE2M17KCYNDLPubIZ8sRe6WE
	Af3u6qcDVWzc0y/5YL8Pe48fbvW2K/dMCemEoHq0oUhZQyAA06W3gDBjusTQiHU8fFoCbEqmxb5sN
	xuw2rUag==;
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOxun-00000001nr0-2UJz
	for linux-amlogic@lists.infradead.org;
	Tue, 10 Jun 2025 12:17:19 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-451dbe494d6so65585605e9.1
        for <linux-amlogic@lists.infradead.org>; Tue, 10 Jun 2025 05:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749557834; x=1750162634; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yJibE8vzk8gYYAz656wGhXQdfbfshNUam9Sx/5ZqBBA=;
        b=PhbfShR5Xcezp+7SCZAmWtlnNGb8t+rAMfXan6vWvXtMS+2E7CkctFT0NRVym1g3AX
         Q5rScapE+HtqzBXLhH3O9jrp6MyMubmtltru6YbOOzQheWSgUNK8zPGkMkkiVrp8Gb53
         380YcE/QUGgDCPutBMy0tGjhkb4UOSJHvVs4admvq7MjHM4eZhbv0VMluwMS2sOgsW3l
         eB4XaaSB9udSQfTcQTB/q12OaKzrj9xxzcDl78H4LAiKwrIfl2N2np+EkY34WSmwGRWg
         mR6AdWy4/ghjFrS5NUHf/rtl7V5AOPrZ6CjI5ZTrL/OeMijWJLTHWybarmL+4cpEDV0M
         Xlsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749557834; x=1750162634;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yJibE8vzk8gYYAz656wGhXQdfbfshNUam9Sx/5ZqBBA=;
        b=wXkCNJD3bSYyaZke1NwAXbgsbOaoEFZyii0c0qXyr80JxAK2FBg9x7hiS0o8nULuEZ
         pUXTYN41fHGnK8RZ0+/qFFHYs5/LDZZCvORUH5a9kehj4hZi3g1LUvviX9NOoj4YOaTF
         NSv+CNXTUgdj087nNOFrHCle0IMIAMDDFJmPg9yfj45R5l8Zz5niIMPXkiu/rdiTBcQH
         kZK78PTzrbhYWXr5LV2sYZOXJxKVXRS+pKfZnas6Op5yCMEFCf8e0SEmoy2pSZXntILE
         UvUcvfuXpcwFaAE6/TuMuXaxR4z/KtCZTXVjyiSIu8qu4cUckFZbsB43iIM+v3stFE+a
         5Nhw==
X-Gm-Message-State: AOJu0YyjUtEuPEXP4fVYN+CxT1wk/UMb73/Cz6oohZ3KGGWuK9ngLoUo
	ptAwMy+O0mOY435/+/oQxF5uXQuR64TK1dpu2VNBV9sm3Z916tMybW1k7POhQzEIo7c=
X-Gm-Gg: ASbGncu8EOKlflPXpQxBX4F+N/NyvirGb/duHwwNFkwVogzN9KvFH9feGTh0HKyYTpM
	oYmAeHjAom4YWEjAZdpb4KlNAxmRFPdpj4ElGAd+wfe9+Ykre4n3l9BqPGi8krEXWedWF3GoD/w
	q+5Cng6wyO4SikpbSSoCWJknYW77joQJsizknZOoXdHtmZQfvmdteoo4LWyKU0EDz6U6+Do0Bm/
	nZ9QAreR4/SKvI8i37vKrQnSE8Kw3oLHNMYxXzQB3xGVkRYJ79Zca2vOeuw2NMOLJbDpvk9Ofz/
	Mq04ab+4G1FO3c0KC5lKg4cxrA7uLJARTpQDA5dj0/Niu/Z+dW/Audg/TaXfcr3h5+QBozoVC8H
	SO8v67mIAuAlmxcdTYw==
X-Google-Smtp-Source: AGHT+IHeRxL7AIpQs/dULM8FxMsmTh1TJE0pgJiXuKAcZExlRGsP8IQNBSgadCI7/pKMwjfUXDxtaQ==
X-Received: by 2002:a05:600c:1e09:b0:439:643a:c8d5 with SMTP id 5b1f17b1804b1-452012ace18mr187168685e9.0.1749557834455;
        Tue, 10 Jun 2025 05:17:14 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4526e1595d4sm136313625e9.16.2025.06.10.05.17.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 05:17:14 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
In-Reply-To: <20250609202751.962208-1-martin.blumenstingl@googlemail.com>
References: <20250609202751.962208-1-martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v1] drm/meson: fix more rounding issues with 59.94Hz
 modes
Message-Id: <174955783398.1721274.13530320235871545331.b4-ty@linaro.org>
Date: Tue, 10 Jun 2025 14:17:13 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_131717_686269_1F95A98C 
X-CRM114-Status: GOOD (  10.19  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

On Mon, 09 Jun 2025 22:27:51 +0200, Martin Blumenstingl wrote:
> Commit 1017560164b6 ("drm/meson: use unsigned long long / Hz for
> frequency types") attempts to resolve video playback using 59.94Hz.
>  using YUV420 by changing the clock calculation to use
> Hz instead of kHz (thus yielding more precision).
> 
> The basic calculation itself is correct, however the comparisions in
> meson_vclk_vic_supported_freq() and meson_vclk_setup() don't work
> anymore for 59.94Hz modes (using the freq * 1000 / 1001 logic). For
> example, drm/edid specifies a 593407kHz clock for 3840x2160@59.94Hz.
> With the mentioend commit we convert this to Hz. Then meson_vclk
> tries to find a matchig "params" entry (as the clock setup code
> currently only supports specific frequencies) by taking the venc_freq
> from the params and calculating the "alt frequency" (used for the
> 59.94Hz modes) from it, which is:
>   (594000000Hz * 1000) / 1001 = 593406593Hz
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-fixes)

[1/1] drm/meson: fix more rounding issues with 59.94Hz modes
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/0cee6c4d3518b2e757aedae78771f17149f57653

-- 
Neil


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
