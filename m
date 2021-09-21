Return-Path: <SRS0=phzD=OL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81D5DC433EF
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Sep 2021 07:25:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45C86611BD
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Sep 2021 07:25:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 45C86611BD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8U8xZn6lOvMi5c7px4RV7mAwXKaf/RxPNgvUPN3Up10=; b=eFCbozVj3yapnh
	19hqmaow89cpHyyrrRHxJ5l8v5s4rSjlHIyQsKD0FZgQIi8SiLWPAvvHh/AagsDbgau50imudu2WJ
	ka1nffhZdJd5mJVWR7r3BqJJEuQIoerQOjZHcvKJPl6l7lAn3T4wBDHkFT1og/HCVs3BDzgPIHYDd
	647LfJo2mLCIuc3isOjGJMf9JCp1omS/ozCYG/aNjhMdqKLVBILmEvSkrSU3oZ9cGYbJWe7FHGIKv
	AAJpMBUTa6JScrfXuJqhy+1AuPkjUwK9VdI+5k+O4bHhv7AETwU+Ukmp6n28Rh3RWVwcLokC21LUC
	Z9RgzaKIMa4xbCTJR0EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSa9s-003njM-0f; Tue, 21 Sep 2021 07:25:40 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSa9p-003ni2-Pi
 for linux-amlogic@lists.infradead.org; Tue, 21 Sep 2021 07:25:39 +0000
Received: by mail-qk1-x72f.google.com with SMTP id f130so12151433qke.6
 for <linux-amlogic@lists.infradead.org>; Tue, 21 Sep 2021 00:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HbepRd/9QrqmFELT1Udt1ETNE18nDF/CjAG8jFkssbY=;
 b=jBgr/jGQ+bdCSFNqA74BZ4IoJkcR5vuHHVyOKfUXtZITuA798u1OI/ZXknWpRXJE9m
 GHfZyU07ZrQWwTrgSdVZNI25ogIu9JD+NxlJW8dLUbQAj3XSrycTW2v+0u1HT2TwU7Z4
 7vTM3E4rNFeRDsVXC4ridjs1Rz609QgucyVTeSvgQmyXAYSsWGzhQjy2drwFSe7q5v5B
 AtlmSKGWRfTXvxYCVoNOWV2oYgSdJW1HrQRxMbKRubvmb3Y4Mq97fjRJDrhkljcWD/3b
 gqN+Qn0rFkXkSJMfj6UYmEiSk/fKwTKk6AFIR57fPKARKIACO5W003D+F1ndz67HuF56
 UCpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HbepRd/9QrqmFELT1Udt1ETNE18nDF/CjAG8jFkssbY=;
 b=tOvbKzyEyy0FYEV0cJg1I0K16BSmvU2B2VbhCUot3SB40UWk0WnYIEJRYcGlRhC+Ii
 yo5bSMHa2nuiKTnnu6RNQstL4j7dd1jzFSCvil6SF5K3ZdUS/FAEegbqsMAJ/ACg0jzo
 IBM5CsyKbNkH9IqZ4SJkLDCJIIHzxw0BL++tTiNg8GV0gXodSbTtY8Wh51gefwP0N+xV
 lIIqIa6lwnY39yy6ewOkMjRIskIp/OyLikJ3civTBj9JSWDhrwqU3NqJahwnxFqg4sh3
 BEJ46InsekJY/TUWC2v6WNUGvPV4sLVu2i+txGys4rGC9lhbYFAylbzwuYeR1K/dLi35
 Q34w==
X-Gm-Message-State: AOAM530eIHOLLyc0WVbs1YuKbDxNgHkRjUHE+9l31v5eILbtx7ki4Rlo
 Ab3xC0c7PJ93zmi+ZU8Tn2RzigArJaMrEjU8lIk=
