Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E873CD2ECEF
	for <linux-amlogic@archiver.kernel.org>; Mon, 19 Jan 2026 21:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8L2uZTjubniPMAHufdwW2DmWi/NPD39X7Co2cXyyPCU=; b=LqTVDtXiubNAJT
	fMn6lDCk6IacPAs1cNYEEBlure52JgP77yv5dXb4Ulayp69ukLFuzapfjIEI3VAw9J4lNIRSys76H
	kuUHv+e9740MCMPO354x8RGpOu5ZF7lR1rpJKMFgtMjXVubcrhAJkPx77XR441576onPOPx/b4k8V
	6lTFCW4PxBet5QZtR46E5DpCoMivzwrfuQn5UhTYppLMsf5bYHKHMFLNxtGF6CTgJ2wp/1H6doE8h
	kI5mpb/wgBg25pTdKtsMrKr6U1JdxtGNE60oUZeyVtfn2MxrUMRUl6pd2nd/DZ1c+33X3shKJl1DV
	krOS0UZ+q/bu4PCdgRQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhx0S-00000002udu-1MIY;
	Mon, 19 Jan 2026 21:41:52 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhx0M-00000002uco-32Ff
	for linux-amlogic@lists.infradead.org;
	Mon, 19 Jan 2026 21:41:51 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2a0d6f647e2so46000955ad.1
        for <linux-amlogic@lists.infradead.org>; Mon, 19 Jan 2026 13:41:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768858906; cv=none;
        d=google.com; s=arc-20240605;
        b=VNqhREaQFksUuQ9zr/KcqpNRgzRmTeZBJ125snzEtWovN7tq6eK7dPGaMqBORfWZBf
         MzYk9cmcEIOYbiTS8jlSwZHVHuppjyzJ5mE6zbtWQlr72cus0aMwbSyvXsGTydDABQ1z
         NW92MxLOlo0FVmnRmhj/xUNlAlqWsz14rsX+Vg3YlbC6PEgHu8BBkg5GpCF+o7qqQ1FJ
         IdAt9F029S+UCd5kgHekX6Od3oBcoGflnvQf5k6kFDEAp7jjeKiZc82dgIXN+tR/+ur7
         01xwLaREZMF0zCDJz3UCFWE6IyWDMaNymcEEFzJ223gC75bWGRp4qFOjyT6Nzmpowk/X
         eWSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pRWznSlw2S7cbES/gsl2WYiTRCw+WXgXVb1obiesglo=;
        fh=eQ+6Ur3PlYcPDVjZWiyz1bDAQW0da9iBY4eCuNweUtA=;
        b=hJd+UNrs61BDgUKRGBqAjV+gFQQI023SCqVVxqOvuL6/HMg1rwWPxvilAhine6TI7N
         gUf4KTFhWA7pY4nrUa2sK3vlPdb0vHufuqGoIQYB7fgNI+1MTgKlWF0v/3ex4jEp7MDG
         Fq33YKA7+H7uP7EUbT729Xhuj5qZeSkbXR239ODY60Rn4hy4V1EnoGcMF+udLpv2AxFO
         cRXW4TylzMwVbdADBRc5KjHDGlEs/M+hbBu3eFz9es6o10im4IoaifOJdoMPlT7gRTX3
         uBZ+ydb/DZYjR9wI1qP0D9zH1r994Rh+Ym9l/FQTp8Vc/qLYeT0KDfmQT32xGk1alR9t
         CfWQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1768858906; x=1769463706; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pRWznSlw2S7cbES/gsl2WYiTRCw+WXgXVb1obiesglo=;
        b=FbJx1B9b2EyVH8EGxVHpRQxychUqyuuV/VF5Lxe5bsEqHLeZ6RE2znXnbiAFHztjL8
         I9cyRNUrtBVjlAqtPHpmUXW4Ih+7qIK4WQC1nk+nMYuq9bpJKFYWbrxADymB37HCFtYW
         0ghvIc9/4Z2WtJndifCEmn555gg6rWEW26h0xlW0SacCD/V0GObGWh+9S4vol8Qe3ndK
         W+Rw+iR1Yjj3yMm92/xrOGh3/AgTVFRPcynkH4ByO/SKKQmdoien4QYif7+biAUO7ymv
         Epeasi4WP1rqnoFPDZTu8QWtTL+MoNSEbUIjKfKLDJVt179FO2ZFutXHtuhlLFQ0EPCK
         xwUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768858906; x=1769463706;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pRWznSlw2S7cbES/gsl2WYiTRCw+WXgXVb1obiesglo=;
        b=M1iiobFKznyhbVisiOzP0d9HeYQHxNv+SpkTGp4urzEbcu9WfeknHGbIw/+xfSWlZO
         YitBrTRj9CrL8VXkqMOC3/QHTzaNNRdkHyKdETS0swFmdlF+0TCzejvLVRCapeavTvHw
         em51gfLfYJAMmQ+yBr2YRWtEX1yGnjIMkxb4ewKlCP/KjLiZ7nFjTJ1pViUS2pkL6f2G
         yPatWGzzsyFod72ywe8EGMNyPuzep7BXiSypnWIyB1JRH10oWvNddxUYDOZFDzvgu10X
         3ZMQl33yf0wOYUeDJuNaMfEAQ93/dZTMDCMd9hOHpZVDQNC8QtW701ZpGy9JPu7aoT0P
         oBnQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1qPGgoXmQC2v6cgSbIrsp+NCBQVYuYNxwnfbFpCpwC9qYHKu8yhT08OuZ66sVKFSigPC9mPxU/6tSi99X@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7Ksk93ZVbrYSfjQ0YI4VFyHFSGu06jnyY/DfGJrQ1GcUZGKZH
	8zDUNcOMwfWiwKkobmn5YhgNQ1E40YIae6eiqnTM1U/BWXuZZiIxetFKy2pmQHarZMdle6Kdu+9
	CSa/KdRVbA1/iaTxZ54O0ZRBpfrFL4oU=
