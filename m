Return-Path: <SRS0=/OEX=PP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E421C43387
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Jan 2019 16:37:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 402292089F
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Jan 2019 16:37:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VyK2n4sy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="vfSxrm01"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 402292089F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MpUpwlMx5/xatnBOV6nJSZSsPj/0bHYGbeihqUjrVCw=; b=VyK2n4sy6G0+rR
	6DZnFHTpzkbE8MiJCwTCakUdvlneigkqeeiZqZMcnM74ZB58YPFraww/0WbxDNZuI9cKM5FElcaMG
	hf/a4uODatHUDd8j8xcy1t40dt+HN4j4tQPNe3H0WqpJ2lgqhKD3SrYKEfREjfj6j0o8yGVnrtl/l
	PdrzlYNWjmcLGN3Xlnqq2gbWZRtNojX66ReVTWBm+tzDwu5OMSK2Pl1ZBAmPKP7GdXfBhY06Lm/VH
	PFXFmKfgDdqdYtEdTyTTMj3xDPLOanQZurerWhfT5Kd2BN9IBvfjeo5JqIGH/Hq1agTdSPP1m+GT6
	VANCq77/LbWE810MQLjQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ggXtt-0000nY-5N; Mon, 07 Jan 2019 16:37:17 +0000
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ggXtq-0000nC-HI
 for linux-amlogic@lists.infradead.org; Mon, 07 Jan 2019 16:37:15 +0000
Received: by mail-lf1-x143.google.com with SMTP id u18so728864lff.10
 for <linux-amlogic@lists.infradead.org>; Mon, 07 Jan 2019 08:37:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=OesGRHeQjjHAr6dEOjmw/xnpBLcPVIoRKc0KepIuIcg=;
 b=vfSxrm01TiLpz+25jc1xsFh+l3fIwsTVw3eaXW9OP43XueFKXZyMo1W9bSqZsU+Nrd
 7g9zPmOM6/epQswUYSA4ubR2/AQ5iGRZBwc1WyPZzZ5qgTfVqq4l7PR6OWmksPab4VPu
 hKCYWavQkZXzKiWe5ypE5glvB5tIwHq1QzhcouSlv+ZyXpprcIFCvNAnSpyLjoOwU5Lf
 qg9+m4IQwUyErC+7c86WsWXQDS2QaVJUKMLG9wzr2d+MQunEA/exuPmDts/pJPtWI/Vy
 ImHkoqH3HieIg1opsEXBUMNam65iIue156xRQY7oK9BETtxhD0EglN7oA+VlaMFTipF0
 d2WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=OesGRHeQjjHAr6dEOjmw/xnpBLcPVIoRKc0KepIuIcg=;
 b=n8T8U/LTIE1jkphELXZ5P2+DRuKC2TJMWx01UL9NaUMmg7RRd5KCPaFiGyxH/f2fuh
 UbzYlH98W/JCw9sk1lfEvfA6Pr6p8gSA693a2KCAqJ79KEVibJuFWQYy5XNIwaGZ+yVA
 vqWXAtb8j6ZF7BxxguuFUYeppkzxzux+GWEjqXl0UTTqt2Hh0Y64rolcuwOUllG/9io3
 QA6yLv8dhephnoDyX5cxWNiqbz6HjcWuhab6Ccn3e7YtD0pO7a7bj0+vJ3hP2WvRAZQ1
 51W6r0x8yNNeQwJSKpnClySK95hmBZPVZru/9+8Vz3CMn/B6eS9wnJDrkUE2fLBt2fy4
 cp3Q==
X-Gm-Message-State: AA+aEWZKEfK0FjWX7soFljV9z82j2f7SUv4Um6UwDPu0Ws3Q6xisfCJh
 y+F7oPMnV3vmmCVDz3SL87ViiN6m
X-Google-Smtp-Source: AFSGD/Wc41qVUsikF+w2mR+rLI84dYpHLAXCVLjg9yKdoHcu8U2krxcDLEUq6yCsJ5qsvbipoWqWMA==
X-Received: by 2002:a19:3809:: with SMTP id f9mr29820492lfa.148.1546879032364; 
 Mon, 07 Jan 2019 08:37:12 -0800 (PST)
Received: from xi.terra (c-74bee655.07-184-6d6c6d4.bbcust.telenor.se.
 [85.230.190.116])
 by smtp.gmail.com with ESMTPSA id v17-v6sm13755008ljg.32.2019.01.07.08.37.11
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 07 Jan 2019 08:37:11 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.91)
 (envelope-from <johan@kernel.org>)
 id 1ggXto-0006lY-SB; Mon, 07 Jan 2019 17:37:12 +0100
Date: Mon, 7 Jan 2019 17:37:12 +0100
From: Johan Hovold <johan@kernel.org>
To: Loys Ollivier <lollivier@baylibre.com>
Subject: Re: [PATCH 0/4] Add driver for globaltop GNSS receivers
Message-ID: <20190107163712.GF14782@localhost>
References: <1545994235-8309-1-git-send-email-lollivier@baylibre.com>
 <86bm4x6830.fsf@baylibre.com> <20190104091937.GA4737@localhost>
 <86ftu41lqx.fsf@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <86ftu41lqx.fsf@baylibre.com>
User-Agent: Mutt/1.11.1 (2018-12-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190107_083714_571263_232EF0A1 
X-CRM114-Status: GOOD (  15.53  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, Jan 07, 2019 at 05:21:58PM +0100, Loys Ollivier wrote:
> 
> On Fri 04 Jan 2019 at 09:19, Johan Hovold wrote:
> 
> > On Thu, Jan 03, 2019 at 05:04:35PM +0100, Loys Ollivier wrote:
> >> 
> >> As suggested by Neil Armstrong - this GNSS device seems to behave like
> >> most generic GNSS receivers.
> >> I'll send a v2 with a generic driver that works for both GlobalTop and
> >> u-blox.
> >
> > That doesn't sound right to me. Judging from a quick look, this device
> > appears to be based on a mediatek chipset, so I suggest reworking
> > (renaming) this as a Mediatek driver (gnss type would be MTK, reflecting
> > the vendor protocol) even if it happens to look a lot like the current
> > u-blox driver.
> >
> OK, agreed - will rename the driver as Mediatek.
> Would you recommend keeping any reference to Globaltop ? Such as in the
> devicetree gnss bindings.
> Or only keep "mediatek,mt3339" for any solution based on that chipset.

Yes, I suggest keeping the globaltop compatible (cf. the sirf driver for
devices based on sirf chipsets).

Thanks,
Johan

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
