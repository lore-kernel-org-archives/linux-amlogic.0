Return-Path: <SRS0=6y+j=TL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75E41C04AB1
	for <linux-amlogic@archiver.kernel.org>; Sat, 11 May 2019 15:53:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 47B452173B
	for <linux-amlogic@archiver.kernel.org>; Sat, 11 May 2019 15:53:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Fe1A2ZyS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="s0FzKNSd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 47B452173B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vhiznYVRQmSdyV03uvl7ziPPS0F0+bu6Ab2UuB0LANI=; b=Fe1A2ZyS4pT/vj
	qxGyK3+rgW6Vo3VD0RteHFfWOjfR4dGhG9ooBJX1UMEpT3YdYMLrriXPGW++slND5KejSRXxVV6EG
	8Ga7AwipV3zoBAXceUvG+r+qzpUuXnUOmfUb3+amkI0es+uQaLPbSIVnKUNibJZL88MU0oV/Ifo2X
	GMCEvqHCY8b1UmiVhiAiRtWKrCD4hL1zu7DcsmgZf3WM+0BiJRglRjtQVzUNyDJTus0zJ1ZgyC3n1
	pNNoizrOiAwWC4RWNHw4KOd8h171/quqAEVH1Nvwtl57BSPbVfSeqe1YXwNss4YBJBK8MkQUq+Sgh
	f5V/IKsT84ioi5YdeuFQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hPUJ1-0007ff-DD; Sat, 11 May 2019 15:52:59 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hPUIx-0007fC-Ne
 for linux-amlogic@lists.infradead.org; Sat, 11 May 2019 15:52:57 +0000
Received: by mail-wm1-x341.google.com with SMTP id h11so9950991wmb.5
 for <linux-amlogic@lists.infradead.org>; Sat, 11 May 2019 08:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=wPE7oz9+/ykS8zKoedHqVltx9asTMcwNqU/NkoJcdcY=;
 b=s0FzKNSdOBwo0GMStdjIpty4uA5mj8FO72cIPIiYgPgYd35EBRX9ZiG8D0YFnvU2+t
 VYwKiZ1P/isFku880QbFIILYQg3OhxyqzDJdkmfWwJRUDidN4S9lzNq8KB4rICYtC4I4
 S2Q3K/YunQWelvK80PpWUzRAXPoJpO4nn7wFr8BYPQXuIHi469BOXYyjSuWJZxRTPHx3
 eNagyGJCnyOkUKPvtBSHVXNACZg4o05CBhoNRxq9gh+4Ql99zjGV222YVyfVJ+9dRgoD
 cWuf4cdIxX9M/3BZ0fbVsS1I4pmOVkmVl8j66d12AogWNnCpJjJFiU3K1pNRYATgECZX
 Ll7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=wPE7oz9+/ykS8zKoedHqVltx9asTMcwNqU/NkoJcdcY=;
 b=BpvRyevg+4XWKf/8QX1RWjBZG1n425lsnR/abhKnEwaBByne4NJcFCMKDKZPmv/PRN
 OIvpGo8+9Nh6sSjQNXgw03VIc3iV7N2g3kgfPL+W9ZHMK61xqNx7uxGRu69t1oUNNpzH
 NdON9ANXu2scx327Ff7zN2wHzJhA+M0NcJMHRVtuXSEBdlO92I25wkLXVvdk8wXXkbHg
 StFApR+DV9CHP0hJk9BojUJDD7VHzmfmU8q6vLSW3XNTjsN4ZOZsrSxieSGMsjXAAQn7
 TOqpLjkyYqyHew2Q8/8KTj7ErOsGNvaNYnRw0LPmXWX4cutqxOdbDXnXNd3mx4oGMyfq
 B+fA==
X-Gm-Message-State: APjAAAWE4aXcysER3gXABi1G+aLaznX2CVGobQ+gbWtXyirSxoB4LDnR
 cx2nMQONLDKSD3IkIVjAiuiSoA==
X-Google-Smtp-Source: APXvYqxNW8CXjnTFV/v4WjIAb7jakTDUy3oFkP7JkALz95R+UIhsGTf/3/M7lS479C8OkF5mMMCpsg==
X-Received: by 2002:a1c:a013:: with SMTP id j19mr6207172wme.59.1557589973884; 
 Sat, 11 May 2019 08:52:53 -0700 (PDT)
Received: from boomer.baylibre.com (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.gmail.com with ESMTPSA id m17sm7174332wmc.6.2019.05.11.08.52.52
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 11 May 2019 08:52:53 -0700 (PDT)
Message-ID: <3bad9dc8c53e50c4aea1212bf949215660259412.camel@baylibre.com>
Subject: Re: [PATCH 1/2] arm64: dts: meson: sei510: consistently order nodes
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Date: Sat, 11 May 2019 17:52:50 +0200
In-Reply-To: <7h4l62dlyh.fsf@baylibre.com>
References: <20190510155327.5759-1-jbrunet@baylibre.com>
 <20190510155327.5759-2-jbrunet@baylibre.com> <7h4l62dlyh.fsf@baylibre.com>
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190511_085255_771157_B57EF447 
X-CRM114-Status: UNSURE (   7.74  )
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
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, 2019-05-10 at 14:43 -0700, Kevin Hilman wrote:
> minor nit: I kind of like "aliases" and "chosen" at the top since they
> are kind of special nodes, but honestly, I can't think of a really good
> reason other than personal preference, so keeping things sorted as
> you've done here is probably better.
> 

You thought the same, then thought maybe memory was important too. But going
down that path, you end up sorting by feeling. It is going to be difficult
to all agree on which nodes are special.

In the end, we just want/need something that is easy to respect and verify.

> Kevin



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
