Return-Path: <SRS0=benv=VH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B4B9C004EF
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 Jul 2019 09:18:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F36B82054F
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 Jul 2019 09:18:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZI7YtONN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F36B82054F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TN3jT+yar4nwSXdgmMQKtfQlsmoMdQ56lmaU+fbW0ws=; b=ZI7YtONN+5KIXQ
	2byJB/mXgnhhUAZ786oGb3d5XKyXixrgWUNGJsONgB60rvlWtHi2r9TyWiO3JQ42XbmXLILnFURdM
	bIbo6Mie8SWwgT9w/rq7lCikEyhcfzqUeqGR83lUzvfG/JCi6oCevG4TGofMJ55hYQgP8UByvPQGH
	akIXd7uZzH6ii22o1k86HIXlNMPemNjHFDM3gR35jc3Zt91hBRqc9q7jkIQgK663Jbw73qc8+LJ8b
	B55QeNrPQL/4W84Zrw9INPZduaJ9NtcEFYMOtz0hqDJaFQzkHrvsUj7Z9zgzX7HwyziHh3hU5Vr1k
	E9dEUzoTZGLEnx4EKYEQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hl8ju-0006TR-Js; Wed, 10 Jul 2019 09:18:15 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hl8jT-0006G2-5p; Wed, 10 Jul 2019 09:17:48 +0000
Received: by sipsolutions.net with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <johannes@sipsolutions.net>)
 id 1hl8jF-0002Ji-QK; Wed, 10 Jul 2019 11:17:33 +0200
Message-ID: <5fa1fa6998332642c49e2d5209193ffe2713f333.camel@sipsolutions.net>
Subject: Re: [PATCH 00/12] treewide: Fix GENMASK misuses
From: Johannes Berg <johannes@sipsolutions.net>
To: Joe Perches <joe@perches.com>, Andrew Morton
 <akpm@linux-foundation.org>,  Patrick Venture <venture@google.com>, Nancy
 Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>,  Andrew
 Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org,  linux-aspeed@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org,  linux-amlogic@lists.infradead.org,
 netdev@vger.kernel.org,  linux-mediatek@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,  linux-wireless@vger.kernel.org,
 linux-media@vger.kernel.org
Date: Wed, 10 Jul 2019 11:17:31 +0200
In-Reply-To: <cover.1562734889.git.joe@perches.com>
 (sfid-20190710_070546_627944_047EEDD0)
References: <cover.1562734889.git.joe@perches.com>
 (sfid-20190710_070546_627944_047EEDD0)
X-Mailer: Evolution 3.28.5 (3.28.5-3.fc28) 
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190710_021747_216383_2E80E633 
X-CRM114-Status: UNSURE (   5.62  )
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
Cc: linux-iio@vger.kernel.org, devel@driverdev.osuosl.org,
 alsa-devel@alsa-project.org, linux-mmc@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, 2019-07-09 at 22:04 -0700, Joe Perches wrote:
> These GENMASK uses are inverted argument order and the
> actual masks produced are incorrect.  Fix them.
> 
> Add checkpatch tests to help avoid more misuses too.
> 
> Joe Perches (12):
>   checkpatch: Add GENMASK tests

IMHO this doesn't make a lot of sense as a checkpatch test - just throw
in a BUILD_BUG_ON()?

johannes


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
