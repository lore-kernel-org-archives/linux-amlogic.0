Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1F82EB64DC
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Jul 2023 07:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=25BYy1HRdZN1IvPfjwm5Tz+jsArMSbROujOVNu5IGVM=; b=yzDOD7R8qE8Dqt
	gt5SgoeNbxGQmsc+787J0qG1Cx6KnB81l7t6bz8l3G0dB1UleeqNdmR6iLBTD+bGOTToOjrrhiU5h
	6fAEv62i7ytHcZeMk7iqbnOHPezPYJHRHIIhwmzCXYDbP2D5dClVujjTwBVzf2WN1rRPc//ETOxpG
	oZ5g7JUazBbwuHi93JzXmqWyt4zZihTnt8IazqQs8VJDQwBTmyyfFpDXtUnSj/XiiFagm9hL7RBSX
	eoolXlA+PtiMcwj/eEH6LvN81xMONgZi7pDZSaXDxwWN/cwjyHA+IkaDWUrl067w/avR1ySLK9A+d
	ggF7u91nBVBTjPNme1rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qIlIm-00AhFh-1Y;
	Mon, 10 Jul 2023 07:27:20 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qIlIj-00AhEg-1u;
	Mon, 10 Jul 2023 07:27:18 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-991ef0b464cso1039155966b.0;
        Mon, 10 Jul 2023 00:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688974036; x=1691566036;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=12SwgujBvNm5u6+5Cu/MHnSp3kLy9fw9popJaOP4K9Q=;
        b=PJQD/wf5Fs/m/YMEnq5E9JP76DgiHcJ1H7b+cbPxL5uR+FHrHl7b4GCPqrkiapTaRC
         J/Y/Th0wXawHmwDoBFij1OoWYzF6j8Bv/gI8QDaIer+GsUpOBrYSI+7A814pohqJpp7O
         68R+i8cwuv5DbppV/y0qmOCYjxUT3nebMb/lBmtcQjqr3v2tnZAko7Zqj8lQMUs3TegK
         1VsQcskWZohLsVDbytT6haoN9l2xD7nDIJixSTDmHGlxay46ExVAif/l9PWikv3CRem8
         6axXdNPzp+hZT+XetQgTzlrEtmgbAaHxI2+LDMloQM6pyn2HfY0su1IbRfLVdq4RBc3Q
         AQRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688974036; x=1691566036;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=12SwgujBvNm5u6+5Cu/MHnSp3kLy9fw9popJaOP4K9Q=;
        b=eLfI7rzmQMncciYZ3ESjYCz9WJy560PwgCmuVJUSjD8QerqoLxtOBKf4cLoUm8ekRI
         IdYNGS24/yzcuABpm72MoxQKdXZjEKqLCmE1XQCf4lyzDZkVuWQm7UcfWiQqHD5sKEdo
         Wizc5tqEcpuKLjVRVaQVSd3yRvoJrxAuEqOMbRilicu7Lal9wTSkv0e3w8Y1swCzUL5m
         atAztLdE3MFOnwH46RNvnjFgzUgoF2AAfzLRI4wn4ckOmbhgKy1RW8EE2DmEoDs342om
         XYQAAV0SOl9Zr92VtEnpT0Ay/MKijLWAnJpltR5xoOOpalBUxuYYNOkJwOi/g7SCHyd+
         zrQw==
X-Gm-Message-State: ABy/qLZTTq03XkAcavTR1molaVrlcsUkCM+48YyijOx+Cbh8fwnrO5Nq
	xpet2rk2dlw39wkrJl0W6jb47e6eJqxFVbiE6Vk=
X-Google-Smtp-Source: APBJJlELkCEdlXye8US5g/6R435+/ePCacMKC+8upB0zYkVGAIV+dy+ir9Yfy3SW1NAV08Y/UbPfQrhop57vhspWmxA=
X-Received: by 2002:a17:907:6d1f:b0:993:22a2:9234 with SMTP id
 sa31-20020a1709076d1f00b0099322a29234mr19989579ejc.31.1688974035627; Mon, 10
 Jul 2023 00:27:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230710042812.2007928-1-huqiang.qin@amlogic.com>
In-Reply-To: <20230710042812.2007928-1-huqiang.qin@amlogic.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 10 Jul 2023 10:26:39 +0300
Message-ID: <CAHp75VcEUre4RVAoMO0Tg1uRdeOBr-ZLeX9ppNx+Nc0ZdSrtiA@mail.gmail.com>
Subject: Re: [PATCH V2 0/2] Add pinctrl driver support for Amlogic C3 SoCs
To: Huqiang Qin <huqiang.qin@amlogic.com>
Cc: linus.walleij@linaro.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com, 
	martin.blumenstingl@googlemail.com, brgl@bgdev.pl, andy@kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_002717_629700_66AFAF19 
X-CRM114-Status: UNSURE (   8.08  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBKdWwgMTAsIDIwMjMgYXQgNzoyOOKAr0FNIEh1cWlhbmcgUWluIDxodXFpYW5nLnFp
bkBhbWxvZ2ljLmNvbT4gd3JvdGU6Cj4KPiBUaGlzIHBhdGNoIGFkZHMgcGluY3RybCBkcml2ZXIg
c3VwcG9ydCBmb3IgQW1sb2lnYyBDMyBTb0MgKEMzMDhMIGFuZCBDMzAyWCkKCk5laXRoZXIgaGVy
ZSwgbm9yIGluIHRoZSBwYXRjaCBJIHNlZSB0aGUgY2hhbmdlbG9nLiBDYW4geW91IGVsYWJvcmF0
ZSwgcGxlYXNlPwoKLS0gCldpdGggQmVzdCBSZWdhcmRzLApBbmR5IFNoZXZjaGVua28KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMg
bWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
