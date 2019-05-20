Return-Path: <SRS0=EW34=TU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6DB5C04AAC
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 17:57:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2107206B6
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 17:57:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ASkYFCTM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="iJIoy/ix"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A2107206B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DS62WABCkMSoFxJvAP4UCNQSgmXFUFQhlgiiGwhbf5Q=; b=ASkYFCTMJAtkvs
	4iEkMoIC84qlcNO15eMlJcU9OilZTzC3zeqy3a0U1gMkLADpo20bNb/A3dE7l2+xPa4nVnqd4BHq4
	ACnOphR/rI/IGYKV0q16HpZpPIdm9cDQkEaVaOKPdV982AyJM4edRdvDNGNYNj2nKNza7TPkQ+W38
	YaIvwMsKofshyEPHRfaduvOD56QcDcF1JT+ag/mD+NprbyKejgRV7tiR8QIc1Wos8CkyK3X79MbpL
	ha1HvE+DDZUgNInkhKNuDzkuRj3335rQrQwfrHmhy5B9yLUpP2XGz0l6Ql95n2ZgqVB9hGggkV7bs
	bi28DuRwlITCXlpYvA+w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSmXN-0000xK-H2; Mon, 20 May 2019 17:57:25 +0000
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSmWz-0000MF-84; Mon, 20 May 2019 17:57:23 +0000
Received: by mail-oi1-x241.google.com with SMTP id 203so10655083oid.13;
 Mon, 20 May 2019 10:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=O+YhahOwl72NephherQ5nxh/plQqDrRpWmjW6ty6chw=;
 b=iJIoy/ixx6XMCclG0KXm7/4HGgiK0ifwcRsSK37SAmbU7SEWP52EOkgkw2QGxih4u3
 Mvmx69eb8ymJWNLX8R8nwQ+TvKECMa3frmpyCQW7cvsqa8vvziYTt4I9VpDD6v6jWrZd
 szvPKHxgce/lkR4cBCMufNwPZvr84X/vSxLkrRDTwDyi6Y0O/SJrJCj0jTO5a+SGHZoC
 16VXZP/dmKFRa90rzfzm32BhmJ8gVX/IaTKNEEvWzhl+W1mvIVtCCTyMoXq4csxFQwPV
 DbDQbZyM2g9m1FlQbvEGBY7YUopt/O8GJl17DO4IdeVWj7bmAmwBEPAH4a5whgKvaKYH
 dHqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O+YhahOwl72NephherQ5nxh/plQqDrRpWmjW6ty6chw=;
 b=c2sxTODbDJx3cJJg/rTskWbgWemqFJTneT2EQ+cRj/I9Sbgp0Rg0r2Oh4Z+6mbnMIN
 g3DkaTZPiI9YTIxEojWvVkaLmeuufMhr8y32qciKZ+cfPUwkziqZzwL1UkO4ti/e+HPJ
 uqqc5AxNbexU274L4NxnAlkHPa5RnYvgr29qNWuD/OcaNs0CuegHcck2E+cAYCyyKtQJ
 maYRR8k38jDq2bUuCgZcbzH3E5TNLx018GqBZrWkGAUz892Qi03pyRDnzvY1PdFgDoAZ
 qjDweDDluvdecMMB4IhS34fyfoLFEqs4MTNVa6axMr66Fj4pSPpcW11anc5ZWFSMH1s+
 Iapw==
X-Gm-Message-State: APjAAAV1p7nesmoCpiUv++wp1nAUsWty7G7Z/VEwGUuG3oS0B1Lsgdun
 ABy3ZK84p6IdlQIWp5/Hcbg1ZtWH6CiNUKHobEc=
X-Google-Smtp-Source: APXvYqy5VAnJeMmPXq3sDvFlEOPBnOK7QobZpzr9pilr4EW7NuXmZblLmTpenR3KYHgu/fJsbCTCAfXRp2y1aTbqpYA=
X-Received: by 2002:aca:5b06:: with SMTP id p6mr282468oib.129.1558375020345;
 Mon, 20 May 2019 10:57:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190520143732.2701-1-narmstrong@baylibre.com>
 <20190520143732.2701-3-narmstrong@baylibre.com>
In-Reply-To: <20190520143732.2701-3-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 20 May 2019 19:56:49 +0200
Message-ID: <CAFBinCAxhEJXO9dsd0e=zJuKgEsAwHrX+Jr7seJpGNjDL+63qg@mail.gmail.com>
Subject: Re: [PATCH 2/2] nvmem: meson-mx-efuse: update with SPDX Licence
 identifier
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190520_105701_903968_4FEC0C39 
X-CRM114-Status: UNSURE (   6.30  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, srinivas.kandagatla@linaro.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, May 20, 2019 at 4:38 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
