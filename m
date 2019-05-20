Return-Path: <SRS0=EW34=TU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33CC9C04AAC
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 17:57:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EEA31206B6
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 17:57:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rP2k5SqG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="EUpH/eB1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EEA31206B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i5OPofQI/YWTme+v2BnhituDClGiXmYIVTJ+JnRoxwE=; b=rP2k5SqGOVab2f
	pPzN5fFUEBbBVvh1JRedF8b/0vFCUnYbECbnbbLt12uSrszDYxoPyOCtYsMnV2SNK+n36cxXABD1+
	C7heyqbF6ciPAR8JBozMR9PoOZZQAI0VUT7agQc4OYeSdAhx4pmzDd17q/KTx7sw1wIklxKL8Nhxa
	NE3treVHIT6qTRWtJnSEHL0axVFBSUQoIQRdX1/3cWa2QOZGj4XFcMQ+Z/TW3zsaCvLKQ68epjW6n
	cGx/wJqjg9fQRLEK0CAnYYXUYRE2t6+ekVIouoyidNodLtOaLhElcwgovv6T3dF/QmIpco90cMFLE
	MD4g5TbG37sGac/A+08w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSmX5-0000Vu-RX; Mon, 20 May 2019 17:57:07 +0000
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSmWd-0008JC-7q; Mon, 20 May 2019 17:56:50 +0000
Received: by mail-ot1-x342.google.com with SMTP id 66so13861030otq.0;
 Mon, 20 May 2019 10:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VXOvDra3GYVXRTYzoLbL0Bskxi3eAOjAFxHF07MZQNM=;
 b=EUpH/eB1pYTfMfO+mY3w9LF/pI07gQS2S/BwAzn8jJhZYYkufQNJFmSeUUPOcHATOk
 ANW3tVACzDfeQc89sQYGoypgC2L+lEihzU0OdL1r1pBM126FwHLKanSghrMpHidOWHes
 a3QJPM2tSV7el0FLS73YBDRERJCs1tsy/oUz8YLjVvvEczyxmk1hBRwdSov2YjNGBYT4
 zpWGAWlI1vX9fG+jqA5ce4HC++cv0au/u+7WJgiK257qURuPbMwzTdll02qcfjtiz8Tz
 jvn3ydM+QNL6+DvDyXA+trchDxPTkXdx23lV2UJS1tU61E1SVVbCE9VOBola40zsiOkM
 q18g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VXOvDra3GYVXRTYzoLbL0Bskxi3eAOjAFxHF07MZQNM=;
 b=h0DG9LOOK+kHqUD00Mt2RH7pbzI5P0HW2eOCGadvPcvg5vb2xTvOcPDTkNCk38cfEt
 DhA/6ErkutxZMe00G3IFYNhUC68t+jpajBzEVB0yMF7/WBNGtgQwz3KzXeyipidoq5Ti
 iLj8G/or2SXUaiyswbtitCC9BDuaDgRjzU8YtFuTVj6cfsnnMx0aqIhpO7KBauIY8IKN
 Ft4gx4QojXiU37Rf8t64tl++8AWk6K1zf7ImCxEq8zIsiY94MOIAwHBDoSoPIgyFqZ8I
 SKTyaDKSLDym0O3HN3WIDxx/jh6nKcbbt/1thpwHY2JKDzz1elwsvebflqICKoVasoPW
 aaJQ==
X-Gm-Message-State: APjAAAU17dtpFxVVAfTWrJbH0f16tBPf3Zs05kDXMLc7wODhEa8bAfBg
 8B+bRx1A3HJMJ/pqhJvTUTbUpNLpkTWbT/CHQFepKbl+VwQ=
X-Google-Smtp-Source: APXvYqy2RzawdpIc1HHiAmR3XwyoAucu/u340Q0tybzzu1jn/P0w89t3q3knDtRkvNk0w7rRp7KRKkrHEE4DJMJ7UyA=
X-Received: by 2002:a9d:2f08:: with SMTP id h8mr45241893otb.42.1558374998281; 
 Mon, 20 May 2019 10:56:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190520143647.2503-1-narmstrong@baylibre.com>
 <20190520143647.2503-3-narmstrong@baylibre.com>
In-Reply-To: <20190520143647.2503-3-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 20 May 2019 19:56:27 +0200
Message-ID: <CAFBinCDy9rOgk7pHSfyam1YUog8PFJiqyDNhqPC_ayY+6tWrZg@mail.gmail.com>
Subject: Re: [PATCH 2/2] mmc: meson-mx-sdio: update with SPDX Licence
 identifier
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190520_105640_097639_AA46639A 
X-CRM114-Status: UNSURE (   6.49  )
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
Cc: linux-amlogic@lists.infradead.org, ulf.hansson@linaro.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, May 20, 2019 at 4:37 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
