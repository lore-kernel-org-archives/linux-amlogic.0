Return-Path: <SRS0=LN9z=TN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 072AAC04AA7
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 May 2019 23:41:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDDDB20879
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 May 2019 23:41:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hClsSipt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="sa5hTJoE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CDDDB20879
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+nQSsgcxsH057rkQmq1CewGC0vjCn7LRYMnPCbTy56A=; b=hClsSiptCwA5it
	eN5lynyIEutf/HTGZuaxNbfjP/qYHgQClwESsaR31a2Q2FG1Rw2yVscJQPcfxNj2QrYd3VDJl90CA
	i4V/XW1xB8BjhaVsvz814/dDJmZPvt73RJAq9bvp/BX3k8WD64SznP/5PTHo2JabhqEIuunj2tkhr
	Fk8VYBnzOGBsS6jln71+35dev2Xlw70oXVC9Rh2XsMZ45kqZ8GpXFr35weVYMQuzlLpT9JsVmCvJ2
	3mkFmVYb2Y/vTIIITTkX9mr95KKR4rHFXYDJa5PObNOA6ejz/KJmFdCAUadeXn2Q+ZVdojGLZyfi0
	qjk9dHw071yar5durmgw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hQKYw-00017h-E7; Mon, 13 May 2019 23:40:54 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQKYs-000172-Pf
 for linux-amlogic@lists.infradead.org; Mon, 13 May 2019 23:40:53 +0000
Received: by mail-pg1-x544.google.com with SMTP id c13so7589160pgt.1
 for <linux-amlogic@lists.infradead.org>; Mon, 13 May 2019 16:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=J8kVwdfKryVwhVTqGuXeaVb2n8/8oNSbahQ/YtWP1xI=;
 b=sa5hTJoEG20bTMXXVU6g1aEoSJCap4+nQDLEavj4IVB0Q0WvFwch1WnSeHVzCeOf+6
 NozdunUylZsJGkfbUevW1O5aRpxemgsu+Cqap9XkehWY73/n/SPIStbxuSlubLpk9jO8
 EdTkhBdYfxzPwyCGLxp2WbiGrvxaRjzX4/otJYQd5sWrbLfmRbKm2YU867GS5Dd/D4wL
 sEP7BY3gwMRxi4fSJYa94KNLcP7twzqhYFbbRVeIS9dTm0jHaiLBh/MT3Yl0gpPfxKJf
 HYYblv/KEjMtWT0fDBkwACZ8qic4unhuM16gzLYZvPBFkhWVRoY/Gu6KOnbpTQz2XUao
 VVzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=J8kVwdfKryVwhVTqGuXeaVb2n8/8oNSbahQ/YtWP1xI=;
 b=nell/lZpameGJRofe5sWtCbMjuM45/7ZBu5i0SlGb8k/AYgr4SVqe75D1tmU8X4c7S
 fovWdr7D2DNbFg1A7kOL1WO7VnP4j66v2BGGzAZ5yLwfU9rdJ3oCpojzAtUQFIXBIKS2
 Xe+EUGcwGmkefds2vqNLo6vW1CCQHTEgN1SA7/dHGjEX8Olks2N7tPyDYENjf+/SObOA
 E+xmjrBFMR0sv+90QZB3Jwnw0IzelySQI/yUe3CORrxj0j60eNhc+DMCwEjlH/YtL9ZL
 qblWmUN/aOKUOm+QB0yXWf7jDpwhO+snw9Kx3jtHuvbASNb+mdbqgtHjN9Y0wEPNWTTl
 uFcA==
X-Gm-Message-State: APjAAAV0XMPHZsmlt2tgJQgqFzFUIgJmyToRCskgK9CvdCYIHB15q33O
 WHLfbIbX+m5vUFGhSNe0JELhpw==
X-Google-Smtp-Source: APXvYqxJza/f7WkrQm4MQNmOM8P+Yp7+nyNFIKDtT5FejuIGuzHjEwFK6tl1nzjsKXvMKfPowpL0mg==
X-Received: by 2002:a65:5682:: with SMTP id v2mr34932877pgs.100.1557790849488; 
 Mon, 13 May 2019 16:40:49 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:fd66:a9bc:7c2c:636a])
 by smtp.googlemail.com with ESMTPSA id e14sm12696269pff.60.2019.05.13.16.40.48
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 13 May 2019 16:40:48 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH 1/2] arm64: dts: meson: sei510: consistently order nodes
In-Reply-To: <b81b46f1-5e8f-26e8-399f-3baca8336e50@baylibre.com>
References: <20190510155327.5759-1-jbrunet@baylibre.com>
 <20190510155327.5759-2-jbrunet@baylibre.com> <7h4l62dlyh.fsf@baylibre.com>
 <3bad9dc8c53e50c4aea1212bf949215660259412.camel@baylibre.com>
 <b81b46f1-5e8f-26e8-399f-3baca8336e50@baylibre.com>
Date: Mon, 13 May 2019 16:40:47 -0700
Message-ID: <7hef51c48w.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190513_164050_973089_DE560CCA 
X-CRM114-Status: GOOD (  11.02  )
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
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> On 11/05/2019 17:52, Jerome Brunet wrote:
>> On Fri, 2019-05-10 at 14:43 -0700, Kevin Hilman wrote:
>>> minor nit: I kind of like "aliases" and "chosen" at the top since they
>>> are kind of special nodes, but honestly, I can't think of a really good
>>> reason other than personal preference, so keeping things sorted as
>>> you've done here is probably better.
>>>
>> 
>> You thought the same, then thought maybe memory was important too. But going
>> down that path, you end up sorting by feeling. It is going to be difficult
>> to all agree on which nodes are special.
>> 
>> In the end, we just want/need something that is easy to respect and verify.
>
> I think it would be better to have the same layout for aliases and memory over
> all the amlogic DTS, it's common over all socs to have these nodes on top.

aliases, chosen, memory and reserved-memory are ones that are typically
on the top for convience sake, but looking around we have not been
terribly consistent there either.

At this point, to continue the tradition, I'm not going to be too picky
about enforcing "standards" that are loosely defined (or undefined) and
will generally accept cleanups that are moving us towards consistency
and ease of rebasing.

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
