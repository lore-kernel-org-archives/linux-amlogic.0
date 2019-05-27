Return-Path: <SRS0=xEjq=T3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4775C04AB3
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2019 18:06:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1626208CA
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2019 18:06:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="V5tM+jW9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="Uz3SxEZe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A1626208CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3Ta9Ygtv2KxXpewWD7BlXfcL1NgMND94eXwDcyFA6gs=; b=V5tM+jW9JG9+op
	0SzgK+d6m/Hf87XzWoYRwYVWVHig+qXyC3E3tz4vlbiX59JvgSJW8LdcD0qxFhF9zal/hfW6CJwwe
	nDjWwUFM8ne8RsuwphohKIB2wI2H5RrG3/0gv5hMJdYOfQmBQvs+07CAu1OPX9uVB6rZidvucFjwg
	gU5BTTdwSWhow9AEzdJdyYduqQVtDzNcJB2m0Qyzvx36PbRWkHqEieWcIPSC5qhzv6tR65Ae2Nc1o
	+c163nMmkKmNGcnZty3Yug86E086q424B5gUXX3Wc/1DCtGwBeJigCKp9X0vV8Ka26qPl9xgP4KEM
	u3KGD4niyVgbr6CSbPrQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hVK18-0003ZH-ST; Mon, 27 May 2019 18:06:38 +0000
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVK16-0003Yj-G6; Mon, 27 May 2019 18:06:37 +0000
Received: by mail-ot1-x342.google.com with SMTP id l17so15528504otq.1;
 Mon, 27 May 2019 11:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=snK6jJsPt2cSi+KLqPDOwYhYAz49h47RS/7FICnk118=;
 b=Uz3SxEZe3/KUMBtLpSR9DuRksazc9sQh8Y1rw3ZYmGZKEDdF1pakQzZrAcm6I6koa3
 RWSyRcQwrZt/GFy/etLHeg1jeEI0wtH91a82uWMz94N69PHboC/Mvd1RnVKDf04oO192
 IEmQsEFpF8/k3UzHaG8bcci0k5Tm9Ff3vgI/gjg/JzFy+NGfyRJnfEz+gnshlCkC9GhE
 yD9VDP3kJBXCFPM0hbHs0Tbsm4cGoC3Or8GPTC25HlXuNGzM4aG0KbOQe1aVyN2pw0JG
 p/fdCCT1aAR6ChXHuYV0tCbgZoQ2Yn31aAfznXGR5fclChYmbeFjsgsnZ9EiFWXb+FkN
 khng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=snK6jJsPt2cSi+KLqPDOwYhYAz49h47RS/7FICnk118=;
 b=grBc5NtMrPfYtT0XzQetaJrpSPnyeELS5Ey4NZN8Z6QvMk5Ys7JpkKOiHlI0xhazCV
 /oLiiDnzthTyDbXekLBKTTv8M4VQswQoYSNUZTyJshTvelBX01GvUP2vKUoFM1G1o+yC
 xXnMUD1i034Thj7Ci9YX37voO6b3UiKWoMSr0icgQHYEjfXVfjT9v64uLaGwK0j0/PzV
 8xCsK8FhTC6aesuE776pFsiyoEQcgGUlvAa1BixeGY8yG/cjRu3neh1zJSQFCp5lHr8g
 MzBijzCubikVgJwfcwhIGWA/VQe4zAAP22KOVFL8SZykcJdaWzMWKn412KWp5HTIf0SQ
 Eipg==
X-Gm-Message-State: APjAAAVZ5h2rm8FqbGEJEueTFnK2tgiYrSJkJ2odvar3mOZicTuM6WjF
 z79wDRbXjBhKn2rMZ7zw5vQrDEaGAQH4MdLAWRQ=
X-Google-Smtp-Source: APXvYqxgFZc3Pv3vlrT0PGq1/+3W6d3l714KVeY/h/DwK3dNU2U9IMXHfxtnwQ85CM6AHjQEp4xb6lPqxgzGJpNUgCs=
X-Received: by 2002:a9d:69c8:: with SMTP id v8mr18558055oto.6.1558980395825;
 Mon, 27 May 2019 11:06:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190527133857.30108-1-narmstrong@baylibre.com>
 <20190527133857.30108-4-narmstrong@baylibre.com>
In-Reply-To: <20190527133857.30108-4-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 27 May 2019 20:06:24 +0200
Message-ID: <CAFBinCBJ2S100DQLWcCBN7uyUR8orr9-qKEX6N=WqZpEo5ptBw@mail.gmail.com>
Subject: Re: [PATCH v2 03/10] ARM: dts: meson6: update with SPDX Licence
 identifier
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190527_110636_534753_80AF483E 
X-CRM114-Status: UNSURE (   8.29  )
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

On Mon, May 27, 2019 at 3:39 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> While the text specifies "of the GPL or the X11 license" the actual
> license text matches the MIT license as specified at [0]
>
> [0] https://spdx.org/licenses/MIT.html
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
