Return-Path: <SRS0=8EGG=SL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3C79C10F0E
	for <linux-amlogic@archiver.kernel.org>; Tue,  9 Apr 2019 08:44:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 947B120883
	for <linux-amlogic@archiver.kernel.org>; Tue,  9 Apr 2019 08:44:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="c7C67Bag";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="sDZ6WKNQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 947B120883
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ARe6RyMnHPTeJdzlDjmgOR3TuvrObLszPAyU6Als64o=; b=c7C67Bag2Pq+pi
	HZGH6eBYjNb4tXIB18Pztb6/9lPUgAGl9/Gj2DKlOqtwjEBptsV+rVpcfin0gzuGO1K0Id8fEawV4
	fSXjX9X1tLnPWEsHBCnbczG3lIEqEcfHkJcMJ/ehn60DZXqy6oAzIB4K7erd0NTuF0YwyK9kVthxJ
	B4kbLCYMAEHfKekPywuqV/Ao3BFD9wRyqC9f7T6Mr2vkLgpaaJlNGsHA1EL6xO9dEsoKESqhykIAU
	9ZinIxl7zpgJgvL44bcflbrJgNeCG8R7gLZkkuJ+FCcTXVEw44m31ydtoIlRcxa59LRrjur9aIoyK
	BDIFJBd7G3dp41dJVT2Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hDmN7-0007b0-C2; Tue, 09 Apr 2019 08:44:49 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hDmN3-0007X0-UJ
 for linux-amlogic@lists.infradead.org; Tue, 09 Apr 2019 08:44:47 +0000
Received: by mail-wr1-x442.google.com with SMTP id k17so19706377wrx.10
 for <linux-amlogic@lists.infradead.org>; Tue, 09 Apr 2019 01:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=HM2Pcrp/PTYpJw1kiu/1UYLz8U5HkCrpn0W1FDR044U=;
 b=sDZ6WKNQ3iWBVO7Qg0zhC2aEDO7k5bJUf4Qw5bbSHMRZtL3wn6yCP5lzVTCechftWN
 5I+Ox6IfKzf4m92Lv+gX5zVloP+Qd5z30eS8IUnqI1Z3hEaBW9ueRO7EsOGw+Z4mLyVz
 SxcGDU/AY3GMWdsHW+ctl2qHXqw4VEBNmLdmWZbFqmK9A//APs5M8/qcExtK2XqTuCGz
 C/Zx1oFCAR91UfvrCgEHf3xaZYeOKWSsR89gf5UtEJ8vhD/mx27Sz81EVqD1/HK1wf0c
 xgSITbQtJpDLK68LXjnfJT8A2Dqa2JAEVyDtJwLQ3Za/47pRKkPekvbT796NpBHS+Vmv
 h8EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=HM2Pcrp/PTYpJw1kiu/1UYLz8U5HkCrpn0W1FDR044U=;
 b=bO71/Syl2A8iW6REcPSAaLQxdxh3qlWy9EiqVFANVKnZnKHmQvhurxxGQ2GQU+5JBw
 Q0K7Dyo5RP7YskjvoGuLjH1kEVkpPMXF2SjSHAANP6aaPUepVbYk7+OiWmJkJGs+2oyS
 eoogbCYVVwFhUjvT5ZkgezKtzRHPoXMbP9ky57+sqOHxRw+RAuiwJ/ZyvOoPZmqj2jVU
 EPXA7tEskn0Z7jm2tpKSGLQIdnAeBidYWPeXA4RhZmTKXUPmo8mHLblrhbuj5irrhCv0
 Bxv0BR1BHZX/tQTwyvrzMoJ1Aep9+vgxVyecUNQlZ2F6uBEnJns9Ck6y+ei8NSwM5LwH
 kvpQ==
X-Gm-Message-State: APjAAAUTzaZpWO2Aak0GQVdiX7gWlc1/1XvgI6bXAc9isqwP9tiVmC7X
 g41nrZmvwUcaRDTHOy0tgh0SBA==
X-Google-Smtp-Source: APXvYqwXqgheZlxrHWUd/4S5AqcI7iPGv9V4Rz/MoCSy8r5nSUUKDf4gALgPcI74EQLW4t/72UFUuw==
X-Received: by 2002:adf:fd0c:: with SMTP id e12mr21764985wrr.230.1554799484462; 
 Tue, 09 Apr 2019 01:44:44 -0700 (PDT)
Received: from boomer.baylibre.com ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.gmail.com with ESMTPSA id
 y1sm94385738wrd.34.2019.04.09.01.44.43
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 09 Apr 2019 01:44:43 -0700 (PDT)
Message-ID: <7dd2bfa45b97aedd64218f9489d1b1f3e477e134.camel@baylibre.com>
Subject: Re: [PATCH 08/11] drm/meson: Add G12A support for CVBS Encoer
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, dri-devel@lists.freedesktop.org
Date: Tue, 09 Apr 2019 10:44:42 +0200
In-Reply-To: <e5199bf4ff4a125414a8843ab4be0eb641ac5d91.camel@baylibre.com>
References: <20190325141824.21259-1-narmstrong@baylibre.com>
 <20190325141824.21259-9-narmstrong@baylibre.com>
 <e5199bf4ff4a125414a8843ab4be0eb641ac5d91.camel@baylibre.com>
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190409_014446_088450_788CD882 
X-CRM114-Status: GOOD (  10.55  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, 2019-04-09 at 10:43 +0200, Jerome Brunet wrote:
> On Mon, 2019-03-25 at 15:18 +0100, Neil Armstrong wrote:
> > The Meson G12A SoCs uses the exact same CVBS encoder except a simple
> > CVBS DAC register offset and settings delta.
> > 
> > Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> > ---
> >   drivers/gpu/drm/meson/meson_venc.c      | 11 +++++++++--
> >   drivers/gpu/drm/meson/meson_venc_cvbs.c | 25 ++++++++++++++++++-------
> >   2 files changed, 27 insertions(+), 9 deletions(-)

... and there is a typo in the patch title. s/Encoer/Encoder


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
