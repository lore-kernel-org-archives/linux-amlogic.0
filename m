Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 975CFC6FD1D
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Mar 2023 13:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZuV/SaIQpPNyiE825UnOzOjXTmI3/uMPAX9ilbXCDlM=; b=wpfg4VzXgQC3mF
	84Xyxf5fC4c55k+ao9rNu1W68k6Vt33sGM3zeeaBSpWmzauic6oIlRefnkeCZ7Kov1fyOwzMacH7P
	31Nu+aV2Mcoa+o1gGr34ZdO1udzFgzoxjB0wxNqHmmyNmumoYoccWlLY2zbLDctFFQTfukzuXeBFj
	1bgXJdswfdhdE9M0kKmng9Div3NfuSW2hItyQu3mEKXcSkRJ43UCizraKGSbvp4pR69E+a1JZH4EM
	CcKNivho5o7NP5ayA6dPUJ16RFIyeeb1ZW3oY0UuvajYSDu43vEGSeV1LPCyjbS9K+KaDt/qWdhS0
	kyyS7qW2k++od29AY9xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pec6A-00CXMy-2g;
	Tue, 21 Mar 2023 13:32:22 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pec67-00CXLR-1e;
	Tue, 21 Mar 2023 13:32:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 17DF061BBD;
	Tue, 21 Mar 2023 13:32:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76778C433EF;
	Tue, 21 Mar 2023 13:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679405536;
	bh=bUettMGzcMjgwJSCScLg1Hb4tZJhPlAkfsegcbCV1zg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uK6kAQEjGNyEdV70dHRdyuAPWpuhDzCRDY0acKas/RqAAf3cx0jQERyMXpfKel6Xz
	 nnwixoPMunz9m3xx4CvO76OrYb1A7muptIsGDeD2ITrqetZbiKeWfqR/GBCYl70Qql
	 Z9BSOZv1YS1B9f7aqgmvp8TKUdi3z7dScL9H0h2Hx0CCBnN5FfKSE/Cn5UgzvJgLwc
	 vbgiM9+BnO921AbSkgze/JCLyOaF2DhRFRiUZZcNxNMma1geYPtEHH3prL3Jf3Rd7t
	 5WdqHiYbSL3PBe/mObaT0NyhbFmTPuqr06+eZdd5eB6zqjOOBln0POI+cEIQEZh/9U
	 egfj6vzw3LuOA==
Received: from johan by xi.lan with local (Exim 4.94.2)
	(envelope-from <johan@kernel.org>)
	id 1pec7P-0006O6-Sj; Tue, 21 Mar 2023 14:33:40 +0100
Date: Tue, 21 Mar 2023 14:33:39 +0100
From: Johan Hovold <johan@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Johan Hovold <johan+linaro@kernel.org>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] drm/meson: fix missing component unbind on bind errors
Message-ID: <ZBmyM6yiDaU/Ql/v@hovoldconsulting.com>
References: <20230306103533.4915-1-johan+linaro@kernel.org>
 <CAFBinCBsC+P=zvh6RF3UKiPnferUYU0QZvZfnn1oS5xWX-65Jw@mail.gmail.com>
 <ZBmtu4klxYwQyN7R@hovoldconsulting.com>
 <35aa4401-8b35-09b5-9d97-59867d1df15c@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <35aa4401-8b35-09b5-9d97-59867d1df15c@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_063219_595441_538E3D20 
X-CRM114-Status: UNSURE (   8.43  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, Mar 21, 2023 at 02:27:08PM +0100, Neil Armstrong wrote:

> Anyway for this patch, sorry for the delay, but it's looks fine:
> 
> Acked-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks for reviewing!

Johan

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
