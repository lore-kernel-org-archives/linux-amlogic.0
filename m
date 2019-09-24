Return-Path: <SRS0=mdkS=XT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 039EEC432C1
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Sep 2019 18:35:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D17AA207FD
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Sep 2019 18:35:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FcsD/LQQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="z0UDEipE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D17AA207FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bBEfzs0UwJuzQaPP+puBbRqV65zkXY24dCJgLonMTkM=; b=FcsD/LQQn3sq12
	40tomaNEQNCSuQ+bnEF8jyOWF6/Z08Dy1MTS3VjZWx2o2p2Wc8SLxTeF0WFB9CvNSPuwJNH9+w1N1
	mbs1NplC53ZTYUNkPbQdYxuFzJEZ8EthBwM8sVJlEYBJgV9vUWJq/L3ycSMoQIOqqaerTFGfchtOo
	E6zbo8VmikC39itrPui8xQWSm+G9t5Ltq/dKzksogz6g2jDqEaW8qe2DUXKloql+WVmY7Z+MtCGi/
	zPE4NfxDKJnsEUJJUlfbXdP6wqsb/Igsd9Ki5CwHdUmLYqNtj11CyPC6QxNxG7zL9E+WGcRGqXzAn
	gtCFdmxlCj33mjDoM1Jw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iCpeL-0004wD-UE; Tue, 24 Sep 2019 18:34:58 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iCpeI-0004vU-9c
 for linux-amlogic@lists.infradead.org; Tue, 24 Sep 2019 18:34:56 +0000
Received: by mail-pg1-x544.google.com with SMTP id x10so1772836pgi.5
 for <linux-amlogic@lists.infradead.org>; Tue, 24 Sep 2019 11:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=jkBCXzn4Uj1xLOMo29hksQeWQpwjGA82dIjcLoLZzTE=;
 b=z0UDEipE4W/AzOwgLuwPGd0hbYj8lB6P6p5iCggsB+uSOZ2ercDuI6QViE8trcyi68
 Ms4bpDlbC17FktVTBM5gBlQ8QRBa/OvosuNUn8F9cuqs+nnRgHavcXYsV+fXIn4fOfHi
 3q+G+MOUuWBNFpOrO58Nvy2MO67v5H5csoVbOuHFdSn2E3jLpAvwwn61KL0KvX26re9h
 S6apGVlqOmapAPl58/oSQBvm4AnBTkNGbaE12ncpt23zSxAPwjzixYva1rmfmWA87KtC
 DL8FB7ElOkvo+l+Vcqt3S5bOGU+5NT5G2NZ1yzPV8VUutxTR9xN2DCHz51458mFtWBnR
 DTdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=jkBCXzn4Uj1xLOMo29hksQeWQpwjGA82dIjcLoLZzTE=;
 b=NQo8FD3Oj4veNapRlLJv6HvRDKfK1h8IP4U+uUTYaqYx3EAujNHisyEyfrPesrQm5k
 OCX394OfqXoefy7G1NHRlXvpb8fuj1q6GiJqDgvqXPjxwdECYrbGEHTHynh2w82tYVSo
 yFf+H4LkvUmOT6FjvGb3OX6gMAIZbwLPsB67jPNnePHennfH9LhKfqON4I0wpkwDUw/C
 xCkqFZf/VgK/fCZux7Bdv/NR7MmLoHdpGyDmHpjOM8genawiyCvPkDhux+KSVxalD/mJ
 EVS/vgwJYy4m7juCqIqROAfllls5Pi/ZNirz7ULHTqzQ1qwhO7Yhk0RWR7c8huCRzdQi
 7Dsw==
X-Gm-Message-State: APjAAAU86wVGtcT0ArNHmyHJu40zbBsNb3PxB9b5/F3j9kkdP7pYSytf
 fqg92K/TVkR8pNdKJt+ORiET0pFJ5PxuuQ==
X-Google-Smtp-Source: APXvYqw2jfPgxdDoSNqWWhnD7kHlXKrQE4WFeQl8IkHVJv88EXWMyWgt15LGw/6oqqVsdoLFFr5Qmw==
X-Received: by 2002:a62:4e0f:: with SMTP id c15mr4989864pfb.42.1569350092855; 
 Tue, 24 Sep 2019 11:34:52 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id f62sm5013581pfg.74.2019.09.24.11.34.52
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 24 Sep 2019 11:34:52 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH 0/5] arm64: dts: meson: audio updates
In-Reply-To: <20190905125956.4384-1-jbrunet@baylibre.com>
References: <20190905125956.4384-1-jbrunet@baylibre.com>
Date: Tue, 24 Sep 2019 11:34:51 -0700
Message-ID: <7hk19x7dbo.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190924_113454_362257_FF1B8133 
X-CRM114-Status: UNSURE (   8.23  )
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
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> The patchset features a few updates to prepare the addition of the audio
> on sm1. It fixes the register range of audio fifo which was incorrect.
>
> It also create another layer of dtsi, common to g12a and g12b but not sm1.
> The audio related device are moved to this file.
>
> This was done because the audio bus, which was at 0xff642000 on g12, has
> moved 0xff660000 on sm1. Overwriting the reg property was option but it
> would have left confusing node names on the sm1.
>
> Jerome Brunet (5):
>   arm64: dts: meson: axg: fix audio fifo reg size
>   arm64: dts: meson: g12: fix audio fifo reg size
>   arm64: dts: meson: g12: add a g12 layer
>   arm64: dts: meson: g12: factor the power domain.
>   arm64: dts: meson: g12: move audio bus out of g12-common

Queued for v5.5,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
