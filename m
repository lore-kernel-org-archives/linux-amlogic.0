Return-Path: <SRS0=10CR=R2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 718B1C43381
	for <linux-amlogic@archiver.kernel.org>; Sat, 23 Mar 2019 00:14:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24714218D3
	for <linux-amlogic@archiver.kernel.org>; Sat, 23 Mar 2019 00:14:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sbBt0v0/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Yxqvn/6+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 24714218D3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kBQZR8UOo9my7ZoYigvPOddYvAV4xt6zGzWHdq0Ywsk=; b=sbBt0v0/scnKMj
	KwOGIjjMgBadUL07PaJreDe5umJ80nJ4bxVcRT/rlK8Wu/Z61ScBQ9B9I53vHKpxdeRigNWHIIEpK
	u+ztaM1bwh6zNzOv6M2Pt00W0ZP3YV3e2wvGt5WlPaI+oB/38SdwkwH5dwHvsWRR16FptTyedsYEM
	5rqrVLJhIVQ5CjaYJOCMhUyIvaePPjA1hVGwptIIP//X4q34lqcbho9Vw9g7Wx5lJ5ZlgnbgVCCVK
	XzqfzeS9GHQ4JiiPYDeozAPw2Cea0JZstEQ00FloR5AEm3Q8sW+4s7AHeMufLAjxcTeaBzxtuJWfY
	OmBQFSI1IBI6sPw6RIXQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h7UIx-00041c-LP; Sat, 23 Mar 2019 00:14:31 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h7UIo-0003td-Qy
 for linux-amlogic@lists.infradead.org; Sat, 23 Mar 2019 00:14:24 +0000
Received: by mail-pf1-x42f.google.com with SMTP id b3so1187258pfd.1
 for <linux-amlogic@lists.infradead.org>; Fri, 22 Mar 2019 17:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=oRMHjnvQs0ikWTEqlDADpNMzEZP3KRcRf9TO7CZKyEs=;
 b=Yxqvn/6+4SCsd6WkN+lGG59xW7aZOpkYX1YuHaGKhLeZuEIKxLFJVRgf6uVOT5kAil
 ncbpZdxV+xkrxuqSr0LkwJKq7XtvkNhUkUoO0RWTKAxN5OUccZIip7XsO4hyUbfgFqNs
 6hxkU7YGflCHKcH+u0Ily+no05jYivfZ1lC9Fs0LLuIqh3yE4HxN6j22TMP+LEyT8pJN
 G/aK7kmXh9vjPqpTYWTBG/ZEjzssJPX71rZA4ZolGe4iuIsnKWXBaeZPowjVe/+VQuWU
 xMWjqxEni2y+QmityXy9oOk4hvft1IiGyLrW5m0c2GmKe9VuZ6Y1xHcGmOXBS/So+SG2
 5+qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=oRMHjnvQs0ikWTEqlDADpNMzEZP3KRcRf9TO7CZKyEs=;
 b=h8nRcZscVDKrEh+UWoUeNDDDKpwycK0WvbSbGL93sgwSQnneG5xzBndTC6PPb6SZ75
 +vFa22Wf5nmErwjj/HaVPhU8JdlYOcu1e3NoAjhA1gb5C+mCZrOLy1nTW1SRThZl88Gu
 2UiygFgO54i3CWoW3/TjpMfmqj/GLaasj5D7YrjERw+0fgU6I34xNQH7AxeBZz8lhvq2
 kX+Lojl40YkUx8z+XGCABAJN/euTUIW+fVXnNqhpX6OWR+CwwZrRlRBuf5lVk4E6Eyxa
 k0Ri4No6nLn9rb5Tx0VFzHBk/O/9lP6owiEouUtwgfgiW6V6HQmTLNAc/W/5Tt79YpMB
 jIDQ==
X-Gm-Message-State: APjAAAX+V0fMsfDPpIzjgXs14Si7OpFJYu7HAwuKFe7rO+dnD0QX0wPr
 hQzndFfGWYNNNtTu55kl6e9eHg==
X-Google-Smtp-Source: APXvYqyak8xPelQDLqlHqvekkoCy2XND4zLRnaILDRz/YPlQfTg/6qXBYGty14l7M2Jt44qSMKOP1g==
X-Received: by 2002:aa7:918b:: with SMTP id x11mr12392871pfa.228.1553300059868; 
 Fri, 22 Mar 2019 17:14:19 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:314c:c810:897b:a1d4])
 by smtp.googlemail.com with ESMTPSA id u86sm9168634pfj.69.2019.03.22.17.14.18
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 22 Mar 2019 17:14:18 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v2 00/11] arm64: dts: g12a: Add boards peripherals
In-Reply-To: <20190318100458.5619-1-narmstrong@baylibre.com>
References: <20190318100458.5619-1-narmstrong@baylibre.com>
Date: Fri, 22 Mar 2019 17:14:18 -0700
Message-ID: <7hh8buzbtx.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190322_171422_877985_E747EED3 
X-CRM114-Status: UNSURE (   5.94  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> Following [1], add regulators, bluetooth, UART and ADC keys on :
> - meson-g12a-x96-max
> - meson-g12a-u200
> - meson-g12a-sei510
>
> Changes since v1:
> - Collected martin's reviewed-bys
> - Added missing regulators in commit logs
> - fixed x96 dc_in regulator
> - fixed includes overall
> - removed dwc2 enable floowing disabled remove in [1]

I queud patches 1-5/11 for v5.2 (branch: v5.2/dt64).  The others have
some dependencies, or you mentioned you'll do a v3.

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
