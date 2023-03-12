Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D2B6C6FD19
	for <linux-amlogic@archiver.kernel.org>; Sun, 12 Mar 2023 20:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hJOTFY2T8T4OeYjUdazjyrldP9D4vMp8HPW8Q0efhyY=; b=C9gZqaM1ERGXJx
	XNobne0yPX/A6m0FppZxkkaGmwumQRJNaQyjVRcGdUnXvvlqP8kkvkika3mJausptDJisLdShTFBS
	7bdpHb9p7GMWdYqQwvG/slROhhHFu8rpvPoStK4GUGXrUFwgNikabdEgn7bhgvlQVV/SaKzPayMlT
	UVq6OYvFyBdgNdeXeTOJgw6jWR3/tXlFkmL5qCirURl+Ox+U1ktIsc9zRPJAZlXzLiopT49GM/WZW
	6SCIqE9l+97qJqHY4cgmWzGZEe9j8rnR8/8I/7NO84zFBbqm+i40YVvNAWhOrVzBtSxyxEllCG9Md
	Wu34u3BWsE7dzGgnla6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbSJ3-003VBZ-QT; Sun, 12 Mar 2023 20:28:38 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbSIy-003V2p-9D; Sun, 12 Mar 2023 20:28:33 +0000
Received: by mail-ed1-x536.google.com with SMTP id j11so40908184edq.4;
        Sun, 12 Mar 2023 13:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112; t=1678652912;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K2J/3a1IUaezXRt8cT97feyTSCzihsk5DrzTrn45/F0=;
        b=JUpqysnXzPDgr43xph6NOGrfHrK3hRBSbcoJmKlMZGRDgz34bhdPORL1rTk5v6vDuh
         o0uKboTtDj37hQp+w7kIxlt6GDhEoW4Yg2gJYl1k+d2FOPfZx0eJJdffcbDGlQs4uDVx
         n31eTA/4bK9Wo7RXr5gVahhx78cAPjHxVt7c8/9n+SUawkBee/5BPkCl2n2v0jPiXp/z
         GGllzt7sWFJXAS9bhl+nWe7hR0XeE4JIIZfSACTaS0G+EDs/CfeNd74gBwFBI8DS7AdA
         q9Y3OHuc6Z5T9cVot7VrKfpjqhllDyvRTuyABN0DCqSPUwy3VvXy+sYvTcsw7yNrbAL2
         dr1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678652912;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K2J/3a1IUaezXRt8cT97feyTSCzihsk5DrzTrn45/F0=;
        b=mRNMbRWeZPw4ePjPb+tm0T+iICadT0Q9ofyMATSbltJuPUc6I9aPup7PUIAnkbF0a+
         F4IrL82gsC4uyXzs3X8RtMveFSv6xsmP0CGvTkiHEHZrpIgyfWEpEMFnwuMP8STaPzri
         vQ2xHAkcO8a0EgANqsY8nqqshisTwZUU4BX4hwTtgsx29JLvVsbWhCllNz6Xa7Q/z1Fs
         n+/fphUF1pB03DBH8rB/b6XUVYWPKvwXyCKK+O+fSfdQoptvZIoCCZGDK9oLQNm7l6RC
         f27mlI8DKCfCYbOTcgi0uxX+Ojq0RNHPowQhc3L5vDE7kqfvKccyipTip/BqQrNVf1q5
         4bIg==
X-Gm-Message-State: AO0yUKXgBwZ03mhffyqL5Wfx8vPF1KAAq80l53Mnvli22R+YLLzcrzf+
	6YMc1Jul6S2G766apfTkDXDB2puGRGTe5usjcgI=
X-Google-Smtp-Source: AK7set93CmoSxc8XZ2D8bTosdl3KJ/YMl/BkXjYrsCPN0sT+HwveYVPnKlpKaUK0A+hjoilnAd7BihLVcNFrQayDwF4=
X-Received: by 2002:a50:9fa5:0:b0:4fb:e0e8:5140 with SMTP id
 c34-20020a509fa5000000b004fbe0e85140mr984123edf.6.1678652911615; Sun, 12 Mar
 2023 13:28:31 -0700 (PDT)
MIME-Version: 1.0
References: <9ae6f90e-e1ea-d088-cdae-7dd8a541f00f@gmail.com> <2ceb62da-07e6-bafc-c29e-13cc1cdde93a@gmail.com>
In-Reply-To: <2ceb62da-07e6-bafc-c29e-13cc1cdde93a@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 12 Mar 2023 21:28:20 +0100
Message-ID: <CAFBinCA-f5aC0A33bnEejvrnrxPY-qGy7QDSrVHKCDxvv8O9zA@mail.gmail.com>
Subject: Re: [PATCH 2/2] mmc: meson-gx: use new helpers mmc_regulator_enable/disable_vqmmc
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, 
	Kevin Hilman <khilman@baylibre.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, 
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230312_132832_350735_61D5A06E 
X-CRM114-Status: UNSURE (   7.40  )
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

T24gU2F0LCBNYXIgMTEsIDIwMjMgYXQgMTE6NDHigK9QTSBIZWluZXIgS2FsbHdlaXQgPGhrYWxs
d2VpdDFAZ21haWwuY29tPiB3cm90ZToKPgo+IFVzZSBuZXcgaGVscGVycyBtbWNfcmVndWxhdG9y
X2VuYWJsZS9kaXNhYmxlX3ZxbW1jIHRvIHNpbXBsaWZ5Cj4gdGhlIGNvZGUuCj4KPiBTaWduZWQt
b2ZmLWJ5OiBIZWluZXIgS2FsbHdlaXQgPGhrYWxsd2VpdDFAZ21haWwuY29tPgpBY2tlZC1ieTog
TWFydGluIEJsdW1lbnN0aW5nbCA8bWFydGluLmJsdW1lbnN0aW5nbEBnb29nbGVtYWlsLmNvbT4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFt
bG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