X-Google-Smtp-Source: ABdhPJwSU/cawDW5Xk/8OB91SBE0w3zrz63HCCw0vgKpZbEHe8uKg3e0CcfnM5otx3akch7ZJrS4TTULTWS6XuroU5Q=
X-Received: by 2002:a05:620a:254c:: with SMTP id
 s12mr28199810qko.112.1632209136403; 
 Tue, 21 Sep 2021 00:25:36 -0700 (PDT)
MIME-Version: 1.0
References: <CAEsQvcsNLJYezYNpDNGJX49NhWgAqjAYAPDcbwrg3+0PmZdh+w@mail.gmail.com>
 <CAEsQvctayUAp4Cx=TaqjUu90VNZa1itqyfqMNzDrDGfr--aSQg@mail.gmail.com>
 <CAFBinCC+7sgtqr2rQPP3OX9v7yss3nm0eCjpx4qan5_BQJ1eHg@mail.gmail.com>
 <274de82d-74f7-ad8b-2707-c424ecb6811f@baylibre.com>
In-Reply-To: <274de82d-74f7-ad8b-2707-c424ecb6811f@baylibre.com>
From: Geraldo Nascimento <geraldogabriel@gmail.com>
Date: Tue, 21 Sep 2021 04:22:05 -0300
Message-ID: <CAEsQvctEXDuoh9DWZtRTrbTRy0qL+4LKyrCrGy7Q17QBNr3Gkg@mail.gmail.com>
Subject: Re: Regression, bisected: meson-dwmac8b never loads, no ethernet
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, arnd@arndb.de, 
 bjorn.andersson@linaro.org, linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210921_002537_860729_B34460A3 
X-CRM114-Status: GOOD (  22.98  )
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

Hi Neil and Martin,

On Tue, Sep 21, 2021 at 3:57 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Hi Geraldo,
>
> Thanks for the report
>
> On 21/09/2021 07:31, Martin Blumenstingl wrote:
> > Hi Geraldo,
> >
> > On Tue, Sep 21, 2021 at 4:09 AM Geraldo Nascimento
> > <geraldogabriel@gmail.com> wrote:
> >>
> >> Sorry to add further noise to this, as there's still 6 release candidates to solve this regression, but the correct name of the driver is meson8b-dwmac.
> >>
> >> You see, git bisecting the kernel had my head spinning so much that I apparently switched the proper driver name.
> >>
> >> Speaking of which, I swear I ran git bisect every time telling it good when where's good and vice-versa. And was I left with a qcom general device tree commit that also merges qcom 5.14-rc3 into 5.15 because of a regression in USB apparently?
> > Which board/SoC are you referring to?
> > I can confirm that dwmac-meson8b still works fine on an Odroid-C1
> > (Meson8b SoC) with 5.15-rc2

At least for me the issue is gone in 5.15-rc2 and present only in 5.15-rc1

My board is is based on the q200 reference design, with 1 GbE external phy.

The only difference between my board and the q200 reference AFAIK is
an Atheros Qualcomm WiFi / BT chip, QCA9377 but this is unrelated.

It's a TV Box branded as H96 Pro+
> > Newer (arm64) SoCs additionally use an MDIO mux driver:
> > - mdio-mux-mmioreg on GXL, GXM
> > - mdio-mux-meson-g12a on G12A, G12B, SM1
>
> Indeed it's an issue with mdio muxes, a similar issue had been reported by Marek at https://lore.kernel.org/all/0a2c4106-7f48-2bb5-048e-8c001a7c3fda@samsung.com/
> and it concerns commit cf4b94c8530d ("of: property: fw_devlink: Add support for "phy-handle" property")
>
> It may be the same issue here.
>

Whatever it was, it seems to be gone at least for me in 5.15-rc2 so it
seems to be low priority unless it reappears.

Thanks,
Geraldo Nascimento

> Neil
>
> >
> >
> > Best regards,
> > Martin
> >
> > _______________________________________________
> > linux-amlogic mailing list
> > linux-amlogic@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-amlogic
> >
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
