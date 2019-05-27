Return-Path: <SRS0=xEjq=T3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D23FC04AB3
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2019 18:23:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 457EC208CA
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2019 18:23:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BXRki0cs";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="j6D7GGZJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 457EC208CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=93foP3hIravaVt1+DoucYiC1a0fWuEUiOLoGD3qHFbY=; b=BXRki0cs7Lc0HC
	O6nurNhRarIjHAnepB2+5EKAdl36XqeRV/rNlNx7nip0qTM1PZEurPj5ktON7pALQP4NZNGxbyiCc
	I7o3OwDA3r+KkrYheWTW3L3MHAVj/D1mIVtHQ8KCv1tO8GFY04w/32QDfSVRqGCh/hd+sjASoRtGy
	2wGo/c9/vOA4n2cCRwbaGmsiXTn58TrtKENJXF6l9/OBSMHke4PEjMwDfvyOqVNYtQZapTrD+E7OW
	1IN8VGM2OX6KdCEBBaHvpIc9mLE7sMrMUe2MGrxuCtTHahv+OR/lfc/XP3veecYrAVaFQTGMn4l+R
	5V2kjQjHYCMKMu3XYFkw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hVKH5-00051u-Dg; Mon, 27 May 2019 18:23:07 +0000
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVKH3-00051V-EL; Mon, 27 May 2019 18:23:06 +0000
Received: by mail-ot1-x342.google.com with SMTP id c3so4254979otr.3;
 Mon, 27 May 2019 11:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=i5pS9FIkhrcHEm3eZ5Ga4hDJRUcLD0JmetiyRDO9zL0=;
 b=j6D7GGZJ3jnysOk0JfkST3h7j24yQmNC88uoYWa5a1qsie60xuPjBU/Cj/GAUICFlC
 LZo8MfvurqHxMCDwb5EOFeQ8m5KdaAUCNBIK1MTcsBvyV0KQhC1d7Y01//YB5PKn6ib2
 CUVFiE3JYOcipMj41ocGRmFV1vRmlLfEst7sSDT0dxrfJ0ZXRTdhI4GJwIF+G7hBCess
 Z0vxiDtJiNV0/F+GfTtDpRr14rH+iUOcUD5jQN78HNxiwJiwoz4EvfA5kNgaVhqMs9YA
 ReSrGQT88MdeSp7drrfiLU0ShK01qHhkT4Ve8Shfi0JT81JniwQfsUvm9dETgiXVUFWw
 TZ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=i5pS9FIkhrcHEm3eZ5Ga4hDJRUcLD0JmetiyRDO9zL0=;
 b=X6sd640Wtw4hossAPZQoQufVxa+oD8JySs2WSIS8MvJCKcu5RB6rXh1sI8gh/St74j
 vduIGNP6x92aoY3d5zC4o3zpLi3dM76M2JZFLO8aNX7GgU32ZM4jCsvM1w2To6x55YZY
 yaA4Y/4yISiq8nukz0ZpNYFSzyWI99Thb+YRoyrxQlcTnFaSOtP/ThZzSq00oUZ3kvYF
 Ipaoxhfl6XklqGM1llFXFLZNaYRk/RsdR43DiRWASok0F4UuC9DGCOgn64+hkiq+p7Rr
 2idqwtrQ1HfopXy3fRDCpV/h3NGBOMp3+jlD3vQi3Zv5+iBDNKhP9qn6vG5X6Mn6gLHt
 go3g==
X-Gm-Message-State: APjAAAV1eWBaCSv+FT6sOaqUue1vFNKcJT1dcmDKYF1juPOnoCkrgfKb
 q/2Mr/aDCj1un1bgHfTB0JrULlKHdjsF8hWvPaw=
X-Google-Smtp-Source: APXvYqwfpF+Rik391VHLo9HSAWgoGl6f3qI+cIt2fwDI2QSuXZfaJTA3JGxi5VY1f+Yun54aGJyKfC4SoUdPayCXxws=
X-Received: by 2002:a9d:7c84:: with SMTP id q4mr2163959otn.98.1558981384606;
 Mon, 27 May 2019 11:23:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190527132200.17377-1-narmstrong@baylibre.com>
 <20190527132200.17377-8-narmstrong@baylibre.com>
In-Reply-To: <20190527132200.17377-8-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 27 May 2019 20:22:53 +0200
Message-ID: <CAFBinCA2uA9TXZzAYhUm9q-qad22fTjiAGxWuuo_L20o+K5qeg@mail.gmail.com>
Subject: Re: [PATCH 07/10] arm64: dts: meson-gxbb-vega-s95: enable CEC
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190527_112305_481417_47C5528B 
X-CRM114-Status: UNSURE (   6.89  )
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
Cc: khilman@baylibre.com, christianshewitt@gmail.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, May 27, 2019 at 3:23 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Add CEC nodes to support CEC communication on Vega S95
>
> Suggested-by: Christian Hewitt <christianshewitt@gmail.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
just like on all other boards, so:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
