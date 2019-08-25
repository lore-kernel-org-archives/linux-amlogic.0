Return-Path: <SRS0=OcNe=WV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86C46C3A5A1
	for <linux-amlogic@archiver.kernel.org>; Sun, 25 Aug 2019 19:55:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59D3C2082F
	for <linux-amlogic@archiver.kernel.org>; Sun, 25 Aug 2019 19:55:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hmTb9hnn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="ZWgvPDk+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 59D3C2082F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OLA5ZREkK3lUD+sMccELYrF9MxF0yvccnwzAjQn6QVc=; b=hmTb9hnn/uTLL5
	t9Z6GIY2ggHJrkNK0MjiuGBDrol4BSAJiEZLmP9c45LvOlnsE4FFetYluYeyy4pelM5Cwx/lpXJfO
	TOXMHGAkbwGHoTHt2gaw1Gajov2LvVTbOA7/GRMkWnyUEN3Trb1mGn/ENTigq7MeM5FGzteiCMaii
	yu7tMHdix/51oo1B7n2RSDd1aaAMs8T/dvUajebrFfbTdb2Je1dni9u3nXs55qE46C+mCawiVSYu+
	9UZpdJ0OmJ6r3Yuxi3FDj7LKUiHRuZ96kgUu3YEH3hWlsAOEr+m1EqtjGy5B0hNCSV6R+2Kdg5qt6
	pDyOnvuD805KqLV7VHPQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i1ybp-0008HP-Lr; Sun, 25 Aug 2019 19:55:29 +0000
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i1ybn-0008Ge-8L; Sun, 25 Aug 2019 19:55:28 +0000
Received: by mail-ot1-x343.google.com with SMTP id b1so13308704otp.6;
 Sun, 25 Aug 2019 12:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kGmPx2xuPkputCeT387Wpalg1a3GB50jgvbEZF5SlNQ=;
 b=ZWgvPDk+e19f+KMo42AfleUbEhqmR1sbLN8un2pAZwnKo7R+VFoNu706wHkkepu0uj
 d/Q9lHk+J4OW9bqN0IAkEXFMzpQAr7rpurCXwxo59pu6SUYdLxN2zHRLq3pQGCTHHkYm
 4HnbVp8i7pIjGh9Xne1FL92bPb39lmbmnfBD6DhRM/6mWCUhl5DgB731UDJVNRLnIpbP
 QDhGbaHKI6HDe1YTMMIYqmN9aH27a+tuZv8rdpuwpULP8svXVorHyX6tV43FGyRJMtJl
 leWknAathV2ibsvyQgXz1FF9lfbszCiabYMdW5cnO1t7yG/L7PVtp29Hk4XfTg4YNk3l
 FrIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kGmPx2xuPkputCeT387Wpalg1a3GB50jgvbEZF5SlNQ=;
 b=S232lwgfhiKIJp5C4yvXhw+ZdTpn3LUqm3aGmiha1wuXuj54npAozmjJ8yUFSt5R5V
 SfwsXQs+4iWCDHt/XFjpJ+ul7pEp6hqLriSGp4WYuXCQMy9n2W1yG/RVN14J+wWnAWnh
 N+Xziown03DuyTzC1tYSS1wIZRY50P+x3AIGA5ZArbfJphpSNUlwcXaMrXPn1JC79WTJ
 NQCOyxxYwld5EsFWoh02MQvfToM5lLiSfvOS3Vj2pDOSjXE8rtgvduS7MAUE7QiRp2vQ
 W9d8enUXRoBeKlc7kBNxFLgZM6B4bWv7NQ+BqNRZvThBy7BMPXDHlb7BJyh4/T1IJM0S
 uZ7Q==
X-Gm-Message-State: APjAAAVWh6901cIGWuktevobMVaWY7E+Nv2eVuRdFlHftUjl1oFUV70l
 iJ4782PLWWqAlEHMhRsm1ffHK7jed7btakATZBA=
X-Google-Smtp-Source: APXvYqzzvtkVUjkecPWG03cxd1nVZTZf8ShZr+HnDL6BFQMZnJcYWHUOL3e4dOdG1vazH5JciiRHL10NvWwaLCvR9a4=
X-Received: by 2002:a9d:1d5:: with SMTP id e79mr12418370ote.98.1566762925225; 
 Sun, 25 Aug 2019 12:55:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190823081427.17228-1-narmstrong@baylibre.com>
 <20190823081427.17228-4-narmstrong@baylibre.com>
In-Reply-To: <20190823081427.17228-4-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 25 Aug 2019 21:55:14 +0200
Message-ID: <CAFBinCAH2LP2OyFEek290Prm9N=rxxAc-9gZ_jS0tY_4+utByA@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: khadas-vim3: add support for the SM1
 based VIM3
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190825_125527_302149_76078D6B 
X-CRM114-Status: UNSURE (   9.63  )
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
Cc: khilman@baylibre.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, Aug 23, 2019 at 10:15 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Add the Amlogic SM1 based Khadas VIM3, sharing all the same features
> as the G12B based one, but:
> - a different DVFS support since only a single cluster is available
> - audio is still not available on SM1
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
schematics are not available yet but this looks sane so:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
