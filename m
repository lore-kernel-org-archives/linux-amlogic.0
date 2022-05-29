Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AD50C433EF
	for <linux-amlogic@archiver.kernel.org>; Sun, 29 May 2022 19:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rpHybOJqnj14HoahvFmIdPgF2D3FVDf42aMcxH98yLo=; b=a6U3qg9/Tvk4Wx
	DEKzQ4r+JXrzoZfqkymJzutyCRnXP7adNlweCuyN4YoLAxbO05Bf858Tb05GmfTzNqTX+1LDjiCZb
	osrcsNVTgZDhleAaVMfvEw+o8NKmmrmPb8Iyv/AUCSGDpgP1WqKWFvGxf5Kdj4CFml3/cYk8BgdbF
	Q6KaWMreC+QCHFw4IMd7v1YeEdmzxJ6ETG8PAGQz5nhBVT2WO0K7sjv2ndQOAis9N7BJ2FOLgpuuM
	BdEbjOn/itcYyjCUfLYXZ0O0sAGLbfp9glNCp8xbvTnzP4m47Q3+3ZROZYSMyOK5w6eadkeJgheuw
	2sJE8EAgVEFL6YKKtgtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvORa-004Xj3-Ky; Sun, 29 May 2022 19:19:18 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvORO-004XhI-SK; Sun, 29 May 2022 19:19:08 +0000
Received: by mail-ej1-x632.google.com with SMTP id jx22so17165723ejb.12;
        Sun, 29 May 2022 12:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wc+EE6uFclfQj0Z++trSIQDhAONqieaeq0cvRbIdEio=;
        b=BlHzcGTrKIpNrIPqJBGVqSC3Fmx0nmtG91acp41+I2sSr3UwjOBg7PTUW2jugiyjOS
         KV8gAeOQp1DF/XZ9Pooh/305TP+Doq4JtQ0i8yC2Av2Uz2LdEKbs+j/83L4p2STY1KYx
         En+nLsDLwEMuFHglSNpbCLREVZyMiC0ZGljmE6AXUHKafD5ej5j3ZPMkpy6pzasMO3IQ
         YFcV65NJBFwWCiRBCdOIGxUgh/6rkm9bY7FuQkIDBQxHwPesIXk/xjTinHFakSnFUihs
         TZY2FgsN57eQPwg+TpyxneWO62ff16jYV2HpwWXkdDu7CPj6cTmh9S5XEfpOm6bfxalB
         r1EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wc+EE6uFclfQj0Z++trSIQDhAONqieaeq0cvRbIdEio=;
        b=IoUtE62wxmIb5Oaoii4KXPAOXT7X2gWq4yOt1o7ZgyNZM2pZdFZ9b4u/WeXAXifrs8
         r43ccvhhtKa/8iDExK6eUoP7ShhbHdExjT/MG78Vi/LfXah6X41pHVaTy75c08Fzw/21
         yliUL4BeKFgv6WpuwxnNv6ePjjvaulpbJBX2rlDa2Um1FDxc/zzP/Pesnodzhambvb4T
         /oqRh8DL+sBuBHRKxYFanJh0kAUA9IWeZYqYEfOpAUYtJnyUz/2/guUKwLEypoTUZYE0
         l1XsCVXTOqa/5/XUbE+7tM1Lsp/+EWbj7EzQEU5UB0v8SLP2QZt2XTTWiU3mKn+yVHnk
         GXfQ==
X-Gm-Message-State: AOAM532SiN7qQQM4hp3+8cslKzDHb06/3et/2kHfXm4dKoK7iekwRCWe
	FVyipylQ66Td9FAicVKN4eHjI9OIZ+zss+MoxxA=
X-Google-Smtp-Source: ABdhPJzCykqQ15vSmNqR86SAPkvkeK17qhqbNMfKxY3rcmoGgzF/riVWYcYCENQrz5Q479KG33OuWkNZXm5nuyzqvrU=
X-Received: by 2002:a17:907:7f21:b0:6ff:10b:9cee with SMTP id
 qf33-20020a1709077f2100b006ff010b9ceemr25697803ejc.302.1653851944022; Sun, 29
 May 2022 12:19:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220526204552.832961-1-krzysztof.kozlowski@linaro.org> <20220526204552.832961-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220526204552.832961-2-krzysztof.kozlowski@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 29 May 2022 21:18:53 +0200
Message-ID: <CAFBinCA=VXjR99AELCnV8nLbt=DinWhcpmKnC1jN0p6Dpx83Dw@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: meson: adjust whitespace around '='
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, arm@kernel.org, soc@kernel.org, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220529_121906_974438_A90DA24D 
X-CRM114-Status: UNSURE (   9.13  )
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

On Thu, May 26, 2022 at 10:45 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Fix whitespace coding style: use single space instead of tabs or
> multiple spaces around '=' sign in property assignment.  No functional
> changes (same DTB).
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Neil, I have seen that you applied this patch to the v5.20/arm64 branch.
I am not sure if it's supposed to go there. If not: please add my
reviewed-by when moving this patch.


Thank you!
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
