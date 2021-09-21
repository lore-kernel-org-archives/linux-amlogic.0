Return-Path: <SRS0=phzD=OL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E1BAC433F5
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Sep 2021 05:31:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A3C96112F
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Sep 2021 05:31:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5A3C96112F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZHLiz8UoDkBL0IQNa19dOj8P8QRptOFQQxQXuWFLV9c=; b=25+knsuADrpu3L
	xHITqQv/pV2u/fFUIjY0Tx7Evf6MIprJPoPH6gQzTLci98JQakUEBsra40qjWLKGgBRU2wfByUiLJ
	cPunfFEa6eM7HztVr/y+rrsPqJzep9OAFIpPHfHr3Kd3jH79ouFKFlGFzv2nS4HoUgvAgN1W9Potf
	Ad8E/XWCJ0q1LkqRmEsw3/aGzy3+W+yh9qrbbgwvQDTwzW0vOROjgBU5g/DOrPW3pOFoZAMsc+EeZ
	a9GQ0+WSTHU/386GnTaxpyd6f7Z1wbKF5+5ZJxChQaosuNSlSf4ScsOt3nuNPSDduS2oDUHHqkVwm
	MgIBNqOTW4M54W3d4saQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSYND-003dRz-0g; Tue, 21 Sep 2021 05:31:19 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSYNA-003dQZ-9X
 for linux-amlogic@lists.infradead.org; Tue, 21 Sep 2021 05:31:17 +0000
Received: by mail-ed1-x52f.google.com with SMTP id dj4so14030289edb.5
 for <linux-amlogic@lists.infradead.org>; Mon, 20 Sep 2021 22:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=47t9liEPCAAtIKpomblMKF0aRdTeNqoGOOxgmNaotL4=;
 b=MHRcd8ctHwjFXsWxirbSJyWpR6oGYCXJRXCYFEM9DTlugmVfmM2J57/+wWkH229yAu
 EHS+xRInKUsQZIGzylBtxEl2EOZn3L0wdj8JADEbMVlduQ+s5cDgLa+trmSF1SDQUTZD
 2xAaYzMWJo1pmGeLvAnzAnZmj+/FsBxsJnv4RXsQknj2CsmLgTWDnd6S7AjaKm+ByQGz
 DopJpe5cWf27epb57XN5LFYiRyN1vKfX6mTJIRFHZC2ymIunJRlan5IYr0qvTOzSo/0H
 rU8dNfhreWh34xIMfax+KLPmLpsif5cgDwRmX270oG2Xo8D8C3eNwg6+NgMdz1awXcog
 NWjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=47t9liEPCAAtIKpomblMKF0aRdTeNqoGOOxgmNaotL4=;
 b=ZSzhVGaTa2jiZMmWRcAZFyXc8e95ScC2FXV6dhUVwwdCnIcH1TN2LapupvpC2XQgke
 iX1SBF1lWk6McMuq+m8bzSBPs2+taX8i7tIL7rnXbB+iKtLMikrEv+LOd7zkAjwLXnBx
 r44Fc2GchrVksbbLNE0Ymau15sUSpIKZlgnnNBEh0/NGMt2ssCWwUFPH7HdQmTrz3bSB
 KK0sivoiY2/BMJT3B6N5IjtZLcu7Hk4DYRxbqRee71XoRa1e7RhMew5FkfOT3bSKS0EZ
 U0IpD9jWUy3wkUg9LRTpmGcz+QbsYz3MllftAEguIZr7mc3L01uqin0SgpzMhYyBkSNt
 jClA==
X-Gm-Message-State: AOAM532o8lrTYHcWW7emOxgM3CEb9H4B29qEFwWNdA2aJu4ft1jkPKRF
 9Lr6/h5AlIVzvpgmQx/n+jt0/asnXAgz/b0ibZ8=
X-Google-Smtp-Source: ABdhPJwmIliQjA3ngYpHCC64F/u7ykJSw370yJggZCOGKguOmhoMl5U/A7ZtYVV3BvSkiRovQ4wGT3Yc3DraC40VMvc=
X-Received: by 2002:a17:906:e105:: with SMTP id
 gj5mr32007913ejb.408.1632202272758; 
 Mon, 20 Sep 2021 22:31:12 -0700 (PDT)
MIME-Version: 1.0
References: <CAEsQvcsNLJYezYNpDNGJX49NhWgAqjAYAPDcbwrg3+0PmZdh+w@mail.gmail.com>
 <CAEsQvctayUAp4Cx=TaqjUu90VNZa1itqyfqMNzDrDGfr--aSQg@mail.gmail.com>
In-Reply-To: <CAEsQvctayUAp4Cx=TaqjUu90VNZa1itqyfqMNzDrDGfr--aSQg@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 21 Sep 2021 07:31:02 +0200
Message-ID: <CAFBinCC+7sgtqr2rQPP3OX9v7yss3nm0eCjpx4qan5_BQJ1eHg@mail.gmail.com>
Subject: Re: Regression, bisected: meson-dwmac8b never loads, no ethernet
To: Geraldo Nascimento <geraldogabriel@gmail.com>
Cc: arnd@arndb.de, bjorn.andersson@linaro.org, 
 linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210920_223116_378168_75427F31 
X-CRM114-Status: UNSURE (   9.87  )
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

Hi Geraldo,

On Tue, Sep 21, 2021 at 4:09 AM Geraldo Nascimento
<geraldogabriel@gmail.com> wrote:
>
> Sorry to add further noise to this, as there's still 6 release candidates to solve this regression, but the correct name of the driver is meson8b-dwmac.
>
> You see, git bisecting the kernel had my head spinning so much that I apparently switched the proper driver name.
>
> Speaking of which, I swear I ran git bisect every time telling it good when where's good and vice-versa. And was I left with a qcom general device tree commit that also merges qcom 5.14-rc3 into 5.15 because of a regression in USB apparently?
Which board/SoC are you referring to?
I can confirm that dwmac-meson8b still works fine on an Odroid-C1
(Meson8b SoC) with 5.15-rc2
Newer (arm64) SoCs additionally use an MDIO mux driver:
- mdio-mux-mmioreg on GXL, GXM
- mdio-mux-meson-g12a on G12A, G12B, SM1


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
