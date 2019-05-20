Return-Path: <SRS0=EW34=TU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 929CFC04AAC
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 18:08:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70987208C3
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 18:08:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="q313P/gh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="rUgI7/cy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 70987208C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9LSuRAKEPlHTDEpwIdVW9M3Omyhi0q0hgKErQtBh2qw=; b=q313P/ghtq2RXN
	U4yRaAlwFCx0poWHFx19NrPS9FHX/oJDQr95Z2MFuEsRVaE+wY5af0dpwliWOtois8YEO2nTCN5p/
	7ut/HJc3tpd+iKHhF600mLxjogrTJBgHAovUmxdkJnqfkoO3DkJ6nvx4uLNIkeHAAhP8bDJUBsxA+
	k/T7dRYmXZpUgIxchx5qkpRZ8SOJboIiQ/RnwQWk6ROMx2j5T//zl9jWRFRqlSLCikCeS4MslqfbV
	pGmu/ELagvQB5iWEQczYwLfGzZZCHM3ZMQRztlNcPSjiH+7rnLy0vbX5vpaG0CP8UXrjyElOXe66u
	QWSPZpoROxzkP2Ws9YdA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSmhu-0007eN-LQ; Mon, 20 May 2019 18:08:18 +0000
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSmhn-0007Ww-25; Mon, 20 May 2019 18:08:12 +0000
Received: by mail-ot1-x344.google.com with SMTP id r10so13867978otd.4;
 Mon, 20 May 2019 11:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=k7G1MGSx6nHwpQNyADoCOs+yAwPJeVT4zKxuY01zrPw=;
 b=rUgI7/cyozVGEI1WAULyI8FAByxK8naBaSx0t8U2HtADFx5+PhMerjbmLI1lCJD+TF
 DWMKQ5MDTPYcUaWAHhBS4Vle2kj1/Cx5mhku2J/Fg1dkoulRXCTqdxCGSUM2Nn9cJrTj
 TpnZQBA2TUUOk5m8jyGwZsrnxmCmXOwsGiB4xvQ80NO49sh/NFKkr8HSviLYPdX394fd
 er5Rf944R5jciEy94lciqJELseu/5s2Kh0FDiwnhztL+Bew6IjgrO3IljmPckNik3OfH
 O71aAdk0jpPZwNlowDIzDMuOmLf+cnOOIgLAFV4pAZf1scPHRV5F0BNcPGcPXZ2SPdbV
 u5xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k7G1MGSx6nHwpQNyADoCOs+yAwPJeVT4zKxuY01zrPw=;
 b=XIxdy8yxWrusND050pPll82N0STi+78/S4hGWxQh+JuHNLMj/uKcYbw8uWVf12gZ02
 bxc8pWg9wwMmycNsiIGdPqPG1OKMO6GDarHHyAnFHJLaS6plh+X9E0HiUwOrLIWLc9cj
 rWMTCpejGSq6G82bzecTYlHTBrbP08OuL62OEZAIqnTtjGwa78jCVHRggMBgtdHotrFJ
 xdxjRfbKBDm4odZG3QVQ9tEdO+9pYLI22yyW6Kwj6H0q4K4I1ka4NhZieAR4mZ5LRDev
 6wpXsl8wrsmZgCLQ8T/M9fzxrXSk3n0pu8LWl5QsRdojrovICHPoO0Hwu1IxWSKYQrLh
 Q3DA==
X-Gm-Message-State: APjAAAWl/UeQ72uorAKsUuLmLsroP7XdVzQG/ZE280DzUwYGSU2p6MlX
 9KZN3c3v4kq+nYEQxqagwaZOAABjOfzwmZt0idBz4TGhIM0=
X-Google-Smtp-Source: APXvYqyXTaYQ+NOHsY6Q4lnQpI7e2SZVcHg565RFV+td7ZiqkS8L3mkm0fonYHSX6TA19ts6wUj++pgx5JEScfV10/0=
X-Received: by 2002:a9d:2f08:: with SMTP id h8mr45286331otb.42.1558375690288; 
 Mon, 20 May 2019 11:08:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190520144108.3787-1-narmstrong@baylibre.com>
 <20190520144108.3787-3-narmstrong@baylibre.com>
In-Reply-To: <20190520144108.3787-3-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 20 May 2019 20:07:59 +0200
Message-ID: <CAFBinCBNKOPfnE9dXLwGv=bgv3piCyecrnoCvvvwaZ63fTRX1g@mail.gmail.com>
Subject: Re: [PATCH 2/5] dt-bindings: gpio: meson-gxbb-gpio: update with SPDX
 Licence identifier
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190520_110811_095891_D64B88A0 
X-CRM114-Status: UNSURE (   5.94  )
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
