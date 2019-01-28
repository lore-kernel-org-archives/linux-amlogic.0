Return-Path: <SRS0=PsYD=QE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BCB1C282C8
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Jan 2019 16:55:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0E5A2147A
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Jan 2019 16:55:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XZ2v2iF8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="Jzi06Ann";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="YZ/O8caE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D0E5A2147A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kroah.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RdMffiKpW7NYUkLzAmyTMluJuhP1K2cvfu5PGE8ZiOw=; b=XZ2v2iF8yEerVv
	IzKkWhjPTNgBYhz7mSSjNt9DPXOWp7Ro1SkOg9Nb5Ms3Svzw1pThWY6Hgcz4L6s1JEUw8VKBCDAC6
	vDJZ6wF+zg/qcmXYbySAyi3dAKJRc+dQjajcJZodSuWEbT2p8TyvKZqL0jf19iiFd7RwxGuGZj3pg
	h1ty7EO5EIp200M7e1Hdz14I2EoDMGHskHzTtfiRi0S+NnJ7/15MDKRaJcpAdWgjaesbJapuxxuyo
	yIiMProXcci4eiy/N6t29yZv2fH22QqTCD1u/snViXhMyGGTL+FwSzJ1GxQp5CiO5OIAJsD3RSckb
	7XlWbjWKQtRr9tAU+SwA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1goACH-00084j-2K; Mon, 28 Jan 2019 16:55:45 +0000
Received: from new1-smtp.messagingengine.com ([66.111.4.221])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1goAC4-0007t3-Sb
 for linux-amlogic@lists.infradead.org; Mon, 28 Jan 2019 16:55:34 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 2565E11169;
 Mon, 28 Jan 2019 11:55:28 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 28 Jan 2019 11:55:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=haZopF8nVy5HljMZVXg9juG9aGL
 3ZbX5pWk6x4bp6Cs=; b=Jzi06Annyq6MY09iMlY9XYyy2BEhHGKcGjlB8mvF6zG
 bxYIFWcmks812YRIBWKRZieJ9BkSvxBY/fpXM/XH0+Hzv4FiRoNo8r+ecuVu7C6n
 IyXXIN0oX4yBOR1Ki+NMyzoJcjn/0s+b/8Jy0DkDCIsKGxxH7ZEoJ6q88UndPaGG
 BAVkxN/79d1MaSs5sfJ/r/GegMLeqCeHcwAwn5i1nwysXsWtbbCsD77+zv4fGLcl
 h729R3YYYoB1xv4zwdZEnxR4jOnMlaXSOJ7qyBgDlI085W20dU8sBlAZan3WQp5J
 6yFSOkSgz/FJWumH8jkw7LbM/gJskgRrq5h6VagQM8w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=haZopF
 8nVy5HljMZVXg9juG9aGL3ZbX5pWk6x4bp6Cs=; b=YZ/O8caEXNTawBqPDrl3kD
 u8b1x+zrqSDvF4xALabCg2fbelXJrLxhJdsfpruM4IgfZ+Ucv3IHcUNYkZKcIp84
 JDK0QpWcs7WHlFeR2Bh6xDtbLHdzCPBQgYjcj1yHg+61PWO01hVnSEvBOymtIkHx
 2+fYPsp4qJbbvmUxps7W/GUonoc8W0hVM8+vDuVYlcoLyXU7KWziw7PwX7wrcP5M
 TJdWB0i8XPBHM/UPkgVD1xxup67kCse3JJIcJPp1pPcEsQdViTwXv3cEB1L9RmQV
 FUZtBT98l30XXsm5//tUWGme0TMe+0/YFuniGFh4GUsbV0SB4dMzukPUaKkCmAHg
 ==
X-ME-Sender: <xms:_zNPXDZYRaTjkAEyrC6KM2tgmIRKN6qKClE28RTLrgtPS_4K9XQtZg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedtledrjedtgddutddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfquhhtnecuuegrihhlohhuthemucef
 tddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenogfuphgrmhfkphculdeftd
 dtmdenucfjughrpeffhffvuffkfhggtggujggfsehttdertddtredvnecuhfhrohhmpefi
 rhgvghcumffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucfkphepkeefrdekiedrke
 elrddutdejnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhhdrtgho
 mhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:_zNPXCkv5CElCJ0DxvtFpbT4FEd7DlND5IWTPIwziQttIX-ow91lfA>
 <xmx:_zNPXIlPNsx3ThUsaW9mNyNnJ7qyYqgsN36ZQR6GjLFkMrYUYEVgBA>
 <xmx:_zNPXFPqYDWbDPXui1EpB0IYREuGOI9-YM7LzYly-Ylyl3sS-RELJA>
 <xmx:ADRPXIo8AfMUO2soO-r2dcjWl0C830z3LdXYjAoOS3QyuuuUzBcYzQ>
Received: from localhost (5356596b.cm-6-7b.dynamic.ziggo.nl [83.86.89.107])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2820F1030D;
 Mon, 28 Jan 2019 11:55:27 -0500 (EST)
Date: Mon, 28 Jan 2019 17:55:25 +0100
From: Greg KH <greg@kroah.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v2] drm/meson: Fix atomic mode switching regression
Message-ID: <20190128165525.GB16213@kroah.com>
References: <20190114153118.8024-1-narmstrong@baylibre.com>
 <2148dfd9-3263-2049-8fd8-d7a4cec97655@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2148dfd9-3263-2049-8fd8-d7a4cec97655@baylibre.com>
User-Agent: Mutt/1.11.2 (2019-01-07)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190128_085533_076659_972A9442 
X-CRM114-Status: UNSURE (   8.70  )
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Tony McKahan <tonymckahan@gmail.com>, stable@vger.kernel.org, daniel@ffwll.ch,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, Jan 28, 2019 at 05:21:12PM +0100, Neil Armstrong wrote:
> Hi Stable kernel team,
> 
> On 14/01/2019 16:31, Neil Armstrong wrote:
> > Since commit 2bcd3ecab773 when switching mode from X11 (ubuntu mate for
> > example) the display gets blurry, looking like an invalid framebuffer width.
> > 
> > This commit fixed atomic crtc modesetting in a totally wrong way and
> > introduced a local unnecessary ->enabled crtc state.
> > 
> > This commit reverts the crctc _begin() and _enable() changes and simply
> > adds drm_atomic_helper_commit_tail_rpm as helper.
> > 
> > Reported-by: Tony McKahan <tonymckahan@gmail.com>
> > Suggested-by: Daniel Vetter <daniel@ffwll.ch>
> > Fixes: 2bcd3ecab773 ("drm/meson: Fixes for drm_crtc_vblank_on/off support")
> > Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> 
> This fix has landed in linus master with id ce0210c12433031aba3bbacd75f4c02ab77f2004
> 
> could it be applied to 4.19 and 4.20 stable trees ?

Now queued up, thanks.

greg k-h

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
