Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 204A2EB64DB
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 Jun 2023 20:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EPXaI6JydsFq98kGl5R3NqxZdOkJPDJdwefWOXzXrKo=; b=4blyxBG8u34NH0
	6426rNZuDVHAR3zMyWa89AazV6FXZGICamJY4yylR8g20UKYajURsihUG+Z2KHh252As2VNSZn6uY
	fBixTu8VizX3xhzdhugG8MmEsUaGRqiIgwY7Gv0VTwdJ8B5cFQvAUN/S/ZOZgCDYkSeGVAqNPcLeI
	cNZzGjFnCDeyfh6on7WHhfzaLK6XetYpRSau/ixQq/zOW/UDoGzstGK2k5/RGmkkVrB8LgR2wK/XN
	Aao7vN87ruJB1FMfSS8htJkAB1yL2y89rwAxkcNt1MFXovw7ci5uFJoa/cX6RvxcAhnAW2IACuWsS
	NFQ+WvV/e3GRJ1dAuXjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9Wse-00Ccy0-03;
	Wed, 14 Jun 2023 20:14:12 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9Wsb-00CcxD-05;
	Wed, 14 Jun 2023 20:14:10 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-978863fb00fso175574966b.3;
        Wed, 14 Jun 2023 13:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1686773647; x=1689365647;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c3Rl7apYSnIbdty4J1LxmZb+9CZUYt38RK5u4EFXNuc=;
        b=sPIfg/bUnXtkfHGRWEXvqK+DryYeOgSATt05cmzm7c9lvbBZFAV8bvBcLt7oDOZr8B
         tHf1h6Od/EvSyU2rEWj6EnnZo1pOB38BR38wI804aJIYwneakuLnUr4m+x71X6omyP2o
         aJFXkdRoDCbFJmo0HPHqgjEw3nBz2O47vSeyDdXwFV9Jq89+H+RqJcKiFPuJXU09AF13
         G1u9MpXsn6LLbL7L0U4DPQXATZVsVQlubLScW3tgY2G4vymnhFdG3IK1UD+6RoKgj3tN
         v/UVtI+GurUgzPkV9LlSPsFFCD5iiovizyahmvHbOPxUNjuLsM9bOUrEM2QfZ9g4LaPC
         AUuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686773647; x=1689365647;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c3Rl7apYSnIbdty4J1LxmZb+9CZUYt38RK5u4EFXNuc=;
        b=YdGLTaf/paHyVMiZAvfDlimLSK2mm0/+Er3Pe0juJUMU7m8UXdA7vwaH3HRfUEYTgX
         qnDZcKPsIZ7EWWdq2OvakaD3ibp6aN3S7ufXr1fhZKwPD/Ygbi2uATZJbC3ZuXAfuhg/
         vQnn5Ze6U597Slal6Myf5oYbzm6mBF6Dpmz+FyfIjvzKMQKoKDSdK/zta8CsazfE2/3j
         ZPl0rWbiTriPDmyI9SV0qBoL6JxkX8eIM74ziTPpcKIHXPthXYzeWDtRa8iqsX6tmANF
         jl+eUh+FRHXv4pt3cvuJu6btd2FFg1X4INcaFwdPCOMcsDch5nnO693z4MJ0FmR5uM6a
         4oOw==
X-Gm-Message-State: AC+VfDyW4va+u4PIWvScARQtl59rwcb9fLaq/GM7hsJiv9Bgv6lsQlje
	Tps+CqvXS7suI56bs8FiZLGxmNs846wOtgG9/wA=
X-Google-Smtp-Source: ACHHUZ6fNzodgl60GiVPDhsGDmi6ZBnWEaM//Wso5VLBjQUMPVocF5eQv0G8fPbIWjaWGjrqtJONw2rblUU2J0bsUI4=
X-Received: by 2002:a17:907:748:b0:974:5ce6:f9f6 with SMTP id
 xc8-20020a170907074800b009745ce6f9f6mr17131237ejb.10.1686773646527; Wed, 14
 Jun 2023 13:14:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230614083943.85660-1-yang.lee@linux.alibaba.com>
In-Reply-To: <20230614083943.85660-1-yang.lee@linux.alibaba.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 14 Jun 2023 22:13:55 +0200
Message-ID: <CAFBinCCeGHqPw_8oUNj3q41KYOix9Tyczwn_=wVCZSEmuxk6bA@mail.gmail.com>
Subject: Re: [PATCH -next] clk: meson: Remove unneeded semicolon
To: Yang Li <yang.lee@linux.alibaba.com>
Cc: neil.armstrong@linaro.org, jbrunet@baylibre.com, mturquette@baylibre.com, 
	sboyd@kernel.org, khilman@baylibre.com, linux-amlogic@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Abaci Robot <abaci@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230614_131409_061417_8493AE02 
X-CRM114-Status: UNSURE (   8.97  )
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

T24gV2VkLCBKdW4gMTQsIDIwMjMgYXQgMTA6NDDigK9BTSBZYW5nIExpIDx5YW5nLmxlZUBsaW51
eC5hbGliYWJhLmNvbT4gd3JvdGU6Cj4KPiAuL2RyaXZlcnMvY2xrL21lc29uL2Nsay1wbGwuYzoz
NzM6Mi0zOiBVbm5lZWRlZCBzZW1pY29sb24KPgo+IFJlcG9ydGVkLWJ5OiBBYmFjaSBSb2JvdCA8
YWJhY2lAbGludXguYWxpYmFiYS5jb20+Cj4gQ2xvc2VzOiBodHRwczovL2J1Z3ppbGxhLm9wZW5h
bm9saXMuY24vc2hvd19idWcuY2dpP2lkPTU1MzEKPiBTaWduZWQtb2ZmLWJ5OiBZYW5nIExpIDx5
YW5nLmxlZUBsaW51eC5hbGliYWJhLmNvbT4KQW4gaWRlbnRpY2FsIHBhdGNoIHdhcyBzZW50IHdp
dGhpbiBtaW51dGVzIG9mIHRoaXMgb25lOiBbMF0KVGhlIG90aGVyIG9uZSBoYXMgdHdvIFJldmll
d2VkLWJ5IGFscmVhZHkuIFNvIEkgdGhpbmsgdGhpcyBvbmUgc2hvdWxkCmJlIGRpc2NhcmRlZC4K
U3RpbGwsIHRoYW5rcyBmb3IgZm9sbG93aW5nIHVwIG9uIHRoaXMgaXNzdWUhCgoKQmVzdCByZWdh
cmRzLApNYXJ0aW4KCgpbMF0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtYW1sb2dpYy8y
MDIzMDYxNDA4NDgwOC45ODgxOS0xLWppYXBlbmcuY2hvbmdAbGludXguYWxpYmFiYS5jb20vCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxv
Z2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
