Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 280F6C54E94
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Jan 2023 14:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jXvBZh4x7PpUS79U7Y3Fi1bL7Imub9rwdIHQEguwbzU=; b=4vHw+QLmNyTMTp
	5++TpjWNlUSjTekoHDfCP6HsxnSSa4YRYprrhzQ9HQEkFs+x0FpokE582Fd9e7OHjihg9a2AELsTw
	l7AWwS5FWDb7nkUdqMzfsu+fhjoHqxnXSUD+QBQ8SpaDFLjXNPijxcsZzQv3T8SaH507dEOnPJ/Wd
	MHb3B2CS2TlHSnnxs9GYYJc+LbOfbTzo8n51loNyX3gdsw+IGueBODORkVGNRyLkB4AUFbDPMxPNO
	8Q/KcwCxJXyzHWU50YEvuuBJDzd4kHG/c6Nl+l/rB5Oel76G2HpQCsS9Oi1TQY9/jhWvHkFaKHB67
	l6d57yhBrJKy/avrUaMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKghs-007Wxn-RJ; Wed, 25 Jan 2023 14:24:56 +0000
Received: from mail-vs1-xe2d.google.com ([2607:f8b0:4864:20::e2d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKghq-007Wvs-Ej
	for linux-amlogic@lists.infradead.org; Wed, 25 Jan 2023 14:24:55 +0000
Received: by mail-vs1-xe2d.google.com with SMTP id j185so19862169vsc.13
        for <linux-amlogic@lists.infradead.org>; Wed, 25 Jan 2023 06:24:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MUqrk3GP/3DhSmWkuOs8ye3NG8xp7aQ+gekfrX4lQc0=;
        b=ZdftSwjj1akDmWaqauSggV71jW2O+HXguAfnqr6NnF30jtnzzC1QbrFAJEAxUiPUC2
         2EwQgfL9avUaF/FtKblPe7764ZyUIxLYHv0Ujvu8Reailrj99ot/mgUfGb4JG+v+cjR4
         0SImZT+cU08V9+a3xPMyJcCz1utBX6387Ol+k6GkHKtU7qt2s1EUL5cyxY60aQxvl5PP
         NTajtuHRDbtB+MutOWPhxu48bOLX/7lEAGsvYdGQG6IChaxsLzMCRDLMl6IfJwMZhk2k
         X2oYHLmyalFzic/odZzxSnfPTqtwyXgzb5ywVXsjjqXFZIGwDRlVlf/79YqGj3LiA/01
         nFng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MUqrk3GP/3DhSmWkuOs8ye3NG8xp7aQ+gekfrX4lQc0=;
        b=iOynGhxHLSslx58TNAIWQbmyO/x/oGGxyqXaedaf0+9sJD/Wab/m44pa7/TSF9aOh9
         o1u3VYZCLBnILwi5YkagIHCv56oolXyBV9TP6KraWgSWmkws0pj5o7GkhKyccxe3P4JO
         cxn/6OS9DGdovygcSECYhi8ST2nrq2dAuAfJeHJDu9EyCwKtP4aZvNcrGth1/XV3gbIU
         qX/+ZRvUWJ339JZHGmgZzBjesWT3+pYJOc10vJ6G2WaCw+7fcrrNDeHs0RPCoi9BUvXJ
         UBQqsDn5Y7/F4hQW9gMwy4Sa2xinK5KzX0C30tas176XlFGjpE3O2MTTJNMsRJnk+GvY
         zYXw==
X-Gm-Message-State: AFqh2kp9hpUw8lQEokPTnjtV6G+ytXKccNz0frTn5ohcmZqR/bRamJcO
	88cvrfZ8BJcmebXO8UQo4WJTuT4ZbejRd7/DQog=
X-Google-Smtp-Source: AMrXdXtp+1+l0V7eBzDbpTKwsXlca8z4HTN//sBpr4Dtwdc6Xx/uxZgT00JsWeAYoFgKAlb6wawZbQI7lVXyFEiKCm4=
X-Received: by 2002:a67:d097:0:b0:3d0:cb3d:ad47 with SMTP id
 s23-20020a67d097000000b003d0cb3dad47mr5095413vsi.76.1674656691211; Wed, 25
 Jan 2023 06:24:51 -0800 (PST)
MIME-Version: 1.0
References: <20230125072605.1121-1-linux.amoon@gmail.com> <20230125072605.1121-5-linux.amoon@gmail.com>
 <bd29cba9-fb1c-051e-e10e-cb3e73ec5ff9@linaro.org> <CANAwSgRWVPghhEwvQgzQicJHcjgAv_d5nYfE0Ni90butc5ouSQ@mail.gmail.com>
 <d2ce0dce-eaa0-12e9-e250-bf948d2ce9e1@linaro.org>
In-Reply-To: <d2ce0dce-eaa0-12e9-e250-bf948d2ce9e1@linaro.org>
From: Anand Moon <linux.amoon@gmail.com>
Date: Wed, 25 Jan 2023 19:54:33 +0530
Message-ID: <CANAwSgRDM87oHsVSkxieD6C-+eAV__TKL8e2P22ucQ+iJEooZQ@mail.gmail.com>
Subject: Re: [PATCH RESEND linux-next v4 4/4] dt-bindings: usb: Fix properties
 for VL817 hub controller
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-amlogic@lists.infradead.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_062454_514146_880B0151 
X-CRM114-Status: GOOD (  16.17  )
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

Hi Krzysztof,

On Wed, 25 Jan 2023 at 15:27, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 25/01/2023 10:43, Anand Moon wrote:
> > Hi Krzysztof,
> >
> > On Wed, 25 Jan 2023 at 13:10, Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >>
> >> On 25/01/2023 08:26, Anand Moon wrote:
> >>> Cleanup by removing unneeded quotes from refs and
> >>> add maxItems to reset-gpios and fix the required list.
> >>>
> >>> Fixes: 31360c28dfdd ("dt-bindings: usb: Add binding for Via lab VL817 hub controller")
> >>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >>
> >> NAK.
> >>
> >> You ignored my feedback. Please help me understand how my tag appeared here.
> >>
> > I have followed your feedback and modified the below patch
> > I thought you review these changes see below.
> >
> > [0] https://lore.kernel.org/all/df1c8545-01d0-3821-0c19-07a369e40472@linaro.org/
>
> This was entirely different patch. You cannot take reviews from
> something else and apply to other patch.
>
> Best regards,
> Krzysztof
>
ok, I will keep this in my mind.

 Thanks
-Anand

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
