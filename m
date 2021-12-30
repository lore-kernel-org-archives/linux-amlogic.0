Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08BB7C433F5
	for <linux-amlogic@archiver.kernel.org>; Thu, 30 Dec 2021 22:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TMs/xG2uCHCKchDrqD+IaLXXV8vRdwi/ViCsjBaQAgg=; b=M4rLC++sVnpMNl
	sEbPcKGgJpTJOHi7l7eTr8o7+EgFkq1fCsQnMxnROumUPlsxWNNgxGYjbXnnSW43IH3segxg+JUYR
	rNAhgMMPraWUG81ysblrMfbIYb+JpZkbCk+ek+v8q+u8WNsbG+2p4dk+E/5+7WDEGnO3xBFH57zwR
	v4DWJFkhcXBdZmHAsGpMsX+5TSBJVoMR5V3A8/0la4JTMxFVfE7DwpdWoBMUh3aSQonAbhx8RKp+9
	/AK8GCL5XznHbcA+0Tx2zpdQuRiMflXTP9hs3Kej1BwmmbG5uuscjCJYc2rLxC2xdeDy3gbt33YCD
	ZJluOcnMklgatEbL6FxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n33W9-005IPy-Ia; Thu, 30 Dec 2021 22:03:25 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n33Vu-005IMb-CM; Thu, 30 Dec 2021 22:03:11 +0000
Received: by mail-ed1-x534.google.com with SMTP id y22so102779767edq.2;
 Thu, 30 Dec 2021 14:03:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ro4azlri2Zm/Aj3GAOqfPGTdL14kEj8hPy5vMhDOk3s=;
 b=iZcOuTOXbnajSmpNak/VH7PsvvLtp7oEpjNKsstHxFFbHjcWBkdhbJcUVC/EMDnYe7
 F94AjkOUtybuY2vsSPVB88twIXpC8q88mo6hnAy48hi+mZUrdrbKZYpFGg4ve0E/U4b2
 Yo1V+LVp5nLIcxS/wSCBPYRQKrmQElRNQmXCpvP1GJYUxLwtMF21cSImggQJi9qoqtAS
 fWSX1E10cg8xmXRW6nut40c1xeYGw52QS/O6SA0aqPfGoTVSulhGyQXu3EBo4hZ5vwmN
 nNSpyL+ZczpsEQVoHfeec+b4HXwA4wylbZA7D+r2ldFygowyaZ3fDIAADfoH5s/hjGcR
 vljQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ro4azlri2Zm/Aj3GAOqfPGTdL14kEj8hPy5vMhDOk3s=;
 b=rq3donw5i4ObMTjAtjWTlKjtqNEvlIC2Ze/U35wd7n5w+FhbV4H9Js/VLgIw8iCnSw
 N9dtrrOgjTkmdmjwW2F/2jtPPfsQb+2rRmi5eQVEmNwHBMMah6Oaabg8jtg4Wug8OtpW
 CXmEUd2P73RIEUVpNLl+etHrj/mjkUqNZxBhtbtGdaHvvTJiRZTSmoQvc+lPBR32F0a5
 jEtfbnLdgTX+muIL2iwB/Vt29orArs1Y52yhkKi15jZIGRuwGNxLe1+cBLXQXxb35LaM
 TRkLVSWKHvVpt+Uotj8s+P0dNhXQjQXin0ArOXHTF3mVUbqswCgXqhZv+I3YG7DXIaX8
 DH/w==
X-Gm-Message-State: AOAM532YMXPcZpf5gT61EsGYqoBT47EwoKDzWRuMqOY72TQZ1M8ksJKd
 KshwRxovk+yBeG+UybkRfxUJMuDjT5a5rLJVegw=
X-Google-Smtp-Source: ABdhPJzytRLWIy3Sg42BMbiWEwzl3/6DV0vgiArKAMhEQP8GnjZyILfsCFjEWtF5ALNni05otch+vMtoQ/ooRgfx3iQ=
X-Received: by 2002:aa7:d55a:: with SMTP id u26mr31861066edr.265.1640901788806; 
 Thu, 30 Dec 2021 14:03:08 -0800 (PST)
MIME-Version: 1.0
References: <20211229121605.10513-1-qianggui.song@amlogic.com>
 <20211229121605.10513-3-qianggui.song@amlogic.com>
In-Reply-To: <20211229121605.10513-3-qianggui.song@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 30 Dec 2021 23:02:58 +0100
Message-ID: <CAFBinCDL=KF2CQyaH0k=qTTEsHmuG_CfXY+6MWyMcY0Qb3SA4g@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] dt-bindings: gpio: Add a header file for Amlogic
 Meson S4
To: Qianggui Song <qianggui.song@amlogic.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
 Rob Herring <robh@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211230_140310_452479_5F819DD3 
X-CRM114-Status: UNSURE (   8.40  )
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

On Wed, Dec 29, 2021 at 1:16 PM Qianggui Song <qianggui.song@amlogic.com> wrote:
>
> Add a new dt-binding header file which documents the detail pin names.
>
> Acked-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Qianggui Song <qianggui.song@amlogic.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
