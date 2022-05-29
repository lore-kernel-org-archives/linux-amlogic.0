Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECB6BC433EF
	for <linux-amlogic@archiver.kernel.org>; Sun, 29 May 2022 19:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jCbyG0+KHGn376odYN8BHHWsq/zHsmZ2LsWY6n+lvPg=; b=XBVBevuBL8ucPv
	V+37DX4BIUfRlHDCpZddTDM3GGpj2F8sWbiv0K1Lh0TQfK92n7zbkOriy9+lxHcnPNMp/KyJIz9bZ
	RCI3h6Jn3+wBRl4zJAngqgyah8ppF+V1vVkX1Wk21u8sepgnBTv1KRtPNNn6Fu50CHtWo6g0ScaPd
	JFyhcQP1B0SDuDB5Rlk//NnfTrt23VPaldfKFsv12f5Vu/mZDTXSes21JtTDG5W2erMGrw5RXP3wp
	vaqbHU+24JsJ9t4V10dpsWDVD1DvKV0oZNhqgNO9WLdhp1XXlENj+pwB/bryUFTKSj1/I7LCd98+p
	Hl0FOORj3ZQ+BjitvWNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvORw-004Xo1-OA; Sun, 29 May 2022 19:19:40 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvORl-004Xkz-F1; Sun, 29 May 2022 19:19:30 +0000
Received: by mail-ej1-x62f.google.com with SMTP id n10so17282439ejk.5;
        Sun, 29 May 2022 12:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6ztQcdyrzloMjbqIddHmmicr8ARqs6zTnjkcVf2TU4I=;
        b=lZjEbcz5P5VLsqhwarIzO3bmV0L0rbhkAOTuhs27gAeZN0rdivc1naIZgpg5RLr0jP
         2foIfDWE1s3rQL/Id9cESnt78kPsjE+YrbhkdYDPvWf/jI1gcXIX/2TfQjW8r5mRfeBC
         fRw5PjKE46bGhgnmYX2ddS4ShozeO5WFv3wIRssT0zTsD7dbEOX9TD0O9BtsrKiKURWr
         pHxgFZAMqKGBpUlChO89Ap+czIbvXabealiPgWhyx6VQIXYlbZoHriYgmHiVOrYNNgjm
         dBu+uHViyUrhGlqTLkpzd3AiFNvq/S+22v/WcDiALV1yZUCNwQuAsDS/i2MjjTuLoKqx
         zoLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6ztQcdyrzloMjbqIddHmmicr8ARqs6zTnjkcVf2TU4I=;
        b=xPdn2IHQHQHWFgSNUS6EOhdxo0DV88EAElkMLYkb5CJI/Mt/0YU8KH2KOsT8FiAXuM
         RenalPVq+ES5LOon7zPXPleVh/VNg4EVutPhL1hBeI5BXf4KSi38sKQKJsoS339lnx4u
         n72RxFruoln7RLT1wToQCTWcWF0//z7+1fgtjw3RmNR5dbE2xGvdaE/eNg9ACQ9I7HCZ
         +VJfWCzM40cRfmdEim4cB0lGMedLDg3zw0DUzdnm6fJJhr+ysZFM4iWomLXY+hKveqJf
         EeWKrajiGptQDDq9Ob9FFEfPE7MxXhatfODZnlJWg5/xVCd5kPxq5cbODpNOGlrXhPQK
         oiEg==
X-Gm-Message-State: AOAM531DsiXecvemzoeRyGXNH8PE7vfO5WyobbUmRNJ9c5cMFdB5+6LD
	pupo07T1MTU0Km2206jRcKOGDX1Kn84x8tii3/JxatDUiU0=
X-Google-Smtp-Source: ABdhPJxJUW72TCf8hhpo0SFKrfjyWkvZ98QG5o00eQvgVLc+gRAu2Akxu+mFKrJ26n7cHynR4/W0tlJMAjP4z5QPWt0=
X-Received: by 2002:a17:907:381:b0:6fe:9ca8:c4b4 with SMTP id
 ss1-20020a170907038100b006fe9ca8c4b4mr44026736ejb.147.1653851957385; Sun, 29
 May 2022 12:19:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220526204552.832961-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220526204552.832961-1-krzysztof.kozlowski@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 29 May 2022 21:19:06 +0200
Message-ID: <CAFBinCDhyY-ebo-JT1gAPSn7nOoX7ZoePsEe-2NviMhyiDu+4g@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: amlogic: adjust whitespace around '='
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, arm@kernel.org, soc@kernel.org, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220529_121929_541292_FDBD5E02 
X-CRM114-Status: UNSURE (   7.78  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, May 26, 2022 at 10:46 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Fix whitespace coding style: use single space instead of tabs or
> multiple spaces around '=' sign in property assignment.  No functional
> changes (same DTB).
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
