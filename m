Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15B58C61DA4
	for <linux-amlogic@archiver.kernel.org>; Sat, 11 Feb 2023 20:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uWu810pJL37sOrHPXz14TT91RfLOzvWtdS/EhsOkWyA=; b=Ir6ZFDTEjGPXOB
	LlvpIFX6M7RQtc19CKZ+c/gCF+QtynTjC//qOoxwzb0C8b5Ign3i5GuwAW8xvz8Er5O9gync9UjPO
	PruMI1OQaqeTK/T3b66PcFo/IrLxU+3jH47Em0m6oFTjIEV3kOjZGZcpe2mZGF+ArdQlkORwDL6Ds
	L55jBU2a2rYdyB2O/qTMTcr6C+Oa5jfZ9eSC4Tizilpogbulm1LcHUhRZ/gbdtGhf79uhmpiXx6Zz
	4KDAZUHKOWpt5eE9CJPMJbjejGMASKRhsW1rflRlfZLqfUjfOASNA4tzEhzzyGtOtwRPwdv+v9Szd
	SnqJS87/w9J80aM5kpOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQwCo-00AIRy-31; Sat, 11 Feb 2023 20:10:42 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQwCV-00AIKC-Mg; Sat, 11 Feb 2023 20:10:25 +0000
Received: by mail-ej1-x62d.google.com with SMTP id sa10so23315577ejc.9;
        Sat, 11 Feb 2023 12:10:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aqvtYFdR0CJM/IKruwD6L9LivhuvudH2/deM4TDKO8U=;
        b=VaGQ+DB+jTkrMi1vkI0YiEnDC+RGJ7VSVTUDGD8WTUI7roAGNy6pbABULsdeKia4fo
         XfNsawqq8ZlXbRbZjM7rquszBkSfaTGZLsgO1IczIFREpZUZhKBSwawQyK9xSAYyqome
         UbTMgEr932yELRVLPmTypXwOZjKZHknWVXy6iaLqwZ7vFN5GMcTuR6LKYMmLw8Cbgs+0
         SgKzB6pUYglNZ/BIML/rD7KmG7heEFNntTKNdM/3hhOQDxTQalLP1jrUycFBewgT0Zti
         ZAO+Cl0Hu2nRbZc5wK+1/2uxujb1mPuh1IQXOXsGM5+iWX34JIvOoB7fB2f4vmE1mln4
         YXjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aqvtYFdR0CJM/IKruwD6L9LivhuvudH2/deM4TDKO8U=;
        b=f8EKnkolOeFJ28+htvBrS17x34thEF2tN8gR4nzF45YP9z3qby6Kvx6MzcV3iGjxjg
         CU0FzeUn3b1xuIxH2Q6VwALrBa9fDknscHV37Co4s+PY4Ar2H+K5xUOlE8EkUDtOup9U
         doY7/w3Ow+KxWkj1zE0mkeVTrUQcchvjBBDd8MXRomtggH1OuM+diX7fK71LUuZu3q0Z
         duYNCy2vQx7e3S4E/G+SDYwMa9f4SIgZwFiZvhGgDWah4CQDTIr9RXVZDfUiOJzUXlsY
         OHSRZe+tAkgz6Hu3QZ2eQgkbUdeXT7Hz3t/8ZobVDDZTl17IOd8P0PPjc0jFjFMIH5KG
         vpuA==
X-Gm-Message-State: AO0yUKXPy8XyALVyZO9i2KsKQs1kzG/+671+3qeDNu5lwGR8ytm+5oX9
	Hop3He3SDv7awTOOV/1SyoIVEorce2IcAVlB6UM=
X-Google-Smtp-Source: AK7set9+5nzM0kGkpoawYhuBJ1IxkbkuleIU6WdPltyPi0WLRcRSqsIRC6icJ8P/TCMEyzHPC97cBkWZ0ueEvmnIapE=
X-Received: by 2002:a17:906:149b:b0:88a:5bed:62f2 with SMTP id
 x27-20020a170906149b00b0088a5bed62f2mr2641855ejc.4.1676146221795; Sat, 11 Feb
 2023 12:10:21 -0800 (PST)
MIME-Version: 1.0
References: <20230209-b4-amlogic-bindings-convert-take2-v1-0-c4fe9049def9@linaro.org>
 <20230209-b4-amlogic-bindings-convert-take2-v1-1-c4fe9049def9@linaro.org>
In-Reply-To: <20230209-b4-amlogic-bindings-convert-take2-v1-1-c4fe9049def9@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 11 Feb 2023 21:10:10 +0100
Message-ID: <CAFBinCDBwh0KWVXHV4eT=SijHvHUQ-KtwhcV1X9o_f5wHVOTWQ@mail.gmail.com>
Subject: Re: [PATCH 1/6] dt-bindings: rtc: convert rtc-meson-vrtc.txt to dt-schema
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230211_121023_779201_72EDD307 
X-CRM114-Status: UNSURE (   7.53  )
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

On Thu, Feb 9, 2023 at 2:41 PM Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> Convert the Amlogic Virtual RTC bindings to dt-schema.
>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
