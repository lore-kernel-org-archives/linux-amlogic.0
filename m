Return-Path: <SRS0=EW34=TU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9E1FC04AAC
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 18:08:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87BA4208C3
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 18:08:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TlifnXEA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="exguTriK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 87BA4208C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9LSuRAKEPlHTDEpwIdVW9M3Omyhi0q0hgKErQtBh2qw=; b=TlifnXEAcT6LQK
	O/zkO/iPkxDexf2Fz+L4xJ9fXiCROq8Crdlk9D8GhYT3aBHkyIx53IohXxfE7iWkvlYFnsMwU+dv7
	9IYjT7OvBQ3QUEnBjiA7ERw+IDqwbxut8sfB6FUWpvX22enO2eUpazOrI3rqUwpgZzpMjYiBP7uu3
	n9l2qAuyChkR35VgsBRpb26+vfGE1U15HEe6de/hiGP8wjBYkibyYf8oQkcrkPvYMgfBKumlKwca9
	o4adZ3TTSt7buyo5iHf/zdtGUJu6FXISnfANSpBqkeF2ZHzjLSEiT9m0UymoVbVCakEUVs3OdPt9l
	W8dJN4GOzgkNKgOx2gmA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSmiR-0008J3-TB; Mon, 20 May 2019 18:08:51 +0000
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSmiD-00081e-MN; Mon, 20 May 2019 18:08:41 +0000
Received: by mail-oi1-x243.google.com with SMTP id t187so10688318oie.10;
 Mon, 20 May 2019 11:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=k7G1MGSx6nHwpQNyADoCOs+yAwPJeVT4zKxuY01zrPw=;
 b=exguTriKwXhXwUBPk3DIYIZn0UebJYIvgkrkUlVQK5eyPslKrHvRJJWZsZZatGDf7+
 4biJjehsUg4Ao2EK1c7Zi8EuvyBpW5eu/Qrh/u1rJrkaSLquZzh3LiB5MOZAHOSzvfJq
 VSu0BLM7IBjWMQm5W7ne+ljo3VCj+ac1NbOYEvqWm/3ezx9EcRD2/+CtLY4YxoxAJusD
 2+aV8oQtf20iAXCAbcpAgCX5EijMQxXPL8yYmSeJSzLHPUWAydKBv91uKdFKttfmLCL7
 ib5bxijAzY1xDT+7Waq6mF1LwTJ7YtobSc3QHW3h0QkQq5wSq8YmbgIzjHAbE9RmZUSW
 mhgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k7G1MGSx6nHwpQNyADoCOs+yAwPJeVT4zKxuY01zrPw=;
 b=WI58YQg56H1dUDjeRRx0X2/CbYDjzonSNsNqqNhk0v/Zfv5Tn9CJa60zTfzZkm9mng
 zDoO2fAyIK4tessCTyVRRStixbV4BDav4AKuQ8omWuHraCc6dJ1iX6t94GybJp/PrXPz
 T7wol0N3l3HFBz0c2YfgNGKEsCl2NLd5ULfbyCkYiKp76kQoBcAXLkIXcSiFvm47PxDA
 w+0E8W6gLO5r6OncXmTUP6ogz0ukQ4caebP1q0G+HvHBMRMsnAl0t4piTktDDWqxZbFe
 B4lrFPZZJSWmeIOh499ZZUq6efRhCN550vRtXqq3PD0d6IeQ1SOLpUwFrwrUtV8slg2H
 WwBg==
X-Gm-Message-State: APjAAAUMUb4CLN6OchqbSlNcGmsTyCfAQNI3UCKaGL2q9s/VrWK6uqPt
 vkltpiMJw1Ug4avNb6LautqFTB0G8qI6dNNKwMc=
X-Google-Smtp-Source: APXvYqwewLUxYADIoBcBQRX4Efzf+CAd/saoxxujYidpsFC28B6J5rhGfQ7a3JNH5kkvVoDjcNeNoCcZHPEX02AayQI=
X-Received: by 2002:aca:ab04:: with SMTP id u4mr318362oie.15.1558375716877;
 Mon, 20 May 2019 11:08:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190520144108.3787-1-narmstrong@baylibre.com>
 <20190520144108.3787-5-narmstrong@baylibre.com>
In-Reply-To: <20190520144108.3787-5-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 20 May 2019 20:08:26 +0200
Message-ID: <CAFBinCCFbKaz=dVkF--sfwRag-+N6wR-6ePsNSGnLXu=N1mbkA@mail.gmail.com>
Subject: Re: [PATCH 4/5] dt-bindings: gpio: meson8-gpio: update with SPDX
 Licence identifier
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190520_110838_311264_45C8FA53 
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