X-Gm-Gg: AZuq6aIbpnmXy0mBYeTGiI6yf0J1YtE+wXtrpUo5xvLRulb0bA2Ll1FYNKODtnGGeO8
	UHLan1KNZ7YNeq/MThAXCJnucX8afkhYgixASWuWoRnI+idEMeAZsNj8+J7p5DDOSlgsIM+gvU6
	YFz+y/Bjoqra+54E4Vn/kWseEjsPGAqywn0NW9ngLceaktaW4eYhK0/wyhddfxwVwbuEPo9zH9i
	XTKCXU3W9POTZNkqmlD+6IzEaS4TAhXGXk+lAvQapa2Aj95lBCqk4RvPw4vsLS8BLWOtSxd8inM
	axpjB5jy5CnZ5RHC7+yzlCuakcxQ
X-Received: by 2002:a17:903:41c7:b0:295:9e4e:4092 with SMTP id
 d9443c01a7336-2a7177e69demr117828295ad.56.1768858905805; Mon, 19 Jan 2026
 13:41:45 -0800 (PST)
MIME-Version: 1.0
References: <20260116023900.2036657-1-nick@khadas.com> <CAFBinCAeNcKW_dK+1LD7U_+JkcozxmMw9J4oGUt1=OcvJ95dFQ@mail.gmail.com>
In-Reply-To: <CAFBinCAeNcKW_dK+1LD7U_+JkcozxmMw9J4oGUt1=OcvJ95dFQ@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 19 Jan 2026 22:41:34 +0100
X-Gm-Features: AZwV_QianNccn2npt0qzJu8jf1J7ZW5nG4PtEcDbgkjGz-yQ00oAH_jww9o3OAc
Message-ID: <CAFBinCCuV9eqDDg9fgy5hkQ8KukxpbfSgTzGq_C38nAB1HtDFQ@mail.gmail.com>
Subject: Re: [PATCH v1] arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s:
 enable SDIO interface
To: Nick Xie <nick@khadas.com>
Cc: neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, xieqinick@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_134146_775333_5627A162 
X-CRM114-Status: UNSURE (   7.66  )
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

T24gTW9uLCBKYW4gMTksIDIwMjYgYXQgMTA6MznigK9QTSBNYXJ0aW4gQmx1bWVuc3RpbmdsCjxt
YXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPiB3cm90ZToKWy4uLl0KPiA+ICsgICAg
ICAgbm8tc2Q7Cj4gPiArICAgICAgIG5vLW1tYzsKPiA+ICsgICAgICAgbW1jLXB3cnNlcSA9IDwm
c2Rpb19wd3JzZXE+Owo+ID4gKyAgICAgICB2bW1jLXN1cHBseSA9IDwmdmRkYW9fM3YzPjsKPiA+
ICsgICAgICAgdnFtbWMtc3VwcGx5ID0gPCZ2ZGRpb19hbzF2OD47Cj4gSSdtIG1pc3Npbmc6Cj4g
ICBjbG9ja3MgPSA8JnNkaW9fMzJrPjsKPiAgIGNsb2NrLW5hbWVzID0gImxwbyI7CkkndmUgYmVl
biBhIGJpdCBxdWljayBoZXJlOiBjbG9ja3MgYW5kIGNsb2NrLW5hbWVzIHNob3VsZCBiZSBwYXJ0
IG9mCnRoZSB3aWZpQDEgc3ViLW5vZGUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LWFtbG9naWMK
