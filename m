Return-Path: <SRS0=BQut=RS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 557FAC43381
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Mar 2019 20:46:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 19017218D8
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Mar 2019 20:46:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IwiVhNAb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="tkWX5A85"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 19017218D8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=84SMTFG2qiFEd7+9ADRM14LJE5Vkg6yPBT5Xo9gIamY=; b=IwiVhNAb43cwzM
	S0YY1EK9YRD1zeG0cFifZoWuI4THfr/TP1xjTVJAFPEOYGB2LojrlXQELNfrmqRM6sCNX06MzQoZT
	bl+Ewo1utm8WDoNu3A9tPd/QVda9aUPpdgsrtgFpepkHpXNjYhMk0uZWB42aecg3UbLqla0qRwHTb
	VmMWr0Ymr2dxlYL7DGmUwCPlLqAmqssaPvoONimcIT2x9+tW+fnJdhqNJfr/YyzbWSDbUkBw9rE++
	u+/cGFhqOef9qFODpEmSRoQKKev7/3enUw1LYl5tmbGg3XE4cbeIZyqAy3owU8N2QdoWUWntVuB9Z
	cMCGYLGI+etJ0OkO/pjQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h4tiJ-0003vM-J1; Fri, 15 Mar 2019 20:45:59 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h4tiH-0003tq-F8
 for linux-amlogic@lists.infradead.org; Fri, 15 Mar 2019 20:45:58 +0000
Received: by mail-pg1-x543.google.com with SMTP id r124so7257218pgr.3
 for <linux-amlogic@lists.infradead.org>; Fri, 15 Mar 2019 13:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=MedYFqyrqJk5Y4rTqrWyFLUFe+H1yz11JYtn4iLD36Q=;
 b=tkWX5A855WjQWiLO2jJ9I3z5acBomik4gteKcmr9GDG5riUNshT4aHdFnHlZQ8yhVH
 fS73+lodLBFza7YhOXeMVJgNH3HXSAsWyOg6atSEOIAcnzBFGdluoK3VkuSEf39/vv3C
 dr+8fYm8sSPT3H8i0LboR8a8e2qEujG1kboOsq4Q1BIvTY6E7VTSF3UdXO/CzCy4/PnJ
 klRL7vQcoHKnNoMu9Fs4FRKd2PvGyyKA7J/bD3ayRg37RNRp0W5m4GJWXZYjlmxybvTa
 ggVJuFzZapW60fxfQ+DdXdAIUFpWSNyNDbFuDPEUyuTb1VJXZzgv4KZ5TNE9X405ce5V
 QR3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=MedYFqyrqJk5Y4rTqrWyFLUFe+H1yz11JYtn4iLD36Q=;
 b=aHz6ROl5tVjggAbVtEhbCx+vyi0tMqLTIoz8rpCsDkiXGhmGIvCIlfVyjNolN7D2KN
 frmGAFhEl8OSwR9gszNWHE6h7XGiUckhqUbxixCW0rTmlkevwKcRawj4FBLm8v3B16Rf
 5VfsinOWu5cxdSd+eIoFMfZuNYdfMpD4k7ECfjPePL1o/QSAMHr+i7SgEZtz9k2rUN31
 VoGcpQ/ECV/t8bLGQs31ym7yCRl35ZSwibFztmxEfEAAAyHwBwZvBzZmqUiNvT2N0cND
 4/3DYfXlYovYMu65QWH1zhQ+0rg6ywL3rPz95D0d7BhNX5LvvK52zI5a/eb9sriWjgzZ
 SNXQ==
X-Gm-Message-State: APjAAAWTip2m51dr3BsRE/DIxLyIs7Z7sCdFCCTKHvQpqdtn2oVSR8OK
 OCkNDXvy2/t3clLp4VU1u/j6pw==
X-Google-Smtp-Source: APXvYqyqTZs+fiS+XZA/nWxr6XjQuLM5+2PTQxHEUAVCclw0a9oeL73yBGy2edwtjfcKIKgRzZDhvA==
X-Received: by 2002:a65:52c3:: with SMTP id z3mr5302316pgp.395.1552682756911; 
 Fri, 15 Mar 2019 13:45:56 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:a567:ae30:4f79:6ce5])
 by smtp.googlemail.com with ESMTPSA id b7sm5047566pff.136.2019.03.15.13.45.56
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 15 Mar 2019 13:45:56 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH] arm64: dts: meson-gxm-nexbox-a1: Enable USB
In-Reply-To: <20190315134909.26721-1-narmstrong@baylibre.com>
References: <20190315134909.26721-1-narmstrong@baylibre.com>
Date: Fri, 15 Mar 2019 13:45:55 -0700
Message-ID: <7h36nnc1do.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190315_134557_528859_E438FC8C 
X-CRM114-Status: UNSURE (   5.39  )
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

> Enable USB on the Nexbox A1 STB
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

Queued for v5.2 (branch; v5.2/dt64)

Thanks,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
