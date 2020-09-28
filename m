Return-Path: <SRS0=0gED=DF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A33AFC4727F
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Sep 2020 20:42:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 553FA2080A
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Sep 2020 20:42:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RtDwA/Xa";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="MwEitxkM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 553FA2080A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UWW1WmUTJL50vOfs+YpbrUyeLKLLuyzeyOqzxyIFCYk=; b=RtDwA/XaGSybaFABMW3kY7Nwz
	FzR7le9zdI9J9Y8BWPOR6oWq1AfhrCtxm0JLCQvI2Qg+jO5FFk+A5AezrVoAo0l+D0BVXVrbxSDm0
	aUIvHZwqkB03ozyYgiRrhHGchXP+XJHMLsle/UqKzfOjBSoxbW1CFyIAr4GHLSXJUQEdmjarhnBnu
	d1L4IECULOV0CiIHebXo25qkY6jJKLgk4j7SwIFP40IomxXMiaKfnN5bE0uWSTeM7AUFLPKpGvs3I
	e9QLsk8Z4XZ4aY4hGootn72R58WRPo3jisKGx2qVGXhBi2XoXt47H72lmNL7sBHwf9s5SYFFJGrFh
	P+5ICnWcQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kMzy7-0004Ub-8c; Mon, 28 Sep 2020 20:41:55 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kMzy4-0004Tf-6w; Mon, 28 Sep 2020 20:41:52 +0000
Received: by mail-lj1-x244.google.com with SMTP id k25so2134444ljg.9;
 Mon, 28 Sep 2020 13:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zx0CfU3J1VJLQIPqhr3Tt9PxwDIrKT2oBCuJthUB07o=;
 b=MwEitxkMtu7a4LKCmc7FOTgRmpbIRPxCON2NnbgPAFnQQEqbMbB+XPd0FWK0nc0yKw
 FYYNEbiHHsJxrVjZnYWbp4LsmWvle/+Net4bLJ4IBtK1j85PZGtFSEjqDkQAa887AJ5S
 3hPYFtUXoqGi7YVlItiIRYXMzKpsr74N4pcaw3waF+Zz4eZm4YHIegmg7YJNqy9Os704
 5NaI2RPw3U7tHDX0libVtJHw+VZmqTPTLm4zoYnAGwcwcC7NhJ0dLcqRNvj36mUFF3at
 FrSUyVvIfma2dLx9FIMhgUiEqCpgbxeDC1fz/zSJLF7iyEzZEjH9XDV7PiQSodrJGZwS
 pzJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zx0CfU3J1VJLQIPqhr3Tt9PxwDIrKT2oBCuJthUB07o=;
 b=Ym2lkc2ppvokgyVkP+UDeBAc06aiSV2CaBBUGUiNRax6SXvYlbvP/CzKzmxVKUtSzM
 uzP7LNRNZeP+JNp0Z56e3nVCZxXm+ZobJaQOR/JBg5LjE4x4PcnjN6BL+Yt4zB4s2J+9
 HPDuruCviA+i6evM0dA9OKWHYNvuiu4SPVW+m+i+mHbsufe5qBZIhl4nGPXvzyzZy6Da
 qp2Fuo7drbmvFA+OAh3I2daOCr2/9MnCjlQsCFlP7/x4ug51Vwl8wOnVuflHtOME7m4f
 aJu0kM6CFBqJ9Yc4Lg9H018HmzuyNcZviCAETDmGa92x8uR1Tvuw+38ZMMJEU//gU4Tb
 d17Q==
X-Gm-Message-State: AOAM531osU4jA8NHsc6K2u1VkVknmsBz8z4JFjdLU5exZkcZp3o2gRSE
 /zLGmXgJjkG7+gFIsZ/hbe5Ee/wHwBBGf72wYaw=
X-Google-Smtp-Source: ABdhPJxMJ5nOOOYxuicR17q4pCezl1xZMe2K4xB5mxX0ik/kdZii5diCzfauXchgWdRQMoQMPuYNvIQ/9O4BIOjMeYM=
X-Received: by 2002:a2e:99d6:: with SMTP id l22mr100831ljj.195.1601325710449; 
 Mon, 28 Sep 2020 13:41:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200925033017.1790973-1-art@khadas.com>
 <20200925033017.1790973-6-art@khadas.com>
 <CAFBinCAJ6svwiv9OM6EHz7468D9h+jW_ULiGrorgLetcODsAKQ@mail.gmail.com>
 <CAKaHn9+CWLJYN1Tt46VxBGNBEbVVJZWeL6ZJSf9w-5DmoxrvgQ@mail.gmail.com>
 <CAFBinCD0_QgKKcH+Kb2QbMWnx_csoXMEhSFYzmDscdTVB2TUJw@mail.gmail.com>
 <CAKaHn9K6O8u6Br84S63V0PDFBhiRbMdd4-bvC5FxFe6izj_Dvg@mail.gmail.com>
 <CAFBinCAb91M5Zyn8yM1Ww4KKPANM2uqvJB11=QGjMJ2fdU836w@mail.gmail.com>
 <CAKaHn9JxKBKW5AYvUNBAA+sNcHfNQNrx95NtLMnrfd0ypOaAoA@mail.gmail.com>
In-Reply-To: <CAKaHn9JxKBKW5AYvUNBAA+sNcHfNQNrx95NtLMnrfd0ypOaAoA@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 28 Sep 2020 22:41:39 +0200
Message-ID: <CAFBinCDHbV2dT1KsXA6PukhsQXj+48Pes=gUeLGD9DFw7xJdYw@mail.gmail.com>
Subject: Re: [PATCH 5/8] arm64: dts: meson: remove reset-gpios from ethernet
 node for VIM2 meson-gxm-khadas-vim2
To: Art Nikpal <email2tema@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200928_164152_269239_6C68ED1C 
X-CRM114-Status: UNSURE (   9.33  )
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
Cc: devicetree@vger.kernel.org, Gouwa Wang <gouwa@khadas.com>,
 Neil Armstrong <narmstrong@baylibre.com>, khilman@baylibre.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, nick@khadas.com,
 linux-amlogic@lists.infradead.org, Artem Lapkin <art@khadas.com>,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Artem,

On Mon, Sep 28, 2020 at 10:42 AM Art Nikpal <email2tema@gmail.com> wrote:
>
> OK today i can't reproduce it again on my new equipments ;-)
>
> may be its some specific problem we can try forget about this
uh, this is weird
please let me know if you can reproduce it on your new hardware

thanks for the update :-)


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
