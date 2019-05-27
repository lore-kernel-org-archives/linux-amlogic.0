Return-Path: <SRS0=xEjq=T3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4676AC04AB3
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2019 18:01:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1133020883
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2019 18:01:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Fuymjo7P";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="QN13UOq2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1133020883
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MvTnDrXbuRyVpg+SzQZu5YNc5JG9HY9CUtkv7DQes90=; b=Fuymjo7PeM3ASL
	/BBoXzdPql0k04/w40ulw5NJekA+RBOA1GEqj+26hbVlTTrMJGnBKoQ/aeeW2h4jB2J2LJbQQaXzz
	CTIm/ooWpUUr/Gl0uAp4h3yLxBBAWV0fONyWPCOtQJCCYTT+G8w3JTxNn4BxJXL9FDpezs4a639qS
	+mPXFmHzqIrruFGmBoW0N6kPw/eP01FniNZSrSqyEALsUBLmPyXM4+3ydsmG5DBfCT/BxN2T8M4Ar
	l5qeK650Kh6JJwWXNKY52WjJ9it/V9Xr4U1OTWw5uMqQ1GEGMSTXy6YgazVbRjKDrT6ykCRxqRvJ0
	nCIgU132SE4wFNG8FUSw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hVJw6-0000NK-7Y; Mon, 27 May 2019 18:01:26 +0000
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVJw3-0000Ma-BL; Mon, 27 May 2019 18:01:24 +0000
Received: by mail-ot1-x342.google.com with SMTP id i8so15461311oth.10;
 Mon, 27 May 2019 11:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EnoK4PcQ32UVFyVvgKGetFOED9mK/jXQboyT6bD3dDE=;
 b=QN13UOq2YxEU06ZlYM0bFo81jCO7B0LidLRXgklwd/MafCP6OGR503WNWGxhRAs8NO
 nMcAc/Q35ih2Un4fApqi3P0On5E5p98dbtrnYmE5VrpkI3WD4BKqk40ayTdQ4IbZVJJc
 R6ULYunFYunS0m7yky4sUfhKsMRDGEORZ8W82iD+DwcqDzwhbTehMFU4gdGMrGshDf1h
 y0zD3muDoSQ9rfK8yt5nS7QrlUluo8moEEqVf6DbUhj4OLzY1EeZGowITcIyovg1Nx7h
 3frxnfV5kdtgiv6NCxUcv476zTsUAX53CQtL2ghEO9koi4LMIOi0V1UMP2REHsKLRasM
 LQXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EnoK4PcQ32UVFyVvgKGetFOED9mK/jXQboyT6bD3dDE=;
 b=ghz54OzqARB6wZIYXHH/z42MJjEIKjtKRyQCBTYMKUkv8uOzaKkZfXdvZ03fnyZ0ho
 apfXmfriL7gzmIg16CoN9dRF8SEmJF4ceawUiYTaqghf4vuCUni3ASyMJtDRdKlBgD01
 BrWAiOrSlIh7PVOV9yOlvNBr3hMu/pnf6re2RisOroTzzOrf6d5ZBxb7txXbypzymfmw
 1tvGEPfY7WUucJVUpmYHDUgSdket7jcoKwXd9JyaCtTeA9P5qeG6fiBFdLb7wcMsZwYe
 LPe8fIqzfW3W3x1uNce0/ggcht5wZXHYhID6wWzkP1/fgasJI7wTOa0jcryu7pM1V8CZ
 Xqmw==
X-Gm-Message-State: APjAAAUgyvO6QzD7JHz8UgHw0GFmwv/IycU9rzFRLHigO//GevTMZex1
 YHlwZIuJoJxm+wMFM1ONXPcFCTq8g4N/mZNEB8E=
X-Google-Smtp-Source: APXvYqxDTzdAWQe0aoPV7ebEFThMELjXniHkv4cVzEGDcZtsCyPfFKYK0To523hJdA6unhGN0pMu5hTm1xZwHeSplIg=
X-Received: by 2002:a9d:2f08:: with SMTP id h8mr71794666otb.42.1558980081440; 
 Mon, 27 May 2019 11:01:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190527130043.3384-1-narmstrong@baylibre.com>
In-Reply-To: <20190527130043.3384-1-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 27 May 2019 20:01:10 +0200
Message-ID: <CAFBinCD67XCpT-zmppJ3SSs5Q5ruse-otGqMLdbeaTnkr3PKiQ@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: meson-g12a-x96-max: Add Gigabit Ethernet
 Support
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190527_110123_392206_40DEBE21 
X-CRM114-Status: UNSURE (   7.56  )
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
Cc: khilman@baylibre.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, May 27, 2019 at 3:00 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Enable the network interface of the X96 Mac using an external
> Realtek RTL8211F gigabit PHY, needing the same broken-eee properties
> as the previous Amlogic SoC generations.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
