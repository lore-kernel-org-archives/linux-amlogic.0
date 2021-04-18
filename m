Return-Path: <SRS0=2olW=JP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58D2CC433B4
	for <linux-amlogic@archiver.kernel.org>; Sun, 18 Apr 2021 20:16:24 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 19F28610E7
	for <linux-amlogic@archiver.kernel.org>; Sun, 18 Apr 2021 20:16:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 19F28610E7
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=j0vhrdNXL212x+Nh+pSQ8UDemSQaRiRyOhy9gZGDKfg=; b=hek/bJbi5Dj5EJC5BhrLN3LUS
	T9XKPvlwMuQQ6ljEeMndbm6OXzKfLjVU8aMIV6g0RXwJIc+GVSoHN8lZ6/pS4otuHZcSIZaZ9MUzh
	xSv0V08NhwzdWQt+TxMHbXmJD9fOE1uUFNyhWT5bmRnlLEh03OiJ/CtSB0SexG2pkOnnm0qO20Ni4
	7/59de7HsSmZ1cl80oOdkvNj+9oBOnW/qdeZ5jY8ld+nm0N9mOs8wJdnZiZTEMSUeVtcEWxxPbKHr
	wQVq3ieabRuCRJo8yQLKeBOd1b97ZzfFB3cu1yQSyWL+YbSmM8KUQHetydfok5T7lWlyPNsgwmpzq
	DOn1dL8Fg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYDq7-008W8m-1Z; Sun, 18 Apr 2021 20:16:19 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYDpv-008W7s-7g; Sun, 18 Apr 2021 20:16:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=aNuUdltEGVx+LNO7Cjlx/rXKrfa7ugDPwassLJV+nSs=; b=dh9mITF0OTunsGtrBDmnFZHtQD
 qbC5fZf7bnI4p4EzF5Z5zf3RyLnGwS5rOGzV1Xfi+PRF+HmGj+qTGy02gFfj9jfPuHC77m9MIy1r/
 VP0DoXjKLW/2/2Ek5d9zhbwV6Sb/YPDUANYXHOaPkKmyVWDBLqRQOe0mTMeS3+6+wIpGK42c6h1bz
 4HlOoaY2HQMPG7hN/DZJ0TrCci5MgM3gPULpuYfhWFfKDDCkHCYlNtaMP7y2gGeKHC8Qm/itYKsH4
 7gH0tFezIMC2ZsX1dzQ03J2tC70bwZSXZs+HuRmXv4fngjdnB132TZtB/L8k4DGw+N4p72JsIEV90
 t7p41txg==;
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYDps-00AeWa-Es; Sun, 18 Apr 2021 20:16:05 +0000
Received: by mail-ej1-x62e.google.com with SMTP id u21so49737162ejo.13;
 Sun, 18 Apr 2021 13:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aNuUdltEGVx+LNO7Cjlx/rXKrfa7ugDPwassLJV+nSs=;
 b=mqPm+w7JmVVzXfnrSms0ASX1jFQJYUm3p1sJbaCl3/uMEbArElAa/R8U9HVvFxQ0hz
 pNliHaRGcBWhgHcNb4xSxzoLx5IHVf3ke0tTMUbYVp/pQN06syEUmeZPHaGAwanbPYz/
 5hfKXtZhctLLIwv8WazMfyxG5k6P12959FpVJuFy98OX0dNx1vwp1E6rNPos3PicqmBm
 9SEMFMjIAhNzyG8ReegFzJpbPEzrinE59CfhKV2IDdIj3ujfOPSyLUTsNVTQMT01GSd4
 T9tNmIdRTOMcB9DgbcbReGxNawcUc3bU5NotsUpebZ8zruG28KZF694GOt0eA1JFn/Zm
 oCyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aNuUdltEGVx+LNO7Cjlx/rXKrfa7ugDPwassLJV+nSs=;
 b=A4yQnjZ6E+HBrfkqkt3vjFlXpz3X/ICVWEr6+JCG5fw4So06y95FvFUfGYU+OsSIuC
 Ln6JPi08TqQv4LpezPRJboDY/YxELrswI1wjz1be7a0sjIf9jB24btlQX+zzG+yCNmPW
 m5wzWbGM/uJwF7fOfRUKKLIa9yEA4cw/w/97Frk2HRGfc76luiq+vvZj9XGMKMlNzDw/
 1Pa4JzkW2fqjplxi2kAKqx93NOuQ4rxIhGyuYYImwg1QHk3yXOZPSh6m2+0x+VfSJexi
 4WP7pTEeTOuzRAHosBa/CFuwomWYXUt4Ca06JpUrUsMMRXWJ4MPYKkoWngoiuUnk5EKf
 9thA==
X-Gm-Message-State: AOAM531LEUW56dgLhq+7iwTlaNYVZhMuo8ZYyWDury7JXlw7JDmXX3r7
 4JZlENIXCn/Y1PDDNTDeJflRm2++Gez9sk7LxLE=
X-Google-Smtp-Source: ABdhPJyhQS7ewMgAuX/LkyOxZdJtKiVze0rTgdP222AQTI32WgZhH+58iLsPWoHbamLBE9hqYjmeo3DutxyH8F6btks=
X-Received: by 2002:a17:906:3ce9:: with SMTP id
 d9mr18688147ejh.172.1618776962793; 
 Sun, 18 Apr 2021 13:16:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210407042609.9736-1-christianshewitt@gmail.com>
 <20210407042609.9736-3-christianshewitt@gmail.com>
In-Reply-To: <20210407042609.9736-3-christianshewitt@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 18 Apr 2021 22:15:51 +0200
Message-ID: <CAFBinCAL1zpcNm5VdbwpwZM1DPvfhnx0+npZvs8Hi5DOLz+7kA@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] arm64: dts: meson: add saradc node to ODROID N2/N2+
To: Christian Hewitt <christianshewitt@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Hyeonki Hong <hhk7734@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210418_131604_540075_856B6590 
X-CRM114-Status: UNSURE (   8.62  )
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

On Wed, Apr 7, 2021 at 6:27 AM Christian Hewitt
<christianshewitt@gmail.com> wrote:
>
> From: Hyeonki Hong <hhk7734@gmail.com>
>
> Add the meson saradc node to the ODROID N2/N2+ common dtsi.
>
> Signed-off-by: Hyeonki Hong <hhk7734@gmail.com>
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
