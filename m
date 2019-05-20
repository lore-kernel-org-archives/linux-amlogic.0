Return-Path: <SRS0=EW34=TU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6193C04AAC
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 18:08:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B280E214DA
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 18:08:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="G95zEt1N";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="ZpZBX2L1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B280E214DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9LSuRAKEPlHTDEpwIdVW9M3Omyhi0q0hgKErQtBh2qw=; b=G95zEt1Ne81Uxl
	M+E7YUhCEEsilXo3I6IGqlTeTYCbgIRuNSbWSnkI2b9kJyuSmbNqjgaYsx+SajiWE1BpWnCIM8Hns
	JnYijxgqgzg39LUbirKF30ZqWkEbl0Kglptd17O+VppXclmfa3jPlhNxv1bwsPKiZNFRbVa9mG97P
	sL39LxWVB2v78REBYYrtWaYp77eEC713XrDnbEhUApzuYu+AWE5dK7DXJ2EXxhOJ1ENZ1kfFumxlD
	xL5i1Q5yGp99I01OHxhJjU3dKD4RdunaSncPMlREZVWOIZa9GhQG3zUFMYuyB3nIkC6q0WwzqKfF7
	xPz/TNlEPXv2f/AXBwkA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSmhZ-000772-Aj; Mon, 20 May 2019 18:07:57 +0000
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSmhO-0006sf-N5; Mon, 20 May 2019 18:07:47 +0000
Received: by mail-oi1-x242.google.com with SMTP id w9so8897535oic.9;
 Mon, 20 May 2019 11:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=k7G1MGSx6nHwpQNyADoCOs+yAwPJeVT4zKxuY01zrPw=;
 b=ZpZBX2L1phGIkWqLtP/wGPhPMbIoJguECDVjKtHvg0SxK2vj293g3R9X2fd3f3/yZL
 xAtRNLhTgspuLkunpxlKA0fR7+285acvRqZNQd+GX3Whb1mWqPP4GtaEsNZ1f9Rlqj07
 E7nUq+RnPYMQj79rxPpCpH5rghIwLEIKNoVMfUpyKkaSAuQZFcTR5/Bvq0w0v8xFmHGG
 eJKeMnq7ItUeBpDtjA/UcCT5Jm7QJbY3pvwEyr9qZVq4MAqXN8mM45x2n1F3AA+nurzJ
 BVBA/ioRgbJ1ESG5ru7e6O3Sj0GOumyy5j8t6pO1RTMq7hCZC5hGTGi6V+/Hnb1+2vfs
 xobw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k7G1MGSx6nHwpQNyADoCOs+yAwPJeVT4zKxuY01zrPw=;
 b=BVDgLAv7oziNb9th9yRkMyFvmnhGE7kFLLrQdfdhKYqxI4/V/8vQcMSo2BaEk4lnir
 07mUnqkGmeqkiU+NILYRZH/F1m7JRj73uUAavLpJyV6AtzOa2u2AzngiN7MjTeMYEB1d
 eN5avq/CoTS39n8K6X7q3sGHRSynYkWXfix/XIrHheAOquSW39dKeNcQAalz8u7W9QMo
 fNQKwusd85239x3uDYGF8fuaxCUNFPM7UZzAXq9KQeG+AN2dkAIX3FUCSWccQ+ei1ofp
 DE/0Pe7IzxkXW+1wF6XSNmWsiIzTz0/2OMBiBf2FeSEPDW+ype2YQAeF96G09UOYhhtE
 XZ5g==
X-Gm-Message-State: APjAAAVByHMqLR5NjJNYpINvC59RggDz/zg1ST7nKqiwfoKuh+VvGrFQ
 235PXGjuit27QS5ltrQIR42y7RaF857i+sidpYo=
X-Google-Smtp-Source: APXvYqy59OliiQjhnHxHS1SdLMScXn9f1+tKlaosJtDBLEK0tbw3TDkfYCYFObUPl6UzrYIrxy5IwZdGaWdzpFXXWRo=
X-Received: by 2002:aca:ab04:: with SMTP id u4mr315260oie.15.1558375665674;
 Mon, 20 May 2019 11:07:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190520144108.3787-1-narmstrong@baylibre.com>
 <20190520144108.3787-2-narmstrong@baylibre.com>
In-Reply-To: <20190520144108.3787-2-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 20 May 2019 20:07:34 +0200
Message-ID: <CAFBinCAaoSb9z8MHu7CmGG-ij+aBOTtUjVcgRmp+wcuiDbxs+Q@mail.gmail.com>
Subject: Re: [PATCH 1/5] pinctrl: meson: update with SPDX Licence identifier
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190520_110746_753347_1B46845B 
X-CRM114-Status: UNSURE (   5.81  )
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
Cc: linux-gpio@vger.kernel.org, linus.walleij@linaro.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, May 20, 2019 at 4:42 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
