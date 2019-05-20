Return-Path: <SRS0=EW34=TU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1F10C04AAC
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 18:04:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE40720863
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 18:04:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uX++Sovj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="fjPy0z87"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE40720863
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LctvSocUoNBNOq4nMyi9NFaW2hx0AmSSZvYbKG9uWX8=; b=uX++Sovj7VjFwX
	HCKcNyAE8E5/QIww0ocAyk+l83gvmIhh20T8apo3eWrgt7HKe39d5Xy9k5xhbBHsXjrULae3UBLV0
	gHlIE1ywaECZKFSbwlkVR6nAX7pXL7B8Bu0cShiSBkSE1QENJy+b7lPKH8Z+HrgbpjHZBtxHYRKVu
	qq6tj0tup/nmyEAIoOkWjbtv+fwI4jXewQ0UAo8aTLmqWAoLA685IA+SxK9aOQ6MbcS4hvh1YhdC0
	nDD3APXjNkBApzwPQq+g3FOmvOKEZ6YlhYyzeeLzsHMoKLrD/bwiU5zu08ogKmLNbvSJa25eZi3zq
	lRFoDNCT0c5BeliJ4f0Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSmeC-0004Xs-Kl; Mon, 20 May 2019 18:04:28 +0000
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSme9-0004X8-9p; Mon, 20 May 2019 18:04:26 +0000
Received: by mail-ot1-x343.google.com with SMTP id j49so13785053otc.13;
 Mon, 20 May 2019 11:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sa417ZNxztSzV34gBCNtKBCrm39utqje6hlLc0wW990=;
 b=fjPy0z87voFVjd4LRHXwBJv1E0lIJRbAa1BuCPTXEjgF4pASSXLtA1JnLIa6eMgspy
 Ocql0kvac07s40F0Odx66ZcpIy9vBxjYN6pH7/uiDEeVx98GkP4r5bWnFK6IYqUOSLMc
 Lc7zPn52zxg08H03xTsUOiTDyHFBcC3lqW2dzKy0EHRppHFN02bQa9gHEu6LkdZQjqlV
 AuIBvwliPWNcJaiAECWKo4ihWOT/5a6AAqIERiROQF0YkthY89TlV+9l0v5uOwN95BU1
 mKFOAFlzz2o0vxtj06zhgCdukmvgI7Phr5jC6PZL1x7XOcqwdJnPd+dxH/jBYKa82CJQ
 WggA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sa417ZNxztSzV34gBCNtKBCrm39utqje6hlLc0wW990=;
 b=WwuVzWJGXkWBCkAe4qSNWIvlhEY0cNcxKAVY1n1Wd/DtoBMOoxt79JIpc5757CwOGt
 4jXPr7pe4Tr+Q+g70nUbgcLlZUZ2O0UzFd3Wo0/UOGvA9MVZzmaQVzq1rOpJvn+K4WtV
 CEvYFO9b8ToFr6qwbOeFb2FIvWFddXbJ3ZfYYqi1gCoxrv3BIPDAoV4SGEXlDsj16pnd
 +JxhjeCDO4AUHjmusd/IStEUGsmXSyLV2vT8gIdOIvS0HKiQZV+0URDq6rYr/Ui4Y42R
 LetrpPIDSjtBZTflJuzBSzZoaCeppHE8oeAdgumk8F8kBM7zH3QqqHuBn+ez0wDkLnFZ
 aVJw==
X-Gm-Message-State: APjAAAV00rlygG7iQ01wHYimgl23KUl8t4+ufe4BtF2bOsh5yRdbVSpL
 M/DTq24PqCrGN6XwKoHIpOGwjK9FkLoBSYWeu16X+b8rHKU=
X-Google-Smtp-Source: APXvYqxnZAE3XgjrCLfuG5LdXQoHW0DgI+PUYOXuxiszmOJE0G57IH/zBq9juUtuCXpiHhya+YGcobYFC7w6J355qwM=
X-Received: by 2002:a9d:2f08:: with SMTP id h8mr45271608otb.42.1558375464251; 
 Mon, 20 May 2019 11:04:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190520143812.2801-1-narmstrong@baylibre.com>
 <20190520143812.2801-6-narmstrong@baylibre.com>
In-Reply-To: <20190520143812.2801-6-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 20 May 2019 20:04:13 +0200
Message-ID: <CAFBinCCL=44M33gf4Qn5wij6XEq=WR-_ttCPB8XW1zbt_xNKvg@mail.gmail.com>
Subject: Re: [PATCH 05/10] ARM: dts: meson8: update with SPDX Licence
 identifier
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190520_110425_346001_010A8198 
X-CRM114-Status: GOOD (  11.36  )
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

Hi Neil,

On Mon, May 20, 2019 at 4:39 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  arch/arm/boot/dts/meson8.dtsi | 42 +----------------------------------
>  1 file changed, 1 insertion(+), 41 deletions(-)
>
> diff --git a/arch/arm/boot/dts/meson8.dtsi b/arch/arm/boot/dts/meson8.dtsi
> index 7ef442462ea4..fd8d57d0a3af 100644
> --- a/arch/arm/boot/dts/meson8.dtsi
> +++ b/arch/arm/boot/dts/meson8.dtsi
> @@ -1,46 +1,6 @@
> +// SPDX-License-Identifier: GPL-2.0 OR X11
I believe this should be GPL-2.0+ OR MIT as explained in [0]


Martin


[0] https://patchwork.kernel.org/patch/10951479/

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
