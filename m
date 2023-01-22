Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E17AC25B4E
	for <linux-amlogic@archiver.kernel.org>; Sun, 22 Jan 2023 07:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z8QAdCIWq+ydpT+fxgwjYHGfa68QaOWPsNCzNHNwvOw=; b=TWpWVGulhJOB0I
	M17CQd5glcFq/Lowf9MLHhLG4YTmWsMLdz+r7DGvtFaYVS4K++HxoLa7FGrQiAplx6XvRgQ082Ul2
	PNx5gTauV2foNvmqmVFhzikF05D5BFzp4T0v00RJNjX0LqxOjU7dD8gLi6rcTuuIjC3fxCXkipbf/
	Li5emMNKzblb+wtHSg8phxVdj9sZmag4WhoN8D4g9L+Wcq4ioKpt31+26vHMBimwr0zgK7OFzy0aE
	2+vg2iGV0SsE4iNGw5NMrUM3boDmxkbPdNjTS3y0ZX0IMBk0G1Xe5usVAV1r9+3O7QrBvu8RR+JYm
	9UwDGjzk4SGK200xy/SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJUOy-00EwyX-C8; Sun, 22 Jan 2023 07:04:28 +0000
Received: from mail-vk1-xa2f.google.com ([2607:f8b0:4864:20::a2f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJUOv-00Ewxr-OB
	for linux-amlogic@lists.infradead.org; Sun, 22 Jan 2023 07:04:27 +0000
Received: by mail-vk1-xa2f.google.com with SMTP id q21so4562111vka.3
        for <linux-amlogic@lists.infradead.org>; Sat, 21 Jan 2023 23:04:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wSHyX0ABKy6xRv7EWotuZ/V83E4MGkAANm24o1WeLUw=;
        b=d3PR0Rzh7ea7fxDUksSd39xo/nyHqV80m0PXYV2IzQaXnDPD4Z4DKj2id6eWEb8qTW
         7kUYDxM4RnXho1DRNqs7x+nXw5dND40MtM9v87ZINruh+yCEBgd//AYhdRGel7gZrZWM
         saeZFtW8wzWvrEu7FF+FF6M03zx0vLqkoZPpexhxzR3nyKiC7mvvAWiKeeG3M0kNLUSz
         zY1xr13K0t1h4ut5nE0iRG+fq0zb+ZYokB2ifbHBpncJtNcVQPJyNj8XCRBeUnjc0Y8E
         IC3P/oiMnOqMj9eWzLcVzM/zNr84Ui/peCk3cWtLwHgD0rrCCfnsb2i6cNq1yiFuOUVB
         rd0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wSHyX0ABKy6xRv7EWotuZ/V83E4MGkAANm24o1WeLUw=;
        b=sYV0FyPokedRFNp/yzfLvmz8jSJ0W3msLIsftQe4PeDLdVaDVJBH1eG/r9VD7TNJ0i
         BGjIA0dn7UbM35Mtanj9deMproix4Zh7ACh2WW4nz+YPFP+4UtTGUZJ1oWaqjyUflHxM
         PJpyyKmsddmDVq3BGraHqjM4xvLU8Z9l/zqGVcIA9KZi0QIDesrWA/HRV4CY7HASMJyI
         IQnPf4YSXiRR2GmYR8xWONU0VYK96mmAyO4uDf/HAixOcumdCjQlUvuagW7PEGrJ90wM
         JSJEzzEkZsLFNjhpKAlUsQByK9a686Kd+9g2AfWeQERO2tl/u5SXOZSgsf4JjT4Zm29n
         d+kg==
X-Gm-Message-State: AFqh2koUw+Gp4r5E+D6HG3OwvkpnI4emH6sO/GIHiwrM5vqAj4vl+m8V
	LWXnvrPXeIortxQ9Yus9TZIyJ8E/+BIgPmMNisk=
X-Google-Smtp-Source: AMrXdXukPFFOYF/qcvgiJmjZfQKsMV7ZehX/gcgF2chIf++qopIzbrt2jDOFPqnWLLg+DmKNiU4J2qdbjl64YHwmFUY=
X-Received: by 2002:a1f:90cd:0:b0:3c5:db35:9288 with SMTP id
 s196-20020a1f90cd000000b003c5db359288mr2716558vkd.32.1674371064425; Sat, 21
 Jan 2023 23:04:24 -0800 (PST)
MIME-Version: 1.0
References: <20230121175639.12818-1-linux.amoon@gmail.com> <20230121175639.12818-6-linux.amoon@gmail.com>
 <d0bdc8f9-5ea8-5c77-3193-a2932c87156a@linaro.org>
In-Reply-To: <d0bdc8f9-5ea8-5c77-3193-a2932c87156a@linaro.org>
From: Anand Moon <linux.amoon@gmail.com>
Date: Sun, 22 Jan 2023 12:34:09 +0530
Message-ID: <CANAwSgT4P544a2MeybV_hXkDfc_HXiO4Rnxt4qG3RM1-X-KCEQ@mail.gmail.com>
Subject: Re: [PATCH v3 5/9] vendor-prefixes: Add VIA Labs, Inc.
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-amlogic@lists.infradead.org, 
	Matthias Kaehlcke <mka@chromium.org>, Alexander Stein <alexander.stein@ew.tq-group.com>, 
	Johan Hovold <johan@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230121_230425_829934_2821A858 
X-CRM114-Status: GOOD (  12.37  )
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

On Sun, 22 Jan 2023 at 00:21, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 21/01/2023 18:56, Anand Moon wrote:
> > Add the vendor prefix for VIA Labs, Inc. (VLI) is a supplier
> > of USB and USB Power Delivery controllers for multi-functional devices
> > and platforms.
> >
> > Website: https://www.via-labs.com/
> >
> > Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > ---
> > v3: - None
> > V2: - drop Drop marketing, so without "leading".
>
> Wasn't this merged? Didn't you get email?
>

Yes, it was merged into USB testing branch.
I have rebased it on Linux master 6.2-rc5,
I hope this series picks up again.

> Best regards,
> Krzysztof
>
Thanks
-Anand

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
